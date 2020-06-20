//
//  RepoModel.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/20/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class RepoModel {
  public private(set) var image: UIImage
  public private(set) var name: String
  public private(set) var description: String
  public private(set) var numberOfForks: Int
  public private(set) var lang: String
  public private(set) var numberOfContributors: Int
  public private(set) var repoUrl: String
  
  init(image: UIImage, name: String, description: String,numberOfForks: Int,lang: String, numberOfContributors: Int, repoUrl: String
) {
    self.image = image
    self.name = name
    self.description = description
    self.numberOfForks = numberOfForks
    self.lang = lang
    self.numberOfContributors = numberOfContributors
    self.repoUrl = repoUrl
  }
}

