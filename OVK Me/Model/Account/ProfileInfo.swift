//
//  ProfileInfoModel.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

struct ProfileInfo: Decodable {
    let firstName: String
    let id: Int
    let lastName: String
    let homeTown: String
    let status: String
    let bdate: String
    let bdateVisibility: Int
    let phone: String
    let relation: Int
    let sex: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id, relation, sex
        case lastName = "last_name"
        case homeTown = "home_town"
        case status, bdate, phone
        case bdateVisibility = "bdate_visibility"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.id = try container.decode(Int.self, forKey: .id)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.homeTown = try container.decode(String.self, forKey: .homeTown)
        self.status = try container.decode(String.self, forKey: .status)
        self.bdate = try container.decode(String.self, forKey: .bdate)
        self.bdateVisibility = try container.decode(Int.self, forKey: .bdateVisibility)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.relation = try container.decode(Int.self, forKey: .relation)
        self.sex = try container.decode(Int.self, forKey: .sex)
    }
    
    init() {
        self.firstName = "Vladimir"
        self.lastName = "Lapskiy"
        self.id = 52
        self.homeTown = "Saint-Petersburg"
        self.status = ""
        self.bdate = "11.09.2005"
        self.bdateVisibility = 0
        self.phone = ""
        self.relation = 0
        self.sex = 1
    }
}
