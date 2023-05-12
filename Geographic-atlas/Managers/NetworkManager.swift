//
//  NetworkManager.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import Foundation

// MARK: - Errors
enum NetworkError: Error {
  case failedTogetData
}

// MARK: - Network Manager
final class NetworkManager {
    
  func getCountries(complition: @escaping (Result<[Country], Error>) -> Void) {
      guard let url = URL(string: "\(URLs.base)\(URLs.allCountries)") else { return }
      
      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
        guard let data = data, error == nil else { return }
        
        do {
          let result = try JSONDecoder().decode(CountriesRespounce.self, from: data)
          complition(.success(result.countries))
        }
        catch {
          complition(.failure(NetworkError.failedTogetData))
        }
      }
      
      task.resume()
    }
}
