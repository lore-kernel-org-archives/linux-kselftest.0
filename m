From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Fri, 24 May 2019 02:36:42 +0530
Subject: about selftests/rtc test related stuff
In-Reply-To: <20190523174739.GY3274@piout.net>
References: <CAG=yYwk+g28_dnOcN--w-PLbGtA2oM5tq14W4X5bBjdurnF2iA@mail.gmail.com>
 <20190523174739.GY3274@piout.net>
Message-ID:
 <CAG=yYwmrE30nROqn63oAkXN9BCqfmo4T7+QPN-H3mSGG9dLU4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523210642.aTdbsIK4ZRL7x1gpbaBza32rOHNrzSgBofaebbXFrPw@z>

On Thu, May 23, 2019 at 11:17 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Your user probably doesn't have access to the rtc device file.
anyway thanks related
Following is the result with sudo....
------------------------x--------------------------------------x----------------------------
$sudo ./rtctest
[sudo] password for jeffrin:
[==========] Running 7 tests from 2 test cases.
[ RUN      ] rtc.date_read
rtctest.c:49:rtc.date_read:Current RTC date/time is 23/05/2019 20:49:49.
[       OK ] rtc.date_read
[ RUN      ] rtc.uie_read
[       OK ] rtc.uie_read
[ RUN      ] rtc.uie_select
[       OK ] rtc.uie_select
[ RUN      ] rtc.alarm_alm_set
rtctest.c:137:rtc.alarm_alm_set:Alarm time now set to 20:49:58.
rtctest.c:156:rtc.alarm_alm_set:data: 1a0
[       OK ] rtc.alarm_alm_set
[ RUN      ] rtc.alarm_wkalm_set
rtctest.c:195:rtc.alarm_wkalm_set:Alarm time now set to 23/05/2019 20:50:01.
[       OK ] rtc.alarm_wkalm_set
[ RUN      ] rtc.alarm_alm_set_minute
rtctest.c:239:rtc.alarm_alm_set_minute:Alarm time now set to 20:51:00.
Alarm clock
$rtctest.c:258:rtc.alarm_alm_set_minute:data: 1a0

$

------------------------x--------------------------------------x----------------------------


-- 
software engineer
rajagiri school of engineering and technology
