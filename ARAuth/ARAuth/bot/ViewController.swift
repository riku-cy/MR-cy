//
//  ViewController.swift
//  bot
//
//  Created by 向山陸 on 2020/12/04.
//

import UIKit
import AudioToolbox
import ARKit
import SceneKit

class ViewController: UIViewController{
    @IBOutlet weak var L1: UILabel!
    @IBOutlet weak var L2: UILabel!
    @IBOutlet weak var L3: UILabel!
    @IBOutlet weak var L4: UILabel!
    @IBOutlet weak var n1: UILabel!
    @IBOutlet weak var n2: UILabel!
    @IBOutlet weak var n3: UILabel!
    @IBOutlet weak var n4: UILabel!
    @IBOutlet weak var n5: UILabel!
    @IBOutlet weak var n6: UILabel!
    @IBOutlet weak var n7: UILabel!
    @IBOutlet weak var n8: UILabel!
    @IBOutlet weak var n9: UILabel!
    @IBOutlet weak var n0: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var EnterButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    
    
    let session = ARSession()
    
    var rightP:Float = 0.55
    var leftP:Float = 0.55
    var upP:Float = 0.35
    var downP:Float = 0.4
    var insertF:Bool = false
    var startAuth:Bool = false
    var ansArray:[Int] = []
    var selArray:[Int]? = []
    var viArray:[Int] = [1,1,1,1]
    var viCount:Int = 0
    var startTime:Date = Date().addingTimeInterval(-18000.3325)
    var endTime:Double = 0
    
    
    

    
    @IBAction func touchButton(_ sender: Any) {
        self.insertF = true
        selArray?.append(focusNum)
        insert()
        self.viAuth()
    }
    
    func ansCreate(){
        for i in 0...3 {
            ansArray.append(Int.random(in: 0...9))
        }
    }
    
    // アラートダイアログを生成
    func startAuthAlert (){
        print("アラート表示")
        // アラートを作成
        let alert = UIAlertController(
            title: "認証開始",
            message: "あなたのパスワードは\(ansArray[0]),\(ansArray[1]),\(ansArray[2]),\(ansArray[3])です",
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startAuth = true
            self.viAuth()
            self.startTime = Date().addingTimeInterval(-18000.3325)
            self.endTime = 0
            
            
        })
        
        // アラートにボタンをつける
        alert.addAction(okAction)

        // アラート表示
        self.present(alert, animated: true, completion: nil)
        print("認証パスワード：",(ansArray[0]),(ansArray[1]),(ansArray[2]),(ansArray[3]))
        
    }
    
    func insert() {
        print("入力数字：",focusNum)
            if L4.text != ""{
                L1.text = "*"
                L2.text = ""
                L3.text = ""
                L4.text = ""
                label.text = ""
            }

            else if L3.text != ""{
                L4.text = "*"
                if judge() == true {
                    label.text = ""
                }
                else{
                    label.text = "×"
                }
                print(" \n")
            }

            else if L2.text != ""{
                L3.text = "*"
            }

            else if L1.text != "" {
                L2.text = "*"            }

            else{
                L1.text = "*"
            }
        focusNum = 5
    }
    
    func setColor(){
        setAnsLayout(l: L1)
        setAnsLayout(l: L2)
        setAnsLayout(l: L3)
        setAnsLayout(l: L4)

        setNumLayout(n: n1)
        setNumLayout(n: n2)
        setNumLayout(n: n3)
        setNumLayout(n: n4)
        setNumLayout(n: n5)
        setNumLayout(n: n6)
        setNumLayout(n: n7)
        setNumLayout(n: n8)
        setNumLayout(n: n9)
        setNumLayout(n: n0)
//        setNumLayout(n: label)
    }

    
    func setAnsLayout(l:UILabel){
        let rgba = UIColor(red: 200/255, green: 210/255, blue: 250/255, alpha: 1.0)
        l.backgroundColor = rgba
        l.layer.cornerRadius = 10.0
        l.clipsToBounds = true
        l.layer.borderWidth = 0
        l.layer.borderColor = UIColor.white.cgColor
    }
    
    func setNumLayout(n:UILabel){
        if n.tag == 4{
            n.textColor = UIColor.red
        }
        else{
        n.textColor = UIColor.black
        }
        let bgra = UIColor(red: 200/255, green: 225/255, blue: 200/255, alpha: 1.0)
        n.backgroundColor = bgra
        n.layer.cornerRadius = 30.0
        n.clipsToBounds = true
        n.layer.borderWidth = 0.3
        n.layer.borderColor = UIColor.black.cgColor
    }
    
    func judge() -> Bool {
        
        for a in 0...3 {
            if viArray[a] == 0 {
                selArray![a] = 9-selArray![a]
            }
        }
        
        for i in 0...3{
            if ansArray[i] != selArray![i] {
                selArray = []
            
                return false
            }
        }
        let vc = secondViewController()
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(vc, animated: true)
        startAuth = false
        selArray = []
        ansArray = []
        return true
    }
    
    func viAuth() {
        if viArray[viCount] == 0 {
            AudioServicesPlaySystemSound(1519) //ブッブという短い振動が1回
        }
        else if viArray[viCount] == 1{
            AudioServicesPlaySystemSound(1521) //ブッブッブという短い振動が3回
        }
        
        if viCount == 3 {
            viCount = 0
        }
        else{
            viCount+=1
        }

    }
    
    func setEnd() -> Double{
        return Date().timeIntervalSince(startTime)
    }
    
//    func getEnd() -> Double {
//        return endTime
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            self.session.delegate = self
        self.setColor()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // "Reset" to run the AR session for the first time.
        self.resetTracking()
        self.ansCreate()
        viArray.shuffle()
        self.startAuthAlert()
        print(viArray[0],viArray[1],viArray[2],viArray[3])
        navigationController?.navigationBar.isHidden = true
    }
}

//MARK:- ARSession
extension ViewController: ARSessionDelegate {
    
    func resetTracking() {
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        self.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }

    //MARK:- ARSessionDelegate
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        frame.anchors.forEach { anchor in
            guard #available(iOS 12.0, *), let faceAnchor = anchor as? ARFaceAnchor else { return }

            // FaceAnchorから左、右目の位置や向きが取得可能。
            
            let pl = faceAnchor.blendShapes[.eyeLookInLeft]
            let pd = faceAnchor.blendShapes[.eyeLookDownLeft]
            let pr = faceAnchor.blendShapes[.eyeLookInRight]
            let pu = faceAnchor.blendShapes[.eyeLookUpLeft]

            
        
            let pL:Float = pl!.floatValue
            let pD:Float = pd!.floatValue
            let pR:Float = pr!.floatValue
            let pU:Float = pu!.floatValue

            

            if insertF == false && startAuth == true{
                if pR > rightP{
                    self.insertF = true
                    selectNum(i: 1)
                }
                else if pL > leftP{
                    self.insertF = true
                    selectNum(i: 2)
                }
                else if pU > upP{
                    self.insertF = true
                    selectNum(i: 3)
                }
                else if pD > downP{
                    self.insertF = true
                    selectNum(i: 4)
                }
            }
            
            else if insertF == true && pR<(rightP-0.1) && pL<(leftP-0.1) && pU<(upP-0.1) && pD<(downP-0.1){
                Thread.sleep(forTimeInterval: 1.0)
                self.insertF = false
            }
        }
       
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {}

}
