#! /usr/bin/env python2

# binclock
# written by Brian Gajdos <brian@linuxee.sk>, 2001

import curses
import _curses
import math
import os
import sys
import time


pause = 0
show_help_screen = 0



class BincScreen:

    def __init__(self):
	self.stdscr = None


    def initialize(self):
	self.stdscr = curses.initscr()
	curses.start_color()
        curses.use_default_colors()
	curses.noecho()
	curses.cbreak()
	self.stdscr.keypad(1)

	self.stdscr.nodelay(1)
	curses.halfdelay(1)

	curses.init_pair(10, curses.COLOR_RED, -1)
	curses.init_pair(11, curses.COLOR_BLACK, -1)
	curses.init_pair(12, curses.COLOR_GREEN, -1)
	curses.init_pair(13, curses.COLOR_BLUE, -1)


    def erase(self):
	self.stdscr.erase()


    def refresh(self):
	self.stdscr.refresh()


    def getch(self):
	return self.stdscr.getch()


    def addtext(self, x, y, col, txt):
	ccc = 0

	if col == 1:
	    ccc = curses.A_BOLD
	elif col == 100:
	    ccc = curses.A_NORMAL | curses.color_pair(10)
	elif col == 101:
	    ccc = curses.A_BOLD | curses.color_pair(10)
	elif col == 111:
	    ccc = curses.A_BOLD | curses.color_pair(11)
	elif col == 120:
	    ccc = curses.A_NORMAL | curses.color_pair(12)
	elif col == 121:
	    ccc = curses.A_BOLD | curses.color_pair(12)
	elif col == 130:
	    ccc = curses.A_NORMAL | curses.color_pair(13)
	elif col == 131:
	    ccc = curses.A_BOLD | curses.color_pair(13)

	self.stdscr.addstr(y, x, txt, ccc)


    def fetch_screensize(self):
	my_width = 80
	my_height = 25
	my_height, my_width = self.stdscr.getmaxyx()
	return my_width, my_height


    def done(self):
	curses.echo()
	curses.endwin()



class BincLED:

    def __init__(self, scr, x, y, co):
	self.scr = scr
	self.x = x
	self.y = y
	self.status = 0
	self.co = co
	self.oldstatus = 0


    def move(self, x, y):
	if self.x == x and self.y == y:
	    return
	self.x = x
	self.y = y


    def switch_on(self):
	self.status = 1


    def switch_off(self):
	self.status = 0


    def draw(self):

	if self.status:
	    if self.co == 2:
		self.scr.addtext(self.x, self.y, 121, "*")
	    else:
		self.scr.addtext(self.x, self.y, 101, "*")
	else:
	    if self.oldstatus:
		if self.co == 2:
		    self.scr.addtext(self.x, self.y, 120, "*")
		else:
		    self.scr.addtext(self.x, self.y, 100, "*")
	    else:
		self.scr.addtext(self.x, self.y, 111, "*")

	self.oldstatus = self.status



class BincColumn:

    def __init__(self, scr, x, y, co=1):
	self.scr = scr
	self.x = x
	self.y = y
	self.co = co
	self.leds = []
	for i in range(4):
	    self.leds.append(BincLED(scr, x, y + i, co))


    def move(self, x, y):
	if self.x == x and self.y == y:
	    return
	self.x = x
	self.y = y
	for i in range(4):
	    self.leds[i].move(x, y + i)


    def setup(self, number):
	if number & 1:
	    self.leds[3].switch_on()
	else:
	    self.leds[3].switch_off()
	if number & 2:
	    self.leds[2].switch_on()
	else:
	    self.leds[2].switch_off()
	if number & 4:
	    self.leds[1].switch_on()
	else:
	    self.leds[1].switch_off()
	if number & 8:
	    self.leds[0].switch_on()
	else:
	    self.leds[0].switch_off()


    def draw(self):
	for i in range(4):
	    self.leds[i].draw()



class BincDigital:

    def __init__(self, scr, x1, y1, x2, y2, x3, y3, x4, y4):
	self.scr = scr
	self.x1 = x1
	self.y1 = y1
	self.x2 = x2
	self.y2 = y2
	self.x3 = x3
	self.y3 = y3
	self.x4 = x4
	self.y4 = y4
	self.hour = 0
	self.minute = 0
	self.second = 0
	self.hds = 0


    def move(self, x1, y1, x2, y2, x3, y3, x4, y4):
	self.x1 = x1
	self.y1 = y1
	self.x2 = x2
	self.y2 = y2
	self.x3 = x3
	self.y3 = y3
	self.x4 = x4
	self.y4 = y4

	self.x12 = ((x1 + 2) + x2) / 2
	self.x23 = ((x2 + 2) + x3) / 2
	self.x34 = ((x3 + 2) + x4) / 2

	self.y12 = (y1 + y2) / 2
	self.y23 = (y2 + y3) / 2
	self.y34 = (y3 + y4) / 2


    def setup(self, hour, minute, second, hds):
	self.hour = hour
	self.minute = minute
	self.second = second
	self.hds = hds


    def draw(self, thds = 0):
	self.scr.addtext(self.x1, self.y1, 131, "%02d" % self.hour)
	self.scr.addtext(self.x12, self.y12, 130, ":")
	self.scr.addtext(self.x2, self.y2, 131, "%02d" % self.minute)
	self.scr.addtext(self.x23, self.y23, 130, ":")
	self.scr.addtext(self.x3, self.y3, 131, "%02d" % self.second)

	if thds:
	    if self.hds < 50:
		self.scr.addtext(self.x34, self.y34, 130, ".")
	    else:
		self.scr.addtext(self.x34, self.y34, 130, " ")
	    self.scr.addtext(self.x4, self.y4, 130, "%02d" % self.hds)



