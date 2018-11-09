From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 9 Nov 2018 16:26:32 +0900
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181108144437.l3proaovfqm5osnr@treble>
References: <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
 <20181104115913.74l4yzecisvtt2j5@yavin>
 <20181106171501.59ccabbc@gandalf.local.home>
 <20181108074612.ldy6rozdpsdps6bf@yavin>
 <20181108080448.rggfn4zawi3por23@yavin>
 <20181108144437.l3proaovfqm5osnr@treble>
Message-ID: <20181109162632.9a3694eea8ac8056302a8262@kernel.org>

On Thu, 8 Nov 2018 08:44:37 -0600
Josh Poimboeuf <jpoimboe at redhat.com> wrote:

> On Thu, Nov 08, 2018 at 07:04:48PM +1100, Aleksa Sarai wrote:
> > On 2018-11-08, Aleksa Sarai <cyphar at cyphar.com> wrote:
> > > I will attach what I have at the moment to hopefully explain what the
> > > issue I've found is (re-using the kretprobe architecture but with the
> > > shadow-stack idea).
> > 
> > Here is the patch I have at the moment (it works, except for the
> > question I have about how to handle the top-level pt_regs -- I've marked
> > that code with XXX).
> > 
> > -- 
> > Aleksa Sarai
> > Senior Software Engineer (Containers)
> > SUSE Linux GmbH
> > <https://www.cyphar.com/>
> > 
> > --8<---------------------------------------------------------------------
> > 
> > Since the return address is modified by kretprobe, the various unwinders
> > can produce invalid and confusing stack traces. ftrace mostly solved
> > this problem by teaching each unwinder how to find the original return
> > address for stack trace purposes. This same technique can be applied to
> > kretprobes by simply adding a pointer to where the return address was
> > replaced in the stack, and then looking up the relevant
> > kretprobe_instance when a stack trace is requested.
> > 
> > [WIP: This is currently broken because the *first entry* will not be
> >       overwritten since it looks like the stack pointer is different
> >       when we are provided pt_regs. All other addresses are correctly
> >       handled.]
> 
> When you see this problem, what does regs->ip point to?  If it's
> pointing to generated code, then we don't _currently_ have a way of
> dealing with that.  If it's pointing to a real function, we can fix that
> with unwind hints.

As I replied, If the stackdump is called from kretprobe event, regs->ip
always points trampoline function. Otherwise (maybe from kprobe event,
or panic, BUG etc.) it always be the address which the event occurs.

So fixing regs->ip is correct.

Thank you,


-- 
Masami Hiramatsu <mhiramat at kernel.org>
