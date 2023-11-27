//
//  ContentView.swift
//  Simple List Navigation
//
//

import SwiftUI

struct ContentView: View {
    
    // MARK: PROPERTIES
    
    var menuItems = [Menu(name: "Onigiri", image: "onigiri"),
                     Menu(name: "Meguro Sushi", image: "meguro-sushi"),
                     Menu(name: "Tako Sushi", image: "tako-sushi"),
                     Menu(name: "Avocado Maki", image: "avocado-maki"),
                     Menu(name: "Tobiko Spicy Maki", image: "tobiko-spicy-maki"),
                     Menu(name: "Salmon Sushi", image: "salmon-sushi"),
                     Menu(name: "Hamachi Sushi", image: "hamachi-sushi"),
                     Menu(name: "Kani Sushi", image: "kani-sushi"),
                     Menu(name: "Tamago Sushi", image: "tamago-sushi"),
                     Menu(name: "California Roll", image: "california-roll"),
                     Menu(name: "Shrimp Sushi", image: "shrimp-sushi"),
                     Menu(name: "Ikura Sushi", image: "ikura-sushi")]
    
    // MARK: BODY
    
    var body: some View {
        
        List {
            ForEach(menuItems) { sushi in
                BasicImageRow(sushi: sushi)
            }
            .listStyle(.plain)
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}


#Preview {
    ContentView()
}

// MARK: VIEWS

struct BasicImageRow: View {
    var sushi: Menu
    var body: some View {
        HStack {
            Image(sushi.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(sushi.name)
        }
    }
}

struct FullImageRow: View {
    var sushi: Menu
    var body: some View {
        ZStack {
            Image(sushi.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(sushi.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.white)
        }
    }
}

struct SushiDetailView: View {
    var sushi: Menu
    var body: some View {
        VStack {
            Image(sushi.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(sushi.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
        }
    }
}
