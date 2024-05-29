//
//  TodoListViewModel.swift
//  voiceMemo
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo]
    @Published var isEditTodoMode: Bool
    @Published var removeTodos: [Todo]
    @Published var isDisplayRemoveTodoAlert: Bool
    
    var removeTodosCount: Int{
        return removeTodos.count
    }
    var navigationBarRightBtnMode: NavigationBtnType{
        isEditTodoMode ? .complete : .edit
    }
    
    init(
        todos: [Todo] = [],
         isEditModeTodoMode: Bool = false,
         removeTodos: [Todo] = [],
         isDisplayTodoAlert: Bool = false
    ) {
        self.todos = todos
        self.isEditTodoMode = isEditModeTodoMode
        self.removeTodos = removeTodos
        self.isDisplayRemoveTodoAlert = isDisplayTodoAlert
    }
  
}

//로직은 따로 분리
extension TodoListViewModel{
    
    func selectedBoxTapped(_ todo: Todo){
        if let index = todos.firstIndex(where: { $0 == todo }){
            todos[index].selected.toggle()
        }
    }
    func addTodo(_ todo: Todo){
        todos.append(todo)
    }
    func navigationRightBtnTapped(){
        if isEditTodoMode{
            if removeTodos.isEmpty{
                isEditTodoMode = false
            }else{
                
            }
        }else{
            isEditTodoMode = true
        }
    }
    
    func setIsDisplayRemoveTodoAlert(_ isDisplay: Bool){
        isDisplayRemoveTodoAlert = isDisplay
        
    }
    func todoRemoveSelectedBoxTapped(_ todo: Todo){
        if let index = removeTodos.firstIndex(of: todo){
            removeTodos.remove(at: index)
        }else{
            removeTodos.append(todo)
        }
    }
    func removeBtnTapped(){
        todos.removeAll(){ todo in
            removeTodos.contains(todo)
        }
        removeTodos.removeAll()
        isEditTodoMode = false
    }
}
