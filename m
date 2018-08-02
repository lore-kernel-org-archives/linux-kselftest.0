From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 2 Aug 2018 16:22:58 +0900
Subject: [PATCH 11/25] selftests/ftrace: Improve kprobe on module
 testcase to load/unload module
In-Reply-To: <20180802100240.a27b72abe375c5817d970a0c@kernel.org>
References: <153269339575.3084.16279591141931053689.stgit@devbox>
 <153269370853.3084.10985190108092225790.stgit@devbox>
 <20180802100240.a27b72abe375c5817d970a0c@kernel.org>
Message-ID: <20180802162258.e038d6b1114f6c3c9e2dc238@kernel.org>

On Thu, 2 Aug 2018 10:02:40 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> On Fri, 27 Jul 2018 21:15:08 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> 
> > --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> > +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_module.tc
> > @@ -4,11 +4,18 @@
> >  
> >  [ -f kprobe_events ] || exit_unsupported # this is configurable
> >  
> > +rmmod trace-printk ||:
> > +if ! modprobe trace-printk.ko ; then
> > +  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=
> > +m"
> > +  exit_unresolved;
> > +fi
> > +
> > +MOD=trace_printk
> > +FUNC=trace_printk_irq_work
> 
> Hmm, this caused a problem with CONFIG_KPROBE_EVENTS_ON_NOTRACE=n.
> However, as far as I can see, the trace_printk_irq_work() is not
> marked as notrace...

Ah, I found this was caused by my prevent probe on notrace patch.
I was a bit too greedy to check out-of-range probes in it.
I'll fix that.

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
