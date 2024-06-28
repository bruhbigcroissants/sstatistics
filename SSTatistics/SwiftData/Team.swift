//
//  Team.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import Foundation
import SwiftData

@Model
final class Team {
    @Attribute(.unique) var uuid: UUID
    var teamName: String
    
    var teamTime: Double
    
    var statScore1: Int
    var statScore2: Int
    var statScore3: Int
    var statScore4: Int
    var statScore5: Int
    var statScore6: Int
    var statScore7: Int
    var statScore8: Int
    
    var statistics: [Statistics]?
    
    init(uuid: UUID, teamName: String, teamTime: Double, statScore1: Int, statScore2: Int, statScore3: Int, statScore4: Int, statScore5: Int, statScore6: Int, statScore7: Int, statScore8: Int) {
        self.uuid = uuid
        self.teamName = teamName
        
        self.teamTime = teamTime
        
        self.statScore1 = statScore1
        self.statScore2 = statScore2
        self.statScore3 = statScore3
        self.statScore4 = statScore4
        self.statScore5 = statScore5
        self.statScore6 = statScore6
        self.statScore7 = statScore7
        self.statScore8 = statScore8

    }
    
}
