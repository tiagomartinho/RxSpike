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

    func testContactWithNameDoesNotReturnEmptyNameError() {
        let contactWithName = Contact(name: "some name", number: "")

        let errors = contactWithName.errors

        XCTAssertFalse(errors.contains(.emptyName))
    }

    func testContactWithNumberDoesNotReturnEmptyNumberError() {
        let contactWithNumber = Contact(name: "", number: "some number")

        let errors = contactWithNumber.errors

        XCTAssertFalse(errors.contains(.emptyNumber))
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
        var errors = [ContactError]()

        if name.isEmpty {
            errors.append(.emptyName)
        }

        if number.isEmpty {
            errors.append(.emptyNumber)
        }

        return errors
    }

    var isValid: Bool {
        return errors.isEmpty
    }
}

enum ContactError {
    case emptyName, emptyNumber
}
