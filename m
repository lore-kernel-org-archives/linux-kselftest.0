From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Fri, 20 Apr 2018 23:33:53 +0530
Subject: PROBLEM: error due to conflicting types during build of kselftests
Message-ID:
 <CAG=yYwnMXFxHxCnYNWCb-HhpAb21kc5_e_6q-N_DRGhMVurPMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180420180353.66zambbNqZvt5KKMlO5WhMWRJs6ED745ChXVc8fXZPs@z>

hello,

the following is the error found...
-----------------------------------------------------------------------------------
protection_keys.c:421:5: error: conflicting types for ‘pkey_set’
 int pkey_set(int pkey, unsigned long rights, unsigned long flags)
     ^~~~~~~~
------------------------------------------------------------------------------------

to reproduce this error...
make -C tools/testing/selftests

Details about software:

Linux debian 4.17.0-rc1+ #1 SMP Thu Apr 19 18:59:45 IST 2018 x86_64 GNU/Linux

GNU Make             4.2.1
Binutils             2.30
Util-linux           2.31.1
Mount                2.31.1
Linux C Library      2.27
Dynamic linker (ldd) 2.27
readlink: missing operand
Try 'readlink --help' for more information.
Procps               3.3.14
Kbd                  2.0.4
Console-tools        2.0.4
Sh-utils             8.28
Udev                 238

-- 
software engineer
rajagiri school of engineering and technology
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
