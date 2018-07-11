From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 22:27:30 -0700
Subject: [PATCH v9 7/7] kselftests: Add tests for the preemptoff and
 irqsoff tracers
In-Reply-To: <20180710204958.22910589@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-8-joel@joelfernandes.org>
 <20180710204958.22910589@gandalf.local.home>
Message-ID: <20180711052730.GB11372@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180711052730.8Hwk0lO117qk-vG0KXtTqtpXSg0rBAL0f-kfq2DCObc@z>

On Tue, Jul 10, 2018@08:49:58PM -0400, Steven Rostedt wrote:
> On Thu, 28 Jun 2018 11:21:49 -0700
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> > 
> > Here we add unit tests for the preemptoff and irqsoff tracer by using a
> > kernel module introduced previously to trigger atomic sections in the
> > kernel.
> > 
> > Reviewed-by: Masami Hiramatsu <mhiramat at kernel.org>
> > Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> 
> This looks fine. The only patch that needs to be changed and resent is
> patch 6 and 7. Just send 6, and this one again because it depends on
> patch 6.
> 
> I'll go ahead and apply 1-5 and kick off my other tests.

Sounds good, I'll resend those shortly with the changes you suggested.

Thanks!

- Joel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
