//
//  Sport.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import Foundation
import SwiftData

@Model
final class Sport {
    @Attribute(.unique) var name: String
    
    var stat1: String
    var stat2: String
    var stat3: String
    var stat4: String
    var stat5: String
    var stat6: String
    var stat7: String
    var stat8: String
    
    init(name: String = "", stat1: String = "", stat2: String = "", stat3: String = "", stat4: String = "", stat5: String = "", stat6: String = "", stat7: String = "", stat8: String = "") {
        self.name = name
        
        self.stat1 = stat1
        self.stat2 = stat2
        self.stat3 = stat3
        self.stat4 = stat4
        self.stat5 = stat5
        self.stat6 = stat6
        self.stat7 = stat7
        self.stat8 = stat8
        
    }

}
