//
//  DescViewController.swift
//  ChildSong
//
//  Created by ZhangLiangZhi on 2016/11/19.
//  Copyright © 2016年 xigk. All rights reserved.
//

import Foundation
import UIKit

class DescViewController: UIViewController {
    @IBOutlet weak var mLabel: UILabel!
    
    override func viewDidLoad() {
        mLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        mLabel.numberOfLines = 0
        
        mLabel.text = "儿童故事视频\n对儿童最有用的40则故事。\n\t我把【小马过河】成语故事放在首位，是因为对中国小孩来说，独立思考的精神，是最为缺失的。1-8岁的儿童每年都可以多看几遍【小🐎过河】。每看一次，体会到的意义每年都会不一样，中国小孩跟国外小孩相比，最大的区别是缺少【独立思考的能力】，少年强则中国强，谢谢！"
        
//        let successbtn: BootstrapBtn = BootstrapBtn(frame: CGRect(x:10, y:UIScreen.main.bounds.height - 33, width:60, height:26), btButtonType: .Primary)
//        successbtn.setTitle("评价", for: UIControlState.normal)
//        self.view.addSubview(successbtn)
//        successbtn.addTarget(self, action:#selector(pj), for: UIControlEvents.touchUpInside)

    }
 
/*
    @IBAction func GoAppStore(_ sender: Any) {
        //弹出消息框
        let alertController = UIAlertController(title: "^_^😊给我一个评价吧！",
                                                message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "暂不评价", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default,
                                     handler: {
                                        action in
                                        self.gotoAppStore()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
*/
    
    // 跳转到应用的AppStore页页面
    func gotoAppStore() {
        let urlString = "https://itunes.apple.com/us/app/er-tong-gu-shi-shi-pin/id1178342873?l=zh&ls=1&mt=8"
        let url = NSURL(string: urlString)
        UIApplication.shared.openURL(url! as URL)
    }
    
    
}
