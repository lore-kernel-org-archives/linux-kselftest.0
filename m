From: jerry.hoemann at hpe.com (Jerry Hoemann)
Date: Mon, 24 Sep 2018 13:36:06 -0600
Subject: [V2 PATCH] selftests: watchdog: Add gettimeout and get|set pretimeout
Message-ID: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>


Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.

Changes  v2
1) Update usage to include argument
2) Update usage to give example.
3) Made printf of WDIOC_GETTIMEOUT distinct from WDIOC_SETTIMEOUT
4) Made WDIOC_GETTIMEOUT a "one shot"
5) Made printf of WDIOC_GETPRETIMEOUT disnct from WDIOC_SETPRETIMEOUT
6) Made WDIOC_GETPRETIMEOUT a "one shot"


Jerry Hoemann (1):
  selftests: watchdog: Add gettimeout and get|set pretimeout

 tools/testing/selftests/watchdog/watchdog-test.c | 33 +++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

-- 
1.8.3.1
