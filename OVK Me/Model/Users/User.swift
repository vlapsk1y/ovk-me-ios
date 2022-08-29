//
//  Friend.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 31.07.2022.
//

import Foundation

struct User: Decodable {
    let id: Int
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool?
    let online: Int?
    let deactivated: String?
    let hasPhoto: Int?
    let photoMaxOrg: String?
    let photo100: String?
    let photo200Orig: String?
    let photo200: String?
    let photo50: String?
    let photoMax: String?
    let sex: Int?
    let verified: Int?
    let status: String?
    let screenName: String?
    let music: String?
    let movies: String?
    let tv: String?
    let books: String?
    let city: String?
    let interests: String?
    
    enum CodingKeys: String, CodingKey {
        case id, sex, online, deactivated, verified, status, music, movies, tv, books, city, interests
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case photo200Orig = "photo_200_orig"
        case screenName = "screen_name"
        case hasPhoto = "has_photo"
        case photoMaxOrg = "photo_max_orig"
        case photoMax = "photo_max"
        case photo50 = "photo_50"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.isClosed = try? container.decode(Bool.self, forKey: .isClosed)
        self.canAccessClosed = try? container.decode(Bool.self, forKey: .canAccessClosed)
        self.online = try? container.decode(Int.self, forKey: .online)
        self.deactivated = try? container.decode(String.self, forKey: .deactivated)
        self.photo100 = try? container.decode(String.self, forKey: .photo100)
        self.photo200Orig = try? container.decode(String.self, forKey: .photo200Orig)
        self.sex = try? container.decode(Int.self, forKey: .sex)
        self.verified = try? container.decode(Int.self, forKey: .verified)
        self.status = try? container.decode(String.self, forKey: .status)
        self.screenName = try? container.decode(String.self, forKey: .screenName)
        self.music = try? container.decode(String.self, forKey: .music)
        self.movies = try? container.decode(String.self, forKey: .movies)
        self.tv = try? container.decode(String.self, forKey: .tv)
        self.books = try? container.decode(String.self, forKey: .books)
        self.city = try? container.decode(String.self, forKey: .city)
        self.interests = try? container.decode(String.self, forKey: .interests)
        self.hasPhoto = try? container.decode(Int.self, forKey: .hasPhoto)
        self.photoMaxOrg = try? container.decode(String.self, forKey: .photoMaxOrg)
        self.photoMax = try? container.decode(String.self, forKey: .photoMax)
        self.photo50 = try? container.decode(String.self, forKey: .photo50)
        self.photo200 = try? container.decode(String.self, forKey: .photo200)
    }
    
    init() {
        self.id = 52
        self.firstName = "Vladimir"
        self.lastName = "Lapskiy"
        self.isClosed = false
        self.canAccessClosed = false
        self.online = 1
        self.deactivated = nil
        self.hasPhoto = 1
        self.photoMaxOrg = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.photoMax = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.photo50 = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.photo100 = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.photo200Orig = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.photo200 = "https://ru-spb.openvk.uk/hentai/b4/b44647f3858b2db205a9cb73b882b465d681b8bb7136d4743a1527f39960ce0421b3b0af4e6acf3b0336009c0961b0e40fb5f11bfddbccd72559840b18e573cc_cropped/normal.jpeg"
        self.sex = 0
        self.verified = 1
        self.status = nil
        self.screenName = "vlapskiy"
        self.music = "Rammstein, Within Temptation"
        self.movies = "Interstellar, steins; gate"
        self.tv = nil
        self.books = "Harry Potter"
        self.city = "Saint-Petersburg"
        self.interests = "Programming, photography, music"
    }
}
