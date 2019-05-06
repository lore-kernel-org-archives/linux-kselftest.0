From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Mon, 6 May 2019 10:14:28 -0500
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
Message-ID: <20190506151428.r6fhirmoz5nrmiu5@treble>

On Thu, May 02, 2019 at 11:02:40AM -0700, Linus Torvalds wrote:
> On Thu, May 2, 2019 at 9:21 AM Peter Zijlstra <peterz at infradead.org> wrote:
> >
> > TL;DR, on x86_32 kernel->kernel IRET frames are only 3 entries and do
> > not include ESP/SS, so not only wasn't regs->sp setup, if you changed it
> > it wouldn't be effective and corrupt random stack state.
> 
> Indeed, the 32-bit case for same-RPL exceptions/iret is entirely
> different, and I'd forgotten about that.
> 
> And honestly, this makes the 32-bit case much worse. Now the entry
> stack modifications of int3 suddenly affect not just the entry, but
> every exit too.
> 
> This is _exactly_ the kind of subtle kernel entry/exit code I wanted
> us to avoid.

I actually love this patch (absent the bugs).  This is already something
that has been sorely needed for years.

The "struct pt_regs is incomplete on x86-32" thing is a monstrosity
which has long been a source of confusion and bugs.  Sure, this patch
adds some complexity to the entry code, but on the other hand it
actually makes it possible to use pt_regs sanely: regs->sp is no longer
uninitialized.  So a class of (very non-obvious) bugs is eliminated.

I don't think it would make sense to make this change for int3 only,
because the benefits are global.

-- 
Josh
