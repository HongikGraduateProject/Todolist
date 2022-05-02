//
//  TodoCell.swift
//  TodoList
//
//  Created by 김지은 on 2022/05/02.
//

import UIKit

protocol TodoCellDelegate: AnyObject {
    func checkboxTap()
}

class TodoCell: UITableViewCell {
    
    private let todolist = Todo.getInstance()

    @IBOutlet weak var checkbox: UIImageView!
    
    @IBOutlet weak var todoText: UILabel!
    
   private var todo:todoData! {
        didSet {
            todoText.text = todo.contents
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func setTodo(_ todo: todoData)-> Void {
        self.todo = todo
    }
    

}
