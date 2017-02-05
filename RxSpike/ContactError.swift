enum ContactError: String {
    case emptyName = "Name is empty"
    case emptyNumber = "Number is empty"
    case numberHasInvalidFormat = "Number should be a \"+\" followed by a nonempty group of digits, a space, a nonempty group of digits, a space, a group of digits with at least 6 digits"
}

extension Collection where Iterator.Element == ContactError {
    var text: String {
        var text = ""
        for error in self {
            text.append(error.rawValue)
            text.append("\n")
        }
        return text
    }
}
