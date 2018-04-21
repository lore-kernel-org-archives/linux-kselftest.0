From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Sun, 22 Apr 2018 02:11:05 +0530
Subject: possible BUG: selftests: proc-loadavg-001 failed during kernel
 testing
Message-ID:
 <CAG=yYwnsP5w6hKqsp0Q3_DZO3JZmtStGwnXNZN9zjPuFe8fOeA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180421204105.dobiA82OE-YjaXXD-lOU6fAgzfuwfOwVq0iXJ2Hni3U@z>

This problem is fixed now.

$sudo make -C tools/testing/selftests/proc run_tests
[sudo] password for jeffrin:
make: Entering directory
'/home/jeffrin/upstream-kernel/linux/tools/testing/selftests/proc'
TAP version 13
selftests: proc-loadavg-001
========================================
ok 1..1 selftests: proc-loadavg-001 [PASS]

Please add me in changelog if i was useful.



On Sat, Apr 21, 2018 at 8:41 PM, Jeffrin Thalakkottoor
<jeffrin@rajagiritech.edu.in> wrote:
> hello,
>
> selftests: proc-loadavg-001
> ========================================
> not ok 1..1 selftests:  proc-loadavg-001 [FAIL]
>
> To reproduce :
> make -C tools/testing/selftests/proc run_tests
>
> Linux debian 4.17.0-rc1+ #3 SMP Sat Apr 21 03:41:44 IST 2018 x86_64 GNU/Linux
>
> GNU Make            4.2.1
> Binutils            2.30
> Util-linux          2.31.1
> Mount                2.31.1
> Linux C Library      2.27
> Dynamic linker (ldd) 2.27
> readlink: missing operand
> Try 'readlink --help' for more information.
> Procps              3.3.14
> Kbd                  2.0.4
> Console-tools        2.0.4
> Sh-utils            8.28
> Udev                238
>
>
>
> --
> software engineer
> rajagiri school of engineering and technology



-- 
software engineer
rajagiri school of engineering and technology
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
