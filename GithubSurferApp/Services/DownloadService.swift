//
//  DownloadService.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/20/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class DownloadService {
  static let instance = DownloadService()
  
  func downloadTrendingRepoDictArray(completion: @escaping (_ reposDictArray:[Dictionary<String,Any>])->() ){
    
    var trendingRepoArray = [Dictionary<String,Any>]()
    
    AF.request(trendingRepoUrl).responseJSON { (response) in
      guard let json = response.value as? Dictionary<String,Any> else {return print("YO")}
      guard let repoDictArray = json["items"] as? [Dictionary<String,Any>] else {return}
      for repoDict in repoDictArray{
        if trendingRepoArray.count <= 9 {
          
          guard
            let name = repoDict["name"] as? String,
            let desc = repoDict["description"] as? String,
            let numberOfForks = repoDict["forks_count"] as? Int,
            let lang = repoDict["language"] as? String,
            let contributorsUrl = repoDict["contributors_url"] as? String,
            let repoUrl = repoDict["html_url"] as? String,
            let ownerDict = repoDict["owner"] as? Dictionary<String, Any>,
            let avatarUrl = ownerDict["avatar_url"] as? String

            else {break}
          

          let repoDictionary: Dictionary<String,Any> =
            ["name":name,
             "description": desc,
             "forks_count": numberOfForks,
             "language": lang,
             "contributors_url": contributorsUrl,
             "html_url": repoUrl,
             "avatar_url": avatarUrl
          ]
          
          trendingRepoArray.append(repoDictionary)
          
        }else{
          break
        }
        
      }
//            print(trendingRepoArray)
      
      completion(trendingRepoArray)
    }
  }
  
  
  
  func downloadTrendingRepos(completion: @escaping (_ reposArray: [RepoModel])-> () ){
    var reposArray = [RepoModel]()
    downloadTrendingRepoDictArray { (trendingReposDictArray) in
      for dict in trendingReposDictArray{
        self.downloadTrendingRepo(fromDict: dict) { (returnedRepo) in
          
          if reposArray.count < 9{
            reposArray.append(returnedRepo)

          }else{
            let sortedArray = reposArray.sorted { (repoA, repoB) -> Bool in
              if repoA.numberOfForks > repoB.numberOfForks{
                return true
              }else{
                return false
              }
            }
            completion(sortedArray)

          }

        }

      }
      
    }
    
  }
  
  func downloadTrendingRepo(fromDict dict: Dictionary<String,Any>, completion: @escaping (_ repo:RepoModel)->()){
    let avatarUrl = dict["avatar_url"] as! String
    let contributorsUrl = dict["contributors_url"] as! String
    let name = dict["name"] as! String
    let desc = dict["description"] as! String
    let numberOfForks = dict["forks_count"] as! Int
    let lang = dict["language"] as! String
    let repoUrl = dict["html_url"] as! String
    
    downloadImage(for: avatarUrl) { (returnedImage) in
      self.downloadContributorsData(for: contributorsUrl) { (returnedContributions) in
        
        let repo = RepoModel(image: returnedImage, name: name, description: desc, numberOfForks: numberOfForks, lang: lang, numberOfContributors: returnedContributions, repoUrl: repoUrl)
        completion(repo)
        
        
      }
    }
    
    
    
    
    
    
  }
  
  
  func downloadImage(for avatarUrl:String, completion: @escaping (_ image:UIImage)->()){
    AF.request(avatarUrl).responseImage { (imageResponse) in
      guard let image = imageResponse.value else{return}
      completion(image)
    }
    
    
  }
  
  func downloadContributorsData(for contributersUrl: String, completion: @escaping (_ contributors:Int)->()){
    
    AF.request(contributersUrl).responseJSON { (response) in
      guard let json = response.value as? [Dictionary<String,Any>] else {return}
      if !json.isEmpty{
        let contributions = json.count
        completion(contributions)
      }
    }
    
  }
  
  
  
}
