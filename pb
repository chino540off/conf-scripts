#! /usr/bin/python

from pushbullet import Pushbullet
import getopt
import sys

class Notification:
    def __init__(self):
        self.pb = Pushbullet("o.eRsy7EbRuM9XYk1I7MIe7QMBdLnbk3ee")

    def send(self, t, m):
        self.pb.channels[0].push_note(t, m)

def usage ():
    print('Usage:')

def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], 't:m:')
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit()

    title = None
    message = None
    for o, a in opts:
        if o in ("-t", "--title"):
            title = a
        elif o in ("-m", "--msg"):
            message = a
        else:
            usage()
            sys.exit()
    
    notif = Notification()
    notif.send(title, message)


if __name__ == "__main__":
    main()
