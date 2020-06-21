//
//  DownloadService.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/20/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import Foundation
import Alamofire

class DownloadService {
  static let instance = DownloadService()
  
  func downloadTrendingRepoDictArray(completion: @escaping (_ reposDictArray:[Dictionary<String,Any>])->() ){
    AF.request(trendingRepoUrl).responseJSON { (response) in
      guard let json = response.result as? Dictionary<String,Any> else {return}
      
      
    }
    
    
  }
}
