//
//  AboutInstance.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 27.08.2022.
//

import Foundation

struct AboutInstance: Decodable {
    let statistics: Statistics
    let administrators: Administrators
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case statistics, administrators, links
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.statistics = try container.decode(Statistics.self, forKey: .statistics)
        self.administrators = try container.decode(Administrators.self, forKey: .administrators)
        self.links = try container.decode(Links.self, forKey: .links)
    }
    
    init() {
        self.statistics = Statistics()
        self.administrators = Administrators()
        self.links = Links()
    }
}
