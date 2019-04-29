From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 11:06:58 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190428133826.3e142cfd@oasis.local.home>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
Message-ID:
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429180658.dw3nLP9gUf7oMDUmC5YsyXGeivFcLp_nH94IhtO10RE@z>

On Sun, Apr 28, 2019@10:38 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> For optimization reasons, if there's only a single user of a function
> it gets its own trampoline that sets up the call to its callback and
> calls that callback directly:

So this is the same issue as the static calls, and it has exactly the
same solution.

Which I already outlined once, and nobody wrote the code for.

So here's a COMPLETELY UNTESTED patch that only works (_if_ it works) for

 (a) 64-bit

 (b) SMP

but that's just because I've hardcoded the percpu segment handling.

It does *not* emulate the "call" in the BP handler itself, instead if
replace the %ip (the same way all the other BP handlers replace the
%ip) with a code sequence that just does

        push %gs:bp_call_return
        jmp *%gs:bp_call_target

after having filled in those per-cpu things.

The reason they are percpu is that after the %ip has been changed, the
target CPU goes its merry way, and doesn't wait for the text--poke
semaphore serialization. But since we have interrupts disabled on that
CPU, we know that *another* text poke won't be coming around and
changing the values.

THIS IS ENTIRELY UNTESTED! I've built it, and it at least seems to
build, although with warnings

  arch/x86/kernel/alternative.o: warning: objtool:
emulate_call_irqoff()+0x9: indirect jump found in RETPOLINE build
  arch/x86/kernel/alternative.o: warning: objtool:
emulate_call_irqon()+0x8: indirect jump found in RETPOLINE build
  arch/x86/kernel/alternative.o: warning: objtool:
emulate_call_irqoff()+0x9: sibling call from callable instruction with
modified stack frame
  arch/x86/kernel/alternative.o: warning: objtool:
emulate_call_irqon()+0x8: sibling call from callable instruction with
modified stack frame

that will need the appropriate "ignore this case" annotations that I didn't do.

Do I expect it to work? No. I'm sure there's some silly mistake here,
but the point of the patch is to show it as an example, so that it can
actually be tested.

With this, it should be possible (under the text rewriting lock) to do

        replace_call(callsite, newcallopcode, callsize, calltargettarget);

to do the static rewriting of the call at "callsite" to have the new
call target.

And again. Untested. But doesn't need any special code in the entry
path, and the concept is simple even if there are probably stupid bugs
just because it's entirely untested.

Oh, and did I mention that I didn't test this?

                Linus
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch.diff
Type: text/x-patch
Size: 2788 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190429/91bbc8fc/attachment.bin>
