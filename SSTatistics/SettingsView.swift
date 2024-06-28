//
//  SettingsView.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State private var isShowingAddSport = false
    
    @Query var sports: [Sport] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.sstBlue.ignoresSafeArea()
                VStack {
                    Spacer()
                    List {
                        ForEach(sports) { sport in
                            SportRow(sport: sport)
                        }
                        Text("test")
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Sports")
                    .navigationBarTitleDisplayMode(.large)
                    .sheet(isPresented: $isShowingAddSport, content: {
                        AddSport()
                    })
                    .toolbar {
                        Button("Add Sport", systemImage: "plus")
                            {
                                isShowingAddSport = true
                            }
                        
                    }
                    Spacer()
                }
                
            }
                
        }
                        
    }
    
}

#Preview {
    SettingsView()
}

struct SportRow: View {
    
    let sport: Sport
    
    var body: some View {
        Text(sport.name)
        
    }
    
}

struct AddSport: View {
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
        }
    }
    
}
