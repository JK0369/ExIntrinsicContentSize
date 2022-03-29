//
//  MyTableView.swift
//  ExIntrinsicContentSize
//
//  Created by Jake.K on 2022/03/29.
//

import UIKit

final class MyTableView: UITableView {
  override var intrinsicContentSize: CGSize {
    let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
    return CGSize(width: self.contentSize.width, height: height)
  }
  override func layoutSubviews() {
    self.invalidateIntrinsicContentSize()
    super.layoutSubviews()
  }
}
