From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 30 Apr 2019 15:00:12 -0400
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
References: <20190428133826.3e142cfd@oasis.local.home>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
Message-ID: <20190430150012.58ed382b@gandalf.local.home>

On Tue, 30 Apr 2019 11:33:21 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> On Tue, Apr 30, 2019 at 10:49 AM Steven Rostedt <rostedt at goodmis.org> wrote:
> >
> > +
> > +asm(
> > +       ".text\n"
> > +
> > +       /* Trampoline for function update with interrupts enabled */
> > +       ".global ftrace_emulate_call_irqoff\n"
> > +       ".type ftrace_emulate_call_irqoff, @function\n"
> > +       "ftrace_emulate_call_irqoff:\n\t"
> > +               "push %gs:ftrace_bp_call_return\n\t"  
> 
> Well, as mentioned in my original suggestion, this won't work on
> 32-bit, or on UP. They have different models for per-cpu data (32-bti
> uses %fs, and UP doesn't use a segment override at all).

Ah, yeah, I forgot about 32-bit. I could easily make this use fs as
well, and for UP, just use a static variable.

> 
> Maybe we just don't care about UP at all for this code, of course.
> 
> And maybe we can make the decision to also make 32-bit just not use
> this either - so maybe the code is ok per se, just needs to make sure
> it never triggers for the cases that it's not written for..
> 
> > +       "ftrace_emulate_call_update_irqoff:\n\t"
> > +               "push %gs:ftrace_bp_call_return\n\t"
> > +               "sti\n\t"
> > +               "jmp *ftrace_update_func_call\n"  
> 
> .. and this should then use the "push push sti ret" model instead.
> 
> Plus get updated for objtool complaints.

Yeah, I see that now. Somehow it disappeared when I looked for it after
making some other changes. I can update it.

> 
> Anyway, since Andy really likes the entry code change, can we have
> that patch in parallel and judge the difference that way? Iirc, that
> was x86-64 specific too.

Note, I don't think live kernel patching supports 32 bit anyway, so
that may not be an issue.

Josh,

When you come back to the office, can you look into that method?

-- Steve
