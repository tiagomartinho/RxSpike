import XCTest

class ContactValidatorTest: XCTestCase {
    
    func testEmptyContactIsInvalid() {
        let contact = Contact(name: "", number: "")

        let isValid = contact.isValid

        XCTAssertFalse(isValid)
    }

    func testEmptyNameReturnNameEmptyError() {
        let contact = Contact(name: "", number: "")

        let errors = contact.errors

        XCTAssert(errors.contains(.emptyName))
    }
}

struct Contact {

    let name: String
    let number: String

    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
}

extension Contact {

    var errors: [ContactError] {
        return [.emptyName]
    }

    var isValid: Bool {
        return errors.isEmpty
    }
}

enum ContactError {
    case emptyName
}
