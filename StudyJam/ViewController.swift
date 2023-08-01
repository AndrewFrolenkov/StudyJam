//
//  ViewController.swift
//  StudyJam
//
//  Created by Андрей Фроленков on 1.08.23.
//

import UIKit

class ViewController: UIViewController {
  
  var mode = false
  var arraySkills = ["MVI/MVVM", "Kotlin Coroutines", "Room", "OkHttp", "DataStore", "WorkManager", "custom view", "ООП и SOLID", "DataStore",  "DataStore"]
  
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
    collectionLayout.minimumLineSpacing = 10
    collectionLayout.minimumInteritemSpacing = 10
    collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
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
  
  lazy var editButton: UIButton = {
    let editButton = UIButton()
    editButton.setImage(UIImage(named: "edit"), for: .normal)
    editButton.addTarget(self, action: #selector(editSkill), for: .touchUpInside)
    editButton.translatesAutoresizingMaskIntoConstraints = false
    return editButton
  }()
  
  lazy var descreptionLabel: UILabel = {
    let mySkill = UILabel()
    mySkill.text = "О Себе"
    mySkill.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    mySkill.translatesAutoresizingMaskIntoConstraints = false
    return mySkill
  }()
  
  lazy var textView: UITextView = {
    let textView = UITextView()
    textView.text = "Experienced software engineer skilled in developing scalable and maintainable systems.Information technology (IT or IT) is a set of interrelated scientific and technical fields of knowledge that study and put into practice methods for creating, processing, storing, protecting and transmitting information using computer technology.Since all of the above is now performed using computer technology, IT usually means computer technology. "
    textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    textView.textColor = #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
    textView.backgroundColor = .clear
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
    setupSubviews()
    setupLayout()
    configureNavBar()
    configureTableView()
  }
  
  // MARK: - Action
  
  @objc func editSkill() {
    if mode {
      editButton.setImage(UIImage(named: "edit"), for: .normal)
      arraySkills.removeLast()
      collectionView.reloadData()
    } else {
      editButton.setImage(UIImage(named: "done"), for: .normal)
      arraySkills.append("+")
      collectionView.reloadData()
    }
    
    mode = !mode
   
  }
  
  // Configure CollectionView
  private func configureTableView() {
    collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: "Cell")
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
    contentView.addSubview(editButton)
    contentView.addSubview(collectionView)
    contentView.addSubview(descreptionLabel)
    contentView.addSubview(textView)
    
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
      
      editButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 40),
      editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      editButton.widthAnchor.constraint(equalToConstant: 24),
      editButton.heightAnchor.constraint(equalToConstant: 24),
      
      collectionView.topAnchor.constraint(equalTo: mySkill.bottomAnchor, constant: 16),
      collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      descreptionLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
      descreptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      
      textView.topAnchor.constraint(equalTo: descreptionLabel.bottomAnchor, constant: 8),
      textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
      textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11),
      textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
      textView.heightAnchor.constraint(equalToConstant: 100),
    ])
    
  }
  
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arraySkills.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let text = arraySkills[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomViewCell
    cell.textLabel.text = text
    
    if mode {
      if indexPath.row == arraySkills.count - 1 {
        print("ww")
        cell.imageView.tintColor = .clear
      }
      cell.imageView.isHidden = false
    } else {
      cell.imageView.isHidden = true
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let cell = collectionView.cellForItem(at: indexPath) as! CustomViewCell
    if cell.textLabel.text == "+" {
      let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
      alert.addTextField { (textField : UITextField!) -> Void in
              textField.placeholder = "Skill"
          }
      let action = UIAlertAction(title: "Отмена", style: .cancel)
      let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] alertAction in
        let tf = alert.textFields![0]
        self?.arraySkills.insert(tf.text!, at: (self?.arraySkills.endIndex)! - 1)
        collectionView.reloadData()
      }
      alert.addAction(action)
      alert.addAction(addAction)
      present(alert, animated: true)
    } else {
      if mode {
        arraySkills.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
      } else {
        print("error")
      }
    }
   
  }
}
