import XCTest

class ContactValidatorTest: XCTestCase {

    let emptyContact = Contact(name: "", number: "")

    func testEmptyContactIsInvalid() {

        let isValid = emptyContact.isValid

        XCTAssertFalse(isValid)
    }

    func testEmptyNameReturnEmptyNameError() {

        let errors = emptyContact.errors

        XCTAssert(errors.contains(.emptyName))
    }

    func testEmptyNumberReturnEmptyNumberError() {

        let errors = emptyContact.errors

        XCTAssert(errors.contains(.emptyNumber))
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
        return [.emptyName, .emptyNumber]
    }

    var isValid: Bool {
        return errors.isEmpty
    }
}

enum ContactError {
    case emptyName, emptyNumber
}
