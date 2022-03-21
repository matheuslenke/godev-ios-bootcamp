//
//  ApiService.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import Foundation

enum PersonError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getPersonList(completion: @escaping (Result<PersonList, PersonError>) -> Void)
    
}

class ApiService: ServiceProtocol {
    
    let baseUrl = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    let session = URLSession.shared
    
    static var shared: ApiService {
        let instance = ApiService()
        return instance
    }
    
    func getPersonList(completion: @escaping (Result<PersonList, PersonError>) -> Void) {
        
        guard let queryUrl = baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return completion(.failure(.urlInvalid))}
        guard let url = URL(string: queryUrl) else { return completion(.failure(.urlInvalid))
        }
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable)) }
                
                let decoder = JSONDecoder()
                let trackList = try decoder.decode(PersonList.self, from: jsonData)
                
                completion(.success(trackList))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
