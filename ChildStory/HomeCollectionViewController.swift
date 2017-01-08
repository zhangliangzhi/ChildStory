//
//  CollectionViewController.swift
//  ChildStory
//
//  Created by ZhangLiangZhi on 2016/11/20.
//  Copyright © 2016年 xigk. All rights reserved.
//

import UIKit
import MediaPlayer

private let reuseIdentifier = "DesignViewCell"

class HomeCollectionViewController: UICollectionViewController {
    @IBOutlet weak var mCollection: UICollectionView!

    @IBOutlet weak var clayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrVedioName.count
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        print(cell)
        
        // Configure the cell
        let name:String = String(format: "%02d.png", indexPath.row+1)
        let sname = arrVedioName[indexPath.row]
        
        // iphone6 414x736 360x640
        let w1 = 200
        let h1 = 115
        
        // iphone5 320x568
        let w2 = 150
        let h2 = 85
        
        var w = w1
        var h = h1

//        print("o UIScreen.main.bounds.width=",UIScreen.main.bounds.width)
//        print("UIScreen.main.nativeBounds.width",UIScreen.main.nativeBounds.width)

        if(UIDevice.current.model == "iPhone" && UIDevice.current.orientation.isPortrait){
            // 是iphone5以下分辨率 414x736
            if(UIScreen.main.bounds.width < 414){
                w = w2
                h = h2
            }
        }
        if(UIDevice.current.model == "iPhone" && UIDevice.current.orientation.isLandscape){
            // 是iphone5以下分辨率 414x736
        }
        
        if(UIDevice.current.model == "iPad"){
            w=250
            h=140
        }
        clayout.itemSize = CGSize(width: w, height: h+15)
        

        let arrView = cell.contentView.subviews
        for v in arrView {
            v.removeFromSuperview()
        }
        let img:UIImageView = UIImageView(image: UIImage(named: name))
        img.frame = CGRect(x: 0, y: 0, width: w, height: h)
        cell.contentView.addSubview(img)
        
        let mlabel:UILabel = UILabel(frame: CGRect(x: 0, y: h, width: w, height: 30))
        mlabel.text = sname
        mlabel.textAlignment = .center
        cell.contentView.addSubview(mlabel)

//        (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: name)
//        (cell.contentView.viewWithTag(2) as! UILabel).text = sname

        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("点击了(\(indexPath.section),\(indexPath.row))")
        
        // umeng统计观看次数
        MobClick.event("UMWATCH")
        
        let tname = arrVedioName[indexPath.row]

        // Video file
        let videoFile = Bundle.main.path(forResource: ""+tname, ofType: ".mp4")
        
        // Subtitle file
        //        let subtitleFile = Bundle.main.path(forResource: "trailer_720p", ofType: "srt")
        //        let subtitleURL = URL(fileURLWithPath: subtitleFile!)
        
        // Movie player
        let moviePlayerView = MPMoviePlayerViewController(contentURL: URL(fileURLWithPath: videoFile!))
        presentMoviePlayerViewControllerAnimated(moviePlayerView)
        
        // Add subtitles
        //        moviePlayerView?.moviePlayer.addSubtitles().open(file: subtitleURL)
        //        moviePlayerView?.moviePlayer.addSubtitles().open(file: subtitleURL, encoding: String.Encoding.utf8)
        
        // Change text properties
        //        moviePlayerView?.moviePlayer.subtitleLabel?.textColor = UIColor.red
        
        // Play
        moviePlayerView?.moviePlayer.play()
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
