
import UIKit
import SwiftUI
import PDFKit

class PDFCreator {
    let title: String
    let characteristic: String?
    let skills: String
    let quality: String
    let detailedCharacteristic: String
    let image: UIImage
    
    
    private let pageWidth = 8.3 * 72.0
    private let pageHeight = 11.7 * 72.0
    private lazy var pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
    private let topMargin: CGFloat = 36
    private let leftMargin: CGFloat = 60
    private lazy var rightMargin: CGFloat = 40
    private var titleBottom: CGFloat = 0
    private var skillsBottom: CGFloat = 0
    private var imageBottom: CGFloat = 0
    private var characteristicBottom: CGFloat = 0
    private var skilsRightEdge: CGFloat = 0
    private lazy var isFullCharacteristic = characteristic != nil
    
    init(title: String, characteristic: String?, skills: String,
         quality: String, detailedCharacteristic: String, image: UIImage) {
        self.title = title
        self.characteristic = characteristic
        self.skills = skills
        self.quality = quality
        self.detailedCharacteristic = detailedCharacteristic
        self.image = image
    }
    
    func createDocument() -> Data {
        let pdfMetaData = [
            kCGPDFContextCreator: "",
            kCGPDFContextAuthor: "",
            kCGPDFContextTitle: title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { context in
            context.beginPage()
            
            titleBottom = addTitle(pageRect: pageRect)
            
            if isFullCharacteristic {
                drawCharacteristic()
                drawSkils()
            }
            
            drawImage()
            drawDetailedCharacteristic()
        }
        
        return data
    }
    
    private func drawCharacteristic() {
        let characteristicTextRect = CGRect(
            x: leftMargin,
            y: titleBottom + 20,
            width: pageRect.width - (rightMargin + leftMargin),
            height: pageRect.height * 0.15
        )
        
        characteristicBottom = addTextBlock(
            textRect: characteristicTextRect,
            text: characteristic ?? ""
        )
    }
    
    private func drawSkils() {
        let skilsTextRect = CGRect(
            x: leftMargin,
            y: characteristicBottom,
            width: (pageRect.width - leftMargin - rightMargin) / 2,
            height: pageRect.height * 0.23
        )
        skillsBottom = addTextBlock(textRect: skilsTextRect, text: skills + quality)
        skilsRightEdge = skilsTextRect.origin.x + skilsTextRect.width
    }
    
    private func drawImage() {
        let imageCropRect = CGRect(
            x: 0,
            y: (image.size.height - image.size.width * 0.7) / 2,
            width: image.size.width,
            height: image.size.width * 0.7
        )
        
        let imageForPrint = image
                                .cropImage(rect: imageCropRect, scale: 1)
                                .round(30)
        
        let imageWidth = (pageRect.width - leftMargin - rightMargin) / 2
        let centerPage = leftMargin + (pageRect.width - leftMargin - rightMargin - imageWidth) / 2
        let imageRect = CGRect(
            x: isFullCharacteristic ? skilsRightEdge : centerPage,
            y: isFullCharacteristic ? characteristicBottom : titleBottom,
            width: imageWidth,
            height: pageRect.height * 0.23
        )
        
        imageBottom = addImage(image: imageForPrint, imageBlockRect: imageRect)
    }
    
    private func drawDetailedCharacteristic() {
        let detailedCharacteristicTextRect = CGRect(
            x: leftMargin,
            y: characteristic != nil ? skillsBottom : imageBottom + 20,
            width: (pageRect.width - leftMargin - rightMargin),
            height: pageRect.height
        )
        let _ = addTextBlock(textRect: detailedCharacteristicTextRect, text: detailedCharacteristic)
    }
    
    
    private func addTitle(pageRect: CGRect) -> CGFloat {
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        let titleAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font: titleFont]
        let attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
        let titleStringSize = attributedTitle.size()
        let titleStringRect = CGRect(x: leftMargin + (pageRect.width - leftMargin - titleStringSize.width) / 2,
                                     y: topMargin, width: titleStringSize.width,
                                     height: titleStringSize.height)
        attributedTitle.draw(in: titleStringRect)
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    private func addTextBlock(textRect: CGRect, text: String) -> CGFloat {
        let textFont = UIFont.init(name: "TimesNewRomanPSMT", size: 12) ?? UIFont.systemFont(ofSize: 12.0, weight: .regular)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
        ]
        let attributedText = NSAttributedString(string: text, attributes: textAttributes)
        attributedText.draw(in: textRect)
        
        return textRect.origin.y + textRect.size.height
        
    }
    
    private func addImage(image: UIImage, imageBlockRect: CGRect) -> CGFloat {
        let maxWidth = imageBlockRect.width * 0.8
        let aspectRatio = maxWidth / image.size.width
    
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        
        let imageX = imageBlockRect.origin.x + imageBlockRect.width - scaledWidth
        let imageY = imageBlockRect.origin.y + (imageBlockRect.height - scaledHeight) / 2
        
        let imageRect = CGRect(x: imageX, y: imageY,
                               width: scaledWidth, height: scaledHeight)
        
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
    
}




struct PDFViewUI_Previews: PreviewProvider {
    static var previews: some View {
        
        let data = PDFCreator(
            title:  "Lorem Ipsum",
            characteristic: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            skills: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            quality: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            detailedCharacteristic: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: UIImage(named: "light10")!
        ).createDocument()
        
        PDFViewUI(data: data)
    }
}






