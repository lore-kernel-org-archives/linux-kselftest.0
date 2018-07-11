From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 11:26:59 -0400
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711151751.GI2476@hirez.programming.kicks-ass.net>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711125647.GG2476@hirez.programming.kicks-ass.net>
 <20180711090649.68af40f9@gandalf.local.home>
 <20180711151751.GI2476@hirez.programming.kicks-ass.net>
Message-ID: <20180711112659.366ec453@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180711152659.d-LtNLSTD-j45p2wcWG78xeFmjqeArbOhbIuWGqUQBo@z>

On Wed, 11 Jul 2018 17:17:51 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> I just read the comment that goes with that function; the order doesn't
> matter. All we want to ensure is that the unregistration is visible to
> either sched or srcu tracepoint users.

Yeah, but I think it is still good to change the order. It doesn't
hurt, and in my opinion makes the code a bit more robust.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
