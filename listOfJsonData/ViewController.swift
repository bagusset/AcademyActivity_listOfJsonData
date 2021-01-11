//
//  ViewController.swift
//  listOfJsonData
//
//  Created by Bagus setiawan on 11/06/20.
//  Copyright © 2020 Bagus setiawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func searchBtn(_ sender: Any) {
        fecthingInformation()
    }
    
    func fecthingInformation(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        
        do{
            let dataFile = try! Data(contentsOf: url)
            let json =  try! JSONSerialization.jsonObject(with: dataFile, options: .mutableContainers)
            
            guard let array = json as? [Any] else {return}
            for user in array{
                guard let userDict = user as? [String: Any] else {return}
                //guard let date = userDict["date"] as? String else {return}
                guard let title = userDict["title"] as? String else {return}
                guard let venue = userDict["venue"] as? String else {return}
                guard let city = userDict["city"] as? String else {return}
                guard let country = userDict["country"] as? String else {return}
               // guard let fb_url = userDict["fb_url"] as? String else {return}
               // guard let ticket_url = userDict["ticket_url"] as? String else {return}
            
                if searchTxt.text!.contains(venue){
                    nameLabel.text = title
                    ageLabel.text = city
                    genderLabel.text = country
                }
            
            }
        }
    
    }

}

