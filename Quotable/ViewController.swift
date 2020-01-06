//
//  ViewController.swift
//  WWKS - What Would Kanye Say
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quote: Contents?
    
    @IBOutlet weak var quoteText: UILabel!
    @IBAction func randomizeBtn(_ sender: UIButton) {
        newQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuote()
    }

//Generates random Kanye quote
    func newQuote() {
        guard let url = URL(string: "https://api.kanye.rest") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) {
             (data, response, err) in
             guard let data = data else { return }
             do {
                 self.quote = try JSONDecoder().decode(Contents.self, from: data)
                 DispatchQueue.main.async {
                        if let kanyeQuote = self.quote {
                            print(kanyeQuote.quote)
                         
                        self.quoteText.text = kanyeQuote.quote           
                     }
                 }
             }
             catch let jsonErr {
                 print("Error serializing json:", jsonErr)
             }
         } .resume()
     }
}

