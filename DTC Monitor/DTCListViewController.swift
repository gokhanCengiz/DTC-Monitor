//
//  ViewController.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 2.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import UIKit

class DTCListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var DTCArray : [DTC] = []
    
    @IBOutlet weak var DTCTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredDTCArray: [DTC]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DTCTableView.delegate = self
        DTCTableView.dataSource = self
        searchBar.delegate = self
        
        prepareDTCList()
        filteredDTCArray = DTCArray
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
        
        DTCDetailViewController.myDTC = DTCArray[index]
        
        self.navigationController?.pushViewController(DTCDetailVC, animated: true)
        
    }
    
    fileprivate func prepareDTCList(){
        let DTC1 = DTC(code: "0x0E0700", title: "Communication interrupted", possibleReasons: "wires of different wheel speed sensors are shorted to each other EPM electronic circuit is damaged")
        
        let DTC2 = DTC(code: "0xF80C00", title: "Timeout in the communication with trailer ECU #2", possibleReasons: "electro-magnetic disturbance, external ECU is disconnected from the CAN external ECU does not send all messages because of an internal reason or error")
        
        let DTC3 = DTC(code: "0xF0FF00", title: "Timeout or error condition in the communication with body controller ECU (BNS) (ZBR) on CAN (SA=0x21 or 0x2D or 0x32)", possibleReasons: "- external ECU because of an internal reason orr error")
        
        let DTC4 = DTC(code: "0xF4FF00", title: "Timeout in the communication with ACC headway controller ECU or Driver Assist ECU (collision avoidance) (SA=0x2A)", possibleReasons: "- external ECU because of an internal reason or error")
        
        DTC1.actions = "Erase fault memory. If the error is reported again, the central ECU is to be replaced."
        DTC2.actions = "Check short-circuits and open circuit on lines CAN-Trailer ISO 11992 to the signal transmitting ECU and assure that ECU works correctly."
        DTC3.actions = "Check short-circuits and open circuit on lines CAN-J1939 to the signal transmitting ECU and assure that ECU works correctly."
        //DTC4.actions = nil
        
        
        
        DTCArray = [DTC1, DTC2, DTC3, DTC4]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDTCArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DTCTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = filteredDTCArray[indexPath.row].code
        cell.detailTextLabel?.text = filteredDTCArray[indexPath.row].title
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedIndex = indexPath.row
        showDetails(ofDTCAt: selectedIndex) //Seçtiğimiz hücrenin index'ine göre detay gösterme fonk'unu çağırıyor.
        tableView.deselectRow(at: indexPath, animated: true) // Bastığımız cell basılı kalmasın diye
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
     
        filteredDTCArray = searchText.isEmpty ? DTCArray : DTCArray.filter { (item: DTC) -> Bool in
            
            return item.code.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        DTCTableView.reloadData()
    }
    
    
    
}
