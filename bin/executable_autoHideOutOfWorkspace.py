#!/usr/bin/env python

import i3ipc
from subprocess import call
from time import strftime, gmtime

i3 = i3ipc.Connection()

HIDDEN = '_NET_WM_STATE_HIDDEN'
SHOWN = '_NET_WM_STATE_SHOWN'

def on_workspace(i3, e):
    if e.current:
        for w in e.current.leaves():
            call(['xprop', '-id', str(w.window) , "-f", "_NET_WM_STATE", "32a", "-remove", HIDDEN])
            call(['xprop', '-id', str(w.window) , "-f", "_NET_WM_STATE", "32a", "-set", "_NET_WM_STATE", SHOWN])


    if e.old:
        for w in e.old.leaves():
            call(['xprop', '-id', str(w.window) , "-f", "_NET_WM_STATE", "32a", "-remove", SHOWN])
            call(['xprop', '-id', str(w.window) , "-f", "_NET_WM_STATE", "32a", "-set", "_NET_WM_STATE" , HIDDEN])
            print(w.name)


def on_window(i3, e):
    call(['xprop', '-id', str(e.container.window) , "-f", "_NET_WM_STATE", "32a", "-remove", HIDDEN])
    call(['xprop', '-id', str(e.container.window) , "-f", "_NET_WM_STATE", "32a", "-set", "_NET_WM_STATE", SHOWN])


i3.on('workspace::focus', on_workspace)
i3.on('window::focus', on_window)


i3.main()
