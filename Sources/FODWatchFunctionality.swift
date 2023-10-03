//
//  Initiate.swift
//  FitnessOnDemandStream
//
//  Created by Amanda Beyers on 10/3/23.
//

import SwiftUI
import GBeatKit
import GBeatUI


public class FODWatchFunctionality {
  @ObservedObject var object = WorkoutStatusObject()
    
    public func launchWatchApp(info: WorkoutInfo) -> ActivationState {
      return object.startWorkout(info)
    }
    
    public func leaveFacility() {
      object.leaveFacility()
    }
}
