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
    
    var trendingRepoArray = [Dictionary<String,Any>]()
    
    AF.request(trendingRepoUrl).responseJSON { (response) in
      guard let json = response.value as? Dictionary<String,Any> else {return print("YO")}
      guard let repoDictArray = json["items"] as? [Dictionary<String,Any>] else {return}
      for repoDict in repoDictArray{
//        print(repoDict)
        if trendingRepoArray.count <= 10 {
          trendingRepoArray.append(repoDict)
          
        }else{
          break
        }
        
      }
//      print(trendingRepoArray)
      
      completion(trendingRepoArray)
    }
  }
  
  
  
  func downloadTrendingRepo(completion: @escaping (_ reposArray: [Repo])-> () ){
    downloadTrendingRepoDictArray { (trendingReposDictArray) in
      for dict in trendingReposDictArray{
        // setup each property
        
      }
    }
  }
  
}
