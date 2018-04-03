//
//  DTC.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 2.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import Foundation

class DTC {
    var code:String = ""
    var title:String = ""
    var possibleReasons = ""
    var actions = ""
    
    init(code: String, title: String, possibleReasons: String, actions: String) {
        
        self.code = code
        self.title = title
        self.possibleReasons = possibleReasons
        self.actions = actions
    }
    
    
}
