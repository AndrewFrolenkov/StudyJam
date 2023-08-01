//
//  CustomViewCell.swift
//  StudyJam
//
//  Created by Андрей Фроленков on 1.08.23.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    
  
  lazy var textLabel: UILabel = {
    let textLabel = UILabel()
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    return textLabel
  }()
  
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = .black
    imageView.image = UIImage(systemName: "xmark")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
    self.layer.cornerRadius = 20
    
    addSubview(textLabel)
    addSubview(imageView)
    
    NSLayoutConstraint.activate([
      textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageView.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 5),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
      
      imageView.widthAnchor.constraint(equalToConstant: 15),
      
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
