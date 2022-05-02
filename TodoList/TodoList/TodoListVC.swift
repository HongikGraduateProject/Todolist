//
//  TodoListVC.swift
//  TodoList
//
//  Created by 김지은 on 2022/05/02.
//

import UIKit

class TodoListVC: UITableViewController {
    
    private let doneImage = UIImage(systemName: "heart.square")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
    private let todoImage = UIImage(systemName: "square")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    
    private let todolist = Todo.getInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.dataSource = self
        tableView.delegate = self
        //setupUI()
    }

    @IBAction func addButtonTap(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .default) { (cancel) in }
        let save = UIAlertAction(title: "저장", style: .default) { (save) in
            self.todolist.addTodo(todoData(contents: textField.text!, isDone: false))
            self.tableView.reloadData()
        }
        
        alert.addTextField {
            (text) in
            textField = text
            textField.placeholder = "새로운 할 일"
        }
        
        alert.addAction(cancle)
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todolist.count()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = todolist.getTodo(indexPath.item)
        cell.setTodo(todolist.getTodo(indexPath.item))
        cell.checkbox.image = todo.isDone == true ? doneImage : todoImage
        cell.todoText.textColor = todo.isDone == true ? .systemGray : .black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todolist.removeTodo(indexPath.item)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        } 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at:indexPath, animated:true)
        guard let cell = tableView.cellForRow(at: indexPath) as? TodoCell else { return }
        todolist.setCheck(indexPath.row)
        let todo = todolist.getTodo(indexPath.row)
        cell.checkbox.image = todo.isDone == true ? doneImage : todoImage
        cell.todoText.textColor = todo.isDone == true ? .systemGray : .black
    }
    
}

