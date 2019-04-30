From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 30 Apr 2019 17:08:08 -0400
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
Message-ID: <20190430170808.1053b3e2@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430210808.fpqIj3Tsd-Bjgbp8gtxUiwWKmTvxT0up80lzaK80LKs@z>

On Tue, 30 Apr 2019 11:33:21 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > +       "ftrace_emulate_call_update_irqoff:\n\t"
> > +               "push %gs:ftrace_bp_call_return\n\t"
> > +               "sti\n\t"
> > +               "jmp *ftrace_update_func_call\n"  
> 
> .. and this should then use the "push push sti ret" model instead.
> 
> Plus get updated for objtool complaints.

And unfortunately, this blows up on lockdep. Lockdep notices that the
return from the breakpoint handler has interrupts enabled, and will not
enable them in its shadow irqs disabled variable. But then we enabled
them in the trampoline, without telling lockdep and we trigger
something likes this:

------------[ cut here ]------------
IRQs not enabled as expected
WARNING: CPU: 2 PID: 0 at kernel/time/tick-sched.c:979 tick_nohz_idle_enter+0x44/0x8c
Modules linked in:
CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.1.0-rc3-test+ #123
Hardware name: MSI MS-7823/CSM-H87M-G43 (MS-7823), BIOS V1.6 02/22/2014
EIP: tick_nohz_idle_enter+0x44/0x8c
Code: f0 05 00 00 00 75 26 83 b8 c4 05 00 00 00 75 1d 80 3d 5f 0f 43 c1 00 75 14 68 72 74 16 c1 c6 05 5f 0f 43 c1 01 e8 33 d7 f8 ff <0f> 0b 58 fa e8 4e 2c 04 00 bb e0 36 6b c1 64 03 1d 28 81 56 c1 8b
EAX: 0000001c EBX: ee769f84 ECX: 00000000 EDX: 00000006
ESI: 00000000 EDI: 00000002 EBP: ee769f50 ESP: ee769f48
DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210292
CR0: 80050033 CR2: 00000000 CR3: 016c4000 CR4: 001406f0
Call Trace:
 do_idle+0x2a/0x1fc
 cpu_startup_entry+0x1e/0x20
 start_secondary+0x1d3/0x1ec
 startup_32_smp+0x164/0x168


I have to fool lockdep with the following:

		if (regs->flags & X86_EFLAGS_IF) {
			regs->flags &= ~X86_EFLAGS_IF;
			regs->ip = (unsigned long) ftrace_emulate_call_irqoff;
			/* Tell lockdep here we are enabling interrupts */
			trace_hardirqs_on();
		} else {
			regs->ip = (unsigned long) ftrace_emulate_call_irqon;
		}

-- Steve
