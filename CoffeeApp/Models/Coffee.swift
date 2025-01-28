//
//  Coffee.swift
//  CoffeeApp
//
//  Created by Indra Mahkota on 28/01/25.
//

struct Coffee: Identifiable, Decodable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let region: String
  let weight: Int
  let flavor_profile: [String]
  let grind_option: [String]
  let roast_level: Int
  let image_url: String
}
