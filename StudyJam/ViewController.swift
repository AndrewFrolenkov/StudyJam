//
//  ViewController.swift
//  StudyJam
//
//  Created by Андрей Фроленков on 1.08.23.
//

import UIKit

class ViewController: UIViewController {
  
  // Properties
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = true
    scrollView.alwaysBounceVertical = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private lazy var contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private lazy var profilePhoto: UIImageView = {
    let profilePhoto = UIImageView()
    profilePhoto.image = UIImage(named: "profilePhoto")
    profilePhoto.translatesAutoresizingMaskIntoConstraints = false
    return profilePhoto
  }()
  
  private lazy var userName: UILabel = {
    let userName = UILabel()
    userName.text = "Иванов Иван Иванович"
    userName.textAlignment = .center
    userName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    userName.numberOfLines = 2
    userName.translatesAutoresizingMaskIntoConstraints = false
    return userName
  }()
  
  private lazy var briefInformationLabel: UILabel = {
    let briefInformationLabel = UILabel()
    briefInformationLabel.text = "Middle iOS-разработчик,опыт более 2-х лет"
    briefInformationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    briefInformationLabel.textColor = #colorLiteral(red: 0.6537411213, green: 0.6508514285, blue: 0.6713269949, alpha: 1)
    briefInformationLabel.textAlignment = .center
    briefInformationLabel.numberOfLines = 1
    briefInformationLabel.translatesAutoresizingMaskIntoConstraints = false
    return briefInformationLabel
  }()
  
  private var locationImageView: UIImageView = {
    let locationImageView = UIImageView()
    locationImageView.image = UIImage(named: "location")
    locationImageView.translatesAutoresizingMaskIntoConstraints = false
    return locationImageView
  }()
  
  private lazy var locationLabel: UILabel = {
    let locationLabel = UILabel()
    locationLabel.text = "Воронеж"
    locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    locationLabel.textColor = #colorLiteral(red: 0.6537411213, green: 0.6508514285, blue: 0.6713269949, alpha: 1)
    locationLabel.textAlignment = .left
    locationLabel.numberOfLines = 1
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    return locationLabel
  }()
  
  lazy var collectionView: UICollectionView = {
    let collectionLayout = UICollectionViewFlowLayout()
    collectionLayout.itemSize = CGSize(width: 100, height: 100)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    collectionView.backgroundColor = .blue
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  lazy var mySkill: UILabel = {
    let mySkill = UILabel()
    mySkill.text = "Мои навыки"
    mySkill.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    mySkill.translatesAutoresizingMaskIntoConstraints = false
    return mySkill
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
    setupSubviews()
    setupLayout()
    configureNavBar()
    configureTableView()
  }
  
  // Configure CollectionView
  private func configureTableView() {
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  // Configure NavigationBar
  private func configureNavBar() {
    title = "Профиль"
    
    navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold),
      NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
    ]
    
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  // Setup Subviews
  private func setupSubviews() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(profilePhoto)
    contentView.addSubview(userName)
    contentView.addSubview(briefInformationLabel)
    contentView.addSubview(locationImageView)
    contentView.addSubview(locationLabel)
    contentView.addSubview(mySkill)
    contentView.addSubview(collectionView)
    
  }
  
  // SetupLayout
  private func setupLayout() {
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
      
      profilePhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
      profilePhoto.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      profilePhoto.widthAnchor.constraint(equalToConstant: 120),
      profilePhoto.heightAnchor.constraint(equalToConstant: 120),
      
      
      userName.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 16),
      userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 113),
      userName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -113),
      
      briefInformationLabel.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 4),
      briefInformationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
      briefInformationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
      
      locationImageView.topAnchor.constraint(equalTo: briefInformationLabel.bottomAnchor, constant: 4),
      locationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 152),
      locationImageView.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -2),
      
      locationImageView.widthAnchor.constraint(equalToConstant: 16),
      
      locationLabel.topAnchor.constraint(equalTo: briefInformationLabel.bottomAnchor, constant: 4),
      locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
      
      mySkill.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 40),
      mySkill.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      
      collectionView.topAnchor.constraint(equalTo: mySkill.bottomAnchor, constant: 4),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      
    ])
    
  }
  
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("df")
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = .red
    return cell
  }
  
  
}
