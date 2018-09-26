From: jerry.hoemann at hpe.com (Jerry Hoemann)
Date: Wed, 26 Sep 2018 15:23:07 -0600
Subject: [V3 PATCH 0/2] selftests: watchdog: Add get/set/pre timeout
Message-ID: <1537996989-13092-1-git-send-email-jerry.hoemann@hpe.com>


Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.

Changes  v2
1) Update usage to include argument
2) Update usage to give example.
3) Made printf of WDIOC_GETTIMEOUT distinct from WDIOC_SETTIMEOUT
4) Made WDIOC_GETTIMEOUT a "one shot"
5) Made printf of WDIOC_GETPRETIMEOUT disnct from WDIOC_SETPRETIMEOUT
6) Made WDIOC_GETPRETIMEOUT a "one shot"

Change v3
1) Printf says errno, but prints the string version of the error.
   Make the printf consistent.
2) As above error was cut/paste from prior printf in application
   add new patch 1 to fix the existing printf first.

Jerry Hoemann (2):
  selftests: watchdog: Fix error message.
  selftests: watchdog: Add gettimeout and get|set pretimeout

 tools/testing/selftests/watchdog/watchdog-test.c | 41 +++++++++++++++++++++---
 1 file changed, 36 insertions(+), 5 deletions(-)

-- 
1.8.3.1
