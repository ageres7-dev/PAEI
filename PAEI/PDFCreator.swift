
import UIKit
import PDFKit

class PDFCreator {
    let title: String
    let characteristic: String?
    let skills: String
    let qualit: String
    let detailedCharacteristic: String
    let image: UIImage
    
    private let topMargin: CGFloat = 36
    private let leftMargin: CGFloat = 60
    private lazy var rightMargin: CGFloat = 40
    private var skillsBottom: CGFloat = 0
    private var characteristicBottom: CGFloat = 0
    private var skilsRightEdge: CGFloat = 0
    private lazy var isFullCharacteristic = characteristic != nil
    
    init(title: String, characteristic: String?, skills: String,
         qualit: String, detailedCharacteristic: String, image: UIImage) {
        self.title = title
        self.characteristic = characteristic
        self.skills = skills
        self.qualit = qualit
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
        
        let pageWidth = 8.3 * 72.0
        let pageHeight = 11.7 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        let data = renderer.pdfData { context in
            context.beginPage()
            
            let titleBottom = addTitle(pageRect: pageRect)
            
            if isFullCharacteristic {
                //
                let characteristicTextRect = CGRect(
                    x: leftMargin,
                    y: titleBottom + 20,
                    width: pageRect.width - (rightMargin + leftMargin),
                    height: pageRect.height * 0.15
                )
                
                let characteristicBottom = addTextBlock(
                    textRect: characteristicTextRect,
                    text: characteristic ?? ""
                )
                let skilsTextRect = CGRect(
                    x: leftMargin,
                    y: characteristicBottom,
                    width: (pageRect.width - leftMargin - rightMargin) / 2,
                    height: pageRect.height * 0.23
                )
                skillsBottom = addTextBlock(textRect: skilsTextRect, text: skills + qualit)
                skilsRightEdge = skilsTextRect.origin.x + skilsTextRect.width
            }
            
            
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
            
            let imageBottom = addImage(image: imageForPrint, imageBlockRect: imageRect)
            
            
            
            let detailedCharacteristicTextRect = CGRect(
                x: leftMargin,
                y: characteristic != nil ? skillsBottom : imageBottom + 20,
                width: (pageRect.width - leftMargin - rightMargin),
                height: pageRect.height
            )
            let _ = addTextBlock(textRect: detailedCharacteristicTextRect, text: detailedCharacteristic)
        }
        
        return data
    }
    
    func addTitle(pageRect: CGRect) -> CGFloat {
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
        //        let maxHeight = imageBlockRect.height * 0.8
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
    
}



//
//struct PDFViewUI_Previews: PreviewProvider {
//    static var previews: some View {
////        PDFViewUI(data: PDFCreator(title: "jhbjhbhb", body: "bjhbhj", image: UIImage(named: "6")!).createDocument())
//    }
//}






