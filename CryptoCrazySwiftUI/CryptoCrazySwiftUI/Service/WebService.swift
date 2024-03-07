//
//  WebService.swift
//  CryptoCrazySwiftUI
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import Foundation

class WebService {
    
    func downloadCurrency(url : URL, completion: @escaping (Result<[CryptoCurrency]?,DownloadError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(DownloadError.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(DownloadError.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
    
}


enum DownloadError : Error {
    case badUrl
    case noData
    case dataParseError
}
