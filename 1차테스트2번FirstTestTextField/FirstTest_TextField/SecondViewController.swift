//
//  SecondViewController.swift
//  FirstTest_TextField
//
//  Created by 이봉원 on 28/03/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {

  var passwordText = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let label = UILabel()
    label.frame = CGRect(
      x: view.frame.width / 2 - 100, y: 150, width: 200, height: 60
    )
    label.font = UIFont.boldSystemFont(ofSize: 25)
    label.textAlignment = .center
    label.text = passwordText
    view.addSubview(label)
    
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
    button.center = view.center
    button.setTitle("Dismiss", for: .normal)
    button.titleLabel?.font = .preferredFont(forTextStyle: .title2)
    button.addTarget(
      self,
      action: #selector(dissmissSecondViewController),
      for: .touchUpInside
    )
    view.addSubview(button)
  }
  
  @objc func dissmissSecondViewController() {
    presentingViewController?.dismiss(animated: true)
    // A -> B -> C
    // 내가 C, B한테 나를 내려줘라고 요청. -> 나는 사라짐.
    // 내가 B 일 때, A 가 나를 dismiss
    
    dismiss(animated: true)
    // A -> B -> C
    // 내가 C, 내가 띄우고 있는 presenting(X) presentedVC 체크해서 있으면 dismiss
    // 없으면 내가 dismiss
    
    // 내가 B 일 때, 내가 dismiss 안 되고, C를 dismiss
  }
}
