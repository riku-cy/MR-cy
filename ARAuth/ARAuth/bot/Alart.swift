//
//  Alart.swift
//  bot
//
//  Created by 向山陸 on 2021/01/18.
//

import Foundation
// アラートダイアログを生成
func noItemAlert (){
        print("アラート表示")
        // アラートを作成
        let alert = UIAlertController(
            title: "認証開始",
            message: "あなたのパスワードは\(ansArray[0]),\(ansArray[1]),\(ansArray[2]),\(ansArray[3])です",
            preferredStyle: .alert)

        // アラートにボタンをつける
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        // アラート表示
        self.present(alert, animated: true, completion: nil)
    }
