//
//  ViewController.swift
//  TableViewSubclass_Practice
//
//  Created by 伊藤走 on 12/9/20.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    private var articleModel:[Article] = []
    private lazy var  TableVC: SecoundTableViewController = {
        return SecoundTableViewController.instantiate()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        embedVC(childVC:TableVC, frame:containerView)
    }
    

    
    private func embedVC(childVC:UITableViewController, frame:UIView){
        TableVC.delegate = self
        frame.addSubview(childVC.view)
        childVC.view.frame = frame.bounds
        addChild(childVC)
        childVC.didMove(toParent: self)
        self.TableVC.articleModel = self.articleModel
    }

    
    @objc func addTapped(){
        
        let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Second Name"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            let article: Article = Article(item1: firstTextField.text ?? "", item2: secondTextField.text ?? "")
            self.articleModel.append(article)
            self.TableVC.articleModel = self.articleModel
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                                            (action : UIAlertAction!) -> Void in })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter First Name"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
}

extension ViewController: TableViewControllerDelegate {
    
    func TableViewController(_ articleListTableViewController: SecoundTableViewController, didSelectItem index: Int) {
        
    }
    
}

