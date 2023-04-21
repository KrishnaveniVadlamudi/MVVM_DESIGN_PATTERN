//
//  ToDoReponse.swift
//  APIParserMVVM
//
//  Created by Sunkara on 4/18/23.
//

import Foundation

struct ToDoResponse : Codable {
    let todos: [Todo]
    let total, skip, limit: Int
}


struct Todo : Codable {
    let id: Int?
     let todo: String?
     let completed: Bool?
     let userID: Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case todo = "todo"
        case completed = "completed"
        case userID = "userId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
   
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        todo = try values.decodeIfPresent(String.self, forKey: .todo)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
    }

}
