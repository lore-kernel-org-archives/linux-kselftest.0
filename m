Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC5246782;
	Fri, 24 Jul 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896414; cv=none; b=EFRrFR6UkuGttjPDMLfxFC5TQ2E5+COuRsHHjnPgQkc5374uniEjQ/Kxe/AGOFa8M038C+ezxllsy2R9JSbhE3apWk2rojaIp6xCFXw7Ok5RDhsQjy569aPVAu/vOh1Tnz3iA16upEeNRG+2iQkk3NFlROXcJ0aGychmaOcQF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896414; c=relaxed/simple;
	bh=DZMpg0/WMF+4qdmbUl4il7B9sxz/8UcJto/PlZLOxJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdA5GpkNrN3Hl20UlpgGetUWAIBbQrQiyMZidnNaFbdCXqj/BhN/6DOsoLkIzCuwk9zmiX8RD0wmJioC/iQ98E/Y63w5Pyi0leWvkCIwVqpyTcociarATpaJ8woZYvExBpVSU9pD6mOkc/ng0/kFo2eLuBx2iQGu5s/qE1sZIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RARNucCx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RARNucCx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BB11F000E9;
	Fri, 24 Jul 2026 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784896412;
	bh=YF5wYY4LkouR8YFwFcU+pHOne4ZFh3+9ga3mifIehL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RARNucCxfRYv8UtKWhAUB7H4T7KIILMDKfv9jZT3tTM+TvDjR99MWgfqIwcYVGeQe
	 TPfEeaxa38Nc9b7hVvHBfDO4j+kQ5ssUF8NAZszf4DhNtAPjd53atV9+ycv2ND0UB7
	 GajmrpL77HYRNVFAcOklAUS509LUmdJMXZufL+/qHKRuDtdqvah7YxR9jOaZdE7MB6
	 HuMedIqOiP143kI2qpoAPK3i4nDxyhiDQiCfDbufkXM3nrZI3R4ABPOKtgX3Eymp2v
	 gm2ecGf+2cXn+gZRunYjBU8AlOTRObl5dZXIuyeYpjMgH8WSfzB5YlvSLmXC1KwEDA
	 7oGaIl2vMP91Q==
From: Simon Horman <horms@kernel.org>
To: xiaoliang.yang_1@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	shuah@kernel.org,
	vladimir.oltean@nxp.com,
	vinicius.gomes@intel.com,
	fejes@inf.elte.hu
Subject: Re: [PATCH net-next 4/6] net: sched: act_frer: add FRER tc action
Date: Fri, 24 Jul 2026 13:33:17 +0100
Message-ID: <20260724123317.670722-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717095549.10565-5-xiaoliang.yang_1@nxp.com>
References: <20260717095549.10565-5-xiaoliang.yang_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717095549.10565-3-xiaoliang.yang_1@nxp.com?part=4
---
--- Patch [4]: [PATCH net-next 4/6] net: sched: act_frer: add FRER tc action ---
commit 51190c05963e5f23d401f666c097c54aacbdc2ad
Author: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Subject: net: sched: act_frer: add FRER tc action

This commit introduces the IEEE 802.1CB FRER tc action, implementing the
Sequence Generation Function and the Sequence Recovery Function. It provides
support for both cross-port shared sequence recovery and per-port individual
recovery.

> diff --git a/net/sched/act_frer.c b/net/sched/act_frer.c
> new file mode 100644
> index 0000000000000..7b6db643788df
> --- /dev/null
> +++ b/net/sched/act_frer.c

[ ... ]

> @@ -59,21 +59,21 @@ static enum hrtimer_restart frer_rcvy_hrtimer_fn(struct hrtimer *timer)
>  {
>  	struct frer_rcvy *rcvy =
>  		container_of(timer, struct frer_rcvy, hrtimer);
>  	struct frer_rcvy_work *rw;
>  
>  	/* Allocate in GFP_ATOMIC context; if it fails the state is not
>  	 * reset this cycle - the next frame will attempt again.
>  	 */
>  	rw = kmalloc_obj(*rw);

[Severity: High]
Can this allocation sleep in atomic context? The timer callback
frer_rcvy_hrtimer_fn executes in softirq context, but kmalloc_obj(*rw)
defaults to a GFP_KERNEL allocation which can sleep.

>  	if (rw) {
>  		INIT_WORK(&rw->work, frer_rcvy_reset_work_fn);
>  		rw->rcvy = rcvy;
>  		schedule_work(&rw->work);
>  	}

[Severity: High]
Is there a use-after-free risk for the tc_action here? The timer dynamically
allocates and queues a work item, but the cleanup routine only cancels the
timer. If the action is freed, the pending work could execute and access
freed memory in frer_rcvy_reset_work_fn.

>  	return HRTIMER_NORESTART;
>  }

