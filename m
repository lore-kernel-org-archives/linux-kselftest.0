From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 3 May 2019 14:46:33 -0400
Subject: [RFC][PATCH 1.5/2] x86: Add int3_emulate_call() selftest
In-Reply-To: <20190503102247.GC2623@hirez.programming.kicks-ass.net>
References: <20190501202830.347656894@goodmis.org>
 <20190503102247.GC2623@hirez.programming.kicks-ass.net>
Message-ID: <20190503144633.750ca9a5@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503184633.WRRmOHJka2Rjex5Asth8nJFEnDkfKRarnmB6CRqsvEg@z>

On Fri, 3 May 2019 12:22:47 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Given that the entry_*.S changes for this functionality are somewhat
> tricky, make sure the paths are tested every boot, instead of on the
> rare occasion when we trip an INT3 while rewriting text.
> 
> Getting the INT3 frame setup even slightly wrong will make this come
> unstuck something spectacular.
> 
> Requested-by: Andy Lutomirski <luto at kernel.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
> ---
>  arch/x86/kernel/alternative.c | 81 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 4 deletions(-)

I'll add this to my queue, as I tested this on x86_32 and 64. I also
put in a printk("HERE in int3_magic\n") to make sure it really did get
there (although, the BUG_ON should be good enough).

The printk will be removed from the official commit. It was just for my
peace of mind.

-- Steve
