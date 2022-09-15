//
//  BaseService.swift
//  Presenter
//
//  Created by Rza Ismayilov on 24.08.22.
//

import Domain

class BaseService<State, Effect>: ObservableObject{
    @Published var state: State
    @Published var effect: Effect
    
    @Published var hasError: Bool
    @Published var error: Error
    
    init(state: State, effect: Effect, hasError: Bool = false, error: Error = NSError(domain: "Base", code: 1)) {
        self.state = state
        self.effect = effect
        self.hasError = hasError
        self.error = error
    }
    
    func post(signal: State) {
        self.state = state
    }
    
    func post(effect: Effect) {
        self.effect = effect
    }
    
    func show(error: Error) {
        self.error = error
        self.hasError = true
    }
}


