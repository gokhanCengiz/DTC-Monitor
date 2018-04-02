//
//  ViewController.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 2.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import UIKit

class DTCListViewController: UIViewController {
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var DTCArray: [DTC] = []
    var pageCount = 1
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        
        prepareNavigationBar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showDTCDetails(of index: Int) {
        
        
        
    }
    
    fileprivate func prepareTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DTCViewCell", bundle: nil), forCellReuseIdentifier: "DTCViewCell")
        searchBar.delegate = self
        
    }
    
    fileprivate func prepareDTCList(){
        
    }
    
    

}

extension DTCListViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = indexPath.row
        showDTCDetails(of: index)
        searchBar.resignFirstResponder()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:DTCViewCell = tableView.dequeueReusableCell(withIdentifier: "DTCViewCell") as? DTCViewCell else {
            return UITableViewCell()
            
        }
        
        if indexPath.row >= DTCArray.count {
            return UITableViewCell()
        }
        
        let DTCAtIndex = DTCArray[indexPath.row]
        
        if let code = DTCAtIndex.code {
            cell.CellCodeView.text = code
        }
        
        cell.CellTitleView.text = DTCAtIndex.title
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DTCArray.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == DTCArray.count-1 {
            pageCount += 1
            prepareDTCList()
        }
    }
    
    fileprivate func prepareNavigationBar(){
        navigationItem.title = "Movies List"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .blackTranslucent
        //navigationController?.navigationBar.barTintColor = Color.barColor
        
    }
    
}

extension DTCListViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DTCArray.removeAll()
        pageCount = 1
        self.searchText = searchText.replacingOccurrences(of: " ", with: "+")
        prepareDTCList()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    
}




