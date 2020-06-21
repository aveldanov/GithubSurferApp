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
    tableView.delegate = self
    tableView.dataSource = self
    tableView.reloadData()
//    DownloadService.instance.downloadTrendingRepoDictArray { (json) in
//      print("Downloaded")
//    }
    
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  

  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trendingRepoTableViewCell") as? TrendingRepoTableViewCell else {return UITableViewCell()}
    let repo = RepoModel(image: UIImage(named: "searchIconLarge")!, name: "Swift", description: "Descrip", numberOfForks: 22, lang: "C++", numberOfContributors: 687, repoUrl: "www.intuit.com")
    cell.configureCell(repo: repo)
    
    return cell
  }


}

