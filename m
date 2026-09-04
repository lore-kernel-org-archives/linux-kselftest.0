Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CCC5221C3
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548035; cv=pass; b=hdUURKMAtKvABJmHnm7VCrPmUU8nQVOlKLGu3QyL1oG4dtTnkhc3k8+Mu1degI6UkxDz/whqYQgywn7znrZmrk7g8TE63GTY0OdZ+Fl/Jjm7iVy2tVkgQpQIjdesfAQTp43tPPpPj9mM3ULhdcg6FO11yaiZQ4s8mJ93PMXdWSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548035; c=relaxed/simple;
	bh=r70Qg3i5VU6dy9PGSmwM7EqGtUgiFHn9KGhctdur50U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVxllXpJQUtrx+ixBXsh5rzV/TCvEOtmkEr/qZKPp44kECbdJEQp1XMufMvH6dVjQKAnVLQt37BUnFX9zELzHt4kNU5Nqy0k8dDHksgCI0Jomk9HODaJc2Mq0qjvIIEL6r6R2mcmGdZdDtYrwuuNLfacTEQF+mnWyxoaopBFhpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=PZuPwEmQ; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="PZuPwEmQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1161333b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 11:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788548033; cv=none;
        d=google.com; s=arc-20260327;
        b=AAPPawT++x07Oa4qv8iT2ztlbm5qc88kxWfbVzawSBgEbeHNKxoi8shaJ51dGT6nbA
         pL1HlIyUhfsUTVFpRoWcQBd2C+/Dx7yxkXFOCVXqA5ZjHyO/k/Mz1A9ZTzWWloLRrKcx
         SFFozMFAM+JFa5BRmx1h/t5m61enVMNaS0FgVjySHR7jtZp08WHmFxiOeS1yn9l2JaIj
         t89wusqTNDBEFo3Z18sBpihw1WNA8zkBKD2aC3RrVE0A+GGINCBHknxByuCmP4ZlsMCS
         L3MflcmKR6qi/lLxZ0X9n5WMaM6GNvTNelKnUJX2EJjh9Cvh7Bo+gMFTQbinmEG5/rUm
         uisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g6EIejMjsRzHM+TB86H1qZbJ/8YKOMSwHJVrFpERbI8=;
        fh=filNs5rJUqrU4udDPaFmchX2QqxXTMHPK6ksrpz/kW0=;
        b=hSrmcyztVTCRYrS4rzuw5zmqT7SZgBz8FnE6z1iHC7ZfrGpWEk/N1+gN5bTUjCCIAN
         7Uw8sTv4ESPtR7Jy63kMjNxgjODh3CidNklV2X2ULztL7NcMCI6NnmvXqC4Ae2RiZPWX
         cYOBal1/0TroqywcnQCDHWHc7qfulJfKHFa9IpDyU3oHJMHLl0N+1HtX7hB2OVYVVCMF
         cO+/yxIooWBCwF9yhMi83ahD9HmB+DaS4aG83qcarrMklhZwSzQlPKy8yHdb+asASaNI
         D8VXY7Y8YrhpHuXdJBf3m1Qb9/wA/QcvPffhKD4Xp60ceKv6PmAy88MPDlyCXnB5YyRB
         oQyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788548033; x=1789152833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6EIejMjsRzHM+TB86H1qZbJ/8YKOMSwHJVrFpERbI8=;
        b=PZuPwEmQRhGhkcWF/A7B86qAUVxQG+Ttem5JM5F4Aghu/4T5VC6k+SitfLO82P3u5X
         xgwJArtmK9g3CLL0JNVgGbZ1JuGyxeIWPx51MSI5Z9i1nIQ+ekB0nTrjYJeYPeEdnkhD
         YYIXmSYon4C8UgrVbBISDa78iTEpowMha/cQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548033; x=1789152833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6EIejMjsRzHM+TB86H1qZbJ/8YKOMSwHJVrFpERbI8=;
        b=f27dzdOHBxOi3DcSMaqd758oOJauAjlELmh0aXPa1kNPJH/KkpdQ7zTcVGzDh1QbOx
         fQ3ZEqDXSRXQ7qi+i1BH8z8WUsuGuVeKJTD4d9GCsqeKo97uyRziofH5gV58qk/idw+k
         UWDXMvTxKnBjffH8ZkXgrYIsIENYYxrny02cBCCQADqKimp6o9HUMrs6/zKsvODzATkA
         QoiXpHCaXr402hNVN2kHG4yxyWJMuyY5q0nNzcAtaoJjdnAmQohn+evQDyq2MzPcCGen
         nBTo6yxCTGYT/G9pv7xANVxBHhOP2x40indcxiv223Pk68zzm/wZT9sN0wyifQl+ieCZ
         nELA==
