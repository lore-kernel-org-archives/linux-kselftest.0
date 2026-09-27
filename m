Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966C41F37D
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535951; cv=none; b=enq485IXxCwFK07TEWvQRDyzE9KkbMqWHE77e8OhVqZvcbVoHVpTHJ0KtNhtOo1sQEq6t78bl1W7WyvxSxSG2MlinunYPyAkRS4l9Vo9aJmcTuDWIcIQsBvb61yl0B944n6sROU+kxwBObRXQOIM5ebinvuHJDsZ35HD3c3oz8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535951; c=relaxed/simple;
	bh=tSd4WidD9uoM4o3Uv5U0cfzn9drdswPKvzsIrp9/bbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/tbjMPX1YDUX2dGcmcXXT3xm9qQugCnVcmtHkjQdntvGjLZ1K91GlY95lt6+ezMy4unxOyCg++0bfPIyJLnNE+xjZoKWwUIiGYPkPepJbqTeXYMoahmneGrVVMxX2vXmkXC4Y2tAPA/kIbajnClWqFXocJemhyQfqSeHqpVRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9/b6VVg; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9/b6VVg"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34346932d93so811066eec.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 12:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535948; x=1791140748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdxMO8egZNtQTxLy0h6hggIXOCvSuNp4M1vDnx1gf4A=;
        b=d9/b6VVg0xCFegQYpn7gTEJj/teYDsxOCCoQLKPdwNQWmK1TwhsfiEV5gNThJ1nV3l
         0bI11B3D8Zods4B3YxDZ+hHgCQKyKGv2HNhkfcBuvBWwDbmnHjOXxfk8Or4qcM20zDSH
         UzCOg1C1iBCLKyAACc3eUVGt5gk8b3TD1QvuPNNzhEXneVbzeFzCuhTt5I5f610DvNEf
         HAUIsbnwDG6WbsJQ4MAhSq1ykuHTs1fti3i8s15Ar+VDLmrzIR9I2k7JQCcx8N2zCvld
         8Hk2Nk4xbeOTFiVQdM2UYnHLdDBdYNg9KJ+aE8ePEni71cx6hA8E+5apG3RFjTnQk6Rk
         mktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535948; x=1791140748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdxMO8egZNtQTxLy0h6hggIXOCvSuNp4M1vDnx1gf4A=;
        b=T4h55UbxjkkUeAx4+Ogs0b40YD4wDvZgY0Q6oSCWHeiVxy6jhmJ+jmwU3wv6bXt9nI
         41TjgBHYNCERtrhrhZkhsutmDqIM0BvEzeiLIFoHIrzHLfMl7xfFiWktFJL550+dD/AY
         H2UUjZKTrGAAWhFFgBuXHfHGOr23pVib7TGrfj6oiRLs5U8Wvhu1b56v2KCtpja8ojzc
         lBBBJ5oxK5O87STJZArbxFHa7uN27YD2UBAcGSB2aNpgUjmMVx5kYEUM22loP6OsiwLY
         Pywyyqc42il2wJlinuLBVAST76dTPQtJDxkjrjqS88Zs5LIUwg+uS7YpYazqx4cIFLc9
         Rk4g==
X-Forwarded-Encrypted: i=1; AKwUvBwVQ5rGV+wtv1kdudIL+oRvl5Sv2wUpMJABT5i1wU9j2kwlAk0n9Xq5VbTzQiTMG0niWkzdyI0PoBGCacVQiP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfHxEllB1vlYmimQ9QdOSvhHs++lXTT6+q2WoKFg/ZDQ/nCpUq
	kc4o+vJe7pGYMD2oge9BdEIcYEEM0fYozrgtUDvN1kxnkBcJytlBa6E5
X-Gm-Gg: AYBFou01SiiuTu5gzBqHZ/misoOqU2Ks7K6UCQiC33AG9NhLnxvwJo0jNieX4mgp69c
	xTGYbwOohKBmmyRQXdPN4SYoKD6qohfO2jLqOjC41LmTDXpshj99sA8pQ53FIskt4t7Gql+35Xh
	bXtSDPb85rVMlhcbMFp5qtws4th2dPwdDX95TVNRPpIz9Gq4p2/fRdxRyh1UQF7gFYleCYPsGGv
	ijQqHhARnMOe5ZT7ZsUw4y/rpvHjKRQKAE3UAJS8rFPIi9iYMDrHC48S42wFMtJvb8NW+gifjj/
	AhYDO9KcD2D82nVpvCe0+NYHldMN05Vt3PGmRdO1o7fGXqjDbmjcH/mKhAIVeLvgl/2ZEmGDw7V
	JcMPOnY2tU57wFpZVhVWqZNxSVZwOXfsOv/zr67PGCZEgSZbgLqn4Ypt69E7+2B2boZXtjo+Md/
	zkNLjnio/mQ8xuWeB/kjT3A9ThkjbHMrhIHEGBgXp3/trdZ9kUIq9kVerTm+1BvcLkpPH4ix8Pb
	DJFplxfl/zoXoNiOvpXhPJvkya04lR9oKIzlX8Am1WbkUiPBDodwmMsWiqHRyg529HWLaph2w==
