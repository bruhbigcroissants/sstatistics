//
//  Statistics.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import Foundation
import SwiftData

@Model
final class Statistics {
    @Attribute(.unique) 
    var uuid: UUID
    var date: Date
    var totalTimeElapsed: Double
    
    var title: String
    var sport: [Sport]?
    
    var team: [Team]?
    
    init(uuid: UUID, date: Date, title: String, sport: [Sport], totalTimeElapsed: Double, team: [Team]) {
        self.uuid = uuid
        self.date = date
        self.totalTimeElapsed = totalTimeElapsed
        
        self.title = title
        self.sport = sport
        
        self.team = team
        
    }
    
}
