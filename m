From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 21:34:20 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506210416.2489a659@oasis.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <20190506210416.2489a659@oasis.local.home>
Message-ID: <20190506213420.62357f23@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507013420.G8zPMo6D-r9NvEILHTe4tHdL0E_lB4tUddk2MHGM414@z>

On Mon, 6 May 2019 21:04:16 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> static int add_breakpoints(struct dyn_ftrace *rec, int enable)
> {
> 	unsigned long ftrace_addr;
> 	int ret;
> 
> 	ftrace_addr = ftrace_get_addr_curr(rec);
> 
> 	ret = ftrace_test_record(rec, enable);
> 
> 	switch (ret) {
> 	case FTRACE_UPDATE_IGNORE:
> 		return 0;
> 
> 	case FTRACE_UPDATE_MAKE_CALL:
> 		/* converting nop to call */
> 		return add_brk_on_nop(rec);
> 
> 	case FTRACE_UPDATE_MODIFY_CALL:

The FTRACE_UPDATE_MODIFY_CALL is the case where we switch from calling
one trampoline to calling another. As you can plainly see from this
switch statement, we treat it the same as converting to a nop. That's
the bug we are trying to fix. It shouldn't be treated as a nop. It
should be treated as a call to the old or new function. Either is fine,
but it must be one or the other, not a nop.

-- Steve


> 	case FTRACE_UPDATE_MAKE_NOP:
> 		/* converting a call to a nop */
> 		return add_brk_on_call(rec, ftrace_addr);
> 	}
> 	return 0;
> }
