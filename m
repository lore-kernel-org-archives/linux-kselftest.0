From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 2 May 2019 19:31:29 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502185225.0cdfc8bc@gandalf.local.home>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
Message-ID: <20190502193129.664c5b2e@gandalf.local.home>

On Thu, 2 May 2019 18:52:25 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Thu, 2 May 2019 22:21:46 +0200
> Peter Zijlstra <peterz at infradead.org> wrote:
> 
> > On Thu, May 02, 2019 at 11:43:37AM -0700, Linus Torvalds wrote:  
> > > What would it look like with the "int3-from-kernel is special" modification?    
> > 
> > Something like so; it boots; but I could've made some horrible mistake
> > (again).
> > 
> > ---
> > diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
> > index 7b23431be5cb..4de51cff5b8a 100644
> > --- a/arch/x86/entry/entry_32.S
> > +++ b/arch/x86/entry/entry_32.S  
> 
> Oh, and so close!
> 
> I was running this on my i386 tests and for test 8 of 9 (passed 1-7) I
> hit this:

Digging a little further, I pinpointed it out to being kretprobes. The
problem I believe is the use of kernel_stack_pointer() which does some
magic on x86_32. kretprobes uses this to hijack the return address of
the function (much like the function graph tracer does). I do have code
that would allow kretprobes to use the function graph tracer instead,
but that's still in progress (almost done!). But still, we should not
have this break the use of kernel_stack_pointer() either.

Adding some printks in that code, it looks to be returning "&regs->sp"
which I think we changed.

-- Steve
