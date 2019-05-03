From: luto@kernel.org (Andy Lutomirski)
Date: Fri, 3 May 2019 09:44:35 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190503163527.GI2606@hirez.programming.kicks-ass.net>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <20190503123126.3a2801be@gandalf.local.home>
 <20190503163527.GI2606@hirez.programming.kicks-ass.net>
Message-ID:
 <CALCETrUcEH8kswYGNkoupVVP+3hEsTA4BWTfLk-RY_RfkDsHGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503164435.6f5-BiGiNEdQmskXR2BYHlE6nQ6Hja4C1aj3xlntPCg@z>

On Fri, May 3, 2019@9:35 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, May 03, 2019@12:31:26PM -0400, Steven Rostedt wrote:
> > I guess the real question is, what's the performance impact of doing
> > that?
>
> Is there anyone that considers i386 a performance platform?

Not me.  As far as I'm concerned, I will basically always gladly trade
several cycles for simplicity on 32-bit.

--Andy
