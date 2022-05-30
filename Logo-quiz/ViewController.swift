//
//  ViewController.swift
//  Logo-quiz
//
//  Created by user216463 on 5/22/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countryFlag: UIImageView!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let countries = ["Brazil", "China", "England", "France", "Germany", "Ireland", "Israel", "Italy", "Mexico", "Portugal", "Russia", "Scotland", "Spain", "Sweeden", "Uzebkistan"]
    let countriesFlags = [#imageLiteral(resourceName: "brazil"), #imageLiteral(resourceName: "china"), #imageLiteral(resourceName: "england"), #imageLiteral(resourceName: "france"), #imageLiteral(resourceName: "germany"), #imageLiteral(resourceName: "ireland"), #imageLiteral(resourceName: "israel"), #imageLiteral(resourceName: "italy"), #imageLiteral(resourceName: "mexico"), #imageLiteral(resourceName: "portugal"), #imageLiteral(resourceName: "russia"), #imageLiteral(resourceName: "scotland"), #imageLiteral(resourceName: "spain"), #imageLiteral(resourceName: "sweden"), #imageLiteral(resourceName: "uzbekistan")]
    let totalGames: Int = 15
    var currentGames: Int = 0
    var currentLife: Int = 3
    var currentScore: Int = 1
    var currentCountry = ""
    
    static var currentScore: String = "7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryRespawn()
        updateUi()
        
    }
    
    func updateUi(){
        score.text = "\(currentScore)"
        progressBar.progress = Float(currentGames)/Float(totalGames)
        if(currentLife == 2){
            heart3.isHidden = true
        }
        else if(currentLife == 1){
            heart2.isHidden = true
        }
        else if(currentLife == 0 ){
            heart1.isHidden = true
            
            UserDefaults.standard.set(currentScore, forKey: "score")

            present((storyboard?.instantiateViewController(withIdentifier: "menu"))!, animated: true)
        }
        
        if(currentGames == totalGames){
            UserDefaults.standard.set(currentScore, forKey: "score")
            
            present((storyboard?.instantiateViewController(withIdentifier: "menu"))!, animated: true)
        }
    }
    
    func countryRespawn(){
        currentGames += 1
        var arr: [Int] = []
        var rands = [Int](0 ..< countries.count)
        let rand1 = rands.randomElement()
        rands = rands.filter(){$0 != rand1}
        let rand2 = rands.randomElement()
        rands = rands.filter(){$0 != rand2}
        let rand3 = rands.randomElement()
        rands = rands.filter(){$0 != rand3}
        let rand4 = rands.randomElement()
        rands = rands.filter(){$0 != rand4}
        currentCountry = countries[rand1!]
        arr.append(rand1!)
        arr.append(rand2!)
        arr.append(rand3!)
        arr.append(rand4!)
        arr.shuffle()
        countryFlag.image = countriesFlags[rand1!]
        
        option1.setTitle(countries[arr[0]], for: .normal)
        option2.setTitle(countries[arr[1]], for: .normal)
        option3.setTitle(countries[arr[2]], for: .normal)
        option4.setTitle(countries[arr[3]], for: .normal)
    }
    
    
    @IBAction func clicked(_ sender: UIButton) {
        if sender.currentTitle == currentCountry {
            currentScore += 1
        }
        else{
            currentLife -= 1
        }
        
        countryRespawn()
        updateUi()
    }
}

