//
//  AstronautView.swift
//  Moonshot
//
//  Created by Moses Harding on 12/27/24.
//

import SwiftUI

struct AstronautView: View {
    
    var astronaut: Astronaut
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
                Text(astronaut.description)
            }
            .padding(.horizontal)
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let first = astronauts.first!
    
    return AstronautView(astronaut: first.value)
        .preferredColorScheme(.dark)
}
