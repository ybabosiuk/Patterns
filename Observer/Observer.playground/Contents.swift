//Bad example without week var
import UIKit

protocol ObserverProtocol {
    func Update(word: String)
    var id: Int { get }
}

protocol SubjectProtocol {
    func RegisterObserver(observer: ObserverProtocol)
    func RemoveObserver(observer: ObserverProtocol)
    func NotifyObservers()
}

class ConcreteObserver: ObserverProtocol  {
    var id = Int()
    
    init(id: Int) {
        self.id = id
    }
    
    func Update(word: String) {
        print(word)
    }
}

class ConcreteSubject: SubjectProtocol {
    
    private var _word = ""
    
    var word: String {
        get {
            return _word
        }
        set {
            _word = newValue
            NotifyObservers()
        }
    }
    
    var observers = [ObserverProtocol]()
    
    func RegisterObserver(observer: ObserverProtocol) {
        observers.append(observer)
    }
    
    func RemoveObserver(observer: ObserverProtocol) {
        if let index = observers.index(where: { $0.id == observer.id}) {
            observers.remove(at: index)
        }
    }
    
    func NotifyObservers() {
        observers.forEach({ observer in
            observer.Update(word: self.word)
            })
    }
}

var concreteSubj = ConcreteSubject()

var concreteObs = ConcreteObserver(id: 1)
var concreteObs2 = ConcreteObserver(id: 2)

concreteSubj.RegisterObserver(observer: concreteObs)
concreteSubj.RegisterObserver(observer: concreteObs2)
concreteSubj.word = "New word with two Observers"

concreteSubj.RemoveObserver(observer: concreteObs2)
concreteSubj.word = "Brand new word with one Observer"





