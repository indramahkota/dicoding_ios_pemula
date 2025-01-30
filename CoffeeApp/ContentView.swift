//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Indra Mahkota on 28/01/25.
//

import SwiftUI

struct ContentView: View {
  let coffeeList: [Coffee] = Bundle.main.decode("coffee.json")
  
  var body: some View {
    NavigationView {
      List(coffeeList) { coffee in
        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
          HStack {
            AsyncImage(url: URL(string: coffee.imageUrl)) { image in
              image.resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            } placeholder: {
              ProgressView()
            }
            
            VStack(alignment: .leading) {
              Text(coffee.name)
                .font(.headline)
              Text(coffee.region)
                .font(.subheadline)
                .foregroundColor(.gray)
            }
          }
        }
      }
      .navigationTitle("Coffee Selection")
      .toolbar {
        NavigationLink(destination: ProfileView()) {
          Image(systemName: "person.crop.circle")
        }
      }
    }
  }
}

struct CoffeeDetailView: View {
  let coffee: Coffee
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        AsyncImage(url: URL(string: coffee.imageUrl)) { image in
          image.resizable()
            .scaledToFit()
            .cornerRadius(10)
        } placeholder: {
          ProgressView()
        }
        .frame(height: 250)
        
        Text(coffee.name)
          .font(.largeTitle)
          .bold()
          .padding(.top, 10)
        
        Text(coffee.description)
          .font(.body)
          .foregroundColor(.gray)
          .padding(.top, 5)
        
        HStack {
          Text("Price: $") + Text(String(format: "%.2f", coffee.price))
          Spacer()
          Text("Weight: \(coffee.weight)g")
        }
        .padding()
        
        Text("Region: " + coffee.region)
          .padding(.bottom, 5)
        
        Text("Flavor Profile: " + coffee.flavorProfile.joined(separator: ", "))
          .padding(.bottom, 5)
        
        Text("Grind Options: " + coffee.grindOption.joined(separator: ", "))
          .padding(.bottom, 5)
        
        Text("Roast Level: \(coffee.roastLevel)")
          .padding(.bottom, 5)
      }
      .padding()
    }
  }
}

struct ProfileView: View {
  var body: some View {
    VStack {
      Image("IndraMahkota")
        .resizable()
        .scaledToFill()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
        .padding()
      
      Text("Indra Mahkota")
        .font(.title2)
        .bold()
        .padding(.bottom, 2)
      
      Text("This app is designed to showcase various coffee types with beautiful UI and smooth interactions, following Apple’s design guidelines.")
        .multilineTextAlignment(.center)
        .padding()
    }
    .navigationTitle("Profile")
  }
}

extension Bundle {
  func decode<T: Decodable>(_ file: String) -> T {
    guard let url = url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    let decoder = JSONDecoder()
    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }
    
    return loaded
  }
}
