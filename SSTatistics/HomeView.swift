//
//  HomeView.swift
//  SSTatistics
//
//  Created by anniehow on 11/4/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var bounce1 = 0
    @State private var bounce2 = 0
    @State private var bounce3 = 0
    @State private var bounce4 = 0
    @State private var bounce5 = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.sstBlue.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Menu(/*@START_MENU_TOKEN@*/"Menu"/*@END_MENU_TOKEN@*/) {
                            NavigationLink(destination: PastGamesView()) {
                                HStack () {
                                    Image(systemName: "clock.arrow.circlepath")
                                    Text("Previous Games")
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            NavigationLink(destination: SettingsView()) {
                                HStack () {
                                    Image(systemName: "gear")
                                    Text("Settings")
                                }
                            }
                            
                            NavigationLink(destination: HelpView()) {
                                HStack () {
                                    Image(systemName: "questionmark.circle")
                                    Text("Help")
                                }
                            }
                            
                            NavigationLink(destination: AboutView()) {
                                HStack () {
                                    Image(systemName: "info.circle")
                                    Text("About")
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Text("SSTatistics").foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .scaleEffect(1.5)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink(destination: StatisticsView()) {
                        HStack () {
                            Text("Start Game").foregroundStyle(Color.sstBlue)
                                .bold()
                            Image(systemName: "play").foregroundStyle(Color.sstBlue)
                        }
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "figure.handball").foregroundStyle(Color.white)
                            .scaleEffect(2)
                            .padding()
                            .symbolEffect(.bounce.up, value: bounce1)
                            .onTapGesture {
                                bounce1 += 3
                            }
                        Image(systemName: "soccerball.inverse").foregroundStyle(Color.white)
                            .scaleEffect(2)
                            .padding()
                            .symbolEffect(.bounce.up, value: bounce2)
                            .onTapGesture {
                                bounce2 += 3
                            }
                        Image(systemName: "basketball").foregroundStyle(Color.white)
                            .scaleEffect(2)
                            .padding()
                            .symbolEffect(.bounce.up, value: bounce3)
                            .onTapGesture {
                                bounce3 += 3
                            }
                        Image(systemName: "volleyball").foregroundStyle(Color.white)
                            .scaleEffect(2)
                            .padding()
                            .symbolEffect(.bounce.up, value: bounce4)
                            .onTapGesture {
                                bounce4 += 3
                            }
                        Image(systemName: "figure.softball").foregroundStyle(Color.white)
                            .scaleEffect(2)
                            .padding()
                            .symbolEffect(.bounce.up, value: bounce5)
                            .onTapGesture {
                                bounce5 += 3
                            }
                    }
                    
                    Text("Brought to you by the\n School of Science and Technology, Singapore").multilineTextAlignment(.center).foregroundStyle(Color.white)
                        .padding()
                            
                
                    
                    
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(SSTatisticsApp.init().sportContainer)
}
