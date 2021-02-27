//
//  Nums.swift
//  bot
//
//  Created by 向山陸 on 2021/01/18.
//

import Foundation
import AudioToolbox
var focusNum:Int = 5



func selectNum(i:Int){
    if focusNum >= 0  && focusNum < 10{
        if i == 1 && focusNum%3 != 0 && focusNum != 0{
            focusNum += 1
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        
        else if i == 2 && focusNum%3 != 1 && focusNum != 0{
            focusNum -= 1
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            
        }
        else if i == 3 && (focusNum > 3 || focusNum < 1){
            if focusNum == 0 {
                focusNum = 8
            }
            else{
                focusNum -= 3
            }
            AudioServicesPlaySystemSound(1011)
        }
        else if i == 4 && focusNum != 7 && focusNum != 9 && focusNum != 0{
            if focusNum == 8 {
                focusNum = 0
            }
            else{
                focusNum += 3
            }
            AudioServicesPlaySystemSound(1011)
        }
//        if i == 1 || i == 2 {
//            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
//        }
//        else if i == 3 || i == 4{
//            AudioServicesPlaySystemSound(1011)
//        }
    }
}
