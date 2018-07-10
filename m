From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 10:33:45 -0700
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180710102050.78ae0ea8@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180710102050.78ae0ea8@gandalf.local.home>
Message-ID: <20180710173345.GB103636@joelaf.mtv.corp.google.com>

On Tue, Jul 10, 2018 at 10:20:50AM -0400, Steven Rostedt wrote:
> On Thu, 28 Jun 2018 11:21:47 -0700
> Joel Fernandes <joel at joelfernandes.org> wrote:
> 
> > diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> > new file mode 100644
> > index 000000000000..dc01c7f4d326
> > --- /dev/null
> > +++ b/kernel/trace/trace_preemptirq.c
> > @@ -0,0 +1,71 @@
> 
> Can you send a patch on top of this, that adds a SPDX header here. Just
> add another patch, no need to resend this one.
> 
> I need to go through all the files in kernel/trace/* and add SPDX
> headers. I don't want to add more files that don't have them.

Sure, I'll send a patch ontop of this.

> I'm still playing around with this patch, and testing it.

Ok, thanks.

-Joel

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
