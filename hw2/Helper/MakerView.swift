import UIKit



class MakerView {
    
    static let makerView = MakerView()
    
    func createLabel(
        text: String = "",
        textColor: UIColor = .black,
        fontSize: CGFloat = 12,
        fontWeight: UIFont.Weight = .regular,
        numberOfLines: Int = 1,
        textAlignment: NSTextAlignment = .left,
        opacity: Float = 1
    ) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        view.numberOfLines = numberOfLines
        view.textAlignment = textAlignment
        view.layer.opacity = opacity
        return view
    }
    
    func createImage(
        image: UIImage? = nil,
        tintColor: UIColor = .black
    ) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.tintColor = tintColor
        return view
    }
    
    func createButton(
        text: String = "",
        textColor: UIColor = .black,
        fontSize: CGFloat = 12,
        fontWeight: UIFont.Weight = .regular,
        tintColor: UIColor = .black,
        setImage: UIImage? = nil,
        cornerRadius: CGFloat = 0,
        backgroundColor: UIColor = .clear
    ) -> UIButton {
        let view = UIButton()
        view.setTitle(text, for: .normal)
        view.setTitleColor(textColor, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        view.tintColor = tintColor
        view.setImage(setImage, for: .normal)
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = backgroundColor
        return view
    }
    
    func createView(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear
    ) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        return view
    }
    
}

extension UILabel {
    static func createLabel(
        text: String = "",
        textColor: UIColor = .black,
        fontSize: CGFloat = 12,
        fontWeight: UIFont.Weight = .regular,
        numberOfLines: Int = 1,
        textAlignment: NSTextAlignment = .left
    ) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        view.numberOfLines = numberOfLines
        view.textAlignment = textAlignment
        return view
    }
}
