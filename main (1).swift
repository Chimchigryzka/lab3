struct Student {
    var firstName: String
    var lastName: String
    var averageGrade: Double
}

class StudentJournal {
    var students: [Student] = []

    func addStudent(student: Student) {
        students.append(student)
    }

    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    func displayStudentsInfo() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
        }
    }

    func listStudentsByDescendingGrade() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
        }
    }

    func averageGradeOfAllStudents() -> Double {
        let totalGrade = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalGrade / Double(students.count)
    }

    func studentWithHighestGrade() -> Student? {
        return students.max { $0.averageGrade < $1.averageGrade }
    }

    func addStudentFromConsole() {
        print("Enter the student's first name:")
        guard let firstName = readLine(), !firstName.isEmpty else {
            print("Invalid input. Please enter a valid first name.")
            return
        }

        print("Enter the student's last name:")
        guard let lastName = readLine(), !lastName.isEmpty else {
            print("Invalid input. Please enter a valid last name.")
            return
        }

        print("Enter the student's average grade:")
        guard let averageGradeString = readLine(), let averageGrade = Double(averageGradeString) else {
            print("Invalid input. Please enter a valid average grade.")
            return
        }

        let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        addStudent(student: newStudent)
        print("Student \(firstName) \(lastName) added to the journal.")
    }

    func removeStudentFromConsole() {
        print("Enter the first name of the student to remove:")
        guard let firstNameToRemove = readLine(), !firstNameToRemove.isEmpty else {
            print("Invalid input. Please enter a valid first name.")
            return
        }

        print("Enter the last name of the student to remove:")
        guard let lastNameToRemove = readLine(), !lastNameToRemove.isEmpty else {
            print("Invalid input. Please enter a valid last name.")
            return
        }

        removeStudent(firstName: firstNameToRemove, lastName: lastNameToRemove)
        print("Student \(firstNameToRemove) \(lastNameToRemove) removed from the journal.")
    }

    func searchStudentFromConsole() {
        print("Enter the first name or last name of the student to search:")
        guard let searchKeyword = readLine(), !searchKeyword.isEmpty else {
            print("Invalid input. Please enter a valid search keyword.")
            return
        }

        let foundStudents = students.filter {
            $0.firstName.contains(searchKeyword) || $0.lastName.contains(searchKeyword)
        }

        if foundStudents.isEmpty {
            print("No students found with the given search keyword.")
        } else {
            print("Students found:")
            for student in foundStudents {
                print("Name: \(student.firstName) \(student.lastName), Average Grade: \(student.averageGrade)")
            }
        }
    }
}

// Пример использования:

let journal = StudentJournal()

var continueLoop = true

while continueLoop {
    print("\nChoose an action:")
    print("1. Add a new student")
    print("2. Remove a student")
    print("3. Display students by descending grade")
    print("4. Search for a student by name or last name")
    print("5. Average grade of all students")
    print("6. Exit")

    guard let choiceString = readLine(), let choice = Int(choiceString) else {
        print("Invalid input. Please enter a valid choice.")
        continue
    }

    switch choice {
    case 1:
        journal.addStudentFromConsole()
    case 2:
        journal.removeStudentFromConsole()
    case 3:
        journal.listStudentsByDescendingGrade()
    case 4:
        journal.searchStudentFromConsole()
    case 5:
        let averageGrade = journal.averageGradeOfAllStudents()
        print("Average Grade of All Students: \(averageGrade)")
    case 6:
        continueLoop = false
    default:
        print("Invalid choice. Please enter a valid option.")
    }
}
