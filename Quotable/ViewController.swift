//
//  ViewController.swift
//  Quotable
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quote = [QuoteContents.Contents]()
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://quotes.rest/qod.json") {
            if let data = try? Data(contentsOf: url){
            parse(json:data)
            }
        }
    }
    
//Parse JSON data
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonQuotes = try? decoder.decode(QuoteContents.self, from: json) {
            quote = jsonQuotes.contents
        }
    }
}

