enum ContactError: String {
    case emptyName = "Name is empty", emptyNumber = "Number is empty"
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
