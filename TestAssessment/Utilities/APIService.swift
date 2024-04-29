//
//  APIService.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import Foundation

struct Resource<T: Codable> {
    let urlString: String
    let params: [String : AnyObject]?
    let headers: [String : String]
}

struct APIService {
    
    static func fetchPage<T : Codable>(resoucrce : Resource<T>, completion: @escaping (Result<[T], Error>) -> Void) {
        
        let urlString = resoucrce.urlString
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let model = try JSONDecoder().decode([T].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
