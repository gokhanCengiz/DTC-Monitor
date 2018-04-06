//
//  CommentViewController.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 4.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myDTC : DTC!
    
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentTableView: UITableView!
    
    @IBAction func addCommentButton(_ sender: Any) {
        
        myDTC.comments.append(commentTextField.text!)
        
        self.commentTableView.reloadData()
        commentTextField.text = ""
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTableView.delegate = self
        commentTableView.dataSource = self
        let myColor : UIColor = UIColor.black
        commentTextField.layer.borderColor = myColor.cgColor
        commentTextField.layer.borderWidth = 1.0
        
        showComments()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func showComments(){
        
        myDTC = DTCDetailViewController.myDTC
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return myDTC!.comments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = myDTC.comments[indexPath.row]
        
        return cell
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
