From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 12 Jul 2018 19:04:13 -0400
Subject: [PATCH 2/2] kselftests: Add tests for the preemptoff and
 irqsoff tracers
In-Reply-To: <20180711063540.91101-3-joel@joelfernandes.org>
References: <20180711063540.91101-1-joel@joelfernandes.org>
 <20180711063540.91101-3-joel@joelfernandes.org>
Message-ID: <20180712190413.317bd017@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712230413.8o3AlCTq_Mbn_mGmJm_QTWe4yY4Fm-2Tqk3CmCcKxfc@z>

On Tue, 10 Jul 2018 23:35:40 -0700
Joel Fernandes <joel@joelfernandes.org> wrote:

> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> 
> Here we add unit tests for the preemptoff and irqsoff tracer by using a
> kernel module introduced previously to trigger long preempt or irq
> disabled sections in the kernel.
> 
> Reviewed-by: Masami Hiramatsu <mhiramat at kernel.org>
> Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>

I added this to my queue too.

If you are curious to see what's currently in my queue, I just pushed
my queue to my tree:

 git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git

  ftrace/core

Beware, that branch can and will rebase often.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
