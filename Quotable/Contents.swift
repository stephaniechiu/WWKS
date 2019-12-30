//
//  Contents.swift
//  Quotable
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import Foundation

struct quoteContents: Codable {
    struct Contents: Codable {
        struct Content: Codable {
            var quote: String
            var author: String
        }
        var quotes: [Content]
    }
    var quoteResults: [Contents]
}

//if let jsonData = jsonString.data(using: .utf8)
//{
//    let decoder = JSONDecoder()
//
//    do {
//        let user = try decoder.decode(User.self, from: jsonData)
//        print(user.last_name)
//    } catch {
//        print(error.localizedDescription)
//    }
//}
