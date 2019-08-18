//
//  ViewController.swift
//  RandomJoke
//
//  Created by Teerawat Vanasapdamrong on 8/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var jokeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
  @IBAction func buttonTapped() {

    
    APIManager().getRandomJoke { [weak self] (joke) in
      DispatchQueue.main.sync {
        guard let joke = joke else {
          return
        }

        let url = URL(string: "https://picsum.photos/300/240")
        let data = try? Data(contentsOf: url!)
        self?.jokeLabel.text = joke.value
        self?.jokeImage.image = UIImage(data: data!)
    }
  }

}

}
