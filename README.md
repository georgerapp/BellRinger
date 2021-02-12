# BellRinger

Automate the injection of text into a chat window.

The initial use case is for the listener chat accompanying Duane Patterson's Aftershow, affiliated with the Hugh Hewitt Show. A running gag on the show is that whenever former Representative John Campbell appears as a guest and mentions NBC's Chuck Todd, Duane rings an audio bell, and the chat participants (collectively known as Tribbles) count the bells. (It's like Groucho Marx and the What's My Line duck when the secret word is spoken.)

In the Chatwee room (at publication time, https://client.chatwee.com/popout/5bdac316bd616d051344c0ff), emojis can be selected from a menu, or typed in the chat between colons. The bell emoji is : b e l l :  without the intervening spaces. 

This PowerShell script requires that the Chatwee room be pulled up in a browser tab titled Chat, and (optionally) that a sacrificial Notepad window also be open -- the script seems to lock whatever application is selected with AppActivate after injecting keystrokes into chat. The script draws a dialog box with two buttons (Ring It! and Stop The Ringing, which exits the dialog) and a Bell Count text box that starts at 1 but can be updated. When John mentions Chuck Todd, the user clicks "Ring It!", which injects the text " : b e l l : x", followed by the Bell Count after a 750ms delay, and increments the Bell Count. This is an effective way to keep track of the Chuck Todd mentions when they happen in rapid succession.

Invoke the script in a Command Prompt window via "powershell .\bell.ps1" in the directory in which the bell.ps1 file was downloaded.
