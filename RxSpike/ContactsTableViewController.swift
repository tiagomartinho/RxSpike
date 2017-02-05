import UIKit
import RxCocoa
import RxSwift

class ContactsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    fileprivate let contacts = Variable<[Contact]>([])

    private var disposeBag: DisposeBag!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.disposeBag = DisposeBag()

        contacts.asObservable().bindTo(tableView.rx.items(cellIdentifier: "Contact Cell Identifier")) {
            (index, contact: Contact, cell) in
            cell.textLabel?.text = contact.name
            cell.detailTextLabel?.text = contact.number
            }
            .addDisposableTo(disposeBag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add Contact Segue" {
            let navigationController = segue.destination as? UINavigationController
            if let viewController = navigationController?.viewControllers.first as? AddContactViewController {
                viewController.delegate = self
            }
        }
    }
}

extension ContactsTableViewController: AddContactViewDelegate {
    func didAddContact(contact: Contact) {
        contacts.value.append(contact)
    }
}
