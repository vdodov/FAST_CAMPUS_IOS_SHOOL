//
//  ViewController.swift
//  FirstTest_TextField
//
//  Created by 이봉원 on 28/03/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {

  private let passwordTextField = UITextField()
  private let passSwitch = UISwitch()
  private let myPassword = "qwer"
  
  
  // MARK: ViewController LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    passwordTextField.frame = CGRect(
      x: 50, y: 100, width: view.frame.width - 100, height: 50
    )
    passwordTextField.placeholder = "비밀번호를 입력하세요"
    passwordTextField.isSecureTextEntry = true //type: password
    passwordTextField.textAlignment = .center
    passwordTextField.addTarget(
      self,
      action: #selector(textFieldEditingChanged(_:)),
      for: .editingChanged
    )
    passwordTextField.addTarget(
      self,
      action: #selector(editingDidEndOnExit(_:)),
      for: .editingDidEndOnExit
    )
    view.addSubview(passwordTextField)
    
    passSwitch.center = CGPoint(x: view.center.x, y: 200)
    passSwitch.isOn = false
    passSwitch.isEnabled = false
    view.addSubview(passSwitch)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    passwordTextField.becomeFirstResponder()
  }
  
  
  // MARK: Action Handler
  
  @objc func textFieldEditingChanged(_ sender: UITextField) {
    guard let text = sender.text else { return }
    let isCorrectPassword = text == myPassword
    passSwitch.setOn(isCorrectPassword, animated: true)
  }
  
  @objc func editingDidEndOnExit(_ sender: UITextField) {
    guard passSwitch.isOn else { return }
    
    let secondVC = SecondViewController()
    secondVC.passwordText = sender.text ?? ""
    present(secondVC, animated: true)
  }
}

