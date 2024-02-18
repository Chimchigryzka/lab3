import Foundation

// Структура для представления задачи
struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
}

// Класс для представления списка дел
class ToDoList {
    var tasks: [Task] = []

    // Метод для добавления новой задачи в список
    func addTask(title: String, description: String) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
        print("Задача '\(title)' добавлена в список.")
    }

    // Метод для удаления задачи из списка по имени
    func removeTask(byTitle title: String) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            let removedTask = tasks.remove(at: index)
            print("Задача '\(removedTask.title)' удалена из списка.")
        } else {
            print("Задача с именем '\(title)' не найдена в списке.")
        }
    }

    // Метод для изменения статуса выполнения задачи
    func toggleTaskStatus(byTitle title: String) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted.toggle()
            let status = tasks[index].isCompleted ? "выполнена" : "не выполнена"
            print("Статус задачи '\(title)' изменен: \(status).")
        } else {
            print("Задача с именем '\(title)' не найдена в списке.")
        }
    }

    // Метод для отображения информации обо всех задачах в списке
    func displayAllTasks() {
        print("Список задач:")
        for task in tasks {
            let status = task.isCompleted ? "выполнена" : "не выполнена"
            print("Название: \(task.title), Описание: \(task.description), Статус: \(status)")
        }
    }

    // Метод для отображения всех завершенных задач
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        print("Завершенные задачи:")
        for task in completedTasks {
            print("Название: \(task.title), Описание: \(task.description)")
        }
    }

    // Метод для отображения всех невыполненных задач
    func displayUncompletedTasks() {
        let uncompletedTasks = tasks.filter { !$0.isCompleted }
        print("Невыполненные задачи:")
        for task in uncompletedTasks {
            print("Название: \(task.title), Описание: \(task.description)")
        }
    }

    // Метод для очистки списка выполненных задач
    func clearCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        tasks = tasks.filter { !$0.isCompleted }
        print("\(completedTasks.count) завершенных задач очищены из списка.")
    }
}

// Пример использования с консольным вводом
let toDoList = ToDoList()

while true {
    print("\nВыберите действие:")
    print("1. Добавить задачу")
    print("2. Удалить задачу")
    print("3. Изменить статус выполнения задачи")
    print("4. Отобразить все задачи")
    print("5. Отобразить завершенные задачи")
    print("6. Отобразить невыполненные задачи")
    print("7. Очистить выполненные задачи")
    print("8. Выйти")

    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Введите название задачи:")
            let title = readLine() ?? ""
            print("Введите описание задачи:")
            let description = readLine() ?? ""
            toDoList.addTask(title: title, description: description)

        case 2:
            print("Введите название задачи для удаления:")
            let title = readLine() ?? ""
            toDoList.removeTask(byTitle: title)

        case 3:
            print("Введите название задачи для изменения статуса выполнения:")
            let title = readLine() ?? ""
            toDoList.toggleTaskStatus(byTitle: title)

        case 4:
            toDoList.displayAllTasks()

        case 5:
            toDoList.displayCompletedTasks()

        case 6:
            toDoList.displayUncompletedTasks()

        case 7:
            toDoList.clearCompletedTasks()

        case 8:
            exit(0)

        default:
            print("Некорректный ввод. Пожалуйста, введите число от 1 до 8.")
        }
    } else {
        print("Некорректный ввод. Пожалуйста, введите число от 1 до 8.")
    }
}
