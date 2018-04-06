//
//  DTCDetailViewController.swift
//  
//
//  Created by Gokhan Cengiz on 3.04.2018.
//


import UIKit

class DTCDetailViewController: UIViewController {
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reasonsLabel: UILabel!
    @IBOutlet weak var actionsLabel: UILabel!
    
    @IBAction func seeCommentsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "commentsSegue", sender: self)
        
        let CommentsVC = CommentViewController()
        
        
    }
    
    
    static var myDTC: DTC!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel.text = "CTD Code: " + DTCDetailViewController.myDTC.code
        titleLabel.text = "Code Text: " + DTCDetailViewController.myDTC.title
        reasonsLabel.text = "Possible Reasons: " + DTCDetailViewController.myDTC.possibleReasons
        if let a = DTCDetailViewController.myDTC.actions {
        actionsLabel.text = "Actions: " + a
        }
        else {
            actionsLabel.text = nil
        }
        
        prepareNavigationBar()
        
       
        
        
        
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
