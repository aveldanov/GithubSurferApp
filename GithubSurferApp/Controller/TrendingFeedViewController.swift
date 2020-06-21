//
//  ViewController.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class TrendingFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "trendingRepoTableViewCell") as? TrendingRepoTableViewCell else {return UITableViewCell()}
    let repo = RepoModel(image: <#T##UIImage#>, name: "Swift", description: "Descrip", numberOfForks: 22, lang: "C++", numberOfContributors: 687, repoUrl: "www.intuit.com")
    
  }
  


}

