//
//  ViewController.swift
//  Quotable
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainQuote = [Content]()
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apikey = "f33bd986587b3df9854280a2de17a6c3a260f0f6"
        guard let url = URL(string: "https://api.paperquotes.com/apiv1/quotes/?author=Mahatma%20Gandhi") else {return}
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in
            guard let data = data else { return }
            do {
                let mainQuote = try JSONDecoder().decode(Content.self, from: data)
                DispatchQueue.main.async {
                    print(mainQuote.author)
                }
            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        } .resume()
    }
}

