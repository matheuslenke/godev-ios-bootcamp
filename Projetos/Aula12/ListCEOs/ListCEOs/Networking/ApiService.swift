//
//  ApiService.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import Foundation
import Alamofire

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
        
        AF.request(url, method: .get).validate().responseDecodable(of: PersonList.self) { response in
            guard let users = response.value else  { return completion(.failure(.noDataAvaliable))}
            
            completion(.success(users))
        }
    }
}
