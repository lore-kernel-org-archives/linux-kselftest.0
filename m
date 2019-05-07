From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 08:54:17 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507124131.GO2623@hirez.programming.kicks-ass.net>
References: <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
 <20190507092731.GH2650@hirez.programming.kicks-ass.net>
 <20190507082716.73cd5a01@gandalf.local.home>
 <20190507124131.GO2623@hirez.programming.kicks-ass.net>
Message-ID: <20190507085417.381d96d0@gandalf.local.home>

On Tue, 7 May 2019 14:41:31 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> > Kprobes sets the FTRACE_OPS_FL_IPMODIFY flag, thus
> > they can never be put at the same location that is being live patched.  
> 
> OK, so do we want to allow kprobes that also modify regs->sp ? Because
> then we need to change these trampolines a bit.
> 
> I'd prefer not to allow kprobes this.

I believe no kprobe changes sp, because it would have had the same
issues we are trying to solve now. And even though we are changing
things to allow it, it's not a regression to keep kprobes from doing it.

-- Steve
