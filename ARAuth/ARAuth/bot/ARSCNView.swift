//
//  ARSCNView.swift
//  bot
//
//  Created by 向山陸 on 2020/12/16.
//

import Foundation
import ARKit
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
            let p = faceAnchor.lookAtPoint
            let pp = SCNVector3(p)

            let sceneView = ARSCNView()
            let scnP = sceneView.projectPoint(pp)
            let sizeX = self.view.frame.maxX
            let sizeY = self.view.frame.maxY


            ppx = Float(sizeX)-(scnP.x)*Float(sizeX)
            ppy = Float(sizeY)-(scnP.y)*Float(sizeY)
        
            if ppx < 0{
                ppx = ppx*(-1)
            }
            
            if ppy < 0{
                ppy = ppy*(-1)
            }
            
//            print("x:\(p.x), y:\(p.y)")
            print("ppx:\(ppx) , ppy:\(ppy)\n")
            
//            label.text = "riku"
//            label.frame = CGRect(x:Int(ppx), y:Int(ppy), width:100, height:100)
//            label.textColor = UIColor.red
            
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {}
    
}
