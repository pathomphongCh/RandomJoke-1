//
//  APIManager.swift
//  RandomJoke
//
//  Created by Teerawat Vanasapdamrong on 8/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
  func getRandomJoke() {
    guard let url = URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random") else {
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5", forHTTPHeaderField: "x-rapidapi-key")
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        print(data)
      }
    }
    task.resume()
  }
  
  func getRandomJokeAlamofire() {
    let headers: HTTPHeaders = [
      "x-rapidapi-key": "d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5",
      "Accept": "application/json"
    ]
    Alamofire.request("https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random", headers: headers).responseJSON { (data) in
      print(data)
    }
  }
}
