//
//  ViewController.swift
//  FirstTest
//
//  Created by 이봉원 on 24/03/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: IBOutlets
  
  @IBOutlet weak var 짜장면amountLabel: UILabel!
  @IBOutlet weak var 짬뽕amountLabel: UILabel!
  @IBOutlet weak var 탕수육amountLabel: UILabel!
  
  // MARK: Properties
  
  struct UI {
    static let 소지금containerHeight: CGFloat = 40
    static let 결제금액containerHeight: CGFloat = 40
  }
  
  enum MenuItem: Int {
    case 짜장면, 짬뽕, 탕수육
  }
  var 주문수량dict: [MenuItem: Int] = [
    MenuItem.짜장면: 0,
    MenuItem.짬뽕: 0,
    MenuItem.탕수육: 0
  ]
  let menuItemCostArr = [5_000, 6_000, 12_000]
  
  let 소지금displayLabel = UILabel()
  var 소지금 = 70_000 {
    didSet {
      소지금displayLabel.text = "\(소지금)원"
    }
  }
  
  let 결제금액displayLabel = UILabel()
  var 결제금액 = 0 {
    didSet {
      결제금액displayLabel.text = "\(결제금액)원"
    }
  }
  
  // MARK: ViewController LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAdditionalViews()
    initializeData()
  }
  
  // MARK: Setup Views
  
  func setupAdditionalViews() {
    setup소지금views()
    setup결제금액views()
  }
  
  func setup소지금views() {
    let 소지금containerView = UIView()
    소지금containerView.frame = CGRect(
      x: 20, y: 350, width: view.frame.width - 40, height: UI.소지금containerHeight
    )
    view.addSubview(소지금containerView)
    
    let 소지금label = UILabel()
    소지금label.frame = CGRect(
      x: 0, y: 0, width: 80, height: UI.소지금containerHeight
    )
    소지금label.text = "소지금"
    소지금label.textAlignment = .center
    소지금label.backgroundColor = .green
    소지금label.font = UIFont.preferredFont(forTextStyle: .title3)
    소지금containerView.addSubview(소지금label)
    
    소지금displayLabel.frame = CGRect(
      x: 소지금label.frame.maxX + 10, y: 0,
      width: 140, height: UI.소지금containerHeight
    )
    소지금displayLabel.backgroundColor = .green
    소지금displayLabel.textAlignment = .right
    소지금displayLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    소지금containerView.addSubview(소지금displayLabel)
    
    let 초기화button = UIButton()
    초기화button.frame = CGRect(
      x: 소지금displayLabel.frame.maxX + 20, y: 0,
      width: 80, height: UI.소지금containerHeight
    )
    초기화button.backgroundColor = .black
    초기화button.setTitle("초기화", for: .normal)
    초기화button.setTitleColor(.white, for: .normal)
    초기화button.addTarget(self, action: #selector(initializeData), for: .touchUpInside)
    소지금containerView.addSubview(초기화button)
  }
  
  func setup결제금액views() {
    let 결제금액maxYOffset = 소지금displayLabel.superview!.frame.maxY
    
    let 결제금액containerView = UIView()
    결제금액containerView.frame = CGRect(
      x: 20, y: 결제금액maxYOffset + 10,
      width: view.frame.width - 40, height: UI.결제금액containerHeight
    )
    view.addSubview(결제금액containerView)
    
    let 결제금액label = UILabel()
    결제금액label.frame = CGRect(
      x: 0, y: 0, width: 80, height: UI.결제금액containerHeight
    )
    결제금액label.text = "결제금액"
    결제금액label.textAlignment = .center
    결제금액label.backgroundColor = .orange
    결제금액label.font = UIFont.preferredFont(forTextStyle: .title3)
    결제금액containerView.addSubview(결제금액label)
    
    결제금액displayLabel.frame = CGRect(
      x: 결제금액label.frame.maxX + 10, y: 0,
      width: 140, height: UI.결제금액containerHeight
    )
    결제금액displayLabel.textAlignment = .right
    결제금액displayLabel.backgroundColor = .orange
    결제금액displayLabel.font = UIFont.preferredFont(forTextStyle: .title3)
    결제금액containerView.addSubview(결제금액displayLabel)
    
    let 결제button = UIButton()
    결제button.frame = CGRect(
      x: 결제금액displayLabel.frame.maxX + 20, y: 0,
      width: 80, height: UI.결제금액containerHeight
    )
    결제button.backgroundColor = .black
    결제button.setTitle("결제", for: .normal)
    결제button.setTitleColor(.white, for: .normal)
    결제button.addTarget(self, action: #selector(didTapPaymentButton(_:)), for: .touchUpInside)
    결제금액containerView.addSubview(결제button)
  }
  
  
  // MARK: - Action Handler
  
  @IBAction func didTapOrderButton(_ sender: UIButton) {
    guard let item = MenuItem(rawValue: sender.tag), let amount = 주문수량dict[item] else { return }
    결제금액 += menuItemCostArr[sender.tag]
    주문수량dict[item] = amount + 1
    
    let labels = [짜장면amountLabel, 짬뽕amountLabel, 탕수육amountLabel]
    labels[sender.tag]?.text = "\(amount + 1)"
  }
  
  @objc func didTapPaymentButton(_ sender: UIButton) {
    let alertController = UIAlertController(
      title: "결제하기",
      message: "총 결제금액은 \(결제금액)원 입니다.",
      preferredStyle: .alert
    )
    let okAction = UIAlertAction(title: "확인", style: .default) { _ in
      guard self.소지금 >= self.결제금액 else { return print("소지금액이 부족합니다.") }
      let temp = self.소지금 - self.결제금액
      self.initializeData()
      self.소지금 = temp
    }
    let cancelAction = UIAlertAction(title: "취소", style: .cancel)
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    present(alertController, animated: true)
  }
  
  @objc func initializeData() {
    소지금 = 70_000
    결제금액 = 0
    짜장면amountLabel.text = "0"
    짬뽕amountLabel.text = "0"
    탕수육amountLabel.text = "0"
    for key in 주문수량dict.keys {
      주문수량dict[key] = 0
    }
  }
}

