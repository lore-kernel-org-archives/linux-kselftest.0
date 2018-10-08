From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Mon, 8 Oct 2018 20:25:01 +0530
Subject: selftests/bpf: test_kmod.sh hangs on all devices
In-Reply-To: <febf5bc7-9e4e-1383-33bc-00416cc90e20@iogearbox.net>
References: <CA+G9fYumFxZghmxndq7STURbDbM4jgUzESr88yCgWvv=S+hbRA@mail.gmail.com>
 <febf5bc7-9e4e-1383-33bc-00416cc90e20@iogearbox.net>
Message-ID: <CA+G9fYuEFofW=L0cmmAAJGaO4ZvaPYUg=h6XgjAY=PiacXM3JA@mail.gmail.com>

Daniel,

On Mon, 8 Oct 2018 at 18:58, Daniel Borkmann <daniel at iogearbox.net> wrote:
>
> On 10/08/2018 03:13 PM, Naresh Kamboju wrote:
> > BPF test case test_kmod.sh hangs on all devices running linux next.
> >
> > + cd /opt/kselftests/default-in-kernel/bpf
> > + ./test_kmod.sh
> > sysctl: cannot stat /proc/sys/net/core/bpf_jit_enable: No such file or directory
> > sysctl: cannot stat /proc/sys/net/core/bpf_jit_harden: No such file or directory
> > sysctl: cannot stat /proc/sys/net/core/bpf_jit_enable: No such file or directory
> > sysctl: cannot stat /proc/sys/net/core/bpf_jit_harden: No such file or directory
> > [ JIT enabled:0 hardened:0 ]
> >
> > https://lkft.validation.linaro.org/scheduler/job/429726
> >
> > Test hangs started from 4.19.0-rc4-next-20180918.
> > Linux version 4.19.0-rc4-next-20180918 (oe-user at oe-host) (gcc version
> > 7.1.1 20170707 (Linaro GCC 7.1-2017.08)) #1 SMP Tue Sep 18 05:26:00
> > UTC 2018
> >
> > History can be compared from this page.
> > https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_kmod.sh
> >
> > OTOH,
> > There is a kernel BUG,
>
> This is quite an old linux-next kernel, should be fixed by 100811936f89 ("bpf: test_bpf:
> add init_net to dev for flow_dissector"). Please make sure you have that commit included
> in your testing:

I will re-validate on latest code base and let you know.

>
> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=100811936f89fd455eda1984810c09003550555b

Thanks for the quick reply.

- Naresh
>
> Thanks,
> Daniel