X-Forwarded-Encrypted: i=1; AKwUvByiRklecbHXdZAKBwwCxS/4roeij1tZhCQGUH1wySfo6ZBVZDIgUY51HdWEdvY5b8Pr78wLXZKgYxjaLG1JimM=@vger.kernel.org
X-Gm-Message-State: AFuF++kwjrsxFVNQgDiCh0CEEOWYNiE4DJSEyDyzHWzoWCZGeoEUmiEE
	yaq4tVmDW0o2eT680OgQxBQSJeaGTyGLPrusjd4uvWDC53ukaMkOyZZTIs0/I89xB1ta+8zhwSW
	6pSQ3fu4rkKaNdsi8O7RxdPFFBKpxcQU0B5/7HdNJ
X-Gm-Gg: AYBFou2OdwHgPk8jr6pOsqEM0sztJiVL+/8aFfR5QJjmth8qX5BW3YN3TTvp8wjkS96
	oA0/Khvs4M+//FwVzczMuuiCCNOx7sjk7kweWUhh19f4BlMIqlxCxKoMXga1NB9Fc46Lw9QrYcU
	as/HbrM6MVVq7alyCVtYpUOeDGjEOx7aCpYAIqYFvWzrwcTwLadqF2DiZDokZrVeNLsyrMSNi1u
	yYC7ipT3YP7noK9Tl/WfCXw2xxRnZIfm8vE5x+oKHd4m/BqOsuTzDSzrKUqokss2VmDS6NQXnQD
	tBqjjg0ftQHkV20Z+FRkd8XdYLBOMNHFXiqQRYdBv5bDudThoEle897bqstefa1DdgnxozIlc4L
	FfvSwUqbdmzcBs9xmBSUJdL0=
X-Received: by 2002:a05:6a00:278e:b0:848:42d0:bc91 with SMTP id
 d2e1a72fcca58-86168595f04mr13515961b3a.12.1788548033030; Fri, 04 Sep 2026
 11:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.4> <178851496374.4131868.18330067911540291337@kernel.org>
In-Reply-To: <178851496374.4131868.18330067911540291337@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 14:53:40 -0400
X-Gm-Features: AcwNN1V76DftAkz9jopx6Xr0LA6PxfVLwujwmR67howR4pkvTvRG1V7HvfjWCRE
Message-ID: <CAM0EoM=5htV5yfiDP2zX3SZ4cUFaT3JZ5aMYMcxBMnUpoiifzg@mail.gmail.com>
Subject: Re: [PATCH net v3 3/9] net/sched: sfq: clamp quantum in change path
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	victor@mojatatu.com, vega@nebusec.ai, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, toke@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 0 (1)
>
> - [High] Incomplete fix: raising the quantum floor to 256 in sfq_change()
>   does not bound the deficit-refill loop in sfq_dequeue()=E2=80=A6
> - [Medium] The reproducer in the commit message cannot reach
>   sfq_change().
> - [Medium] The commit message's justification contradicts the tree the
>   patch is applied to.
>
> Pre-existing issues:
> - [Low] Code/comment mismatch: struct sfq_sched_data documents `unsigned
>   int quantum; /* Allotment per round: MUST BE >=3D MTU */`=E2=80=A6
>
>