class BincTitle:

    def __init__(self, scr, x, y, txt=""):
	self.scr = scr
	self.x = x
	self.y = y
	self.txt = txt


    def move(self, x, y):
	if self.x == x and self.y == y:
	    return
	self.x = x
	self.y = y


    def draw(self):
	self.scr.addtext(self.x, self.y, 0, self.txt)



class BincHelpAdv:

    def __init__(self, scr, width, height):
	self.scr = scr
	self.width = width
	self.height = height
	self.txt_x = 0
	self.txt_y = 0
	self.start_time = 0
	self.help_text = "Press '?' to get help"
	self.window_too_small = 1


    def resize(self, width, height):
	self.width = width
	self.height = height

	self.window_too_small = 0
	if (len(self.help_text) + 1 > width) or (height < 2):
	    self.window_too_small = 1

	self.txt_x = (width - len(self.help_text)) / 2
	self.txt_y = height - 1


    def start(self):
	self.start_time = time.time()


    def draw(self):
	if self.window_too_small:
	    return
	t = time.time() - self.start_time
	if t < 0.15:
	    a = 0
	elif t < 0.25:
	    a = 1
	elif t < 4.0:
	    a = 0
	else:
	    a = 111
	self.scr.addtext(self.txt_x, self.txt_y, a, self.help_text)



class BincWatch:

    def __init__(self, scr):

	self.scr = scr

	self.exc_window_is_too_small = "window is too small"

	self.window_too_small = 0

	self.toggle_digital = 0
	self.toggle_help = 0
	self.toggle_hundreds = 1
	self.toggle_titles = 1

	self.title_hrs = BincTitle(scr, 0, 0, "hrs")
	self.title_min = BincTitle(scr, 0, 0, "min")
	self.title_sec = BincTitle(scr, 0, 0, "sec")
	self.title_hds = BincTitle(scr, 0, 0, "hds")

	self.bincols = [
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0),
	    BincColumn(scr, 0, 0, 2),
	    BincColumn(scr, 0, 0, 2)
	]

	self.bindigi = BincDigital(scr, 0, 0, 0, 0, 0, 0, 0, 0)

	self.binhelpadv = BincHelpAdv(scr, 0, 0)


    def setup_time(self, t):
	cas2 = time.localtime(t)
	year, month, day, hour, minute, second, weekday = cas2[:7]
	hds = int(math.fmod(math.floor(t * 100), 100))

	self.bincols[0].setup(hour / 10)
	self.bincols[1].setup(hour % 10)
	self.bincols[2].setup(minute / 10)
	self.bincols[3].setup(minute % 10)
	self.bincols[4].setup(second / 10)
	self.bincols[5].setup(second % 10)
	self.bincols[6].setup(hds / 10)
	self.bincols[7].setup(hds % 10)

	self.bindigi.setup(hour, minute, second, hds)

	if self.toggle_help:
	    if time.time() - self.binhelpadv.start_time > 5:
		self.toggle_help = 0


    def recalc_coords(self, width, height):

	inner_width = 13

	if self.toggle_hundreds:
	    inner_width = inner_width + 5

	inner_height = 4

	if self.toggle_titles:
	    inner_height = inner_height + 2
	if self.toggle_digital:
	    inner_height = inner_height + 2

	self.window_too_small = 0

	if inner_width > width or inner_height > height:
	    self.window_too_small = 1
	    raise self.exc_window_is_too_small

#	if self.toggle_help:
#	    if (len(self.help_text) + 1 > width) or (inner_height + 2 > height):
#		self.window_too_small = 1
#		raise "window is too small"

	off_x = (width - inner_width) / 2
	off_y = (height - inner_height) / 2

	pos_hrs_x = off_x
	pos_homi_x = off_x + 3
	pos_min_x = off_x + 5
	pos_mise_x = off_x + 8
	pos_sec_x = off_x + 10
	pos_seho_x = off_x + 13
	pos_hds_x = off_x + 15

	pos_hrs_y = pos_min_y = pos_sec_y = pos_hds_y = off_y

	if self.toggle_titles:
	    pos_hrs_y = pos_min_y = pos_sec_y = pos_hds_y = off_y + 2
	    pos_tit_y = off_y

	    self.title_hrs.move(pos_hrs_x, pos_tit_y)
	    self.title_min.move(pos_min_x, pos_tit_y)
	    self.title_sec.move(pos_sec_x, pos_tit_y)
	    self.title_hds.move(pos_hds_x, pos_tit_y)

	if self.toggle_digital:
	    pos_dig_y = pos_hrs_y + 5

	    self.bindigi.move(pos_hrs_x, pos_dig_y,
		pos_min_x, pos_dig_y, pos_sec_x, pos_dig_y,
		pos_hds_x, pos_dig_y)

