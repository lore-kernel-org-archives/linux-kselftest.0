From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Wed, 8 May 2019 06:57:59 -0500
Subject: [RFC][PATCH 4/4] x86_32: Provide consistent pt_regs
In-Reply-To: <20190508080612.832694080@infradead.org>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.832694080@infradead.org>
Message-ID: <20190508115759.yvxjgsqriez4z22l@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508115759.MxIblg_zVtszr30UfcR0LkpdITG7q3dc1ss_SXXLAcg@z>

On Wed, May 08, 2019@09:49:05AM +0200, Peter Zijlstra wrote:
> Currently pt_regs on x86_32 has an oddity in that kernel regs
> (!user_mode(regs)) are short two entries (esp/ss). This means that any
> code trying to use them (typically: regs->sp) needs to jump through
> some unfortunate hoops.
> 
> Change the entry code to fix this up and create a full pt_regs frame.
> 
> This then simplifies:
> 
>   - ftrace
>   - kprobes
>   - stack unwinder
>   - ptrace
>   - kdump
>   - kgdb
> 
> Hated-by: Linus Torvalds <torvalds at linux-foundation.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
> ---
>  arch/x86/entry/entry_32.S         |  105 ++++++++++++++++++++++++++++++++++----
>  arch/x86/include/asm/kexec.h      |   17 ------
>  arch/x86/include/asm/ptrace.h     |   17 ------
>  arch/x86/include/asm/stacktrace.h |    2 
>  arch/x86/kernel/crash.c           |    8 --
>  arch/x86/kernel/ftrace_32.S       |   81 ++++++++++++++++-------------
>  arch/x86/kernel/kgdb.c            |    8 --
>  arch/x86/kernel/kprobes/common.h  |    4 -
>  arch/x86/kernel/kprobes/core.c    |   29 ++++------
>  arch/x86/kernel/kprobes/opt.c     |   20 ++++---
>  arch/x86/kernel/process_32.c      |   16 +----
>  arch/x86/kernel/ptrace.c          |   29 ----------
>  arch/x86/kernel/time.c            |    3 -
>  arch/x86/kernel/unwind_frame.c    |   32 +----------
>  arch/x86/kernel/unwind_orc.c      |    2 
>  15 files changed, 181 insertions(+), 192 deletions(-)

Very nice diffstat.  This moves all the pain to the 32-bit entry code
where it belongs.

-- 
Josh
