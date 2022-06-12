//
//  Extension + UIImage.swift
//  PAEI
//
//  Created by Сергей on 22.02.2021.
//

import UIKit

public extension UIImage {
  func round(_ radius: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        let result = renderer.image { c in
            let rounded = UIBezierPath(roundedRect: rect, cornerRadius: radius)
            rounded.addClip()
            if let cgImage = self.cgImage {
                UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation).draw(in: rect)
            }
        }
        return result
    }
    func circle() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        let result = renderer.image { c in
            let isPortrait = size.height > size.width
            let isLandscape = size.width > size.height
            let breadth = min(size.width, size.height)
            let breadthSize = CGSize(width: breadth, height: breadth)
            let breadthRect = CGRect(origin: .zero, size: breadthSize)
            let origin = CGPoint(x: isLandscape ? floor((size.width - size.height) / 2) : 0,
                                 y: isPortrait  ? floor((size.height - size.width) / 2) : 0)
            let circle = UIBezierPath(ovalIn: breadthRect)
            circle.addClip()
            if let cgImage = self.cgImage?.cropping(to: CGRect(origin: origin, size: breadthSize)) {
                UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation).draw(in: rect)
            }
        }
        return result
    }
    
    func cropImage(rect: CGRect, scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width / scale, height: rect.size.height / scale), true, 0.0)
        self.draw(at: CGPoint(x: -rect.origin.x / scale, y: -rect.origin.y / scale))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage(systemName: "person.fill")!
        UIGraphicsEndImageContext()
        
        return croppedImage
    }
}
