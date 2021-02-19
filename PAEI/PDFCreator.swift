
import SwiftUI
import PDFKit

class PDFCreator {
    let title: String
    let characteristic: String
    let skills: String
    let qualit: String
    let detailedCharacteristic: String
    let image: UIImage
    
    private let topMargin: CGFloat = 36
    private let leftMargin: CGFloat = 40
    private lazy var rightMargin: CGFloat = 40
    
    init(title: String, characteristic: String, skills: String, qualit: String, detailedCharacteristic: String, image: UIImage) {
        self.title = title
        self.characteristic = characteristic
        self.skills = skills
        self.qualit = qualit
        self.detailedCharacteristic = detailedCharacteristic
        self.image = image
    }
    
    func createDocument() -> Data {
        let pdfMetaData = [
            //      kCGPDFContextCreator: "Flyer Builder",
            //      kCGPDFContextAuthor: "raywenderlich.com",
            kCGPDFContextTitle: title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageWidth = 8.3 * 72.0
        let pageHeight = 11.7 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        let data = renderer.pdfData { context in
            context.beginPage()
            
            let titleBottom = addTitle(pageRect: pageRect)
            
            let characteristicTextRect = CGRect(
                x: leftMargin,
                y: titleBottom + 20,
                width: pageRect.width - (rightMargin + leftMargin),
                height: pageRect.height * 0.18
            )
            
            let characteristicBottom = addTextBlock(
                textRect: characteristicTextRect,
                text: characteristic
            )
            let skilsTextRect = CGRect(
                x: leftMargin,
                y: characteristicBottom,
                width: (pageRect.width - leftMargin - rightMargin) / 2,
                height: pageRect.height * 0.43
            )
            let skillsBottom = addTextBlock(textRect: skilsTextRect, text: skills + qualit)
            let _ = addImage(pageRect: pageRect, imageTop: characteristicBottom)
            
            let detailedCharacteristicTextRect = CGRect(
                x: leftMargin,
                y: skillsBottom,
                width: (pageRect.width - leftMargin - rightMargin),
                height: pageRect.height
            )
            let _ = addTextBlock(textRect: detailedCharacteristicTextRect, text: detailedCharacteristic)
        
        }
        
        return data
    }
    
    func addTitle(pageRect: CGRect) -> CGFloat {
        // 1
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        
        // 2
        let titleAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font: titleFont]
        let attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
        // 3
        let titleStringSize = attributedTitle.size()
        // 4
        let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                     y: topMargin, width: titleStringSize.width,
                                     height: titleStringSize.height)
        // 5
        attributedTitle.draw(in: titleStringRect)
        // 6
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func addTextBlock(textRect: CGRect, text: String) -> CGFloat {
        // 1
//        let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        let textFont = UIFont.init(name: "TimesNewRomanPSMT", size: 12) ?? UIFont.systemFont(ofSize: 12.0, weight: .regular)
        // 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 3
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
        ]
        let attributedText = NSAttributedString(string: text, attributes: textAttributes)
        // 4
//        let textRect = CGRect(x: leftMargin, y: textTop, width: pageRect.width - (rightMargin + leftMargin), height: pageRect.height * indexHeight )
        attributedText.draw(in: textRect)
        
        return textRect.origin.x + textRect.size.height
        
    }
    
    func addImage(pageRect: CGRect, imageTop: CGFloat) -> CGFloat {
        // 1
        let maxHeight = pageRect.height * 0.2
        let maxWidth = pageRect.width * 0.2
        // 2
        let aspectWidth = maxWidth / image.size.width
        let aspectHeight = maxHeight / image.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        // 3
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        // 4
//        let imageX = (pageRect.width - scaledWidth) - (pageRect.width / 2)
        let imageX = (leftMargin + (pageRect.width - leftMargin - rightMargin) * 3 / 4 - scaledWidth / 2)
        let imageRect = CGRect(x: imageX, y: imageTop,
                               width: scaledWidth, height: scaledHeight)
        // 5
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
    
    func cropImage(image: UIImage, rect: CGRect, scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width / scale, height: rect.size.height / scale), true, 0.0)
        image.draw(at: CGPoint(x: -rect.origin.x / scale, y: -rect.origin.y / scale))
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage(systemName: "person.fill")!
        UIGraphicsEndImageContext()
        return croppedImage
    }
    
}


//
//struct PDFViewUI_Previews: PreviewProvider {
//    static var previews: some View {
////        PDFViewUI(data: PDFCreator(title: "jhbjhbhb", body: "bjhbhj", image: UIImage(named: "6")!).createDocument())
//    }
//}
