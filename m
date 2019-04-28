From: luto@amacapital.net (Andy Lutomirski)
Date: Sun, 28 Apr 2019 13:56:31 -0700
Subject: [PATCH 1/4] x86/thread_info: introduce ->ftrace_int3_stack member
In-Reply-To: <20190428154345.789635b3@oasis.local.home>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-2-nstange@suse.de>
 <F6268634-96D3-4267-B739-6D375FAB26A8@amacapital.net>
 <20190428135143.09d35bb6@oasis.local.home>
 <D5735AF7-D603-4B20-A3EE-B519044D1E5D@amacapital.net>
 <20190428154345.789635b3@oasis.local.home>
Message-ID: <249CA966-9EFF-4687-8BC9-9364EDD51388@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190428205631.exbjYISA6LPvLiUcpaYEVzTAW-SvipSEzNVcnz6v8Ho@z>


> On Apr 28, 2019,@12:43 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> On Sun, 28 Apr 2019 11:08:34 -0700
> Andy Lutomirski <luto@amacapital.net> wrote:
> 
>>> 
>>> Perhaps adding another slot into pt_regs that gets used by int3 to
>>> store a slot to emulate a call on return?
>>> 
>>> 
>> 
>> That’s not totally nuts, although finding pt_regs isn’t entirely trivial.
> 
> I meant on the int3 handler (which stores the pt_regs).

But that’s below the stub’s RSP, so it’s toast if another interrupt happens. Or am I misunderstanding you?

> 
>> 
>> I still think I prefer an approach where we just emulate the call directly.
> 
> Then, on the return of int3, if there's anything in that slot, then we
> could possibly shift the exception handler frame (that was added by the
> hardware), insert the slot data into the top of the stack, and then
> call iret (which the int3 handler, would add the return ip to be the
> function being called), which would in essence emulate the call directly.

Oh, I get it.

I liked Josh’s old proposal of unconditionally shifting the #BP frame 8 bytes better. It will be interesting when kernel shadow stacks are thrown in the mix, but that’s a problem for another day.
