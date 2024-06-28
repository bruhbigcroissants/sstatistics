//
//  SSTatisticsApp.swift
//  SSTatistics
//
//  Created by anniehow on 8/4/24.
//

import SwiftUI
import SwiftData

@main
@MainActor
struct SSTatisticsApp: App {

    let sportContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: Sport.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            
            var sportFetchDescriptor = FetchDescriptor<Sport>()
            sportFetchDescriptor.fetchLimit = 1
            
            guard try container.mainContext.fetch(sportFetchDescriptor).count == 0 else { return container }
            
            let sports = [
                Sport(name: "Netball", stat1: "Shots", stat2: "Goals", stat3: "Rebounds", stat4: "Intercepts", stat5: "Turnovers", stat6: "Penalties", stat7: "Offside", stat8: ""),
                Sport(name: "Handball", stat1: "Shots", stat2: "Goals", stat3: "Steals", stat4: "Fouls", stat5: "", stat6: "", stat7: "", stat8: ""),
                Sport(name: "Football", stat1: "Shots", stat2: "Goals", stat3: "Turnovers", stat4: "Fouls", stat5: "Yellow Cards", stat6: "Red Cards", stat7: "Offside", stat8: "Corners"),
                Sport(name: "Basketball", stat1: "Field Goals", stat2: "3 Pointers", stat3: "Free Throws", stat4: "Rebounds", stat5: "Assists", stat6: "Blocks", stat7: "Steals", stat8: "Turnovers"),
                Sport(name: "Volleyball", stat1: "Set Score", stat2: "Spikes", stat3: "Blocks", stat4: "Digs", stat5: "Aces", stat6: "Service Errors", stat7: "", stat8: "")
            ]
            
            for sport in sports {
                container.mainContext.insert(sport)
            }
            
            return container
            
        }
        
        catch {
            fatalError("Failed to create container for sports!")
            
        }
        
    }()
    
    var body: some Scene {
        
        WindowGroup {
            HomeView()
        }
        
        //.modelContainer(for: Statistics.self)
        .modelContainer(sportContainer)
        
    }
    
}
