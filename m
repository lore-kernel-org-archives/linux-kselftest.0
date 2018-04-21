From: jeffrin at rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Sat, 21 Apr 2018 20:17:55 +0530
Subject: possible BUG: selftest about raw_skew failed
Message-ID: <CAG=yYwmQb-zuq3V9muu=xXsRGa3s1A=fFgz-XJchCiFd+GYUYQ@mail.gmail.com>

hello,

failure of a test in selftest:timers

selftests: raw_skew
========================================
WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
Estimating clock drift: 17.910(est) 16.820(act) [FAILED]
Bail out!
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
not ok 1..7 selftests:  raw_skew [FAIL]


To reproduce :

make -C tools/testing/selftests/timers/ run_tests




Linux debian 4.17.0-rc1+ #3 SMP Sat Apr 21 03:41:44 IST 2018 x86_64 GNU/Linux

GNU Make            4.2.1
Binutils            2.30
Util-linux          2.31.1
Mount                2.31.1
Linux C Library      2.27
Dynamic linker (ldd) 2.27
readlink: missing operand
Try 'readlink --help' for more information.
Procps              3.3.14
Kbd                  2.0.4
Console-tools        2.0.4
Sh-utils            8.28
Udev                238

-- 
software engineer
rajagiri school of engineering and technology
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
