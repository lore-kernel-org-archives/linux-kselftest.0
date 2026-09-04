Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F744236C;
	Fri,  4 Sep 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514965; cv=none; b=kNVR+FeD88VijJl5HLVt4DMrfXMdzy44nnS9T526qYcrB6LsRYKC55tH9X5zNLICt2FTu+mmGYM2nlCNAdv98h9cZ0zhrdu7PR2toMacjTiaCdUMe6OlJGVegGJs3VIBg1axzxlk4R74lN+seWe6+NbxgtUdnR+6un0lbS9OZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514965; c=relaxed/simple;
	bh=O+3IvS8KbvQbz9WV1wt9JeRJ1KcSdpTlesMe2TYJCOA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d5k8XP7pXjtSBthvsgxOwoVHDFsZtf6kBj/SZbgc5fPr+FVE5OzLS2VydSPu6ce2iDWhG1ZlhM1dSwfgh+Htr7xdegllcTSc47r0rUprh6V9C7ODSFYta5hoBlEV8RhVfg6kLjibbwIZmxd7VIWAzZywTbAU0Kz9b1//QQavUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5nFRLHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5nFRLHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAC21F00A3D;
	Fri,  4 Sep 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514963;
	bh=2XKvUisbHFI9e29fu3cWF5vgWmFMNbxcXlQvQuZd+Ts=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c5nFRLHs60M46J5AQ1McQjawBymNgs8TJHn27bVkff6gTPTyUgpUAoZbT5C9yrwD8
	 5LBDb/Z+oe5e7qp1DlEtcWvYclNJSceL9b/dAHflLvHSxF6QgYJMM6XKiaX2J18FSk
	 roc0Mw2FWC315PaheGwe113q1TUqn/SBUmfVO8hAtgysEfrvfzSzzsAcS6rL8kAyEG
	 xpU7BPAEW4u6o4Top8CbibVTIV1wV9k5xkpX2N6Ui/alUPpzsHeScQ1m5z/HgzUBrN
	 T9B18VOfh7RAhtNSKnciP6xhLK5KcDEwWW/aIZ/y8w1F2O7Yask0q4Dg4mwXYJpLN2
	 QOlI4twG0vK0g==
Subject: Re: [PATCH net v3 1/9] net/sched: fq: clamp quantum and
 initial_quantum in change path
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, toke@redhat.com
Date: Fri, 04 Sep 2026 09:42:42 +0000
Message-ID: <178851496241.4131868.3916017237623578286@kernel.org>
In-Reply-To: <QDISC-0CFC.v3.20260901204856@mojatatu.com.2>
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.2>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 4 · Low: 1

- [Medium] Commit message misdescribes the pre-patch behaviour and the
  severity of the bug being fixed.
- [Medium] fq_change() no longer rejects an out-of-range TCA_FQ_QUANTUM.
- [Medium] The `Fixes: 709f34f7c28d ("net/sched: fq: add overflow bounds
  to quantum and initial quantum")` tag does not identify the commit…
- [Medium] Narrowing `iq_range.max` from INT_MAX to 1<<20 makes any
  configuration that sets initial_quantum above 1 MiB fail with -ERANGE…
- [Low] The tc-testing case 10f7 "Create FQ with invalid initial_quantum
  setting" uses `initial_quantum 0x80000000` (2147483648), which was…

--

net/sched: fq: clamp quantum and initial_quantum in change path

This narrows the netlink policy range for TCA_FQ_INITIAL_QUANTUM to 1<<20
and replaces the range check on TCA_FQ_QUANTUM in fq_change() with an
unconditional clamp to [256, 1<<20].  fq_init() now also clamps its
default quantum to the same range.

A few questions on the changelog and on the behaviour changes.

> The fq change path accepts TCA_FQ_QUANTUM in [1, INT_MAX] and
> TCA_FQ_INITIAL_QUANTUM up to INT_MAX, while fq_init() already clamps to
> [1, 1<<20]. A user can override the init clamp via tc qdisc change,
> restoring the small-quantum deficit spin that the init clamp prevents.

[Severity: Medium]
Is this description of the pre-patch behaviour accurate?  The code this
patch removes from fq_change() is:

net/sched/sch_fq.c:fq_change() {
	if (tb[TCA_FQ_QUANTUM]) {
		u32 quantum = nla_get_u32(tb[TCA_FQ_QUANTUM]);

		if (quantum > 0 && quantum <= (1 << 20)) {
			WRITE_ONCE(q->quantum, quantum);
		} else {
			NL_SET_ERR_MSG_MOD(extack, "invalid quantum");
			err = -EINVAL;
		}
	}

so the accepted range on the change path was [1, 1<<20], not
[1, INT_MAX].

Also, 709f34f7c28d only touched fq_init(), where the clamp prevents
quantum == 0 arising from 2 * psched_mtu() wrapping.  quantum == 0 was
already refused by fq_change() with -EINVAL, so what exactly could be
overridden through tc qdisc change?

On the "spin" itself, __qdisc_calculate_pkt_len() in net/sched/sch_api.c
already bounds the stab-inflated length:

	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);

With QDISC_PKT_LEN_MAX == (1 << 20), the fq_dequeue() refill loop

	if (f->credit <= 0) {
		f->credit += q->quantum;
		...
		goto begin;
	}

terminates after at most ~2^20 passes for any quantum >= 1.

Would it be more accurate to state that the residual gap closed on the
change path is quantum in [1, 255]?

> Fixes: 709f34f7c28d ("net/sched: fq: add overflow bounds to quantum and initial quantum")

