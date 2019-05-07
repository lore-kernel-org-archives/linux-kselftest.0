From: luto@amacapital.net (Andy Lutomirski)
Date: Tue, 7 May 2019 07:48:45 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
Message-ID: <48BDF7B6-252B-4D29-9116-844363010BC0@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507144845.mT8LdZIGUwJ-lcpQxxNh6qB30Wp6JOyWBNb7UT_f29o@z>



>> On May 6, 2019,@7:22 PM, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> 
>> On Mon, May 6, 2019@6:53 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>> 
>> Also, I figured just calling ftrace_regs_caller() was simpler then
>> having that int3 handler do the hash look ups to determine what handler
>> it needs to call.
> 
> So what got me looking at this - and the races (that didn't turn out
> to be races) - and why I really hate it, is because of the whole
> notion of "atomic state".
> 
> Running an "int3" handler (when the int3 is in the kernel) is in some
> sense "atomic". There is the state in the caller, of course, and
> there's the state that the int3 handler has, but you can *mostly*
> think of the two as independent.
> 
> In particular, if the int3 handler doesn't ever enable interrupts, and
> if it doesn't need to do any stack switches, the int3 handler part
> looks "obvious". It can be interrupted by NMI, but it can't be
> interrupted (for example) by the cross-cpu IPI.
> 
> That was at least the mental model I was going for.
> 
> Similarly, the "caller" side mostly looks obvious too. If we don't
> take an int3, none of this matter, and if we *do* take an int3, if we
> can at least make it "atomic" wrt the rewriter (before or after
> state), it should be easy to think about.
> 
> One of the things I was thinking of doing, for example, was to simply
> make the call emulation do a "load four bytes from the instruction
> stream, and just use that as the emulation target offset".
> 
> Why would that matter?
> 
> We do *not* have very strict guarantees for D$-vs-I$ coherency on x86,
> but we *do* have very strict guarantees for D$-vs-D$ coherency. And so
> we could use the D$ coherency to give us atomicity guarantees for
> loading and storing the instruction offset for instruction emulation,
> in ways we can *not* use the D$-to-I$ guarantees and just executing it
> directly.
> 
> So while we still need those nasty IPI's to guarantee the D$-vs-I$
> coherency in the "big picture" model and to get the serialization with
> the actual 'int3' exception right, we *could* just do all the other
> parts of the instruction emulation using the D$ coherency.
> 
> So we could do the actual "call offset" write with a single atomic
> 4-byte locked cycle (just use "xchg" to write - it's always locked).
> And similarly we could do the call offset *read* with a single locked
> cycle (cmpxchg with a 0 value, for example). It would be atomic even
> if it crosses a cacheline boundary.

I don’t quite get how this could work.  Suppose we start with a five-byte NOP (0F 1F ...).  Then we change the first byte to INT3 (CC).  Now we can atomically change the other four bytes, but the INT3 could happen first. I suppose that we could treat 1F 00 00 00 or similar as a known-bogus call target, but that seems dangerous.

IOW I think your trick only works if the old and new states are CALL, but we don’t know that until we’ve looked up the record, at which point we can just use the result of the lookup.

An I missing something clever?  IMO it’s a bummer that there isn’t a way to turn NOP into CALL by changing only one byte.
