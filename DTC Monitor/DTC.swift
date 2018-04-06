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
    var possibleReasons:String = ""
    var actions:String? = ""
    var comments: [String] = ["Default Comment"]
    
    init(code: String, title: String, possibleReasons: String) {
        
        self.code = code
        self.title = title
        self.possibleReasons = possibleReasons
        
    }
        
    
    
}
