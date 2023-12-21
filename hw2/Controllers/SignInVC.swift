import UIKit
import SnapKit



class SignInVC: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private var isPasswordVisible = true

    private lazy var mainImage: UIImageView = MakerView.makerView.createImage(image: UIImage(named: "mainImage"))
        
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var signInContinueLabel: UILabel = MakerView.makerView.createLabel(
        text: "Sign in to continue", textColor: .white, fontSize: 20, opacity: 0.7
    )
        
    private lazy var welcomeBackLabel: UILabel = MakerView.makerView.createLabel(
        text: "Welcome Back", textColor: .white, fontSize: 34, fontWeight: .bold
    )
    
    private lazy var emailLabel: UILabel = MakerView.makerView.createLabel(
        text: "Employee Id / Email", textColor: UIColor(hex: "#A5A5A5"), fontWeight: .medium
    )
    
    private lazy var emailTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter your email"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        view.leftView = leftView
        view.leftViewMode = .always
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var emailView: UIView = MakerView.makerView.createView(backgroundColor: UIColor(hex: "#E1E3E8"))
    
    private lazy var passwordLabel: UILabel = MakerView.makerView.createLabel(
        text: "Password", textColor: UIColor(hex: "#A5A5A5"), fontWeight: .medium
    )
    
    private lazy var passwordTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter your password"
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        view.leftView = leftView
        view.rightView = rightView
        view.leftViewMode = .always
        view.rightViewMode = .always
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var passwordButton: UIButton = MakerView.makerView.createButton(setImage: UIImage(named: "passwordEye"))
    
    private lazy var passwordView: UIView = MakerView.makerView.createView(backgroundColor: UIColor(hex: "#E1E3E8"))
    
    private lazy var forgotButton: UIButton = MakerView.makerView.createButton(
        text: "Forgot Password?", textColor: UIColor(hex: "#4B94EA"), fontSize: 13
    )
    
    private lazy var rememberButton: UIButton = MakerView.makerView.createButton(setImage: UIImage(systemName: "square"))
    
    private lazy var rememberLabel: UILabel = MakerView.makerView.createLabel(
        text: "Remember Me", textColor: .black, fontSize: 18, fontWeight: .medium
    )
    
    private lazy var signInButton: UIButton = MakerView.makerView.createButton(
        text: "Sign In", textColor: .white, fontSize: 18, fontWeight: .medium, cornerRadius: 15, backgroundColor: UIColor(hex: "#2855AE")
    )
    
    private lazy var footerView: FooterView = {
        let view = FooterView()
        view.footerButton.addTarget(self, action: #selector(footerSignUpTapped), for: .touchUpInside)
        view.setupButtonText(text: "Sign Up")
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    
    private func initUI() {
        view.backgroundColor = UIColor(hex: "#4094A8")
        configureMainImage()
        configureWhiteView()
        configureSignInContinueLabel()
        configureWelcomeBackLabel()
        configureEmailLabel()
        configureEmailTF()
        configureEmailView()
        configurePasswordLabel()
        configurePasswordTF()
        configurePasswordButton()
        configurePasswordView()
        configureForgotButton()
        configureRememberButton()
        configureRememberLabel()
        configureFooterView()
        configureSignInButton()
    }
    
    private func configureMainImage() {
        view.addSubview(mainImage)
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(256)
        }
    }
    
    private func configureWhiteView() {
        view.addSubview(whiteView)
        
        whiteView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(height / 1.7)
        }
    }
    
    private func configureSignInContinueLabel() {
        view.addSubview(signInContinueLabel)
        
        signInContinueLabel.snp.makeConstraints { make in
            make.bottom.equalTo(whiteView.snp.top).offset(-8)
            make.leading.equalToSuperview().offset(23)
        }
    }
    
    private func configureWelcomeBackLabel() {
        view.addSubview(welcomeBackLabel)
        
        welcomeBackLabel.snp.makeConstraints { make in
            make.bottom.equalTo(signInContinueLabel.snp.top).offset(-4)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    private func configureEmailLabel() {
        whiteView.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(43)
            make.leading.equalToSuperview().offset(23)
        }
    }
        
    private func configureEmailTF() {
        whiteView.addSubview(emailTF)
        
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(40)
        }
        
        emailTF.addTarget(self, action: #selector(testTF), for: .editingChanged)
    }
        
    private func configureEmailView() {
        whiteView.addSubview(emailView)
        
        emailView.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(1)
        }
    }
    
    private func configurePasswordLabel() {
        whiteView.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(23)
        }
    }
    
    private func configurePasswordTF() {
        whiteView.addSubview(passwordTF)
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(40)
        }
    }
    
    private func configurePasswordButton() {
        whiteView.addSubview(passwordButton)
        
        passwordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(-41)
            make.height.equalTo(13)
            make.width.equalTo(18)
        }
        
        passwordButton.addTarget(self, action: #selector(passwordButtonTapped), for: .touchUpInside)
    }
    
    private func configurePasswordView() {
        whiteView.addSubview(passwordView)
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.height.equalTo(1)
        }
    }
    
    private func configureForgotButton() {
        whiteView.addSubview(forgotButton)
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(3)
            make.trailing.equalToSuperview().offset(-23)
        }
        
        forgotButton.addTarget(self, action: #selector(forgotButtonTapped), for: .touchUpInside)
    }
    
    private func configureRememberButton() {
        whiteView.addSubview(rememberButton)
        
        rememberButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(23)
            make.height.width.equalTo(24)
        }
    }
    
    private func configureRememberLabel() {
        whiteView.addSubview(rememberLabel)
        
        rememberLabel.snp.makeConstraints { make in
            make.top.equalTo(rememberButton.snp.top)
            make.leading.equalTo(rememberButton.snp.trailing).offset(13)
        }
    }
    
    private func configureFooterView() {
        view.addSubview(footerView)
        
        footerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(68)
        }
    }
    
    private func configureSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(footerView.snp.top).offset(-14)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(168)
            make.height.equalTo(40)
        }
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func emptyTfState(textFeild: UITextField) {
        textFeild.placeholder = "Заполните пожалуйста."
        textFeild.layer.borderWidth = 1
        textFeild.layer.borderColor = UIColor.red.cgColor
    }
    
    private func filledTfState(textFeild: UITextField, placeholder: String) {
        textFeild.text = ""
        textFeild.layer.borderWidth = 0
        textFeild.layer.borderColor = .none
        textFeild.placeholder = placeholder
    }
    
    @objc func signInButtonTapped(_ sender: UIButton) {
        if emailTF.hasText && passwordTF.hasText && passwordTF.text?.count ?? 0 >= 8 {
            navigationController?.pushViewController(SuccessVC(), animated: true)
            filledTfState(textFeild: emailTF, placeholder: "Enter your email")
            filledTfState(textFeild: passwordTF, placeholder: "Enter your password")
        }
        else {
            emptyTfState(textFeild: emailTF)
            emptyTfState(textFeild: passwordTF)
        }
    }
    
    @objc func footerSignUpTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    @objc func passwordButtonTapped(_ sender: UIButton) {
        isPasswordVisible = !isPasswordVisible
        passwordTF.isSecureTextEntry = isPasswordVisible
    }
    
    @objc func forgotButtonTapped(_ sender: UIButton) {
        let vc = ForgotPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func testTF() {
        print("text field \(emailTF.text!)")
    }
}
