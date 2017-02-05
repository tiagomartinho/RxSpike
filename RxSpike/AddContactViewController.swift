import UIKit
import RxCocoa
import RxSwift

class AddContactViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var errorsLabel: UILabel!

    @IBAction func save(_ sender: Any) {
        delegate?.didAddContact(contact: contact)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    weak var delegate: AddContactViewDelegate?

    private var disposeBag: DisposeBag!
    private var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.disposeBag = DisposeBag()

        let name = nameTextField.rx.text.orEmpty
            .observeOn(MainScheduler.instance)

        let number = numberTextField.rx.text.orEmpty
            .observeOn(MainScheduler.instance)

        let contact = Observable.combineLatest(name, number) { (name, number) -> Contact in
            return Contact(name: name, number: number)
        }

        contact.subscribe(onNext: { contact in
            self.updateUI(with: contact)
            self.contact = contact
        }).addDisposableTo(disposeBag)
    }

    private func updateUI(with contact: Contact) {
        let isValid = contact.isValid
        errorsLabel.text = isValid ? "Contact is valid" : contact.errors.text
        errorsLabel.textColor = isValid ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        navigationItem.rightBarButtonItem?.isEnabled = isValid
    }
}
