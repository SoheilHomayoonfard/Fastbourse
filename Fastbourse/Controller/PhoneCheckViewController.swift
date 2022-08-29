//
//  PhoneCheckViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class PhoneCheckViewController: UIViewController {
    
    //MARK: - Subviews
    
    @IBOutlet weak var activationCodeTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var unwindButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    //MARK: - Properties
    
    var counter : Int = RegisterUser.ActivateValidationTime
    var activateCodeValidationTime = RegisterUser.ActivateValidationTime
    var timer : Timer!
    var ValidationTimer : Timer!
    var isCodeValid = true
}

//MARK: - VC Lifecycle

extension PhoneCheckViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimers()
        ErrorLabel.isHidden = true
        Styling.styleTextField(activationCodeTextField)
        Styling.styleFilledButton(signUpButton)
        Styling.styleFilledButton(resendButton)
        Styling.styleFilledButton(unwindButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

//MARK: - Methods

extension PhoneCheckViewController {
    func initTimers () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(resendStep), userInfo: nil, repeats: true)
        ValidationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(validationStep), userInfo: nil, repeats: true)
    }
    
    @objc func resendStep() {
        if counter > 0{
            counter -= 1
            resendButton.setTitle("Resend Activation Code in \(counter)", for: .normal)
        }else{
            timer.invalidate()
            resendButton.setTitle("Resend Activation Code", for: .normal)
            resendButton.isEnabled = true
        }
    }
    
    @objc func validationStep() {
        if activateCodeValidationTime > 0 {
            activateCodeValidationTime -= 1
        }else{
            isCodeValid = false
            ValidationTimer.invalidate()
        }
    }
    
    func segueToMainMenu (){
        self.performSegue(withIdentifier: "SegueToMainMenu", sender: self)
    }
    
    func resetTimers(){
        isCodeValid = true
        activateCodeValidationTime = RegisterUser.ActivateValidationTime
        counter = 20
        resendButton.isEnabled = false
        initTimers()
    }
    
    //MARK: Networking
    
    func fetchActivationData(ActivationCode activationCode : Int) {
        let params: Parameters = [
            "phone_number": RegisterUser.PhoneNumber,
            "code": String(activationCode)]
        AF.request("https://api-dev.fasttse.com/api/v2/user/activate", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseDecodable(of : User.self){ response in
            if (response.error == nil){
                self.segueToMainMenu()
            }
        }
    }
    
    func fetchResendActivationData() {
        let params: Parameters = [
            "phone_number": RegisterUser.PhoneNumber]
        AF.request("https://api-dev.fasttse.com/api/v2/user/activate/code", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate().responseDecodable(of: ActivationValidate.self) { response in
            if (response.error == nil){
                guard let ActivateTTL = response.value else {
                    print("Trouble parsing Json!")
                    return }
                RegisterUser.ActivateValidationTime = ActivateTTL.ActivateValidationTime
                RegisterUser.PhoneNumber = ActivateTTL.PhoneNumber
                self.resetTimers()
            }
        }
    }
}

//MARK: - Actions

extension PhoneCheckViewController {
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let cleanActivationCode = activationCodeTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        if isCodeValid && cleanActivationCode == String(RegisterUser.AvtivateCode){
            ErrorLabel.isHidden = true
            fetchActivationData(ActivationCode: Int(cleanActivationCode)!)
        }else {
            ErrorLabel.isHidden = false
        }
    }
    
    @IBAction func resendButtonPressed(_ sender: Any) {
        fetchResendActivationData()
    }
    
    @IBAction func unwindButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
}
