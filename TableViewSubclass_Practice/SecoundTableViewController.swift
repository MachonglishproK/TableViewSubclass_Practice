//
//  TableViewController.swift
//  TableViewSubclass_Practice
//
//  Created by 伊藤走 on 12/9/20.
//

import UIKit


protocol TableViewControllerDelegate: class {
    func TableViewController(_ articleListTableViewController: SecoundTableViewController, didSelectItem index: Int)
}

class SecoundTableViewController: UITableViewController {
    
    weak var delegate: TableViewControllerDelegate?
    
    var articleModel:[Article] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate()->SecoundTableViewController {
        let storyboard = UIStoryboard(name: "SecoundTableViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "SecoundTableViewController") as? SecoundTableViewController{
            return vc
        } else {
            preconditionFailure("vc must be ArticleListTableViewController")
        } 
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if articleModel.isEmpty != true {
            return articleModel.count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell()}
        
        if articleModel.isEmpty != true {
        cell.config(item: articleModel[indexPath.row])
        }
        
        return cell
    }
    
    
}
