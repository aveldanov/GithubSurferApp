//
//  RoundedCornerButton.swift
//  GithubSurferApp
//
//  Created by Veldanov, Anton on 6/19/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {

  override func awakeFromNib() {
    
    backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0)
    layer.cornerRadius = frame.height/2
    layer.borderWidth = 3
    layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }

}
