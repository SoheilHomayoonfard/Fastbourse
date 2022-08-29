//
//  ViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class SignInViewController: UIViewController {
    
    //MARK: - Subviews
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
}

//MARK: - VC Lifecycle

extension SignInViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styly()
    }
}

//MARK: - Methods

extension SignInViewController {
    
    func styly() {
        errorLabel.isHidden = true
        Styling.styleTextField(phoneNumberTextField)
        Styling.styleTextField(emailTextField)
        Styling.styleFilledButton(registerButton)
    }
    
    func segueToPhoneCheck (){
        self.performSegue(withIdentifier: "SegueToPhoneCheck", sender: self)
    }
    
//MARK: - Networking
    
    func registerData(PhoneNumber phoneNumber:String,Email email:String){
        let params: Parameters = [
            "email": email,
            "phone_number": phoneNumber]
        AF.request("https://api-dev.fasttse.com/api/v2/user/register", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate().responseDecodable(of: ActivationValidate.self) { response in
            if response.error == nil {
                guard let ActivateTTL = response.value else {
                    print("Trouble parsing Json!")
                    return}
                RegisterUser(PhoneNumber: phoneNumber, Email: email, ActivateValidationTime: ActivateTTL.ActivateValidationTime)
                self.segueToPhoneCheck()
                
            }
        }
    }
}

//MARK: - Actions

extension SignInViewController {
    
    @IBAction func phoneFieldCheck(_ sender: UITextField) {
        if phoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
            let cleanPhoneNumber = phoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            errorLabel.isHidden = true
            if Helper.isValidPhoneNumber(cleanPhoneNumber) {
                errorLabel.isHidden = true
            } else {
                errorLabel.text = "Please enter valid Phone Number!"
                errorLabel.isHidden = false
            }
        }else {
            errorLabel.text = "Please enter your number!"
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func emailFieldCheck(_ sender: Any) {
        if emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
            let cleanEmailField = emailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            errorLabel.isHidden = true
            if Helper.isValidEmail(cleanEmailField){
                errorLabel.isHidden = true
            } else {
                errorLabel.text = "Please enter valid Email!"
                errorLabel.isHidden = false
            }
        }else {
            errorLabel.text = "Please enter your Email!"
            errorLabel.isHidden = false
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any)  {
        let cleanPhoneNumber = phoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let cleanEmailField = emailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        
        if phoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""
            && emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            && Helper.isValidPhoneNumber(cleanPhoneNumber)
            && Helper.isValidEmail(cleanEmailField) {
                registerData(PhoneNumber: cleanPhoneNumber, Email: cleanEmailField)
        }
    }
}
