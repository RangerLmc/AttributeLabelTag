//
//  ViewController.swift
//  AttributeLabel
//
//  Created by xthk_lmc on 2020/12/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let contentStr = " 那你还回复化火凤凰化火凤凰发"
//
//        let label = UILabel(frame: CGRect(x: 30, y: 100, width: 250, height: 50))
//        label.font = UIFont.systemFont(ofSize: 40)
//        label.numberOfLines = 2
//        label.backgroundColor = UIColor.gray
//        label.attributedText = contentStr.attributeLabelTag(titleFont: 40, typeTitle: "标签哈哈哈", typeColor: UIColor.red)
//        view.addSubview(label)
        
        let contentStr2 = " 那你还回复化火凤凰化火凤凰发那你还回复化火凤凰化火凤凰发"
        label1.attributedText = contentStr2.attributeLabelTag(titleFont: 18, typeTitle: "标签哈哈哈", typeColor: UIColor.red)
    }

    
    

    
}

