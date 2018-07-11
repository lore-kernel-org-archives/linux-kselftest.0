From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 10 Jul 2018 22:26:52 -0700
Subject: [PATCH v9 6/7] lib: Add module to simulate atomic sections for
 testing preemptoff tracers
In-Reply-To: <20180710204707.2fbaef87@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-7-joel@joelfernandes.org>
 <20180710204707.2fbaef87@gandalf.local.home>
Message-ID: <20180711052652.GA11372@joelaf.mtv.corp.google.com>

On Tue, Jul 10, 2018 at 08:47:07PM -0400, Steven Rostedt wrote:
> On Thu, 28 Jun 2018 11:21:48 -0700
> Joel Fernandes <joel at joelfernandes.org> wrote:
> 
> > From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> > 
> > In this patch we introduce a test module for simulating a long atomic
> > section in the kernel which the preemptoff or irqsoff tracers can
> > detect. This module is to be used only for test purposes and is default
> > disabled.
> > 
> > Following is the expected output (only briefly shown) that can be parsed
> > to verify that the tracers are working correctly. We will use this from
> > the kselftests in future patches.
> > 
> > For the preemptoff tracer:
> > 
> > echo preemptoff > /d/tracing/current_tracer
> > sleep 1
> > insmod ./test_atomic_sections.ko atomic_mode=preempt atomic_time=500000
> > sleep 1
> > bash-4.3# cat /d/tracing/trace
> > preempt -1066    2...2    0us@: atomic_sect_run <-atomic_sect_run
> > preempt -1066    2...2 500002us : atomic_sect_run <-atomic_sect_run
> > preempt -1066    2...2 500004us : tracer_preempt_on <-atomic_sect_run
> > preempt -1066    2...2 500012us : <stack trace>
> >  => kthread
> >  => ret_from_fork  
> > 
> > For the irqsoff tracer:
> > 
> > echo irqsoff > /d/tracing/current_tracer
> > sleep 1
> > insmod ./test_atomic_sections.ko atomic_mode=irq atomic_time=500000
> > sleep 1
> > bash-4.3# cat /d/tracing/trace
> > irq dis -1069    1d..1    0us@: atomic_sect_run
> > irq dis -1069    1d..1 500001us : atomic_sect_run
> > irq dis -1069    1d..1 500002us : tracer_hardirqs_on <-atomic_sect_run
> > irq dis -1069    1d..1 500005us : <stack trace>
> >  => ret_from_fork  
> > 
> > Co-developed-by: Erick Reyes <erickreyes at google.com>
> > Cc: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > ---
> >  lib/Kconfig.debug          |  8 ++++
> >  lib/Makefile               |  1 +
> >  lib/test_atomic_sections.c | 77 ++++++++++++++++++++++++++++++++++++++
> 
> I think this code should reside in kernel/trace directory. I already
> have modules there. See the ring_buffer_benchmark code and the test
> module for mmio tracer.

Ok, I'll move it to there.

> >  3 files changed, 86 insertions(+)
> >  create mode 100644 lib/test_atomic_sections.c
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 8838d1158d19..622c90e1e066 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1956,6 +1956,14 @@ config TEST_KMOD
> >  
> >  	  If unsure, say N.
> >  
> > +config TEST_ATOMIC_SECTIONS
> > +	tristate "Simulate atomic sections for tracers to detect"
> 
> Hmm, I don't like this title. It's not very obvious to what it is
> about. What about "Preempt / IRQ disable delay thread to test latency
> tracers" ? Or something along those lines.

Sure, I'll change it to that. I agree its better. I'll change the text to
that and call the config TEST_PREEMPT_IRQ_DISABLE_DELAY.

> > +	depends on m
> > +	help
> > +	  Select this option to build a test module that can help test atomic
> > +	  sections by simulating them with a duration supplied as a module
> > +	  parameter. Preempt disable and irq disable modes can be requested.
> 
> "If unsure say N"

Sure, sounds good.

> > +
> >  config TEST_DEBUG_VIRTUAL
> >  	tristate "Test CONFIG_DEBUG_VIRTUAL feature"
> >  	depends on DEBUG_VIRTUAL
> > diff --git a/lib/Makefile b/lib/Makefile
> > index 90dc5520b784..7831e747bf72 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -44,6 +44,7 @@ obj-y += string_helpers.o
> >  obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
> >  obj-y += hexdump.o
> >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > +obj-$(CONFIG_TEST_ATOMIC_SECTIONS) += test_atomic_sections.o
> >  obj-y += kstrtox.o
> >  obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
> >  obj-$(CONFIG_TEST_BPF) += test_bpf.o
> > diff --git a/lib/test_atomic_sections.c b/lib/test_atomic_sections.c
> > new file mode 100644
> > index 000000000000..1eef518f0974
> > --- /dev/null
> > +++ b/lib/test_atomic_sections.c
> > @@ -0,0 +1,77 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Atomic section emulation test module
> > + *
> > + * Emulates atomic sections by disabling IRQs or preemption
> > + * and doing a busy wait for a specified amount of time.
> > + * This can be used for testing of different atomic section
> > + * tracers such as irqsoff tracers.
> > + *
> > + * (c) 2018. Google LLC
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kthread.h>
> > +#include <linux/ktime.h>
> > +#include <linux/module.h>
> > +#include <linux/printk.h>
> > +#include <linux/string.h>
> > +
> > +static ulong atomic_time = 100;
> > +static char atomic_mode[10] = "irq";
> > +
> > +module_param_named(atomic_time, atomic_time, ulong, S_IRUGO);
> > +module_param_string(atomic_mode, atomic_mode, 10, S_IRUGO);
> > +MODULE_PARM_DESC(atomic_time, "Period in microseconds (100 uS default)");
> 
> It's not a "Period", it's a delay. "Length of time in critical section"

Sure.

> > +MODULE_PARM_DESC(atomic_mode, "Mode of the test such as preempt or irq (default irq)");
> 
>   "Mode of the test: preempt or irq disabled (default irq)"

Ok.

> > +
> > +static void busy_wait(ulong time)
> > +{
> > +	ktime_t start, end;
> > +	start = ktime_get();
> > +	do {
> > +		end = ktime_get();
> > +		if (kthread_should_stop())
> > +			break;
> > +	} while (ktime_to_ns(ktime_sub(end, start)) < (time * 1000));
> > +}
> > +
> > +int atomic_sect_run(void *data)
> > +{
> > +	unsigned long flags;
> > +
> > +	if (!strcmp(atomic_mode, "irq")) {
> > +		local_irq_save(flags);
> > +		busy_wait(atomic_time);
> > +		local_irq_restore(flags);
> > +	} else if (!strcmp(atomic_mode, "preempt")) {
> > +		preempt_disable();
> > +		busy_wait(atomic_time);
> > +		preempt_enable();
> > +	}
> 
> So this is a one shot deal? That should be explained somewhere,
> probably in the config help message. In fact, I think the config help
> message should show how to use this.

Sounds good, I'll clarify it better. Thanks!

- Joel

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
