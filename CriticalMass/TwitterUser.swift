//
//  TwitterUser.swift
//  CriticalMaps
//
//  Created by Leonard Thomas on 1/28/19.
//

import Foundation

struct TwitterUser: Codable, Hashable {
    var name: String
    var screen_name: String
    var profile_image_url_https: String
}
