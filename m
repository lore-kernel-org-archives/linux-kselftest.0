Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA3744238D;
	Fri,  4 Sep 2026 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514966; cv=none; b=d38D9WXFEgNJY608FHdwAFgaYgSQ9FxdHEUsb/x5G6wOXDlXjykdasXGf/+pN6zhQv/zqC4ygdvhHve6V3vyrzxX6J8MiVBRevPtoEQhTLigW4rApLlYAPPFIQ1qvR3rUp8P1fLKEOicjUFoUCx9NZp1+eo0TF7OJBhgAflenDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514966; c=relaxed/simple;
	bh=r78UmUK6nBvOP+xjg3mpTqMjUF+BeTK6vm22T6YJHoA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qYEpaqUax1OkPGuNVQPblyyiTskPf1xkYSMcdn7l5DRsWl4jDu7JRzqofgbxZgcOYa0NWqFCJT4BiLCpBShKqRCl7s5GaKVWEWboFEWjKjuByACUrRz2uUzI917RzzVDtMBdBs/GhC+7493FtQ5MEevby3VMmExEUTQJhWneHPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghclDamp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghclDamp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0631F00A3E;
	Fri,  4 Sep 2026 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514964;
	bh=EaueYWLj5JrUyJ9+afLmjlV+I4hZt/mJxytsOnhmpxM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ghclDampDcKhqmtNS5mfU33PPV4e6JWxm+lJd/SBr01LlFpP6jbAPvBBFzrg/mX3E
	 WWCcwsncQha1Bbh7u390Ebt30txkQkiRBh1T5WEHuPtSFNdyRILucf2VRoMvePhfu0
	 QQx/x+TX+ELG9opxv0m5YNAdyclUXYiZwyWZy+CakCeLOB6DFkwhnIAtwND3UWve2h
	 vzSvPqBb/pzl2DbsUagEC0CnT5dfE4gauK1womHDLL2O9iPtvR9bULUJdtmETJchBd
	 zJmLKYwRDJqsXimJopq1+S2g3KjFYZF2T1tknqp+2v50dbvavjcAk9M/wBpthXNwQ0
	 t5gXuA1Upx5PQ==
Subject: Re: [PATCH net v3 3/9] net/sched: sfq: clamp quantum in change path
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:43 +0000
Message-ID: <178851496374.4131868.18330067911540291337@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.4>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.4>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 2 · Low: 0 (1)

- [High] Incomplete fix: raising the quantum floor to 256 in sfq_change()
  does not bound the deficit-refill loop in sfq_dequeue()…
- [Medium] The reproducer in the commit message cannot reach
  sfq_change().
- [Medium] The commit message's justification contradicts the tree the
  patch is applied to.

Pre-existing issues:
- [Low] Code/comment mismatch: struct sfq_sched_data documents `unsigned
  int quantum; /* Allotment per round: MUST BE >= MTU */`…

--

net/sched: sfq: clamp quantum in change path

This adds two new checks to sfq_change(): quantum values above 1<<20 are
rejected with -EINVAL, and accepted quantum values are raised to a floor
of 256 bytes.  The stated goal is to stop the deficit-refill loop in
sfq_dequeue() from spinning for a very long time under the qdisc lock.

A few questions on the changelog and on how much of the loop is actually
bounded afterwards.

>     sfq_change() accepts any non-negative quantum (only rejects
>     (int)ctl->quantum < 0). With a crafted size table qdisc_pkt_len reaches
>     ~2 GiB, so quantum=1 makes the deficit-refill loop spin ~2^31 times
>     under the qdisc lock (a soft lockup / denial of service).

[Severity: Medium]
Is the "~2 GiB" figure still accurate for this tree?  The tail of
__qdisc_calculate_pkt_len() in net/sched/sch_api.c already ends with:

	/* A size table can inflate qdisc_pkt_len() beyond any real packet
	 * (via overhead, the data table, or size_log); cap it so deficit
	 * schedulers such as DRR/ETS terminate their refill loops.
	 */
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);

with QDISC_PKT_LEN_MAX defined as (1 << 20) in include/net/pkt_sched.h.
git blame puts that clamp at commit 8f735d64382dcf, which is already in
the baseline this patch applies to, so qdisc_pkt_len() appears to top out
at 1 MiB rather than ~2 GiB, making the "~2^31 times" number roughly
2048x too large.

Given the Fixes: tag will drive stable triage, would it be worth saying
that the generic pkt_len clamp already bounds the loop in current trees,
and that the 2^31 figure only applies to kernels predating that clamp?

