//
//  ViewController.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 2.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import UIKit

class DTCListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var DTCArray : [DTC] = []
    
    @IBOutlet weak var DTCTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DTCTableView.delegate = self
        DTCTableView.dataSource = self
        
        prepareDTCList()
        prepareNavigationBar()
        
        
    }
    
    fileprivate func prepareNavigationBar() {
        navigationItem.title = "DTCList"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    
    func showDetails(ofDTCAt index: Int) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let DTCDetailVC = storyboard.instantiateViewController(withIdentifier: "DTCDetailViewController") as? DTCDetailViewController else {
            return
        }
        
        DTCDetailVC.myDTC = DTCArray[index]
        
        self.navigationController?.pushViewController(DTCDetailVC, animated: true)
        
    }
    
    fileprivate func prepareDTCList(){
        let DTC1 = DTC(code: "0001", title: "DTC1", possibleReasons: "wires of different wheel speed sensors are shorted to each other EPM electronic circuit is damaged", actions: "Check the lines and plugs between EPM and wheel-speed sensor for short-circuits. Repair wiring if faulty If fault is not found in the wiring, replace EPM.")
        let DTC2 = DTC(code: "0002", title: "DTC2", possibleReasons: "wires of different wheel speed sensors are shorted to each other EPM electronic circuit is damaged", actions: "Check the lines and plugs between EPM and wheel-speed sensor for short-circuits. Repair wiring if faulty If fault is not found in the wiring, replace EPM.")
        let DTC3 = DTC(code: "0003", title: "DTC3", possibleReasons: "wires of different wheel speed sensors are shorted to each other EPM electronic circuit is damaged", actions: "Check the lines and plugs between EPM and wheel-speed sensor for short-circuits. Repair wiring if faulty If fault is not found in the wiring, replace EPM.")
        let DTC4 = DTC(code: "0004", title: "DTC4", possibleReasons: "wires of different wheel speed sensors are shorted to each other EPM electronic circuit is damaged", actions: "Check the lines and plugs between EPM and wheel-speed sensor for short-circuits. Repair wiring if faulty If fault is not found in the wiring, replace EPM.")
        
        DTCArray = [DTC1, DTC2, DTC3, DTC4]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DTCArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DTCTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = DTCArray[indexPath.row].code
        cell?.detailTextLabel?.text = DTCArray[indexPath.row].title
        
        return cell!
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedIndex = indexPath.row
        showDetails(ofDTCAt: selectedIndex) //Seçtiğimiz hücrenin index'ine göre detay gösterme fonk'unu çağırıyor.
        tableView.deselectRow(at: indexPath, animated: true) // Bastığımız cell basılı kalmasın diye
        
    }
    
    
    
}
