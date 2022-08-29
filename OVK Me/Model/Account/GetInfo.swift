//
//  GetInfo.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 12.08.2022.
//

import Foundation

struct GetInfo: Decodable {
    let twoFaRequired: Int
    let country: String
    let euUser: Bool
    let httpRequired: Int
    let intro: Int
    let communityComments: Bool
    let isLiveStreamingEnabled: Bool
    let isNewLiveStreamingEnabled: Bool
    let lang: Int
    let noWallReplies: Int
    let ownPostsDefault: Int
    
    enum CodingKeys: String, CodingKey {
        case twoFaRequired = "2fa_required"
        case country, intro, lang
        case euUser = "eu_user"
        case httpRequired = "https_required"
        case communityComments = "community_comments"
        case isLiveStreamingEnabled = "is_live_streaming_enabled"
        case isNewLiveStreamingEnabled = "is_new_live_streaming_enabled"
        case noWallReplies = "no_wall_replies"
        case ownPostsDefault = "own_posts_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.twoFaRequired = try container.decode(Int.self, forKey: .twoFaRequired)
        self.country = try container.decode(String.self, forKey: .country)
        self.euUser = try container.decode(Bool.self, forKey: .euUser)
        self.httpRequired = try container.decode(Int.self, forKey: .httpRequired)
        self.intro = try container.decode(Int.self, forKey: .intro)
        self.communityComments = try container.decode(Bool.self, forKey: .communityComments)
        self.isLiveStreamingEnabled = try container.decode(Bool.self, forKey: .isLiveStreamingEnabled)
        self.isNewLiveStreamingEnabled = try container.decode(Bool.self, forKey: .isNewLiveStreamingEnabled)
        self.lang = try container.decode(Int.self, forKey: .lang)
        self.noWallReplies = try container.decode(Int.self, forKey: .noWallReplies)
        self.ownPostsDefault = try container.decode(Int.self, forKey: .ownPostsDefault)
    }
    
    init() {
        self.twoFaRequired = 0
        self.country = "JP"
        self.euUser = false
        self.httpRequired = 0
        self.intro = 0
        self.communityComments = false
        self.isLiveStreamingEnabled = false
        self.isNewLiveStreamingEnabled = false
        self.lang = 0
        self.noWallReplies = 0
        self.ownPostsDefault = 0
    }
}
