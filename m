From: asarai@suse.de (Aleksa Sarai)
Date: Sat, 10 Nov 2018 02:06:29 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181109161551.6b96bd7d932c71432ac65e83@kernel.org>
References: <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
 <20181104115913.74l4yzecisvtt2j5@yavin>
 <20181106171501.59ccabbc@gandalf.local.home>
 <20181108074612.ldy6rozdpsdps6bf@yavin>
 <20181108080448.rggfn4zawi3por23@yavin>
 <20181109161551.6b96bd7d932c71432ac65e83@kernel.org>
Message-ID: <20181109150629.wpedwxsgbftkl3ab@mikami>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109150629.qR9qkc2S4pXTIog3H20QI8WOjM5w9VPZcLuyx2PXYJU@z>

On 2018-11-09, Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
> > index ee696efec99f..c4dfafd43e11 100644
> > --- a/arch/x86/include/asm/ptrace.h
> > +++ b/arch/x86/include/asm/ptrace.h
> > @@ -172,6 +172,7 @@ static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
> >  	return regs->sp;
> >  }
> >  #endif
> > +#define stack_addr(regs) ((unsigned long *) kernel_stack_pointer(regs))
> 
> No, you should use kernel_stack_pointer(regs) itself instead of stack_addr().
> 
> > 
> >  #define GET_IP(regs) ((regs)->ip)
> >  #define GET_FP(regs) ((regs)->bp)
> > diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
> > index b0d1e81c96bb..eb4da885020c 100644
> > --- a/arch/x86/kernel/kprobes/core.c
> > +++ b/arch/x86/kernel/kprobes/core.c
> > @@ -69,8 +69,6 @@
> >  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> >  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> >  
> > -#define stack_addr(regs) ((unsigned long *)kernel_stack_pointer(regs))
> 
> I don't like keeping this meaningless macro... this should be replaced with generic
> kernel_stack_pointer() macro.

Sure. This patch was just an example -- I can remove stack_addr() all
over.

> > -	if (regs)
> > -		save_stack_address(trace, regs->ip, nosched);
> > +	if (regs) {
> > +		/* XXX: Currently broken -- stack_addr(regs) doesn't match entry. */
> > +		addr = regs->ip;
> 
> Since this part is for storing regs->ip as a top of call-stack, this
> seems correct code. Stack unwind will be done next block.

This comment was referring to the usage of stack_addr(). stack_addr()
doesn't give you the right result (it isn't the address of the return
address -- it's slightly wrong). This is the main issue I was having --
am I doing something wrong here?

> > +		//addr = ftrace_graph_ret_addr(current, &state.graph_idx, addr, stack_addr(regs));
> 
> so func graph return trampoline address will be shown only when unwinding stack entries.
> I mean func-graph tracer is not used as an event, so it never kicks stackdump.

Just to make sure I understand what you're saying -- func-graph trace
will never actually call __ftrace_stack_trace? Because if it does, then
this code will be necessary (and then I'm a bit confused why the
unwinder has func-graph trace code -- if stack traces are never taken
under func-graph then the code in the unwinder is not necessary)

My reason for commenting this out is because at this point "state" isn't
initialised and thus .graph_idx would not be correctly handled during
unwind (and it's the same reason I commented it out later).

> > +		addr = kretprobe_ret_addr(current, addr, stack_addr(regs));
> 
> But since kretprobe will be an event, which can kick the stackdump.
> BTW, from kretprobe, regs->ip should always be the trampoline handler, 
> see arch/x86/kernel/kprobes/core.c:772 :-)
> So it must be fixed always.

Right, but kretprobe_ret_addr() is returning the *original* return
address (and we need to do an (addr == kretprobe_trampoline)). The
real problem is that stack_addr(regs) isn't the same as it is during
kretprobe setup (but kretprobe_ret_addr() works everywhere else).

> > @@ -1856,6 +1870,41 @@ static int pre_handler_kretprobe(struct kprobe *p, struct pt_regs *regs)
> >  }
> >  NOKPROBE_SYMBOL(pre_handler_kretprobe);
> >  
> > +unsigned long kretprobe_ret_addr(struct task_struct *tsk, unsigned long ret,
> > +				 unsigned long *retp)
> > +{
> > +	struct kretprobe_instance *ri;
> > +	unsigned long flags = 0;
> > +	struct hlist_head *head;
> > +	bool need_lock;
> > +
> > +	if (likely(ret != (unsigned long) &kretprobe_trampoline))
> > +		return ret;
> > +
> > +	need_lock = !kretprobe_hash_is_locked(tsk);
> > +	if (WARN_ON(need_lock))
> > +		kretprobe_hash_lock(tsk, &head, &flags);
> > +	else
> > +		head = kretprobe_inst_table_head(tsk);
> 
> This may not work unless this is called from the kretprobe handler context,
> since if we are out of kretprobe handler context, another CPU can lock the
> hash table and it can be detected by kretprobe_hash_is_locked();.

Yeah, I noticed this as well when writing it (but needed a quick impl
that I could test). I will fix this, thanks!

By is_kretprobe_handler_context() I imagine you are referring to
checking is_kretprobe(current_kprobe())?

> So, we should check we are in the kretprobe handler context if tsk == current,
> if not, we definately can lock the hash lock without any warning. This can
> be something like;
> 
> if (is_kretprobe_handler_context()) {
>   // kretprobe_hash_lock(current == tsk) has been locked by caller  
>   if (tsk != current && kretprobe_hash(tsk) != kretprobe_hash(current))
>     // the hash of tsk and current can be same.
>     need_lock = true;
> } else
>   // we should take a lock for tsk.
>   need_lock = true;

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181110/c126e648/attachment.sig>
