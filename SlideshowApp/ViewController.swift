//
//  ViewController.swift
//  SlideshowApp
//
//  Created by TakeshiTakeuchi on 2016/08/21.
//  Copyright © 2016年 jp.techacademy.takeshi.takeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //進むボタンの設定
    @IBOutlet weak var gobutton: UIButton!

    //戻るボタンの設定
    @IBOutlet weak var backButton: UIButton!
    
    //自動再生ボタン
    @IBOutlet weak var autorunButton: UIButton!
    
    //画像ファイルの設定
    @IBOutlet weak var slideshowImageView: UIImageView!

    //画像タップによる拡大
    @IBOutlet weak var kakudaiButton: UIImageView!
    
    //拡大画面からの戻るボタンの設定
    @IBAction func unwind(segue: UIStoryboardSegue) {
        performSegueWithIdentifier("kakudai", sender: nil)
    
    }
    
    
    
    /// タイマーの設定
    var timer: NSTimer!
 
    //タイマーの利用
    var timerRunning = true
    
    /// 画像の番号
    var dispImageNo = 0
    
    /// 画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像配列
        let imageNameArray = [
            "IMG_3613.JPG",
            "IMG_3614.JPG",
            "IMG_3615.JPG",
            "IMG_3616.JPG",
            "IMG_3617.JPG"
        ]

        
        // 範囲より外の場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 4
        }
        
        // 範囲より上の場合、最初の画像を表示
        if dispImageNo > 4 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // slideshowImageViewの画像をセット
        slideshowImageView.image = image


    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //初期画像の設定
        let image = UIImage(named: "IMG_3613.JPG")
        slideshowImageView.image = image

        slideshowImageView.userInteractionEnabled = true

        //進むボタンの制御
        gobutton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        //戻るボタンの制御
        backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        //自動再生ボタンの制御
        autorunButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        autorunButton.setTitle("再生", forState: UIControlState.Normal)
        
        //スライドショーをタップ可能
        slideshowImageView.userInteractionEnabled = true
        
    
    }


    
//進むボタン押下時の処理
   @IBAction func goButtonTapped(sender: AnyObject) {

        //画像番号に1をたす
        dispImageNo += 1
        
        // 関数が呼ばれていることを確認
        print(dispImageNo)
    
        // 画像の番号を元に画像を表示する
        displayImage()
    
   
    }
    
//戻るボタン押下時の処理
    @IBAction func backButtonTapped(sender: AnyObject) {

        //画像番号から1を引く
        dispImageNo -= 1
        
        // 関数が呼ばれていることを確認
        print(dispImageNo)
        
        // 画像の番号を元に画像を表示する
        displayImage()
        
    }
    
//再生/停止ボタン押下時の処理
    @IBAction func startstopButtonTapped(sender: AnyObject) {
        
        // 関数が呼ばれていることを確認
        print(dispImageNo)
        
        // 自動スライドショーの設定(2秒ごと)
        if timerRunning==true{
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            timerRunning = false
        
            //進むボタンの制御
            gobutton.enabled = false
            gobutton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)

            //戻るボタンの制御
            backButton.enabled = false
            backButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)

            //自動再生ボタンの制御
            autorunButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            autorunButton.setTitle("停止", forState: UIControlState.Normal)
            

        }
        else{
            //タイマーを止める処理
            timer.invalidate()
            timerRunning = true

            //進むボタンの制御
            gobutton.enabled = true
            gobutton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            
            //戻るボタンの制御
            backButton.enabled = true
            backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

            //自動再生ボタンの制御
            autorunButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            autorunButton.setTitle("再生", forState: UIControlState.Normal)


        }
    }

    /// NSTimerによって、一定の間隔で呼び出される関数
    func onTimer(timer: NSTimer) {

        // 関数が呼ばれていることを確認
        print(dispImageNo)
        print(timerRunning)
        
        // 画像の番号を1増やす
        dispImageNo += 1

        // 画像の番号を元に画像を表示する
        displayImage()

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のKakudaiViewControllerを取得する
        let kakudaiViewController:KakudaiViewController = segue.destinationViewController as! KakudaiViewController

        // 遷移先のKakudaiControllerで宣言しているkakudaiImgNoに値を代入して渡す
        kakudaiViewController.kakudaiImgNo = dispImageNo
        
        timer.invalidate()
        timerRunning = true
            
        //進むボタンの制御
        gobutton.enabled = true
        gobutton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        //戻るボタンの制御
        backButton.enabled = true
        backButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        //自動再生ボタンの制御
        autorunButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        autorunButton.setTitle("再生", forState: UIControlState.Normal)

    }

}