//
//  SearchTableViewCell.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/25/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

  @IBOutlet weak var repoNameOutlet: UILabel!
  @IBOutlet weak var repoDescOutlet: UILabel!
  @IBOutlet weak var forksCountOutlet: UILabel!
  @IBOutlet weak var langOutlet: UILabel!
  @IBOutlet weak var backViewOutlet: UIView!
  
  private var repoUrl:String?
  
    override func awakeFromNib() {
        super.awakeFromNib()
      backViewOutlet.layer.cornerRadius = 15
    }

  
  func configureCell(repo: RepoModel){
    repoNameOutlet.text = repo.name
    repoDescOutlet.text = repo.description
    forksCountOutlet.text = String(describing: repo.numberOfForks)
    langOutlet.text = repo.lang
    repoUrl = repo.repoUrl
    
  }

//New comment
}
