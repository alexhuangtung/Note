import UIKit
import Note_shared

class MainViewController: UIViewController {
    
    private let greeting = Greeting()
    
    private lazy var greetingLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lb.textColor = .black
        let env: String = {
            #if DEV
            return "Dev"
            #elseif STAG
            return "Stag"
            #elseif PROD
            return "Prod"
            #endif
        }()
        lb.text = greeting.greeting() + " (\(env))"
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
