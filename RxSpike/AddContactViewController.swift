import UIKit
import RxCocoa
import RxSwift

class AddContactsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!

    @IBAction func save(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let nameValidator = nameTextField.rx.text.orEmpty
            .distinctUntilChanged()
            .flatMapLatest { query -> Observable<String> in
                if query.isEmpty {
                    return .just("Name is empty")
                }

                return .just("")
            }
            .observeOn(MainScheduler.instance)

        tableView.rx.obe
    }
}
