//
//  BaseUseCases.swift
//  Domain
//
//  Created by Rza Ismayilov on 14.09.22.
//

import Combine

open class AsyncThrowsUseCase<Input, Output> {
    
    public init() {}
    
    open func execute(_ input: Input) async throws -> Output {
        fatalError("Method should be implemented")
    }
}

open class BaseAsyncThrowsUseCase<Output> {
    
    public init() {}
    
    open var execute: Output {
        get async throws {
            fatalError("Method should be implemented")
        }
    }
}

open class ObserveUseCase<Input, Output> {
    
    public init() {}
    
    open func observe(_ input: Input) -> AnyPublisher<Output, Never> {
        fatalError("Method should be implemented")
    }
}


open class BaseObserveUseCase<Output> {
    
    public init() {}
    
    open var observe: AnyPublisher<Output, Never> {
        fatalError("Method should be implemented")
    }
}
