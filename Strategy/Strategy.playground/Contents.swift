//: Playground - noun: a place where people can play

import UIKit

protocol StrategyProtocol {
    func Algoritm()
}

class ConcreteAlgoritm1: StrategyProtocol {
    func Algoritm() {
        print("Algoritm1")
    }
}

class ConcreteAlgoritm2: StrategyProtocol {
    func Algoritm() {
        print("Algoritm2")
    }
}

class Context {
    private var contextStrategy: StrategyProtocol
    
    init(strategy: StrategyProtocol) {
        self.contextStrategy = strategy
    }
    
    func ExecuteAlgoritm() {
        contextStrategy.Algoritm()
    }
    
}

Context(strategy: ConcreteAlgoritm1()).ExecuteAlgoritm()
Context(strategy: ConcreteAlgoritm2()).ExecuteAlgoritm()