[ ... ]

> @@ -109,51 +109,51 @@ static int frer_rtag_push(struct sk_buff *skb, u16 seq_num)
>  {

[ ... ]

>  	skb->protocol = htons(ETH_P_RTAG);
>  	skb_set_network_header(skb, head_len);
>  	if (data_offset > 0)
>  		skb_pull(skb, data_offset);

[Severity: High]
Does this leave skb->data pointing inside the R-TAG instead of the payload?
The code shifts the MAC header backwards by 6 bytes but only pulls
data_offset, leaving the pointer 6 bytes short.

>  
>  	/* Write R-TAG after the Ethernet / VLAN header */
>  	rtag = (struct r_tag *)(new_mac_header + head_len);
>  	rtag->reserved    = 0;
>  	rtag->sequence_nr = htons(seq_num);
>  	rtag->encap_proto = saved_proto;
>  
>  	return 0;
>  }

[ ... ]

> @@ -162,51 +162,51 @@ static void frer_rtag_pop(struct sk_buff *skb)
>  {

[ ... ]

>  	if (*proto_ptr != htons(ETH_P_RTAG))
>  		return;

[Severity: High]
Can this early return path leave the pointer at the MAC header? It appears
to exit without restoring skb->data using skb_pull(skb, data_offset).

>  
>  	rtag = (struct r_tag *)((unsigned char *)eh + head_len);
>  	*proto_ptr = rtag->encap_proto;
>  
>  	skb->protocol = rtag->encap_proto;
>  
>  	skb_postpull_rcsum(skb, rtag, sizeof(struct r_tag));
>  	skb_pull(skb, sizeof(*rtag));
>  	skb_reset_mac_header(skb);
>  
>  	new_mac_header = skb_mac_header(skb);
>  	memmove(new_mac_header, (unsigned char *)eh, head_len);
>  
>  	skb_set_network_header(skb, head_len);
>  	if (data_offset > 0)
>  		skb_pull(skb, data_offset);

[Severity: High]
Does this over-pull and skip 6 bytes of the payload? The code pushes
data_offset (which included the 6-byte R-TAG), pulls 6 bytes, shifts the
MAC header, and then pulls data_offset again.

>  }

[ ... ]

