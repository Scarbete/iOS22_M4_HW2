import UIKit
import SnapKit



class FooterView: UIView {
    
    private lazy var footerImage: UIImageView = MakerView.makerView.createImage(
        image: UIImage(named: "footerImage")!
    )
    
    private lazy var footerLabel: UILabel = MakerView.makerView.createLabel(
        text: "Don’t have an Account?", fontSize: 13, fontWeight: .medium
    )
    
    lazy var footerButton: UIButton = MakerView.makerView.createButton(
        textColor: UIColor(hex: "#4B94EA"), fontSize: 13, fontWeight: .medium
    )
    
    
    override func layoutSubviews() {
        initLayout()
    }
    
    
    private func initLayout() {
        configureFooterImage()
        configureFooterLabel()
        configureFooterButton()
    }
    
    private func configureFooterImage() {
        addSubview(footerImage)
        
        footerImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureFooterLabel() {
        addSubview(footerLabel)
        
        footerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(23)
        }
    }
    
    private func configureFooterButton() {
        addSubview(footerButton)
        
        footerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalTo(footerLabel.snp.trailing).offset(4)
        }
    }
    
    func setupButtonText(text: String) {
        footerButton.setTitle(text, for: .normal)
    }
}
