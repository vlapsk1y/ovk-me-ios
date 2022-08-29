//
//  Error.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 18.07.2022.
//

import Foundation

struct ServerError: Decodable, Error {
    let errorCode: Int
    let errorMessage: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorMessage = "error_msg"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.errorCode = try container.decode(Int.self, forKey: .errorCode)
        self.errorMessage = try container.decode(String.self, forKey: .errorMessage)
    }
}
