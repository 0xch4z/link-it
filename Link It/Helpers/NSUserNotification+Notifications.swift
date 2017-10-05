//
//  NSUserNotification+Notifications.swift
//  Link It
//
//  Created by Charles Kenney on 10/5/17.
//  Copyright © 2017 Charles Kenney. All rights reserved.
//

import Foundation

extension NSUserNotification {
    
    // Notifications for this app
    static let InvalidURL: NSUserNotification = {
        let notification = NSUserNotification()
        notification.title = "Invalid URL!"
        notification.informativeText = "The URL you are trying to link is invalid. Please try again."
        notification.soundName = NSUserNotificationDefaultSoundName
        return notification
    }()
    
    static let EmptyPasteboard: NSUserNotification = {
        let notification = NSUserNotification()
        notification.title = "Empty Pasteboard!"
        notification.informativeText = "Your pasteboard seems to be empty! Please try again."
        notification.soundName = NSUserNotificationDefaultSoundName
        return notification
    }()
    
    static let MadeLink: NSUserNotification = {
        let notification = NSUserNotification()
        notification.title = "Linked It!"
        notification.informativeText = "The link has been formatted and added to your pasteboard!"
        notification.soundName = NSUserNotificationDefaultSoundName
        return notification
    }()
    
}
