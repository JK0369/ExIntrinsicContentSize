//
//  ViewController.swift
//  ExIntrinsicContentSize
//
//  Created by Jake.K on 2022/03/29.
//

import UIKit

class ViewController: UIViewController {
  
  private let myTableView = MyTableView()
  private lazy var addButton: UIButton = {
    let button = UIButton()
    button.setTitle("add", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    return button
  }()
  
  private var dataSource = (1...5).map(String.init(_:))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.myTableView)
    self.myTableView.dataSource = self
    
    self.myTableView.translatesAutoresizingMaskIntoConstraints = false
    self.myTableView.register(MyCell.self, forCellReuseIdentifier: "cell")
    NSLayoutConstraint.activate([
      self.myTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      self.myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      self.myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
    ])
    
    NSLayoutConstraint.activate([
      self.addButton.topAnchor.constraint(equalTo: self.myTableView.bottomAnchor, constant: 16),
      self.addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    
  }
  
  @objc private func didTapButton() {
    self.dataSource.append("추가")
    self.myTableView.reloadData()
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.dataSource.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
    cell.prepare(self.dataSource[indexPath.row])
    return cell
  }
}

final class MyCell: UITableViewCell {
  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.addSubview(self.nameLabel)
    NSLayoutConstraint.activate([
      self.nameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
      self.nameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
      self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
      self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
    ])
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare()
  }
  
  func prepare(_ text: String? = nil) {
    self.nameLabel.text = text
  }
}