Ok, so 4 issues:
1. [High] "256 floor does not bound the deficit-refill walk"
This is valid but NOT introduced by this patch.
This is a pre-existing residual of the same family (the guard belongs
at the refill site in sfq_dequeue(), exactly like the fq_codel case);
Again, it is NOT introduced by this patch and does not invalidate the clamp=
.
Filed as a separate follow-up patch; will reference whatever this
commit is when it gets merged on that followup.

2. [Medium] "reproducer cannot reach sfq_change()"
Valid. sfq_change() is only wired to sfq_init()/add-replace, not
change. Changelog wording issue only. Only if i have to repost.

3. [Medium] "justification contradicts the tree"
QDISC_PKT_LEN_MAX caps pkt_len at 1 MiB on the tree. So i wont do
anything with this.

4. [Low] "comment says MUST BE >=3D MTU"
noted; the 256 floor supersedes the comment's assumption; comment
refresh belongs with any future sfq patch.

Summary:  i dont see anything here either that requires a resend.

cheers,
jamal
>
> net/sched: sfq: clamp quantum in change path
>
> This adds two new checks to sfq_change(): quantum values above 1<<20 are
> rejected with -EINVAL, and accepted quantum values are raised to a floor
> of 256 bytes.  The stated goal is to stop the deficit-refill loop in
> sfq_dequeue() from spinning for a very long time under the qdisc lock.
>
> A few questions on the changelog and on how much of the loop is actually
> bounded afterwards.
>
> >     sfq_change() accepts any non-negative quantum (only rejects
> >     (int)ctl->quantum < 0). With a crafted size table qdisc_pkt_len rea=
ches
> >     ~2 GiB, so quantum=3D1 makes the deficit-refill loop spin ~2^31 tim=
es
> >     under the qdisc lock (a soft lockup / denial of service).
>
> [Severity: Medium]
> Is the "~2 GiB" figure still accurate for this tree?  The tail of
> __qdisc_calculate_pkt_len() in net/sched/sch_api.c already ends with:
>
>         /* A size table can inflate qdisc_pkt_len() beyond any real packe=
t
>          * (via overhead, the data table, or size_log); cap it so deficit
>          * schedulers such as DRR/ETS terminate their refill loops.
>          */
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>
> with QDISC_PKT_LEN_MAX defined as (1 << 20) in include/net/pkt_sched.h.
> git blame puts that clamp at commit 8f735d64382dcf, which is already in
> the baseline this patch applies to, so qdisc_pkt_len() appears to top out
> at 1 MiB rather than ~2 GiB, making the "~2^31 times" number roughly
> 2048x too large.
>
> Given the Fixes: tag will drive stable triage, would it be worth saying
> that the generic pkt_len clamp already bounds the loop in current trees,
> and that the 2^31 figure only applies to kernels predating that clamp?
>
> >       tc qdisc add dev dummy0 root sfq
> >       tc qdisc change dev dummy0 root sfq quantum 1 stab data 32768 siz=
e_log 15 cell_log 0
>
> [Severity: Medium]
> Can this second command actually reach sfq_change()?  sfq_qdisc_ops sets:
>
>         .change         =3D       NULL,
>
> and qdisc_change() in net/sched/sch_api.c rejects the request before
> either the options or the size table are applied:
>
>         if (tca[TCA_OPTIONS]) {
>                 if (!sch->ops->change) {
>                         NL_SET_ERR_MSG(extack, "Change operation not supp=
orted by specified qdisc");
>                         return -EINVAL;
>                 }
>
> For "tc qdisc change dev dummy0 root sfq quantum 1 ..." iproute2 always
> emits TCA_OPTIONS, and __tc_modify_qdisc() falls through to
> qdisc_change() for an existing root qdisc of matching kind, so the
> command should return -EINVAL.
>
> The only live caller of sfq_change() looks to be sfq_init(), i.e. tc
> qdisc add / replace.  Should the subject ("clamp quantum in change
> path"), the narrative and the reproducer be reworded around
> add/replace instead?
>
> > diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
> > index 187d3ed578f26..8bbcfc9e85d94 100644
> > --- a/net/sched/sch_sfq.c
> > +++ b/net/sched/sch_sfq.c
> > @@ -660,6 +660,11 @@ static int sfq_change(struct Qdisc *sch, struct nl=
attr *opt,
> >               return -EINVAL;
> >       }
> >
> > +     if (ctl->quantum > 1 << 20) {
> > +             NL_SET_ERR_MSG_MOD(extack, "quantum too large");
> > +             return -EINVAL;
> > +     }
> > +
> >       if (ctl->perturb_period < 0 ||
> >           ctl->perturb_period > INT_MAX / HZ) {
> >               NL_SET_ERR_MSG_MOD(extack, "invalid perturb period");
> > @@ -688,7 +693,7 @@ static int sfq_change(struct Qdisc *sch, struct nla=
ttr *opt,
> >
> >       /* update and validate configuration */
> >       if (ctl->quantum)
> > -             quantum =3D ctl->quantum;
> > +             quantum =3D max(256U, ctl->quantum);
>
> [Severity: High]
> Does a 256-byte quantum floor actually bound the refill loop, or only
> divide its trip count?  The loop in sfq_dequeue() credits one quantum to
> one slot per iteration and stops at the first visited slot with a
> positive allot:
>
> net/sched/sch_sfq.c:sfq_dequeue() {
>         ...
> next_slot:
>         a =3D q->tail->next;
>         slot =3D &q->slots[a];
>         if (slot->allot <=3D 0) {
>                 q->tail =3D slot;
>                 WRITE_ONCE(slot->allot, slot->allot + q->quantum);
>                 goto next_slot;
>         }
>         ...
> }
>
> q->tail is not advanced past the slot that was just served; the served
> slot is only debited:
>
>         } else {
>                 WRITE_ONCE(slot->allot, slot->allot - qdisc_pkt_len(skb))=
;
>         }
>
> So with a size table pushing qdisc_pkt_len() to QDISC_PKT_LEN_MAX, each
> slot served in one round-robin sweep is left at about -1 MiB, and a slot
> needs (1 << 20) / 256 =3D 4096 visits to become positive again.  New flow=
s
> start positive in sfq_enqueue():
>
>                 /* We could use a bigger initial quantum for new flows */
>                 WRITE_ONCE(slot->allot, q->quantum);
>
> so N flows can each be driven deeply negative by one dequeue before the
> ring wraps.  With flows 65408 (SFQ_MAX_FLOWS) that is on the order of
> 4096 * 65408 iterations inside a single sfq_dequeue() call, with the root
> qdisc spinlock held and BH disabled.
>
> The same arithmetic seems to hold without any small quantum at all: a
> default quantum derived from a 1500-byte MTU still gives roughly
> (1 << 20) / 1500 * 65408 iterations under the same setup.
>
> Would bounding the deficit itself work better here, for example clamping
> or resetting slot->allot when it goes below -q->quantum, or computing the
> number of quanta arithmetically rather than looping one quantum at a
> time?
>
> [Severity: Low]
> This is a pre-existing mismatch and not introduced by this patch, but
> while this validation is being touched: struct sfq_sched_data documents
>
>         unsigned int    quantum;        /* Allotment per round: MUST BE >=
=3D MTU */
>
> and sfq_init() derives its default from the device MTU:
>
>         q->quantum =3D clamp_t(u32, psched_mtu(qdisc_dev(sch)),
>                              256, 1 << 20);
>
> whereas sfq_change() now stores max(256U, ctl->quantum) without looking
> at psched_mtu(), so on a 1500-MTU device a requested quantum of 300 is
> stored verbatim.  Should the clamp use psched_mtu() as its lower bound,
> or should the "MUST BE >=3D MTU" comment be updated?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
