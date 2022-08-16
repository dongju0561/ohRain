//
//  ProspectsView.swift
//  oh!Rain
//
//  Created by macbook on 2022/08/13.
//
//
import Foundation
import UserNotifications

struct ProspectsView {
    //config for notification
    func addNotification(_ WeatherModel : WeatherModel,_ hour : Int,_ min : Int) {
        let center = UNUserNotificationCenter.current()
        let pct = WeatherModel.getPct

        let addRequest = { // edit context for banner
            let content = UNMutableNotificationContent()
            content.title = "oh!Rain 알림"
            content.subtitle = WeatherBrain.isItRain(pct: pct)
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = min
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
            print("it worked")
        }
        //request authorization
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}
