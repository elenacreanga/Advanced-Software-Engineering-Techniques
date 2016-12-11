//
//  AppStateManager.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/11/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit
import SwiftFSM

class AppStateManager: NSObject {
    
    static let sharedInstance = AppStateManager()
    
    let fsm = SwiftFSM<MachineState, MachineTransition>(id: "MachineFSM", willLog: false)
    
    func startMonitoring() {
        let notLogged = fsm.addState(newState: .NotLogged)
        
        notLogged.onEnter = { (transition: MachineTransition) -> Void in
            print("Entered the \(self.fsm.currentState) state with the \(transition) transition")
        }
        
        notLogged.addTransition(transition: .Login, to: .Logged)
        notLogged.addTransition(transition: .Logout, to: .NotLogged)
        
        
        let logged = fsm.addState(newState: .Logged)
        
        logged.onEnter = { (transition: MachineTransition) -> Void in
            print("Entered the \(self.fsm.currentState) state with the \(transition) transition")
        }
        logged.onExit = { (transition: MachineTransition) -> Void in
            print("FSM exited the Logged state with the \(transition) transition")
        }
        
        logged.addTransition(transition: .Login, to: .Logged)
        logged.addTransition(transition: .Logout, to: .NotLogged)
        
        fsm.startFrom(state: .NotLogged)

    }
}
