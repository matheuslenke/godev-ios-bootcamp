//
//  Person.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import Foundation

typealias PersonList = [Person]

struct Person: Codable {
    let id: Int
    let name: String
    let photoUrl: String
    let company: Company
    
    enum CodingKeys: String, CodingKey {
        case id, name, company
        case photoUrl = "photo"
    }
}

struct Company: Codable {
    let name: String
}
