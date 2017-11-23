From: peterz at infradead.org (Peter Zijlstra)
Date: Thu, 23 Nov 2017 09:57:21 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 v3 15/22] rseq:
	selftests: Provide self-tests
In-Reply-To: <20171123085511.ohwuobf5v32vggho@hirez.programming.kicks-ass.net>
References: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
 <20171121141900.18471-16-mathieu.desnoyers@efficios.com>
 <20171123085511.ohwuobf5v32vggho@hirez.programming.kicks-ass.net>
Message-ID: <20171123085721.bzburngdsatgewjo@hirez.programming.kicks-ass.net>

On Thu, Nov 23, 2017 at 09:55:11AM +0100, Peter Zijlstra wrote:
> On Tue, Nov 21, 2017 at 09:18:53AM -0500, Mathieu Desnoyers wrote:
> > +static inline __attribute__((always_inline))
> > +int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv,
> > +		int cpu)
> > +{
> > +	__asm__ __volatile__ goto (
> > +		RSEQ_ASM_DEFINE_TABLE(3, __rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
> > +		RSEQ_ASM_STORE_RSEQ_CS(1, 3b, rseq_cs)
> 
> > +		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)

> > +		"cmpq %[v], %[expect]\n\t"
> > +		"jnz 5f\n\t"

Also, I'm confused between the abort and cmpfail cases.

In would expect the cpu_id compare to also result in cmpfail, that is, I
would only expect the kernel to result in abort.

> > +		/* final store */
> > +		"movq %[newv], %[v]\n\t"
> > +		"2:\n\t"
> > +		RSEQ_ASM_DEFINE_ABORT(4, __rseq_failure, RSEQ_SIG, "", abort)
> > +		RSEQ_ASM_DEFINE_CMPFAIL(5, __rseq_failure, "", cmpfail)
> > +		: /* gcc asm goto does not allow outputs */
> > +		: [cpu_id]"r"(cpu),
> > +		  [current_cpu_id]"m"(__rseq_abi.cpu_id),
> > +		  [rseq_cs]"m"(__rseq_abi.rseq_cs),
> > +		  [v]"m"(*v),
> > +		  [expect]"r"(expect),
> > +		  [newv]"r"(newv)
> > +		: "memory", "cc", "rax"
> > +		: abort, cmpfail
> > +	);
> > +	return 0;
> > +abort:
> > +	return -1;

Which then would suggest this be -EINTR or something like that.

> > +cmpfail:
> > +	return 1;
> > +}
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
