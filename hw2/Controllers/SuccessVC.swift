import UIKit
import SnapKit



class SuccessVC: UIViewController {
    
    private lazy var successImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Success")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var successLabel: UILabel = {
        let view = UILabel()
        view.text = "Success`"
        view.font = .systemFont(ofSize: 23, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    private func initUI() {
        view.backgroundColor = UIColor(hex: "#4094A8")
        configureSuccessImage()
        configureSuccessLabel()
    }
    
    private func configureSuccessImage() {
        view.addSubview(successImage)
        
        successImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(159)
            make.height.equalTo(188)
        }
    }
    
    private func configureSuccessLabel() {
        view.addSubview(successLabel)
        
        successLabel.snp.makeConstraints { make in
            make.top.equalTo(successImage.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
    }
    
}