X-Received: by 2002:a05:7301:6183:10b0:346:d87c:b76 with SMTP id 5a478bee46e88-346d88b546dmr1852662eec.6.1790535947923;
        Sun, 27 Sep 2026 12:05:47 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6651:2efb:bfb:bd73])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm23009054eec.23.2026.09.27.12.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:05:47 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v8 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon, 28 Sep 2026 00:35:39 +0530
Message-Id: <20260927190539.12287-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925175027.07e8c158@kernel.org>
References: <20260925175027.07e8c158@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jakub,

We have reviewed the low-severity comments. Please find our responses inline
below.

> [Severity: Low]
> The commit message says the class ops are wired up:
>
>   so that 'tc -s class show' reports per-flow state (prob, delay, deficit,
>   avg_dq_rate, dq_rate_estimating).
>
> Does that hold with an existing tc binary?
>
> Here the nine qdisc counters are zeroed and the per-flow data is in
> class_stats at offset 40. A tc that predates the type field treats every
> fq_pie xstats blob as qdisc stats. It would likely print a row of zero qdisc
> counters for each active flow class and none of the per-flow values. Before
> this patch fq_pie had no cl_ops, so 'tc class show' printed nothing for it.
>
> The companion iproute2 change is only mentioned in the follow-up commit
> "selftests: tc-testing: add fq_pie per-flow class stats test" ("printed
> with the companion iproute2 change"). Could this commit mention it as well?

That's expected, not a regression, and it holds in both directions.
tc has copied min(RTA_PAYLOAD(xstats), sizeof(*st)) into a zeroed
struct since fq_pie support was first added to iproute2 (commit
9dced637, "tc: add support for FQ-PIE packet scheduler", 2019) - every
released tc that knows fq_pie parses this way, so an old tc against a
new kernel degrades to a zeroed row instead of erroring out. The
companion iproute2 patch carries the same discipline forward on the
new side too: fq_pie_print_xstats() treats a missing or zero type as
the qdisc case (`if (!st->type || st->type == TCA_FQ_PIE_XSTATS_QDISC)`),
so a new tc against an old, pre-type kernel also degrades gracefully
instead of misreading the blob. The companion iproute2 dependency is already
documented in patch 2/3's commit message and in both series' cover letters; 
we don't think it needs a third copy here.

> [Severity: Low]
> Setting .cl_ops makes the TC core treat fq_pie as classful. Is the change
> in user-visible errors intended?
>
> Filter add on parent <fq_pie>: used to fail in __tcf_qdisc_find() with
> -EINVAL "Qdisc not classful". It now reaches this check instead:
>
> 	if (!cops->tcf_block) {
> 		NL_SET_ERR_MSG(extack, "Class doesn't support blocks");
> 		err = -EOPNOTSUPP;
> 		goto errout_qdisc;
> 	}
>
> Grafting or getting a child on parent <fq_pie>:N through qdisc_leaf() used
> to return -EOPNOTSUPP "Parent qdisc is not classful". Because fq_pie_find()
> always returns 0, it now returns -ENOENT "Specified class not found".
>
> RTM_GETTCLASS and RTM_DELTCLASS in __tc_ctl_tclass() also change from
> -EINVAL to -ENOENT.
>
> fq_pie_init() still calls tcf_block_get(), and fq_pie_classify() still
> reads q->filter_list and maps tcf results to flow ids 1..flows_cnt. That is
> the class id space this patch exposes. With .tcf_block, .bind_tcf and
> .unbind_tcf left out, the classifier path stays unreachable, as it was
> before this patch.
>
> The commit message says these callbacks are "omitted on purpose". Could it
> give the reason and mention the errno changes?

Yes, intended - an unavoidable side effect of any qdisc gaining .cl_ops
for the first time. fq_codel, sfq and cake don't document the same
errno transitions either, so we don't think this needs it here.

fq_pie_class_ops has no .tcf_block. __tcf_qdisc_find()
(net/sched/cls_api.c) rejects any filter attach with -EOPNOTSUPP when
cops->tcf_block is NULL, before q->filter_list is touched. So
q->filter_list stays NULL for good, and fq_pie_classify()'s tcf branch
never runs.

That branch has no case for TC_ACT_CONSUMED - a gap shared with
fq_codel, sfq, cake, htb, hfsc, drr, qfq, multiq, prio, sfb, ets and
dualpi2, predating this series. It's unreachable here without
.tcf_block, which we're not adding, so it's out of scope.

We're not planning to fold this into the commit message - it's covered
above.

> [Severity: Low]
> Should Documentation/netlink/specs/tc.yaml be updated along with this?
>
> In the spec, tc-fq-pie-xstats still lists only the nine original u32
> members. The tca-stats-app-msg sub-message still binds fq_pie to it:
>
>       -
>         value: fq_pie
>         fixed-header: tc-fq-pie-xstats
>
> The spec has no type member, no class-stats member, no tc-fq-pie-cl-stats
> struct and no enum for TCA_FQ_PIE_XSTATS_QDISC/CLASS.
>
> A spec-driven (YNL) decoder will only decode the first 36 bytes of the new
> 64-byte payload. It cannot tell class records from qdisc records, and it
> never shows prob, delay, deficit, avg_dq_rate or dq_rate_estimating.
>
> tc.yaml is still unchanged at the end of the series (after "net/sched: pie:
> correct tc_pie_xstats field documentation").

This is a gap and we don't dispute it, but it isn't new to fq_pie.
tc-fq-codel-xstats in tc.yaml is the flat qdisc_stats view - no
class-stats member, no enum for TCA_FQ_CODEL_XSTATS_QDISC/CLASS - even
though tc_fq_codel_xstats, the union struct cited above as the pattern
to follow, has had a class_stats arm since it was added. We believe this 
would be better handled in a logically separate patch series to bring tc.yaml
up to date with the current xstats structures across all qdiscs, rather than 
addressing fq_pie in isolation here.

> [Severity: Low]
> Can the last flow be reported under the qdisc's own handle?
>
> fq_pie_change() accepts up to 65536 flows:
>
> 	if (!q->flows_cnt || q->flows_cnt > 65536) {
>
> fq_pie_walk() passes i + 1 as the class id. With flows_cnt == 65536, the
> flow at index 65535 is dumped with cl == 65536. TC_H_MIN() masks that to
> minor 0, which gives a handle of <major>:0, the same as the qdisc itself.
>
> fq_pie_dump_class_stats() still uses the unmasked cl, so the stats are
> correct but userspace sees them under the qdisc handle.
>
> fq_codel has the same latent issue. This patch brings it into fq_pie.

Agreed this exists, and we've addressed the same point in a previous patch 
before: it's a display quirk. fq_codel has had the identical 16-bit 
TC_H_MIN() wraparound at the identical 65536-flow limit since 2012, 
and it isn't reachable through any other addressable operation - only 
a dump can ever surface it. We're staying consistent with fq_codel's 
long-standing, accepted behaviour rather than special-casing fq_pie alone 
for a display-only edge case for now. A separate patch can address 
both of these together.

> [Severity: Low]
> fq_pie_walk() lists a class <major>:<i+1> for every active flow, but
> fq_pie_find() always returns 0. Is it intended that a class shown by
> 'tc class show' gets -ENOENT from a targeted RTM_GETTCLASS, such as
> 'tc class get dev X classid <major>:N' going through __tc_ctl_tclass()?
>
> fq_codel_find(), sfq_find() and cake_find() also return 0 for their
> pseudo-classes. A non-zero return would also send qdisc_leaf() and the
> RTM_DELTCLASS paths into ops that fq_pie does not implement. So this may
> well be the intended convention. It does mean per-flow stats can only be
> read through a full dump.

Confirmed intentional - same convention as fq_codel_find(), sfq_find()
and cake_find(). Pseudo-classes across this whole family are dump-only
by design; nothing to change here.

> [Severity: Low]
> Are these lockless reads safe against the datapath writers?
>
> tc_fill_tclass() passes a NULL lock to gnet_stats_start_copy_compat(), so
> this function runs under RTNL only. Meanwhile enqueue, dequeue and
> fq_pie_timer() update the same fields under the qdisc root lock on other
> CPUs.
>
> The writers of deficit, qlen and backlog use plain stores with no
> WRITE_ONCE(). In fq_pie_qdisc_enqueue():
>
> 		if (list_empty(&sel_flow->flowchain)) {
> 			...
> 			sel_flow->deficit = q->quantum;
> 			sel_flow->qlen = 0;
> 			sel_flow->backlog = 0;
> 		}
> 		sel_flow->qlen++;
> 		sel_flow->backlog += pkt_len;
>
> And in fq_pie_qdisc_dequeue():
>
> 	flow->qlen--;
> 	flow->deficit -= pkt_len;
> 	flow->backlog -= pkt_len;
>
> KCSAN_ASSUME_PLAIN_WRITES_ATOMIC does not cover compound writes like these,
> so KCSAN will likely report them. The reader can also see intermediate
> values, such as qlen == 0 on a flow that was just activated. fq_codel
> annotates the equivalent writers, for example WRITE_ONCE(flow->deficit,
> ...).
>
> vars.prob and vars.qdelay are u64, so READ_ONCE() can tear on 32-bit
> kernels.
>
> pie_calculate_probability() also publishes an unclamped value before it
> applies the overflow fix-up:
>
> 	WRITE_ONCE(vars->prob, vars->prob + delta);
>
> 	if (delta > 0) {
> 		/* prevent overflow */
> 		if (vars->prob < oldprob) {
> 			WRITE_ONCE(vars->prob, MAX_PROB);
>
> A lockless reader here could therefore export a wrapped probability.
>
> fq_pie_dump_stats() in the same file takes sch_tree_lock(). Should the
> class dump take it too, or should the fq_pie writers be annotated?

Lockless READ_ONCE() stats dumps are already accepted, existing
practice in net/sched, and sch_pie carries the same u64 and
unclamped-prob exposure on the read side. Since this patch series is 
focused on class_stats, we’d prefer to make such annotations in a separate one.


Regards,
Hemendra
