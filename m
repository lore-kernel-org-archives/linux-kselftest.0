From: alexandre.belloni at bootlin.com (Alexandre Belloni)
Date: Thu, 23 May 2019 19:47:39 +0200
Subject: about selftests/rtc test related stuff
In-Reply-To: <CAG=yYwk+g28_dnOcN--w-PLbGtA2oM5tq14W4X5bBjdurnF2iA@mail.gmail.com>
References: <CAG=yYwk+g28_dnOcN--w-PLbGtA2oM5tq14W4X5bBjdurnF2iA@mail.gmail.com>
Message-ID: <20190523174739.GY3274@piout.net>

On 23/05/2019 22:29:36+0530, Jeffrin Thalakkottoor wrote:
> I get the following result when i run "rtctest"
> please see the following....
> -----------------x------------------------x-----------------
> $pwd
> /home/jeffrin/upstream/linux-kselftest/tools/testing/selftests/rtc
> $./rtctest
> [==========] Running 7 tests from 2 test cases.
> [ RUN      ] rtc.date_read
> rtctest.c:32:rtc.date_read:Expected -1 (18446744073709551615) !=
> self->fd (18446744073709551615)
> rtc.date_read: Test terminated by assertion

Your user probably doesn't have access to the rtc device file.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
