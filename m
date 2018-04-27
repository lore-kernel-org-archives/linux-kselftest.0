From: rdunlap@infradead.org (Randy Dunlap)
Date: Fri, 27 Apr 2018 16:38:02 -0700
Subject: PROBLEM: error due to conflicting types during build of kselftests
In-Reply-To: <CAG=yYwnMXFxHxCnYNWCb-HhpAb21kc5_e_6q-N_DRGhMVurPMQ@mail.gmail.com>
References: <CAG=yYwnMXFxHxCnYNWCb-HhpAb21kc5_e_6q-N_DRGhMVurPMQ@mail.gmail.com>
Message-ID: <bd125268-a685-ba6e-efc4-130a0621855f@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180427233802.Uy5jl8Ko7WsHNuXKeEO2yd97S17yNih5iZp7Y2u_CCk@z>

On 04/20/2018 11:03 AM, Jeffrin Thalakkottoor wrote:
> hello,
> 
> the following is the error found...
> -----------------------------------------------------------------------------------
> protection_keys.c:421:5: error: conflicting types for ‘pkey_set’
>  int pkey_set(int pkey, unsigned long rights, unsigned long flags)
>      ^~~~~~~~
> ------------------------------------------------------------------------------------
> 
> to reproduce this error...
> make -C tools/testing/selftests

Hi,

I can't reproduce this problem.  What is your gcc --version?

Thanks.

> Details about software:
> 
> Linux debian 4.17.0-rc1+ #1 SMP Thu Apr 19 18:59:45 IST 2018 x86_64 GNU/Linux
> 
> GNU Make             4.2.1
> Binutils             2.30
> Util-linux           2.31.1
> Mount                2.31.1
> Linux C Library      2.27
> Dynamic linker (ldd) 2.27
> readlink: missing operand
> Try 'readlink --help' for more information.
> Procps               3.3.14
> Kbd                  2.0.4
> Console-tools        2.0.4
> Sh-utils             8.28
> Udev                 238
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
