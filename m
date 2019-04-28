From: rostedt at goodmis.org (Steven Rostedt)
Date: Sun, 28 Apr 2019 15:43:45 -0400
Subject: [PATCH 1/4] x86/thread_info: introduce ->ftrace_int3_stack member
In-Reply-To: <D5735AF7-D603-4B20-A3EE-B519044D1E5D@amacapital.net>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-2-nstange@suse.de>
 <F6268634-96D3-4267-B739-6D375FAB26A8@amacapital.net>
 <20190428135143.09d35bb6@oasis.local.home>
 <D5735AF7-D603-4B20-A3EE-B519044D1E5D@amacapital.net>
Message-ID: <20190428154345.789635b3@oasis.local.home>

On Sun, 28 Apr 2019 11:08:34 -0700
Andy Lutomirski <luto at amacapital.net> wrote:

> > 
> > Perhaps adding another slot into pt_regs that gets used by int3 to
> > store a slot to emulate a call on return?
> > 
> >   
> 
> That’s not totally nuts, although finding pt_regs isn’t entirely trivial.

I meant on the int3 handler (which stores the pt_regs).

> 
> I still think I prefer an approach where we just emulate the call directly.

Then, on the return of int3, if there's anything in that slot, then we
could possibly shift the exception handler frame (that was added by the
hardware), insert the slot data into the top of the stack, and then
call iret (which the int3 handler, would add the return ip to be the
function being called), which would in essence emulate the call directly.

I believe the complexity comes from the exception frame added by the
hardware is where we need to put the return of the call for the
emulation.

-- Steve
