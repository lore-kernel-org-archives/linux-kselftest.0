From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 30 Apr 2019 13:18:46 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjAQaowLHBrXs1M5K-Nr-eVQMt0K8oyCuWxKTvP9k=qqA@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wjAQaowLHBrXs1M5K-Nr-eVQMt0K8oyCuWxKTvP9k=qqA@mail.gmail.com>
Message-ID: <20190430111846.GS2623@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430111846.k6T61TakyZD2-ZdzV0o9-jU8O7gSZjv-AMPUgi5o8kE@z>

On Mon, Apr 29, 2019@03:06:30PM -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2019@11:57 AM Andy Lutomirski <luto@kernel.org> wrote:
> > >
> > > Otherwise you could never trust the whole sti shadow thing - and it very much is part of the architecture.
> >
> > Is this documented somewhere?
> 
> Btw, if you really don't trust the sti shadow despite it going all the
> way back to the 8086, then you could instead make the irqoff code do
> 
>         push %gs:bp_call_return
>         push %gs:bp_call_target
>         sti
>         ret

This variant cures the RETPOLINE complaint; due to there not actually
being an indirect jump anymore. And it cures the sibling call complaint,
but trades it for "return with modified stack frame".

Something like so is clean:

+extern asmlinkage void emulate_call_irqon(void);
+extern asmlinkage void emulate_call_irqoff(void);
+
+asm(
+	".text\n"
+	".global emulate_call_irqoff\n"
+	".type emulate_call_irqoff, @function\n"
+	"emulate_call_irqoff:\n\t"
+		"push %gs:bp_call_return\n\t"
+		"push %gs:bp_call_target\n\t"
+		"sti\n\t"
+		"ret\n"
+	".size emulate_call_irqoff, .-emulate_call_irqoff\n"
+
+	".global emulate_call_irqon\n"
+	".type emulate_call_irqon, @function\n"
+	"emulate_call_irqon:\n\t"
+		"push %gs:bp_call_return\n\t"
+		"push %gs:bp_call_target\n\t"
+		"ret\n"
+	".size emulate_call_irqon, .-emulate_call_irqon\n"
+	".previous\n");
+
+STACK_FRAME_NON_STANDARD(emulate_call_irqoff);
+STACK_FRAME_NON_STANDARD(emulate_call_irqon);
