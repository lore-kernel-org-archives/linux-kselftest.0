From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 3 May 2019 12:49:06 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CALCETrUcEH8kswYGNkoupVVP+3hEsTA4BWTfLk-RY_RfkDsHGw@mail.gmail.com>
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
 <CALCETrUcEH8kswYGNkoupVVP+3hEsTA4BWTfLk-RY_RfkDsHGw@mail.gmail.com>
Message-ID: <20190503124906.576c21f7@gandalf.local.home>

On Fri, 3 May 2019 09:44:35 -0700
Andy Lutomirski <luto at kernel.org> wrote:

> On Fri, May 3, 2019 at 9:35 AM Peter Zijlstra <peterz at infradead.org> wrote:
> >
> > On Fri, May 03, 2019 at 12:31:26PM -0400, Steven Rostedt wrote:  
> > > I guess the real question is, what's the performance impact of doing
> > > that?  
> >
> > Is there anyone that considers i386 a performance platform?  
> 
> Not me.  As far as I'm concerned, I will basically always gladly trade
> several cycles for simplicity on 32-bit.
>

So should I wait for a new PATCH 1 from Peter to implement it this way?
I'd like to get this into the next merge window (although, I am marking
it for stable since it fixes a bug for live kernel patching).

Linus, what's your thoughts?

-- Steve
