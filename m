From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 21:04:16 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wj3R_s0RTJOmTBNaUPhu4fz2shNBUr4M6Ej65UYSNCs-g@mail.gmail.com>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <CAHk-=wj3R_s0RTJOmTBNaUPhu4fz2shNBUr4M6Ej65UYSNCs-g@mail.gmail.com>
Message-ID: <20190506210416.2489a659@oasis.local.home>

On Mon, 6 May 2019 15:06:57 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> On Mon, May 6, 2019 at 2:45 PM Steven Rostedt <rostedt at goodmis.org> wrote:
> >
> > To do that we would need to rewrite the logic to update each of those
> > 40,000 calls one at a time, or group them together to what gets
> > changed.  
> 
> Stephen, YOU ARE NOT LISTENING.

 (note, it's Steven ;-)

I'm listening, I'm just trying to understand.

> 
> You are already fixing the value of the call in the instruction as
> part of the instruction rewriting.
> 
> When you do things like this:
> 
>         unsigned long ip = (unsigned long)(&ftrace_call);
>         unsigned char *new;
>         int ret;
> 
>         new = ftrace_call_replace(ip, (unsigned long)func);
>         ret = update_ftrace_func(ip, new);
> 
> you have already decided to rewrite the instruction with one single
> fixed call target: "func".
> 
> I'm just saying that you should ALWAYS use the same call target in the
> int3 emulation.
> 
> Instead, you hardcode something else than what you are AT THE SAME
> TIME rewriting the instruction with.
> 
> See what I'm saying?

Yes, but that's not the code I'm worried about.

ftrace_replace_code() is, which does:

	for_ftrace_rec_iter(iter) {
		rec = ftrace_rec_iter_record(iter);

		ret = add_breakpoints(rec, enable);
		if (ret)
			goto remove_breakpoints;
		count++;
	}

	run_sync();


And there's two more iterator loops that will do the modification of
the call site, and then the third loop will remove the breakpoint.

That iterator does something special for each individual record. All
40,000 of them.

That add_breakpoint() does:

static int add_breakpoints(struct dyn_ftrace *rec, int enable)
{
	unsigned long ftrace_addr;
	int ret;

	ftrace_addr = ftrace_get_addr_curr(rec);

	ret = ftrace_test_record(rec, enable);

	switch (ret) {
	case FTRACE_UPDATE_IGNORE:
		return 0;

	case FTRACE_UPDATE_MAKE_CALL:
		/* converting nop to call */
		return add_brk_on_nop(rec);

	case FTRACE_UPDATE_MODIFY_CALL:
	case FTRACE_UPDATE_MAKE_NOP:
		/* converting a call to a nop */
		return add_brk_on_call(rec, ftrace_addr);
	}
	return 0;
}

And to get what the target is, we call ftrace_get_addr_curr(), which
will return a function based on the flags in the record. Which can be
anything from a call to a customized trampoline, to either
ftrace_caller, or to ftrace_regs_caller, or it can turn the record into
a nop.

This is what I'm talking about. We are adding thousands of int3s
through out the kernel, and we have a single handler to handle each one
of them.

The reason I picked ftrace_regs_caller() is because that one does
anything that any of the callers can do (albeit slower). If it does
not, then ftrace will be broken, because it handles the case that all
types of trampolines are attached to a single function, and that code
had better do the exact same thing for each of those trampolines as if
the trampolines were called directly, because the handlers that those
trampolines call, shouldn't care who else is using that function.

Note, the only exception to that rule, is that we only allow one
function attached to the function to modify the return address (and the
record has a flag for that). If a record already modifies the ip
address on return, the registering of another ftrace_ops that modifies
the ip address will fail to register.


> 
> Stop with the "there could be thousands of targets" arguyment. The
> "call" instruction THAT YOU ARE REWRITING has exactly one target.
> There aren't 40,000 of them. x86 does not have that kind of "call"
> instruction that randomly calls 40k different functions. You are
> replacing FIVE BYTES of memory, and the emulation you do should
> emulate those FIVE BYTES.
> 
> See?
> 
> Why are you emulating something different than what you are rewriting?

I'm not having one call site call 40,000 different functions. You are
right about that. But I have 40,000 different call sites that could be
calling different functions and all of them are being processed by a
single int3 handler.

That's my point.

-- Steve