>       tc qdisc add dev dummy0 root sfq
>       tc qdisc change dev dummy0 root sfq quantum 1 stab data 32768 size_log 15 cell_log 0

[Severity: Medium]
Can this second command actually reach sfq_change()?  sfq_qdisc_ops sets:

	.change		=	NULL,

and qdisc_change() in net/sched/sch_api.c rejects the request before
either the options or the size table are applied:

	if (tca[TCA_OPTIONS]) {
		if (!sch->ops->change) {
			NL_SET_ERR_MSG(extack, "Change operation not supported by specified qdisc");
			return -EINVAL;
		}

For "tc qdisc change dev dummy0 root sfq quantum 1 ..." iproute2 always
emits TCA_OPTIONS, and __tc_modify_qdisc() falls through to
qdisc_change() for an existing root qdisc of matching kind, so the
command should return -EINVAL.

The only live caller of sfq_change() looks to be sfq_init(), i.e. tc
qdisc add / replace.  Should the subject ("clamp quantum in change
path"), the narrative and the reproducer be reworded around
add/replace instead?

> diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
> index 187d3ed578f26..8bbcfc9e85d94 100644
> --- a/net/sched/sch_sfq.c
> +++ b/net/sched/sch_sfq.c
> @@ -660,6 +660,11 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
>  		return -EINVAL;
>  	}
>  
> +	if (ctl->quantum > 1 << 20) {
> +		NL_SET_ERR_MSG_MOD(extack, "quantum too large");
> +		return -EINVAL;
> +	}
> +
>  	if (ctl->perturb_period < 0 ||
>  	    ctl->perturb_period > INT_MAX / HZ) {
>  		NL_SET_ERR_MSG_MOD(extack, "invalid perturb period");
> @@ -688,7 +693,7 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
>  
>  	/* update and validate configuration */
>  	if (ctl->quantum)
> -		quantum = ctl->quantum;
> +		quantum = max(256U, ctl->quantum);

[Severity: High]
Does a 256-byte quantum floor actually bound the refill loop, or only
divide its trip count?  The loop in sfq_dequeue() credits one quantum to
one slot per iteration and stops at the first visited slot with a
positive allot:

net/sched/sch_sfq.c:sfq_dequeue() {
	...
next_slot:
	a = q->tail->next;
	slot = &q->slots[a];
	if (slot->allot <= 0) {
		q->tail = slot;
		WRITE_ONCE(slot->allot, slot->allot + q->quantum);
		goto next_slot;
	}
	...
}

q->tail is not advanced past the slot that was just served; the served
slot is only debited:

	} else {
		WRITE_ONCE(slot->allot, slot->allot - qdisc_pkt_len(skb));
	}

So with a size table pushing qdisc_pkt_len() to QDISC_PKT_LEN_MAX, each
slot served in one round-robin sweep is left at about -1 MiB, and a slot
needs (1 << 20) / 256 = 4096 visits to become positive again.  New flows
start positive in sfq_enqueue():

		/* We could use a bigger initial quantum for new flows */
		WRITE_ONCE(slot->allot, q->quantum);

so N flows can each be driven deeply negative by one dequeue before the
ring wraps.  With flows 65408 (SFQ_MAX_FLOWS) that is on the order of
4096 * 65408 iterations inside a single sfq_dequeue() call, with the root
qdisc spinlock held and BH disabled.

The same arithmetic seems to hold without any small quantum at all: a
default quantum derived from a 1500-byte MTU still gives roughly
(1 << 20) / 1500 * 65408 iterations under the same setup.

Would bounding the deficit itself work better here, for example clamping
or resetting slot->allot when it goes below -q->quantum, or computing the
number of quanta arithmetically rather than looping one quantum at a
time?

[Severity: Low]
This is a pre-existing mismatch and not introduced by this patch, but
while this validation is being touched: struct sfq_sched_data documents

	unsigned int	quantum;	/* Allotment per round: MUST BE >= MTU */

and sfq_init() derives its default from the device MTU:

	q->quantum = clamp_t(u32, psched_mtu(qdisc_dev(sch)),
			     256, 1 << 20);

whereas sfq_change() now stores max(256U, ctl->quantum) without looking
at psched_mtu(), so on a 1500-MTU device a requested quantum of 300 is
stored verbatim.  Should the clamp use psched_mtu() as its lower bound,
or should the "MUST BE >= MTU" comment be updated?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
