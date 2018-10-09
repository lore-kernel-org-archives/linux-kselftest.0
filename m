From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Tue, 9 Oct 2018 23:26:30 +0530
Subject: selftests/bpf: test_kmod.sh hangs on all devices
In-Reply-To: <CA+G9fYuEFofW=L0cmmAAJGaO4ZvaPYUg=h6XgjAY=PiacXM3JA@mail.gmail.com>
References: <CA+G9fYumFxZghmxndq7STURbDbM4jgUzESr88yCgWvv=S+hbRA@mail.gmail.com>
 <febf5bc7-9e4e-1383-33bc-00416cc90e20@iogearbox.net>
 <CA+G9fYuEFofW=L0cmmAAJGaO4ZvaPYUg=h6XgjAY=PiacXM3JA@mail.gmail.com>
Message-ID: <CA+G9fYtGNFaX_F=436cKC=xNrS4VvpRhzK98w_jr4MCimufivg@mail.gmail.com>

> > > OTOH,
> > > There is a kernel BUG,
> >
> > This is quite an old linux-next kernel, should be fixed by 100811936f89 ("bpf: test_bpf:
> > add init_net to dev for flow_dissector"). Please make sure you have that commit included
> > in your testing:

This patch included in the linux next tree.

>
> I will re-validate on latest code base and let you know.

test_kmod.sh PASS on linux-next.

+ ./test_kmod.sh
[ JIT enabled:0 hardened:0 ]
[   25.886816] test_bpf: #0 TAX jited:0 441 435 436 PASS
[   25.889223] test_bpf: #1 TXA jited:0 144 143 143 PASS
<trim>
[  105.557950] test_bpf: #377 JNE signed compare, test 7 jited:1 46 PASS
[  105.564354] test_bpf: Summary: 378 PASSED, 0 FAILED, [366/366 JIT'ed]
test_bpf: ok
[  105.564354] test_bpf: Summary: 378 PASSED, 0 FAILED

Thank you
- Naresh
