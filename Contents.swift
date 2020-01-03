//
//  Contents.swift
//  Quotable
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import Foundation

struct QuoteContents: Codable {
    struct Contents: Codable {
        var quote: String
        var author: String
    }
    var results: [Contents]
}

