From: dan.rue at linaro.org (Dan Rue)
Date: Fri, 26 Jan 2018 09:36:31 -0600
Subject: [Linux-kselftest-mirror] selftests/x86/fsgsbase_64 test problem
Message-ID: <20180126153631.ha7yc33fj5uhitjo@xps>

We've noticed that fsgsbase_64 can fail intermittently with the
following error:

        [RUN]   ARCH_SET_GS(0x0) and clear gs, then schedule to 0x1
                Before schedule, set selector to 0x1
                other thread: ARCH_SET_GS(0x1) -- sel is 0x0
        [FAIL]  GS/BASE changed from 0x1/0x0 to 0x0/0x0

This can be reliably reproduced by running fsgsbase_64 in a loop. i.e.

    for i in $(seq 1 10000); do ./fsgsbase_64 || break; done

This problem isn't new - I've reproduced it on latest mainline and every
release going back to v4.12 (I did not try earlier). This was tested on
a Supermicro board with a Xeon E3-1220 as well as an Intel Nuc with an
i3-5010U.

Thanks,
Dan
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
