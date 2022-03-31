//
//  ServiceAPI.swift
//  DependencyInject
//
//  Created by Matheus Lenke on 30/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvailable
    case noProcessData
}

typealias completion = (Result<[User], UserError>) -> Void

protocol ServiceAPIProtocol: AnyObject {
    func getUsers(completion: @escaping completion)
}

class ServiceAPI: ServiceAPIProtocol {
    func getUsers(completion: @escaping completion) {
        let user = [User(name: "Matheus", email: "matheuslenke@gmail.com")]
        
        completion(.success(user))
    }
    
}

class SecondServiceAPI: ServiceAPIProtocol {
    func getUsers(completion: @escaping completion) {
        let user = [User(name: "Matheus", email: "matheuslenke@gmail.com")]
        
        completion(.success(user))
    }
    
}

class apiFailureService: ServiceAPIProtocol {
    func getUsers(completion: @escaping completion) {
        
        completion(.failure(.noProcessData))
    }
    
    
}
