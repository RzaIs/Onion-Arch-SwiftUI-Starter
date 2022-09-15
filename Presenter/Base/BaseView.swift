//
//  BaseView.swift
//  Presenter
//
//  Created by Rza Ismayilov on 16.09.22.
//

import SwiftUI

protocol BaseView: View {
    associatedtype State
    associatedtype Effect
    associatedtype Service: BaseService<State, Effect>
    var service: Service { get }
    var navProvider: NavProviderProtocol { get }
}
