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
//        let controller =
            UIActivityViewController(activityItems: itemsToShare,
                                     applicationActivities: servicesToShareItem)
//        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}
