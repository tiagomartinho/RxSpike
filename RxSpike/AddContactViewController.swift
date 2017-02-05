import UIKit
import RxCocoa
import RxSwift

class AddContactsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var errorsLabel: UILabel!

    @IBAction func save(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    var disposeBag: DisposeBag!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.disposeBag = DisposeBag()

        let name = nameTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)

        let number = numberTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)

        let contact = Observable.zip(name, number) { (name, number) -> Contact in
            return Contact(name: name, number: number)
        }

        contact.subscribe(onNext: { contact in
            self.errorsLabel.text = "isValid: \(contact.isValid)"
        }).addDisposableTo(disposeBag)
    }
}

