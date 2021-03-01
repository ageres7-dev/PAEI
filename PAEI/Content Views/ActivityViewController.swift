//
//  ActivityViewController.swift
//  PAEI
//
//  Created by Сергей on 26.01.2021.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    var itemsToShare: [Any]
    var servicesToShareItem: [UIActivity]?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        UIActivityViewController(activityItems: itemsToShare,
                                 applicationActivities: servicesToShareItem)
  
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}