[Severity: Medium]
Does this Fixes tag point at the right commit?  709f34f7c28d changes only
fq_init().  Blame at the parent of this commit attributes the fq_change()
quantum handling to 3725a269815ba6 (2015) with the 1<<20 upper bound from
d9e15a2733067c (2020), and iq_range.max = INT_MAX to 7041101ff6c307
(2023).

The reproducer in the changelog

	tc qdisc change dev dummy0 root fq quantum 1 stab ...

goes only through fq_change(), so it would behave the same on kernels
predating 709f34f7c28d.  Since stable selection keys off the Fixes tag,
should the tag name one of the older commits instead?

> diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
> index 6144b5686f13f..35f940b2205df 100644
> --- a/net/sched/sch_fq.c
> +++ b/net/sched/sch_fq.c
> @@ -980,7 +980,7 @@ static int fq_resize(struct Qdisc *sch, u32 log)
>  }
>  
>  static const struct netlink_range_validation iq_range = {
> -	.max = INT_MAX,
> +	.max = 1 << 20,
>  };

[Severity: Medium]
Is this an intentional uAPI restriction?  With
NLA_POLICY_FULL_RANGE(NLA_U32, &iq_range), validate_nla() now returns
-ERANGE during nla_parse_nested_deprecated(), so

	tc qdisc add dev dummy0 root fq initial_quantum 2000000

fails outright and fq_change() never runs.  Values above 1 MiB have been
accepted since 7041101ff6c307, and unvalidated before that.

What bug does a large initial_quantum cause?  In sch_fq.c the only uses of
q->initial_quantum are the two assignments in fq_classify()

	f->credit = q->initial_quantum;

plus the dump, while the refill loop in fq_dequeue() adds q->quantum.  So
initial_quantum looks like a per-new-flow burst knob that cannot drive the
refill loop.

Should the changelog mention the compatibility break for existing tc
scripts?

>  
>  static const struct nla_policy fq_policy[TCA_FQ_MAX + 1] = {
> @@ -1106,14 +1106,10 @@ static int fq_change(struct Qdisc *sch, struct nlattr *opt,
>  			   nla_get_u32(tb[TCA_FQ_FLOW_PLIMIT]));
>  
>  	if (tb[TCA_FQ_QUANTUM]) {
> -		u32 quantum = nla_get_u32(tb[TCA_FQ_QUANTUM]);
> +		u32 quantum = clamp_t(u32, nla_get_u32(tb[TCA_FQ_QUANTUM]),
> +				     256, 1 << 20);
>  
> -		if (quantum > 0 && quantum <= (1 << 20)) {
> -			WRITE_ONCE(q->quantum, quantum);
> -		} else {
> -			NL_SET_ERR_MSG_MOD(extack, "invalid quantum");
> -			err = -EINVAL;
> -		}
> +		WRITE_ONCE(q->quantum, quantum);
>  	}

[Severity: Medium]
Is the loss of the -EINVAL here intended?  After this change,

	tc qdisc change dev dummy0 root fq quantum 0

returns success and installs 256, where it previously returned -EINVAL
with the "invalid quantum" extack (that rejection dates back to
3725a269815ba6, with the upper bound from d9e15a2733067c).  Values in
[1, 255] that were previously honoured are now silently rewritten to 256.

There is a second, less obvious effect: this branch can no longer set err,
so the later blocks in fq_change()

	if (!err && tb[TCA_FQ_PRIOMAP])
		err = fq_load_priomap(...);

	if (!err && tb[TCA_FQ_WEIGHTS])
		err = fq_load_weights(...);

	if (!err) {
		sch_tree_unlock(sch);
		err = fq_resize(sch, fq_log);
		sch_tree_lock(sch);
	}

now all run for a request that carries an invalid quantum together with
priomap, weights or a new buckets_log.  Previously such a request was
refused as a whole.  Was that change in behaviour considered?

The same file still rejects out-of-range band quanta in fq_load_weights()
with

	NL_SET_ERR_MSG_MOD(extack, "invalid weights");

and fq_codel_change() keeps the split convention:

net/sched/sch_fq_codel.c:fq_codel_change() {
		quantum = max(256U, nla_get_u32(tb[TCA_FQ_CODEL_QUANTUM]));
		if (quantum > FQ_CODEL_QUANTUM_MAX) {
			NL_SET_ERR_MSG(extack, "Invalid quantum");
			return -EINVAL;
		}
}

Within this patch, TCA_FQ_INITIAL_QUANTUM is hard-rejected at parse time
while its neighbour TCA_FQ_QUANTUM is silently clamped.  Could the two
adjacent attributes signal out-of-range input the same way, i.e. keep the
-EINVAL for quantum above 1<<20 and only clamp the low end?

>  
>  	if (tb[TCA_FQ_INITIAL_QUANTUM])

[ ... ]

[Severity: Low]
This isn't a bug, but is there test coverage for the new bounds?  The
tdc case 10f7 "Create FQ with invalid initial_quantum setting" in
tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq.json uses

	initial_quantum 0x80000000

which is 2147483648 and was already refused by the old INT_MAX bound, so
it passes identically before and after this patch and would keep passing
if the 1<<20 bound were reverted.  Case 845b uses initial_quantum 900000,
below the new bound, and the only quantum case 2390 uses quantum 9000,
inside the new clamp.

Nothing in fq.json exercises 0x100000 accepted versus 0x100001 rejected,
and nothing exercises quantum 0, quantum 1 (the reproducer named in the
changelog) or quantum above 1<<20.  The series does update tc-testing for
the ETS clamp but adds nothing for fq.  Could fq.json be extended along
with this change?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-0CFC.v3.20260901204856%40mojatatu.com
