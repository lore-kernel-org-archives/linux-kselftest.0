From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Tue, 7 May 2019 23:13:40 +0900
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506174511.2f8b696b@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190506095631.6f71ad7c@gandalf.local.home>
 <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
 <20190506130643.62c35eeb@gandalf.local.home>
 <CAHk-=whesas+GDtHZks62wqXWXe4d_g3XJ359GX81qj=Fgs6qQ@mail.gmail.com>
 <20190506145745.17c59596@gandalf.local.home>
 <CAHk-=witfFBW2O5v6g--FmqnAFsMkKNLosTFfWyaoJ7euQF8kQ@mail.gmail.com>
 <20190506162915.380993f9@gandalf.local.home>
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
 <20190506174511.2f8b696b@gandalf.local.home>
Message-ID: <20190507231340.92b1b0665d1110f90929d878@kernel.org>

On Mon, 6 May 2019 17:45:11 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> If we go with Peter's patch, I can make this code much more sane, and
> not have to worry about having &regs->sp be at the top of the stack. I
> could simply, just push everything in the order of pt_regs and call the
> handler.

Hi Steve, I need to catch up with the origin of this series, but it seems
also good to optprobe which is doing similar trick on pt_regs. If we can
assume that int3 pt_regs can have a gap, optprobe can also make a gap, and
it can be also used for storing destination address.

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
