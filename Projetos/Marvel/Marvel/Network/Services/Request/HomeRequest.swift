//
//  HomeRequest.swift
//  Marvel
//
//  Created by Matheus Lenke on 30/03/22.
//

import Foundation

enum HomeRequest : URLRequestProtocol {
    
    case home
    case details
    
    /// The API's base url
    var baseURL: String {
        return Environment.baseURL
    }
    
    /// Defines the endpoint we want to hit
    var path: String {
        switch self {
        case .home:
               return "characters"
        case .details:
            return "details"
        }
    }
    
    /// The API's base url and it's endpoint combined
    var targetURL: String {
        return "\(baseURL)/\(path)"
    }
    
    /// The API's query params
    var queryParams: String {
        /*
         timestamp
         
         MD5 = timestamp + private + public
         */
        let timestamp = NSDate().timeIntervalSince1970.description
        switch self {
        case .home:
            let hash = HashMD5Hex(string: "\(timestamp)\(Environment.privateKey)\(Environment.publicKey)")
            return "limit=30&ts=\(timestamp)&apikey=\(Environment.publicKey)&hash=\(hash)"
        case .details:
            return "details=124010"
        }
    }
    
    /// Relative to the method we want to call, that was defined with an enum above
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        case .details:
            return .post
        }
    }
    
}