#	pos_help_x = (width - len(self.help_text)) / 2
#	pos_help_y = height - 1

	self.binhelpadv.resize(width, height)

	self.bincols[0].move(pos_hrs_x, pos_hrs_y)
	self.bincols[1].move(pos_hrs_x + 1, pos_hrs_y)
	self.bincols[2].move(pos_min_x, pos_min_y)
	self.bincols[3].move(pos_min_x + 1, pos_min_y)
	self.bincols[4].move(pos_sec_x, pos_sec_y)
	self.bincols[5].move(pos_sec_x + 1, pos_sec_y)
	self.bincols[6].move(pos_hds_x, pos_sec_y)
	self.bincols[7].move(pos_hds_x + 1, pos_sec_y)



    def recalc_coords2(self, width, height):
	self.window_too_small = 0
	try:
	    self.recalc_coords(width, height)
	except self.exc_window_is_too_small:
	    self.window_too_small = 1


    def start_help_adv(self):
	self.toggle_help = 1
	self.binhelpadv.start()


    def draw(self):

	self.scr.erase()
	if self.window_too_small:
	    self.scr.refresh()
	    return

	if self.toggle_hundreds:
	    self.bcols = self.bincols[:]
	else:
	    self.bcols = self.bincols[:6]

	for a in self.bcols:
	    a.draw()

	if self.toggle_titles:
	    self.title_hrs.draw()
	    self.title_min.draw()
	    self.title_sec.draw()
	    if self.toggle_hundreds:
		self.title_hds.draw()

	if self.toggle_digital:
	    self.bindigi.draw(thds = self.toggle_hundreds)

	if self.toggle_help:
	    self.binhelpadv.draw()

	self.scr.refresh()




def draw_help_screen(scr):
    try:
	scr.erase()
	scr.addtext(2, 2, 131, "d")
	scr.addtext(4, 2, 130, "- toggles ordinary digital display on/off")
	scr.addtext(2, 3, 131, "h")
	scr.addtext(4, 3, 130, "- toggles hundreds display on/off")
	scr.addtext(2, 4, 131, "p")
	scr.addtext(4, 4, 130, "- pause/unpause")
	scr.addtext(2, 5, 131, "q")
	scr.addtext(4, 5, 130, "- quit")
	scr.addtext(2, 6, 131, "t")
	scr.addtext(4, 6, 130, "- toggles titles display on/off")

    except _curses.error:
	pass


def resize_handler(scr, thewatch):
    global my_width
    global my_height
    my_width, my_height = scr.fetch_screensize()
    thewatch.recalc_coords2(my_width, my_height)


def main():
    global pause
    global window_is_too_small
    global show_help_screen
    global my_height
    global my_width

    thescr = BincScreen()
    thescr.initialize()

    thewatch = BincWatch(thescr)

    thewatch.start_help_adv()

    my_width, my_height = thescr.fetch_screensize()
    try:
	thewatch.recalc_coords(my_width, my_height)
    except "window is too small":
	thescr.done()
	print "Screen too small."
	sys.exit(1)

    cas = time.time()

    while 1:
	try:
	    c = thescr.getch()
	except KeyboardInterrupt:
	    break
	if c in [-1, curses.KEY_RESIZE]:
	    if c == -1:
		pass
	    elif c == curses.KEY_RESIZE:
		resize_handler(thescr, thewatch)
	else:
	    if show_help_screen:
		show_help_screen = 0
	    elif c == ord('d'):
		thewatch.toggle_digital = not thewatch.toggle_digital
		thewatch.recalc_coords2(my_width, my_height)
	    elif c == ord('h'):
		thewatch.toggle_hundreds = not thewatch.toggle_hundreds
		thewatch.recalc_coords2(my_width, my_height)
	    elif c == ord('q'): break
	    elif c == ord('p'):
		pause = not pause
	    elif c == ord('t'):
		thewatch.toggle_titles = not thewatch.toggle_titles
		thewatch.recalc_coords2(my_width, my_height)
	    elif c == ord('?'):
		show_help_screen = 1
	    else:
		thewatch.start_help_adv()
	if not pause:
	    cas = time.time()

	if show_help_screen:
	    draw_help_screen(thescr)
	    thescr.refresh()
	    continue

	thewatch.setup_time(cas)
	thewatch.draw()

    thescr.done()


main()


