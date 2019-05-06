From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 14:57:45 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=whesas+GDtHZks62wqXWXe4d_g3XJ359GX81qj=Fgs6qQ@mail.gmail.com>
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
 <20190506095631.6f71ad7c@gandalf.local.home>
 <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
 <20190506130643.62c35eeb@gandalf.local.home>
 <CAHk-=whesas+GDtHZks62wqXWXe4d_g3XJ359GX81qj=Fgs6qQ@mail.gmail.com>
Message-ID: <20190506145745.17c59596@gandalf.local.home>

On Mon, 6 May 2019 11:06:51 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> On Mon, May 6, 2019 at 10:06 AM Steven Rostedt <rostedt at goodmis.org> wrote:
> >
> > Can you try booting with:
> > [ snip snip ]
> >
> > And see if it boots?  
> 
> No it doesn't.
> 
> Dang, I tried to figure out what's up, but now I really have to start
> handling all the puill requests..
> 
> I thought it might be an int3 that happens on the entry stack, but I
> don't think that should ever happen. Either it's a user-mode int3, or
> we're in the kernel and have switched stacks. So I still don't see why
> my patch doesn't work, but now I have no time to debug it.
> 

You should have waited another week to open that merge window ;-)

-- Steve
