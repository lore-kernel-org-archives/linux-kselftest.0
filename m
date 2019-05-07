From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 08:27:16 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507092731.GH2650@hirez.programming.kicks-ass.net>
References: <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
 <20190507092731.GH2650@hirez.programming.kicks-ass.net>
Message-ID: <20190507082716.73cd5a01@gandalf.local.home>

On Tue, 7 May 2019 11:27:31 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> FWIW, both these trampolines assume a kprobe will not
> int3_emulate_{push/call}(), for both bitnesses.
> 
> But then; I'm thinking kprobes should be inspection only and not modify
> things. So that might just be good enough.

I believe there are kprobe calls that do modify things. Note, they can
modify regs->ip. Kprobes sets the FTRACE_OPS_FL_IPMODIFY flag, thus
they can never be put at the same location that is being live patched.

-- Steve
