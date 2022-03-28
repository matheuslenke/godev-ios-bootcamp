//
//  ApiService.swift
//  WhatsappClone
//
//  Created by Matheus Lenke on 28/03/22.
//

import Foundation

enum MessageError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvaliable
}

protocol ServiceProtocol {
    func getMessages(completion: @escaping (Result<Messages, MessageError>) -> Void)
    
}

class ApiService: ServiceProtocol {
    
    let baseUrl = "https://run.mocky.io/v3/5c8874c5-225c-4f8f-82c9-b7ab462c938d"
    
    let session = URLSession.shared
    
    static var shared: ApiService {
        let instance = ApiService()
        return instance
    }
    
    func getMessages(completion: @escaping (Result<Messages, MessageError>) -> Void) {

        guard let queryUrl = baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return completion(.failure(.urlInvalid))}
        guard let url = URL(string: queryUrl) else { return completion(.failure(.urlInvalid)) }
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvaliable)) }
                
                let decoder = JSONDecoder()
                let Messages = try decoder.decode(Messages.self, from: jsonData)
                
                completion(.success(Messages))
                
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        
        dataTask.resume()
    }
}
