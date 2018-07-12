From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 12 Jul 2018 16:31:35 -0400
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <CAEXW_YSxxEXF5knSDXsq=dTkZjtw_Qr1voo0A3qqW+KN8LKcMQ@mail.gmail.com>
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
 <CAEXW_YSxxEXF5knSDXsq=dTkZjtw_Qr1voo0A3qqW+KN8LKcMQ@mail.gmail.com>
Message-ID: <20180712163135.22075cd4@gandalf.local.home>

On Thu, 12 Jul 2018 13:29:32 -0700
Joel Fernandes <joel at joelfernandes.org> wrote:

> Also the kselftest patches were acked and can be taken independently,
> I had reposted them as a separate 2 patch series with some minor
> changes based on your suggestions. Could you check them?
>

Yep, I saw them. I was going to wait till these patches were sent, but
since they are agnostic, I'll look at them now. Thanks for letting me
know.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
