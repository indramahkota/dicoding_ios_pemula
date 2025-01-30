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
  let flavorProfile: [String]
  let grindOption: [String]
  let roastLevel: Int
  let imageUrl: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case description
    case price
    case region
    case weight
    case flavorProfile = "flavor_profile"
    case grindOption = "grind_option"
    case roastLevel = "roast_level"
    case imageUrl = "image_url"
  }
}
