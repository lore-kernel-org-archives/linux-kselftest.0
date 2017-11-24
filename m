From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Fri, 24 Nov 2017 13:55:47 +0000 (UTC)
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 v3 15/22] rseq:
 selftests: Provide self-tests
In-Reply-To: <20171123085511.ohwuobf5v32vggho@hirez.programming.kicks-ass.net>
References: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
 <20171121141900.18471-16-mathieu.desnoyers@efficios.com>
 <20171123085511.ohwuobf5v32vggho@hirez.programming.kicks-ass.net>
Message-ID: <1080135963.21671.1511531747949.JavaMail.zimbra@efficios.com>

----- On Nov 23, 2017, at 3:55 AM, Peter Zijlstra peterz at infradead.org wrote:

> On Tue, Nov 21, 2017 at 09:18:53AM -0500, Mathieu Desnoyers wrote:
>> +int percpu_list_push(struct percpu_list *list, struct percpu_list_node *node)
>> +{
>> +	intptr_t *targetptr, newval, expect;
>> +	int cpu, ret;
>> +
>> +	/* Try fast path. */
>> +	cpu = rseq_cpu_start();
> 
>> +	/* Load list->c[cpu].head with single-copy atomicity. */
>> +	expect = (intptr_t)READ_ONCE(list->c[cpu].head);
>> +	newval = (intptr_t)node;
>> +	targetptr = (intptr_t *)&list->c[cpu].head;
>> +	node->next = (struct percpu_list_node *)expect;
> 
>> +	ret = rseq_cmpeqv_storev(targetptr, expect, newval, cpu);
> 
>> +	if (likely(!ret))
>> +		return cpu;
> 
>> +	return cpu;
>> +}
> 
>> +static inline __attribute__((always_inline))
>> +int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv,
>> +		int cpu)
>> +{
>> +	__asm__ __volatile__ goto (
>> +		RSEQ_ASM_DEFINE_TABLE(3, __rseq_table, 0x0, 0x0, 1f, 2f-1f, 4f)
>> +		RSEQ_ASM_STORE_RSEQ_CS(1, 3b, rseq_cs)
> 
>> +		RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> 
> So the actual C part of the RSEQ is subject to an ABA, right? We can get
> migrated to another CPU and back again without then failing here.

Yes, that's correct. All algorithms preparing something in C and
then using a compare-and-other-stuff sequence need to ensure they
do not have ABA situations. For instance, a list push does not care
if the list head is reclaimed and re-inserted concurrently, because
none of the preparation steps in C involve the head next pointer.

> 
> It used to be that this was caught by the sequence count, but that is
> now gone.

The sequence count introduced other weirdness: although it would catch
those migration cases, it is a sequence read-lock, which means
the C code "protected" by this sequence read-lock needed to be
extremely careful about not accessing reclaimed memory.
The sequence lock ensures consistency of the data when they comparison
matches, but it does not protect against other side-effects.

So removing this sequence lock is actually a good thing: it removes
any expectation that users may have about that sequence counter being
anything stronger than a read seqlock.

> 
> The thing that makes it work is the compare against @v:
> 
>> +		"cmpq %[v], %[expect]\n\t"
>> +		"jnz 5f\n\t"
> 
> That then ensures things are still as we observed them before (although
> this itself is also subject to ABA).

Yes.

> 
> This means all RSEQ primitives that have a C part must have a cmp-and-
> form, but I suppose that was already pretty much the case anyway. I just
> don't remember seeing that spelled out anywhere. Then again, I've not
> yet read that manpage.

Yes, pretty much. The only primitives that don't have the compare are
things like "rseq_addv()", which does not have much in the C part
(it's just incrementing a counter).

I did not state anything like "typical rseq c.s. do a compare and other stuff"
in rseq(2), given that the role of this man page, AFAIU, is to explain
how to interact with the kernel system call, and not really a document
about user-space implementation guide lines.

But let me know if I should expand it with a user-space sequence implementation
guide lines, which would include notes about being careful about ABA. I'm
not sure it belongs there though.

Thanks!

Mathieu

> 
>> +		/* final store */
>> +		"movq %[newv], %[v]\n\t"
>> +		"2:\n\t"
>> +		RSEQ_ASM_DEFINE_ABORT(4, __rseq_failure, RSEQ_SIG, "", abort)
>> +		RSEQ_ASM_DEFINE_CMPFAIL(5, __rseq_failure, "", cmpfail)
>> +		: /* gcc asm goto does not allow outputs */
>> +		: [cpu_id]"r"(cpu),
>> +		  [current_cpu_id]"m"(__rseq_abi.cpu_id),
>> +		  [rseq_cs]"m"(__rseq_abi.rseq_cs),
>> +		  [v]"m"(*v),
>> +		  [expect]"r"(expect),
>> +		  [newv]"r"(newv)
>> +		: "memory", "cc", "rax"
>> +		: abort, cmpfail
>> +	);
>> +	return 0;
>> +abort:
>> +	return -1;
>> +cmpfail:
>> +	return 1;
> > +}

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
