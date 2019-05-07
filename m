From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Tue, 7 May 2019 12:21:59 -0500
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wiuue37opWK5QaQ9f6twqDZuSratdP-1bK6kD9-Az5WnA@mail.gmail.com>
References: <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
 <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>
 <20190507111227.1d4268d7@gandalf.local.home>
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
 <20190507163440.GV2606@hirez.programming.kicks-ass.net>
 <CAHk-=wiuue37opWK5QaQ9f6twqDZuSratdP-1bK6kD9-Az5WnA@mail.gmail.com>
Message-ID: <20190507172159.5t3bm3mjkwagvite@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507172159.s_eHlEQ6ZEKU16Zs2C9-KXztkrkeV-ZicgVXzdir4b0@z>

On Tue, May 07, 2019@10:08:50AM -0700, Linus Torvalds wrote:
> On Tue, May 7, 2019@9:34 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Would you consider my approach later on, under the guise of unification?
> 
> WHY?
> 
> The *only* advantage of your patch is that trivial "look up kernel stack" macro.
> 
> Seriously. There's absolutely nothing else.
> 
> Is that macro ugly? Yes. But it's directly explainable by just
> pointing to the architecture documentation.
> 
> It's a one-liner hack.
> 
> And for that, you want to complicate the x86-32 entry and exit code?
> 
> Do we have different emulation for "push" on 32-bit and 64-bit? Yes.
> But again, that's just how the hardware works. This is not some
> "generic hw-independent code". This is literally emulating
> instructions that care about instruction encoding and bit size
> details, where there are certainly _similarities_ (and in the case of
> 'call', they look bit-identical), but it's also not like "same code"
> is a big argument. That's why we have a helper function, to hide the
> details.
> 
> I point to my diffstat once again. It's smaller, and I argue that it
> is actually conceptually *simpler* to simply say "this is how the
> architecture works".
> 
> And yes, I realize that I may be biased by the fact that I simply know
> i386 so well, so to me it simply makes more sense to just work with
> what the hardware gives us. The i386 exception model with the kernel
> stack nesting is a *hell* of a lot simpler than the x86-64 one. The
> fact is, x86-64 messed things up, and swapgs and friends are an
> abomination against God.
> 
> So the whole "let's clean up x86-32 to look like x86-64, which got
> things right" is to me a completely bogus argument. x86-64 got the
> "yes, push ss/sp unconditionally" part right, but got a lot of other
> things horribly wrong. So this is all just one small detail that
> differs, across two architectures that are similar but have very
> different warts.
> 
> But that diffstat is still hard, cold, unbiased data.

regs->sp is *undefined* on x86-32.  We're damning our future selves to
have to always remember to use that darn kernel_stack_pointer() helper
for eternity just because of x86-32.

There have already been several bugs related to that.  Because regs->sp
is there, so why wouldn't you use it?

If we truly want the code to reflect the HW, then we should have a
pt_regs_kernel and a pt_regs_user on 32-bit.  I'm pretty sure we don't
want to go there...

IMO, we either need to make the pt_regs struct(s) match the HW behavior,
or make entry code match pt_regs.  But this in-between thing just
creates a bunch of headaches.

-- 
Josh
