#!/usr/bin/env python
'''
    ob-logout, fire power-managment events without sudo
 
    Copyright (C) 2010 Arthur Spitzer <http://arthapex.wordpress.com/>
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.
 
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''
 
import dbus
import gtk
import os
 
class DBusExecutor(object):
 
    ConsoleKitService = 'org.freedesktop.ConsoleKit'
    ConsoleKitPath = '/org/freedesktop/ConsoleKit/Manager'
    ConsoleKitInterface = 'org.freedesktop.ConsoleKit.Manager'
    UPowerService = 'org.freedesktop.UPower'
    UPowerPath = '/org/freedesktop/UPower'
    UPowerInterface = UPowerService
 
    def __init__(self):
        self.__bus = dbus.SystemBus()
 
    def logout(self, widget=None):
        os.system("openbox --exit")
        self.cancel()
 
    def restart(self, widget=None):
        obj = self.__bus.get_object(self.ConsoleKitService, self.ConsoleKitPath)
        manager = dbus.Interface(obj, self.ConsoleKitInterface)
        if manager.CanRestart():
            manager.Restart()
            self.logout()
 
    def shutdown(self, widget=None):
        obj = self.__bus.get_object(self.ConsoleKitService, self.ConsoleKitPath)
        manager = dbus.Interface(obj, self.ConsoleKitInterface)
        if manager.CanStop():
            manager.Stop()
            self.logout()
 
    def suspend(self, widget=None):
        obj = self.__bus.get_object(self.UPowerService, self.UPowerPath)
        manager = dbus.Interface(obj, self.UPowerInterface)
        if manager.SuspendAllowed():
            manager.Suspend()
            self.cancel()
 
    def hibernate(self, widget=None):
        obj = self.__bus.get_object(self.UPowerService, self.UPowerPath)
        manager = dbus.Interface(obj, self.UPowerInterface)
        if manager.HibernateAllowed():
            manager.Hibernate()
            self.cancel()
 
    def cancel(self, widget=None):
        # Check if we're already in gtk.main loop
        if gtk.main_level() > 0:
            gtk.main_quit()
        else:
            exit(1)
 
class BiggerButton(gtk.Button):
    def __init__(self, label=None):
        gtk.Button.__init__(self, label, use_underline=True)
        self.set_size_request(200, 50)
 
class OBLogout(object):
    def __init__(self):
        self.executor = DBusExecutor()
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_border_width(16)
        self.window.set_resizable(False)
        self.window.connect("destroy", self.executor.cancel)
 
        vbox = gtk.VBox(False, 16)
        self.window.add(vbox)
 
        icon_size = gtk.ICON_SIZE_DND
 
        logout_btn = BiggerButton('_Logout')
        image = gtk.image_new_from_icon_name('gnome-session-logout', icon_size)
        logout_btn.set_property('image', image)
        logout_btn.connect('clicked', self.executor.logout)
        vbox.pack_start(logout_btn, True, True, 0)
 
        restart_btn = BiggerButton('_Restart')
        image = gtk.image_new_from_icon_name('gnome-session-reboot', icon_size)
        restart_btn.set_property('image', image)
        restart_btn.connect('clicked', self.executor.restart)
        vbox.pack_start(restart_btn, True, True, 0)
 
        shutdown_btn = BiggerButton('Shut_down')
        image = gtk.image_new_from_icon_name('gnome-session-halt', icon_size)
        shutdown_btn.set_property('image', image)
        shutdown_btn.connect('clicked', self.executor.shutdown)
        vbox.pack_start(shutdown_btn, True, True, 0)
 
        suspend_btn = BiggerButton('_Suspend')
        image = gtk.image_new_from_icon_name('gnome-session-suspend', icon_size)
        suspend_btn.set_property('image', image)
        suspend_btn.connect('clicked', self.executor.suspend)
        vbox.pack_start(suspend_btn, True, True, 0)
 
        hibernate_btn = BiggerButton('_Hibernate')
        image = gtk.image_new_from_icon_name('gnome-session-hibernate', icon_size)
        hibernate_btn.set_property('image', image)
        hibernate_btn.connect('clicked', self.executor.hibernate)
        vbox.pack_start(hibernate_btn, True, True, 0)
 
        sep = gtk.HSeparator()
        vbox.pack_start(sep, True, True, 0)
 
        cancel_btn = BiggerButton('_Abort')
        image = gtk.image_new_from_stock(gtk.STOCK_CANCEL, icon_size)
        cancel_btn.set_property('image', image)
        cancel_btn.connect('clicked', self.executor.cancel)
        vbox.pack_start(cancel_btn, True, True, 0)
 
        self.window.set_type_hint(gtk.gdk.WINDOW_TYPE_HINT_DIALOG)
        self.window.set_skip_taskbar_hint(True)
        self.window.stick()
        self.window.set_decorated(False)
        self.window.show_all()
 
    def main(self):
        try:
            gtk.main()
        except KeyboardInterrupt:
            pass
 
if __name__ == "__main__":
    obl = OBLogout()
    obl.main()