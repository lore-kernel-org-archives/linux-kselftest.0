From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Tue, 7 Aug 2018 18:22:41 -0400 (EDT)
Subject: [PATCH 0/1] rseq/selftests: add __rseq_abi misalignment check
In-Reply-To: <cover.thread-5c3a1c.your-ad-here.call-01533555685-ext-8699@work.hours>
References: <cover.thread-5c3a1c.your-ad-here.call-01533555685-ext-8699@work.hours>
Message-ID: <1178149993.10208.1533680561904.JavaMail.zimbra@efficios.com>

----- On Aug 6, 2018, at 7:47 AM, gor gor at linux.ibm.com wrote:

> While implementing rseq selftest for s390 a glibc problem with tls
> variables alignment has been discovered. It turned out to be a general
> problem affecting several architectures. The bug opened for this problem:
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=23403
> 
> There is no fix yet. On s390 __rseq_abi ends up aligned to 0x10 instead
> of 0x20 which makes rseq selftest fail every time.
> 
> The change proposed adds __rseq_abi misalignment check, produces user
> friendly message and skips the test.

That's a very unfortunate situation. I'm concerned about adding glibc-specific
error messages in rseq selftests though. I'm curious to hear what others think
about this.

I would have thought simply improving rseq registration error handling from
having the test program return nonzero to add a perror() in there would be
a more generic way to handle this.

Regarding the message printed by your check: "you need a fixed version of glibc to
run this test". I disagree with it. Someone can effectively run the test on
a bogus glibc and it serves its purpose: it reports that glibc is buggy.

I would understand adding this kind of test in an user-facing application or
library to detect bogus glibc (in fact I've used similar approaches in lttng-ust
to detect bogus compilers), but why add this to skip a selftest program, which
sole purpose is to test the stack underneath it ?

Thanks,

Mathieu

> 
> Vasily Gorbik (1):
>  rseq/selftests: add __rseq_abi misalignment check
> 
> tools/testing/selftests/rseq/rseq.c           | 19 +++++++++++++++++++
> .../testing/selftests/rseq/run_param_test.sh  |  4 ++--
> 2 files changed, 21 insertions(+), 2 deletions(-)
> 
> --
> 2.18.0.13.gd42ae10

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
