From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 12 Jul 2018 13:29:32 -0700
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180712161538.0737ba7f@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711124954.GE2476@hirez.programming.kicks-ass.net>
 <20180711090003.42596c2b@gandalf.local.home>
 <20180711142744.GN3593@linux.vnet.ibm.com>
 <20180711104618.05dc4b46@gandalf.local.home>
 <20180711205249.GA32091@joelaf.mtv.corp.google.com>
 <20180711232120.5dbfa1c7@vmware.local.home>
 <20180712042825.GA154647@joelaf.mtv.corp.google.com>
 <20180712093512.1f612a24@gandalf.local.home>
 <20180712191701.GA107829@joelaf.mtv.corp.google.com>
 <20180712161538.0737ba7f@gandalf.local.home>
Message-ID:
 <CAEXW_YSxxEXF5knSDXsq=dTkZjtw_Qr1voo0A3qqW+KN8LKcMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712202932.e7yUDR_O2lr-pcK2R4MnsCfOUzhjKhoLHLC1wqsa914@z>

On Thu, Jul 12, 2018@1:15 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Thu, 12 Jul 2018 12:17:01 -0700
>> So then, we should use the regular variant for this additional check you're
>> suggesting.
>
> OK, I thought we had a rcu_dereference_notrace() that did checks and
> thought that this followed suit, but it appears there is no such call.
> That's where my confusion was.
>
> Sure, I'll nuke the notrace() portion, thanks.
>
> Also, I've applied 1-3, since 4 and 5 looks to be getting a remake, I'm
> going to remove them from my queue. Please fold the SPDX patch into 5.

Will do, and send out the 4 and 5 shortly with the SPDK folded.

Also the kselftest patches were acked and can be taken independently,
I had reposted them as a separate 2 patch series with some minor
changes based on your suggestions. Could you check them?

thanks!

- Joel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