> @@ -273,63 +273,63 @@ static bool frer_vector_alg(struct frer_rcvy *rcvy, int seq, bool individual)
>  {

[ ... ]

>  	delta = (seq - (int)rcvy->rcvy_seq_num) &
>  		(int)(rcvy->seq_space - 1);
>  	/* Map delta > seq_space/2 to negative (signed wrap) */
>  	if ((u32)delta & (u32)(rcvy->seq_space / 2))
>  		delta -= (int)rcvy->seq_space;
>  
>  	if (delta >= (int)rcvy->history_len ||
>  	    delta <= -(int)rcvy->history_len) {
>  		/* Packet is out-of-range (rogue). */

[Severity: High]
Does this check permanently drop valid packets if history_len is configured
to 1? A valid next sequential packet with delta equal to 1 would trigger
this rogue packet check.

>  		rcvy->stats_rogue_pkts++;
>  		if (individual)
>  			restart_timer = true;
>  		pass = false;
>  		goto out;
>  	}

[ ... ]

> @@ -345,41 +345,41 @@ static bool frer_match_alg(struct frer_rcvy *rcvy, int seq, bool individual)
>  {

[ ... ]

>  	if ((u32)seq == rcvy->rcvy_seq_num) {
>  		/* Duplicate */
>  		if (individual)
>  			frer_rcvy_timer_restart(rcvy);
>  		return false;
>  	}
>  
>  	/* New sequence number: accept and update */
>  	if ((u32)seq != ((rcvy->rcvy_seq_num + 1) % rcvy->seq_space))
>  		rcvy->stats_out_of_order_pkts++;

[Severity: Low]
Does this modulo operation cause a build failure on 32-bit architectures?
The modulo operator is used with a 64-bit divisor (rcvy->seq_space), which
emits a call to __umoddi3.

>  	rcvy->rcvy_seq_num = (u32)seq;
>  	frer_rcvy_timer_restart(rcvy);
>  	return true;
>  }

[ ... ]

> @@ -407,130 +407,130 @@ static int tcf_frer_init(struct net *net, struct nlattr *nla,
>  			 struct nlattr *est, struct tc_action **a,
>  			 struct tcf_proto *tp, u32 flags,
>  			 struct netlink_ext_ack *extack)
>  {

[ ... ]

>  	err = tcf_action_check_ctrlact(parm->action, tp, &goto_ch, extack);
>  	if (err < 0)
>  		goto release_idr;
>  
>  	f = to_frer(*a);
>  
>  	spin_lock_bh(&f->tcf_lock);
>  	goto_ch = tcf_action_set_ctrlact(*a, parm->action, goto_ch);
>  	f->func     = func;
>  	f->tag_type = tag_type;
>  	f->tag_pop  = !!tb[TCA_FRER_RCVY_TAG_POP];

[Severity: High]
Does this early mutation cause a resource leak and state corruption? The
code mutates live action fields and overwrites goto_chain before validating
the TCA_FRER_RCVY_ALG attribute.

If validation fails below, it jumps to release_idr without calling
tcf_chain_put_by_act(goto_ch), leaking the old chain, and leaving the action
running with a corrupted hybrid state.

>  
>  	if (func == TCA_FRER_FUNC_PUSH) {
>  		if (ret == ACT_P_CREATED) {
>  			spin_lock_init(&f->seqgen.lock);
>  			f->seqgen.seq_space = 1 << 16;
>  		}
>  		/* gen_seq_num starts at 0 on creation; preserved on replace */
>  	} else {

[Severity: High]
Does this cause a timer leak when changing modes? If a RECOVER action is
replaced with a PUSH action, f->func is changed without cancelling the old
rcvy.hrtimer. When the action is later deleted, the cleanup function will
skip timer cancellation.

>  		u8 alg = tb[TCA_FRER_RCVY_ALG] ?
>  			 nla_get_u8(tb[TCA_FRER_RCVY_ALG]) :
>  			 TCA_FRER_RCVY_VECTOR_ALG;

[ ... ]

>  		/* Cancel any running reset timer before re-initialising. */
>  		if (ret != ACT_P_CREATED && f->rcvy.reset_msec) {
>  			spin_unlock_bh(&f->tcf_lock);
>  			hrtimer_cancel(&f->rcvy.hrtimer);
>  			spin_lock_bh(&f->tcf_lock);
>  		}
>  
>  		frer_rcvy_init_state(&f->rcvy, alg, history_len,
>  				     reset_msec, take_no_seq);

[Severity: High]
Does unconditionally calling frer_rcvy_init_state() destroy active primitives?
When replacing a live RECOVER action, spin_lock_init() and hrtimer_setup()
are called while the datapath might concurrently acquire the lock or restart
the timer.

>  	}
>  
>  	spin_unlock_bh(&f->tcf_lock);
>  
>  	if (goto_ch)
>  		tcf_chain_put_by_act(goto_ch);
>  
>  	return ret;
>  
>  release_idr:
>  	tcf_idr_release(*a, bind);
>  	return err;
>  }

[ ... ]

> @@ -702,10 +702,10 @@ static void tcf_frer_cleanup(struct tc_action *a)
>  {
>  	struct tcf_frer *f = to_frer(a);
>  
>  	if (f->func == TCA_FRER_FUNC_RECOVER)
>  		hrtimer_cancel(&f->rcvy.hrtimer);

[Severity: High]
As noted above, failing to cancel the dynamic workqueue item here leaves
a pending work that will access the action memory after it is freed.

>  }
