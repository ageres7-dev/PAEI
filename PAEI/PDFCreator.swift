
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
        
        let imageCropRect = CGRect(
            x: 0,
            y: (image.size.height - image.size.width * 0.7) / 2,
            width: image.size.width,
            height: image.size.width * 0.7
        )
        let croppedImage = cropImage(image: image, rect: imageCropRect, scale: 1)
        
        
        let pdfMetaData = [
            kCGPDFContextCreator: "",
            kCGPDFContextAuthor: "",
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
                height: pageRect.height * 0.15
            )
            
            let characteristicBottom = addTextBlock(
                textRect: characteristicTextRect,
                text: characteristic
            )
            let skilsTextRect = CGRect(
                x: leftMargin,
                y: characteristicBottom,
                width: (pageRect.width - leftMargin - rightMargin) / 2,
                height: pageRect.height * 0.23
            )
            let skillsBottom = addTextBlock(textRect: skilsTextRect, text: skills + qualit)
            
            let imageRect = CGRect(
                x: skilsTextRect.origin.x + skilsTextRect.width,
                y: characteristicBottom,
                width: (pageRect.width - leftMargin - rightMargin) / 2,
                height: pageRect.height * 0.23
            )
            
            let _ = addImage(image: croppedImage, imageBlockRect: imageRect)
            
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
//        let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
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
    
    func addImage(image: UIImage, imageBlockRect: CGRect) -> CGFloat {
        let maxHeight = imageBlockRect.height * 0.8
        let maxWidth = imageBlockRect.width * 0.8
        
//        let aspectWidth = maxWidth / image.size.width
//        let aspectHeight = maxHeight / image.size.height
//        let aspectRatio = min(aspectWidth, aspectHeight)
        
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
