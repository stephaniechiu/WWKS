//
//  ViewController.swift
//  Quotable
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainQuote: QuoteContents?
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apikey = "f33bd986587b3df9854280a2de17a6c3a260f0f6"
        guard let url = URL(string: "https://api.paperquotes.com/apiv1/quotes/?tags=love,life&curated=1") else {return}
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in
            guard let data = data else { return }
            do {
                self.mainQuote = try JSONDecoder().decode(QuoteContents.self, from: data)
                DispatchQueue.main.async {
                    if let mainQuote = self.mainQuote {
                        print(mainQuote.results[0])
                        
                        // Uncomment this to see all of the results
                        // print(mainQuote.results)
                    }
                }
            }
            catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        } .resume()
    }
}

