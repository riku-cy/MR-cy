//
//  secondViewController.swift
//  bot
//
//  Created by 向山陸 on 2021/01/21.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
//        let e = ViewController().setEnd()
//        print("Time:\(e)")
//        let m = (e/60).truncatingRemainder(dividingBy: 60)
//        let s = e.truncatingRemainder(dividingBy: 60)
//        // ミリ秒
//        let ms = (e * 100).truncatingRemainder(dividingBy: 100)
//
//        self.navigationItem.title = "Time:\(m):\(s):\(Int(ms))"
        self.navigationItem.title = "認証成功"
        loadResult()

        // Do any additional setup after loading the view.
    }
    
    
    func loadResult() {
        self.view.backgroundColor = UIColor.white
        let image1:UIImage = UIImage(named: "welldone")!
        let imageView = UIImageView(image: image1)
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
         
         // 画像の縦横サイズを取得
        let imgWidth:CGFloat = image1.size.width
        let imgHeight:CGFloat = image1.size.height
         
         // 画像サイズをスクリーン幅に合わせる
        let scale:CGFloat = screenWidth / imgWidth
        let rect:CGRect =
            CGRect(x:0, y:0, width:imgWidth*scale, height:imgHeight*scale)
         
         // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
         
         // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
         
         // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
