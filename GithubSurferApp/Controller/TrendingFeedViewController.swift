//
//  ViewController.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/17/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TrendingFeedViewController: UIViewController {
  let refreshControl = UIRefreshControl()
  var dataSource = PublishSubject<[RepoModel]>()
  var disposeBag = DisposeBag()
  
  @IBOutlet weak var tableView: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.refreshControl = refreshControl
    refreshControl.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    refreshControl.attributedTitle = NSAttributedString(string: "Fetching github repos 🛹", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 17)!])
    refreshControl.addTarget(self, action: #selector(self.fetchData),  for: .valueChanged)
    

//    tableView.delegate = self
//    tableView.dataSource = self
//    tableView.reloadData()

    
//    DownloadService.instance.downloadTrendingRepos { (reposArray) in
//      print(reposArray[0].name)
//    }
    
    fetchData()
//
//    bind to tableView to view data
    dataSource.bind(to: tableView.rx.items(cellIdentifier: "trendingRepoTableViewCell")){(row,repo:RepoModel,cell:TrendingRepoTableViewCell) in
      cell.configureCell(repo: repo)
    }.disposed(by: disposeBag)
    
  }
//
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return 1
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return 1
//  }
//
//
//
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trendingRepoTableViewCell") as? TrendingRepoTableViewCell else {return UITableViewCell()}
//    let repo = RepoModel(image: UIImage(named: "searchIconLarge")!, name: "Swift", description: "Descrip", numberOfForks: 22, lang: "C++", numberOfContributors: 687, repoUrl: "www.intuit.com")
//    cell.configureCell(repo: repo)
//
//    return cell
//  }

  
  @objc func refresh(){
    print("KJLJO")
  }
  
  
  @objc func fetchData(){
    print("YO")

    DownloadService.instance.downloadTrendingRepos { (trendingRepoArray) in
      self.dataSource.onNext(trendingRepoArray)
      self.refreshControl.endRefreshing()

    }
  }

}






