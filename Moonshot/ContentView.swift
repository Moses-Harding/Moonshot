//
//  ContentView.swift
//  Moonshot
//
//  Created by Moses Harding on 12/27/24.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    
    // Data
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // Showing view type
    enum ViewType { case grid, list }
    @State private var showingViewType: ViewType = .list
    
    var body: some View {
        NavigationStack {
            ScrollView {
                switch showingViewType {
                case .grid:
                    GridLayout(missions: missions, astronauts: astronauts)
                case .list:
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Switch views") {
                    showingViewType = showingViewType == .grid ? .list : .grid
                }
            }
        }
    }
}

struct GridLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    // Grid layout
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                    )
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(missions) { mission in
                LazyHStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 50)
                        .padding()
                    Spacer()
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.white)
        }
    }
}

// MARK: Creating a grid
/*
struct ContentView: View {
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 80)),
            GridItem(.adaptive(minimum: 80)),
            GridItem(.adaptive(minimum: 80))
        ]
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}
*/

// MARK: Creating navigation link with list
/*
 struct ContentView: View {
     var body: some View {
         NavigationStack {
             List(0..<100) { row in
                 NavigationLink("Row \(row)") {
                     Text("Detail \(row)")
                 }
             }
             .navigationTitle("SwiftUI")
         }
     }
 }
 */

// MARK: Creating custom navigation link
/*
 struct ContentView: View {
     var body: some View {
         NavigationStack {
             NavigationLink {
                 Text("Detail View")
             } label: {
                 VStack {
                     Text("This is the label")
                     Text("So is this")
                     Image(systemName: "face.smiling")
                 }
                 .font(.largeTitle)
             }
         }
     }
 }
 */

// MARK: Creating a scrollview
/*
struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity) // This makes the whole area scrollable, but is not necessary with a LazyVStack vs a regular VStack
        }
    }
}

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText for \(text)")
        self.text = text
    }
}
 */

// MARK: Scaling image relatively
/*
struct ContentView: View {
    var body: some View {
        VStack {
            Image(.messi)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.vertical) { size, axis in
                    return size * 0.8
                }
        }
        .padding()
    }
}
*/

