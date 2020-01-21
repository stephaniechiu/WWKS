//
//  ViewController.swift
//  WWKS - What Would Kanye Say
//
//  Created by Stephanie on 12/29/19.
//  Copyright © 2019 Stephanie Chiu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var quote: Contents?
    let backgroundColor = BackgroundColorProvider()
    let splashImage = UIImageView(image: UIImage(named: "KanyeFace"))
    let splashView = UIView()
    
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var randomizeBtnView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            newQuote()
            randomizeBtnView.alpha = 0.5
            titleLabel.alpha = 0.8
        
        //Splash view
        splashView.backgroundColor = UIColor(red: 255/255, green: 244/255, blue: 107/255, alpha: 1.0)
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        splashImage.contentMode = .scaleAspectFit
        splashView.addSubview(splashImage)
        splashImage.frame = CGRect(x: splashView.frame.maxX - 250, y: splashView.frame.maxY - 630, width: 100, height: 128)
    
        randomizeBtnView.layer.cornerRadius = 8
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.scaleDownAnimation()
        }
    }
    
//Splash view animation
    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.splashImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { ( success ) in
            self.scaleUpAnimation()
        }
    }
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.splashImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { ( success ) in
            self.removeSplashScreen()
        }
    }
    func removeSplashScreen() {
        splashView.removeFromSuperview()
    }
    
//Generates a new Kanye quote when button is tapped
    @IBAction func randomizeBtn(_ sender: UIButton) {
        sender.shake(duration: 0.5, values: [-12.0, 12.0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
        
        newQuote()
        
        let randomColor = backgroundColor.randomColor()
        view.backgroundColor = randomColor
        
        let red = UIColor(red: 176/255.0, green: 46/255.0, blue: 12/255.0, alpha: 1.0)
        let gray = UIColor(red: 66/255.0, green: 62/255.0, blue: 65/255.0, alpha: 1.0)
        let pink = UIColor(red: 153/255.0, green: 120/255.0, blue: 143/255.0, alpha: 1.0)
    
        if (randomColor == red || randomColor == gray || randomColor == pink) {
            quoteText.textColor = UIColor.white
            authorLabel.textColor = UIColor.white
            titleLabel.textColor = UIColor.white
        } else {
            quoteText.textColor = UIColor.black
            authorLabel.textColor = UIColor.black
            titleLabel.textColor = UIColor.black
        }
    }

//Generates a Kanye quote
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

