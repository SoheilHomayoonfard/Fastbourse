//
//  DetailViewController.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//
import UIKit

class DetailViewController: UITableViewController {
    
//MARK: - Properties
    
    static var JsonData : CompanyType?
    static var items: [Displayable] = []
    var selectedItem: Displayable?
}

//MARK: - VC Lifecycle

extension DetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
    }
}

//MARK: - Methods

extension DetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailViewController.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        let item = DetailViewController.items[indexPath.row]
        cell.textLabel?.text = item.TitleLabel
        cell.detailTextLabel?.text = item.subtitleLabel
        return cell
    }
}
