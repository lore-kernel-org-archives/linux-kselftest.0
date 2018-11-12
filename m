From: asarai at suse.de (Aleksa Sarai)
Date: Mon, 12 Nov 2018 21:38:22 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181111003137.c9df7a077d983cde57c06ee8@kernel.org>
References: <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
 <20181104115913.74l4yzecisvtt2j5@yavin>
 <20181106171501.59ccabbc@gandalf.local.home>
 <20181108074612.ldy6rozdpsdps6bf@yavin>
 <20181108080448.rggfn4zawi3por23@yavin>
 <20181109161551.6b96bd7d932c71432ac65e83@kernel.org>
 <20181109150629.wpedwxsgbftkl3ab@mikami>
 <20181111003137.c9df7a077d983cde57c06ee8@kernel.org>
Message-ID: <20181112103822.ktd4fx7o4cqpfk4q@mikami>

On 2018-11-11, Masami Hiramatsu <mhiramat at kernel.org> wrote:
> > > > +		addr = kretprobe_ret_addr(current, addr, stack_addr(regs));
> > > 
> > > But since kretprobe will be an event, which can kick the stackdump.
> > > BTW, from kretprobe, regs->ip should always be the trampoline handler, 
> > > see arch/x86/kernel/kprobes/core.c:772 :-)
> > > So it must be fixed always.
> > 
> > Right, but kretprobe_ret_addr() is returning the *original* return
> > address (and we need to do an (addr == kretprobe_trampoline)). The
> > real problem is that stack_addr(regs) isn't the same as it is during
> > kretprobe setup (but kretprobe_ret_addr() works everywhere else).
> 
> I think stack_addr(regs) should be same when this is called from kretprobe
> handler context. Otherwise, yes, it is not same, but in that case, regs->ip
> is not kretprobe_trampoline too.

I figured it out.

It should be (regs->sp - 1) (just like it is inside the relevant
unwinder function for ORC). I now have a prototype which works under the
frame unwinder[*] -- however under ORC you can only see the top-most
function (the unwinder doesn't see the other function calls). I'm
playing with ORC hints with kretprobe_trampoline to try to improve
things but it's still a bit screwy.


[*]: However, I've noticed that the stack traces between the two traces
	 no longer match. On kprobe you get function_name+1, but on
	 kretprobe you get function_caller+foo. Obviously it's working but
	 the return address results in slightly different stack traces. This
	 means that stack trace aggregation between kprobe and kretprobe
	 won't work anymore -- at least not like it did in my original
	 patch. So I'm really not sure where to go from here.

I can send around another patchset to illustrate the problem if you like
(as well as show how the current unwinding code works).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181112/562e3359/attachment.sig>
