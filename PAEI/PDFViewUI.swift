//
//  PDFViewUI.swift
//  PAEI
//
//  Created by Сергей on 19.02.2021.
//

import SwiftUI
import PDFKit

struct PDFViewUI: UIViewRepresentable {

    var data: Data
    init(data: Data) {
        self.data = data
    }

    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()

            pdfView.document = PDFDocument(data: data)
        

        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

}
