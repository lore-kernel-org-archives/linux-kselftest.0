From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 09:56:31 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
Message-ID: <20190506095631.6f71ad7c@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506135631.tNa3VeUZCa1ZAYWmiMGNEzHgaUfeyCFobpdV1NAfHUQ@z>

On Mon, 6 May 2019 10:19:51 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, May 03, 2019@11:57:22AM -0700, Linus Torvalds wrote:
> > On Fri, May 3, 2019 at 9:21 AM Andy Lutomirski <luto at amacapital.net> wrote:  
> > >
> > > So here’s a somewhat nutty suggestion: how about we tweak the 32-bit
> > > entry code to emulate the sane 64-bit frame, not just for int3 but
> > > always?  
> > 
> > What would the code actually end up looking like? I don't necessarily
> > object, since that kernel_stack_pointer() thing certainly looks
> > horrible, but honestly, my suggestion to just pass in the 'struct
> > pt_regs' and let the call emulation fix it up would have also worked,
> > and avoided that bug (and who knows what else might be hiding).
> > 
> > I really think that you're now hitting all the special case magic
> > low-level crap that I wanted to avoid.  
> 
> This did actually boot on first try; so there must be something horribly
> wrong...
> 
> Now, I know you like that other approach; but I figured I should at
> least show you what this one looks like. Maybe I've been staring at
> entry_32.S too much, but I really don't dislike this.

I can test this too. I was hoping to get this in by this merge window.
I spent 3 hours yesterday trying to get Linus's version working on
i386 with no success. Not sure how much time Linus will have to look at
this, as he just opened the merge window.

Again, I think Peter's solution here is the more elegant one. But as
long as we get *a* solution, I'll be happy. And my time to work on it
has pretty much already been depleted.

-- Steve
