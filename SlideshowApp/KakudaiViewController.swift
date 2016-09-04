//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by TakeshiTakeuchi on 2016/08/31.
//  Copyright © 2016年 jp.techacademy.takeshi.takeuchi. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {

    //画像ファイルの設定

    @IBOutlet weak var kakudaiImageView: UIImageView!

    /// 画像の番号
    var kakudaiImgNo = 0

    /// 画像の番号を元に画像を表示する
    func dispImageNo() {
        
        // 画像配列
        let imageNameArray = [
            "IMG_3613.JPG",
            "IMG_3614.JPG",
            "IMG_3615.JPG",
            "IMG_3616.JPG",
            "IMG_3617.JPG"
        ]
        
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[kakudaiImgNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // slideshowImageViewの画像をセット
        kakudaiImageView.image = image

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期画像の設定
        let image = UIImage(named: "IMG_3613.JPG")
        kakudaiImageView.image = image

        // 画像の番号を元に画像を表示する
        dispImageNo()

        //前の画面に戻る
        let leftButton = UIBarButtonItem(title: "戻る", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KakudaiViewController.goTop))
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
        //トップに戻るボタン押下時の呼び出しメソッド
        func goTop() {
            
            //トップ画面に戻る。
            self.navigationController?.popToRootViewControllerAnimated(true)
        }

    



    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
