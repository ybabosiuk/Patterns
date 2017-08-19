//: Playground - noun: a place where people can play

import UIKit

protocol IStrategy {
    func Algoritm()
}

class ConcreteAlgoritm1: IStrategy {
    func Algoritm() {
        print("Algoritm1")
    }
}

class ConcreteAlgoritm2: IStrategy {
    func Algoritm() {
        print("Algoritm2")
    }
}

class Context {
    private var contextStrategy: IStrategy
    
    init(strategy: IStrategy) {
        self.contextStrategy = strategy
    }
    
    func ExecuteAlgoritm() {
        contextStrategy.Algoritm()
    }
    
}

Context(strategy: ConcreteAlgoritm1()).ExecuteAlgoritm()
Context(strategy: ConcreteAlgoritm2()).ExecuteAlgoritm()
