//
//  ViewController.swift
//  Jokes
//
//  Created by Алексей Каземиров on 4/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getJokeButton(_ sender: Any) {
        ApiManager.shared.getAnyJoke(completion: { jokes in
            if let setup = jokes.setup, let joke = jokes.delivery {
                DispatchQueue.main.async {
                    self.deliveryLabel.text = "\(joke)"
                    self.setupLabel.text = "\(setup)"
                }
            }
        })
    }
    
}


