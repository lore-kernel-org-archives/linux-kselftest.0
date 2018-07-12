From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 12 Jul 2018 09:37:47 -0400
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180712083805.GA67912@joelaf.mtv.corp.google.com>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180711131256.GH2476@hirez.programming.kicks-ass.net>
 <20180711091944.4d8e78ef@gandalf.local.home>
 <20180712083805.GA67912@joelaf.mtv.corp.google.com>
Message-ID: <20180712093747.4fca1642@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712133747.LOUS8ZOMetmCr7el5hB8d8JayOpYpceZWUoNqUc26XU@z>

On Thu, 12 Jul 2018 01:38:05 -0700
Joel Fernandes <joel@joelfernandes.org> wrote:

> So actually with or without the clean up, I don't see any issues with
> dropping lockdep_recursing in my tests at the moment. I'm not sure something
> else changed between then and now causing the issue to go away. I can include
> Peter's clean up in my series though if he's Ok with it since you guys agree
> its a good clean up anyway. Would you prefer I did that, and then also
> dropped the lockdep_recursing checks? Or should I keep the
> lockdep_recursing() checks just to be safe? Do you see cases where you want
> irqsoff tracing while lockdep_recursing() is true?

I say rewrite it as per Peter's suggestion. Perhaps even add credit to
Peter like:

Cleaned-up-code-by: Peter Zijlstra <peterz at infradead.org>

  ;-)

And yes, I would recommend dropping the lockdep_recursion() if you
can't trigger issues from within your tests. If it shows up later, we
can always add it back.

Thanks!

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
