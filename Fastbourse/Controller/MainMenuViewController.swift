//
//  MainMenuViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class MainMenuViewController: UITableViewController {
    
    //MARK: - Properties
    
    var JSONData: CompanyType?
    var tableContent: [String] = []
}

//MARK: - VC Lifecycle

extension MainMenuViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
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

extension MainMenuViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = self.tableContent[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            CompanyCategoriesViewController.isBourseSelected = true
            let CompanyType = JSONData?.bourse
            DetailViewController.items = CompanyType!.instrumentEffect
        }else{
            CompanyCategoriesViewController.isBourseSelected = true
            let CompanyType = JSONData?.farabourse
            DetailViewController.items = CompanyType!.instrumentEffect
        }
        self.performSegue(withIdentifier: "SegueToCategory", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    // MARK: Networking
    
    func fetchData() {
        AF.request("https://api-dev.fasttse.com/api/v2/market").validate().responseDecodable(of: CompanyType.self){ (response) in
            guard let ComapanyType = response.value else {
                print("Trouble parsing JSON!")
                return
            }
            self.tableContent = [ "bourse" , "farabourse" ]
            self.tableView.reloadData()
            DetailViewController.JsonData = ComapanyType
            self.JSONData = ComapanyType
        }
    }
}




