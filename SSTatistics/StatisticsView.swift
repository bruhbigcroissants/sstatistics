//
//  StatisticsView.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import SwiftUI
import SwiftData

struct StatisticsView: View {
    
    @Query var sports: [Sport] = []
    
    @State private var statName: String = "Statistics"
    
    @State private var currentIndex = 1
    @State private var currentSport = Sport()
    @State private var currentDate = Date()
    
    @State private var timerTeam1String = "00:00.00"
    @State private var isTimerRunning = false
    @State private var timerTeam1 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var timerTeam2 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            Color.sstBlue.ignoresSafeArea()
            
            VStack {
                Menu {
                    ForEach(sports.indices, id: \.self) { sport in
                        Button {
                            currentIndex = sport
                            currentSport = sports[sport]
                        } label: {
                            Text(sports[sport].name)
                        }
                    }
                    
                } label: {
                    Text(currentSport.name)
                        .font(.largeTitle)
                        .scaleEffect(1.5)
                        .bold()
                }
                .padding()
                
                HStack {
                    VStack {
                        Button {
                            if isTimerRunning {
                                self.timerTeam1.upstream.connect().cancel()
                            }
                            else {
                                timerTeam1String = "00:00.00"
                                currentDate = Date.now
                                self.timerTeam1 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                                
                            }
                            isTimerRunning.toggle()
                        } label: {
                            Text("Custom Button")
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                .foregroundColor(.white)
                                .background(.sstRed)
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        .onReceive(timerTeam1, perform: { _ in
                            if self.isTimerRunning {
                                timerTeam1String = String(format: "%02.0f:%02.0f.%01.0f", ((Date().timeIntervalSince( self.currentDate))/60).truncatingRemainder(dividingBy: 60).rounded(.down),((Date().timeIntervalSince( self.currentDate))).truncatingRemainder(dividingBy: 60),((Date().timeIntervalSince( self.currentDate))*10).truncatingRemainder(dividingBy: 10).rounded(.down))
                            }
                        })
                        
                        Text(self.timerTeam1String)
                            .foregroundStyle(Color.white)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Button {
                            
                        } label: {
                            Text("Start")
                                .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.width/3)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        Text("00:00.00")
                            .foregroundStyle(Color.white)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Text("Custom Button")
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                .foregroundColor(.white)
                                .background(.sstRed)
                                .cornerRadius(8)
                        }
                        .buttonStyle(.plain)
                        Text("00:00.00")
                            .foregroundStyle(Color.white)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    
                    
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width)
                

                LazyVStack {
                    let stats = [currentSport.stat1, currentSport.stat2, currentSport.stat3, currentSport.stat4, currentSport.stat5, currentSport.stat6, currentSport.stat7, currentSport.stat8]
                    
                    ForEach(stats, id: \.self) { stat in
                        if stat == "" { }
                        else { StatRow(statName: stat) }
                    }
            }
                
                Spacer()
                
            }
            .onAppear {
                currentSport = sports[currentIndex]
            }
            
        }
    }
}


#Preview {
    StatisticsView()
        .modelContainer(SSTatisticsApp.init().sportContainer)
}

struct StatRow: View {
    
    @State private var statTeam1 = 0
    @State private var statTeam2 = 0
    
    @State var statName: String
    
    var body: some View {
        
        ZStack {
            HStack {
                Stepper(value: $statTeam1, in: 0...99) {
                }
                .padding()
                .fixedSize()
                .scaleEffect(1.5)
        
                Text(String(statTeam1))
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            
            Text(statName)
                .foregroundStyle(Color.white)
                .font(.largeTitle)
                .bold()
                .padding()
            
            HStack {
                Spacer()
                Text(String(statTeam2))
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
            
                Stepper(value: $statTeam2, in: 0...99) {
                }
                .padding()
                .fixedSize()
                .scaleEffect(1.5)

            }
            
        }
        .padding(.horizontal)
        
        
    }
}
