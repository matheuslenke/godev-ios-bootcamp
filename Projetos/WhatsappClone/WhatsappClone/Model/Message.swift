//
//  Message.swift
//  WhatsappClone
//
//  Created by Matheus Lenke on 25/03/22.
//

import Foundation

struct Message: Codable {
    let contactName: String
    let message: String
    let sentDate: String
    let avatarUrl: String
}

typealias Messages = [Message]
