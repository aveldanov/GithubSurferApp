//
//  TrendingRepoTableViewCell.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/20/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class TrendingRepoTableViewCell: UITableViewCell {

  private var repoUrl: String?
  
  
  @IBOutlet weak var backViewOutlet: UIView!
  @IBOutlet weak var repoNameLabel: UILabel!
  @IBOutlet weak var repoDescLabel: UILabel!
  @IBOutlet weak var repoImageView: UIImageView!
  @IBOutlet weak var numberOfForksLabel: UILabel!
  @IBOutlet weak var langLabel: UILabel!
  @IBOutlet weak var contribLabel: UILabel!
  @IBOutlet weak var viewReadMeButtonOutlet: RoundedCornerButton!

  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  override func layoutSubviews() {
    backViewOutlet.layer.cornerRadius = 15
    backViewOutlet.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    backViewOutlet.layer.shadowOpacity = 0.25
    backViewOutlet.layer.shadowRadius = 5.0
    backViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
  }
  
  
  func configureCell(repo:RepoModel){
    repoImageView.image = repo.image
    repoNameLabel.text = repo.name
    repoDescLabel.text = repo.description
    numberOfForksLabel.text = String(describing: repo.numberOfForks)
    langLabel.text = repo.lang
    contribLabel.text = String(describing: repo.numberOfContributors)
    repoUrl = repo.repoUrl
  }



}
