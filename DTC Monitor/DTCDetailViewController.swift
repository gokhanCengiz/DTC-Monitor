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
    
    var myDTC: DTC!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeLabel.text = myDTC.code
        titleLabel.text = myDTC.title
        reasonsLabel.text = myDTC.possibleReasons
        actionsLabel.text = myDTC.actions
        
        
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
