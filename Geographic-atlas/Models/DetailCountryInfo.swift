//
//  DetailCountryInfo.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 18.05.2023.
//

import Foundation

struct DetailCountryInfo {
  let name: Name
  let population: Int
  let area: Double
  let capital: [String]?
  let currencies: Currencies?
  let flags: Flags
  var isHidden = false
}
