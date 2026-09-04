Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DF44F30CD
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547288; cv=pass; b=Qm9QObqkx4CSJoQ2nxftV3B8buUJtMOZ2Fx40eR6c7zJX0r8TKjNpNpZv+Q4RkIi+AcTR2hjHzSdAWv/MFJ8xJqPM+TUsbgnFNQX920s8oRzpkc8uCAWNTZV4T9BNC0s9tnc/sg8mA0QRB1E7Ow9z0jwgrByRHlpX4dxmYifmPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547288; c=relaxed/simple;
	bh=0a8boaLZnX8G73FWNJYzO3tsM8U3EeqTWuXS91VBzf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4ZEBtDmCtNrOUV51+aSef87cjW3rXYx4aIIS+/LlVCE16BpAhRGLyfPWjFXtnOQwY3Jdjy+OQ2ffN39agzEeKcRRryk3w3lzyqNt2XCsjNNTNJGT+neHuolFjKuweB9WTGxecAqu2laWVbR4ckMZpO3+Rhmi+jUJPUI+CND49c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=m28Mz7RA; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="m28Mz7RA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1295745b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 11:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788547285; cv=none;
        d=google.com; s=arc-20260327;
        b=JPjxeNu6TLMxSRcCWB0pNAwRPY8I0iVLXKgffxYp6l/2ns+sSZEnnLEOmiCoXRlxBo
         zWDb/xSbBASaK4TwOr5BZqjNhsWKo0Yq7sWvCTxjWVCyEk+XsOI65Hb1vDvRiNPUYSVA
         2U0COp3tQu8sWBqz6mtygcsQQbPlUnrQ0EdCA9IbvJzV7VGNdWw0iK4w3j16hndhKrue
         RFs9ZfXMtfVhDYGtw3AE3FZ3t2GglZDt4uDPmnndM9pGaF9HXD7gWMQN/mfn1u2NVcq6
         bf6XcLbvXkb3ZcO3p/+n6lNn+LNGSU7wLtpxuqJP76SVMfueS4zNG3XtyWHe4WD+o57s
         WUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtnjy0NBhZLXSdKKjefRrmWAz1CQIECgQXFHDuXRy0Y=;
        fh=wENj7Mx9Jbq1XghiU9ldRdnm17hxN0crtupwXLvidww=;
        b=e02Et6wymm9pgTiHT9eZ/njXhYXEU2OwBFnfAEn2STmtATuc/VdZrg9CCG2YF3fiV8
         d6Lcxa1wvBFDGpYnp8haF7+hQG4aO8Y6lP8/VGrMmoHETYj8uEaRCL309E63g7vds8G3
         PZcXFlbFAk+tszlN7vWD6zWGm/dZsEVaGYMSDaMdBcPL6bV9b3iexwjoyMLJfG24AUqM
         DBIWGcnJWSh+eJXx4ftWbJ/A5YORrLfFahBRso5SeBgj1auEMS/Ig7f562dApH8Pjn8G
         6duPjGDPHYR8HSNnmSjhMUKIf0BbRTddxOEuxQeU9i7JipEDAGuK+fGL7i9yoapT7tff
         6OYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788547285; x=1789152085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtnjy0NBhZLXSdKKjefRrmWAz1CQIECgQXFHDuXRy0Y=;
        b=m28Mz7RALhN0VE6/w8r3a1yVkpCMPjkgI8PbMqc2Jc/oYM/5PfAvJn9VqEmt0RpmKs
         paBz+iCNDaI88VYvDjYI/jbwdRAMYLKenuZVm9ac5hmodSUv5J3Ku46co8n8m9BBKcBy
         wfbKL+U3mWn6zTPWW8RFIypqS/Mp3Yb9k8BDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547285; x=1789152085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtnjy0NBhZLXSdKKjefRrmWAz1CQIECgQXFHDuXRy0Y=;
        b=Aj6XpWYgPP8JjhOdL103dlxZgtwzvkmp2JOXR25PcZ30fwqDw8n9+OovU9JIsg5Zkx
         b3WtcBSmBncvqoHR3ZrTrfVFHs7MT3zDuh/eG0Ggmx5/SiBsWv8ERtnBQJYAWQIKwoQn
         ifcJjxXGJ6yi2tZCUZKVEyEi/VF0wiGEPKCYV/306EVRmqLSVSmX6d1H9FfZXW18dkCQ
         fxeOs3MqzmMeQ3QOgvj0QC5MlaVyvqUocjqVmSxwLTJMOiytWwE2/1T+pd9kNHRMpXMZ
         nMqPSusFLbuUfboP+K+d0PBFbqwef9hpMIdFYOprd7mS5cEMUtYSKTVs/aKQ3nKqnYjy
         WxxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvoTb2uLoe7u/zJa2ik9ncqrxE+swZp5jC8Veb2Bzh63ci9Q/5+wx1NhAB9LoiNU4FgNPqGaEtuvTp8ZbMguA=@vger.kernel.org
X-Gm-Message-State: AFuF++nt/5O3tyUQcv9heMeNCzG6na9qP9EP3WKCYCg9GJgPUcYwiPv7
	XAt6quGtIMp/eI2t8OSp5IHckOnTepeQ0v9h9lyIbUACgisAlwvsd1S+ygB+/+ze7XGwWFIUIGi
	c/nXs5lVt7k085v0v3ZzcWUv71kTNyt7g41c2hq4S
X-Gm-Gg: AYBFou14gxhqa65zJWh96hqasmYgLT9DNnlLwT9d25M1wIQk4+2/T9qNUCgCnBT3tbb
	PdosN5UzOjQRJaappxI+MD/vHL01HAcxFwXdli39n/4bP0aK86yvLttYIkgp2S7pGDM+Nn+5+wU
	qKW1bCKE9WI8GnH77Fp3L8+UG+FvgsogRh86Z/fp9W/fQ4Ka0aqHpSltjqN5XbFOqFmTi/RcUec
	9JhKMyNMlUMd9s0R+KlJ5HgfQX9i+gCnwnIj06iHOW5sNGrxuRDMVeH11V6gm1G9uTgLII+T/u6
	tTurcLFsDlMfi1s13OZQTGim1uaubdmC4LsPWIOxUCKzU+uw2uCv/JprXHQ5ltb5pDh9xJrErL1
	ZlMAByAerMz8222gL4mCWDyU=
X-Received: by 2002:a05:6a00:2303:b0:848:63c9:ee39 with SMTP id
 d2e1a72fcca58-8616a36d54emr11309586b3a.12.1788547285398; Fri, 04 Sep 2026
 11:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.2> <178851496241.4131868.3916017237623578286@kernel.org>
In-Reply-To: <178851496241.4131868.3916017237623578286@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 14:41:13 -0400
X-Gm-Features: AcwNN1W6P-mL-JIrG8q0wt2k27IK74hQFzObyTqZtK921nhY9FGOGGa8wOW28Kw
Message-ID: <CAM0EoMmYTNnCkC27AM4OL6h99NYR1ruk0DqtAJwr1PX050sMag@mail.gmail.com>
Subject: Re: [PATCH net v3 1/9] net/sched: fq: clamp quantum and
 initial_quantum in change path
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
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
>

Man, this is going to be more time consuming than I anticipated. I may
not going to be able to respond to all today.
I am going to summarize my responses here.
Summary: I dont see need to make any updates, but I will if something
else serious shows up on the other patches.


Here are my conclusions on your findings:

1. [Medium] "pre-patch behaviour misdescribed". This is a valid
complaint. The changelog was misleading.
It's a freaking changelog, a human wouldnt label it as "medium"
priority - but you do. I will fix if i have to resend.

2. [Medium] "fq_change() no longer rejects out-of-range quantum"
IMO, Valid as a behaviour description (0 now installs 256 instead of -EINVA=
L).
Intentional: the clamp is the fix; the d9e15a273306 reject was
protecting against the same small-quantum hang this floor now prevents
by construction. The err-flow note (later blocks now run for an
otherwise-invalid request) is real but harmless: no error path was
reachable for out-of-range quantum alone, and the attributes are
independent.

3. [Medium] "Fixes: 709f34f7c28d wrong"

Partially valid: The iq_range INT_MAX that this patch narrows came
from 7041101ff6c3; the change-path floor itself is new hardening. If I
have to resend will point Fixes: to 7041101ff6c3.

4. [Medium] "initial_quantum -ERANGE is a uAPI break"
initial_quantum > 1 MiB has no functional use (burst-credit only), and
the flood-amplification risk is what the bound is for.
The changelog could name the compatibility break; noted for a future resend=
.

5. [Low] "tdc coverage for the new bounds"
Valid.  Will add fq.json cases (quantum 0x100000 vs 0x100001, quantum
0/1) if the series is ever resent.

Overall conclusion: no code change requested for this patch as
accepted on-list; documentation/attribution notes only.
So only if i have to resend..

cheers,
jamal

> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 4 =C2=B7 Low: 1
>
> - [Medium] Commit message misdescribes the pre-patch behaviour and the
>   severity of the bug being fixed.
> - [Medium] fq_change() no longer rejects an out-of-range TCA_FQ_QUANTUM.
> - [Medium] The `Fixes: 709f34f7c28d ("net/sched: fq: add overflow bounds
>   to quantum and initial quantum")` tag does not identify the commit=E2=
=80=A6
> - [Medium] Narrowing `iq_range.max` from INT_MAX to 1<<20 makes any
>   configuration that sets initial_quantum above 1 MiB fail with -ERANGE=
=E2=80=A6
> - [Low] The tc-testing case 10f7 "Create FQ with invalid initial_quantum
>   setting" uses `initial_quantum 0x80000000` (2147483648), which was=E2=
=80=A6
>
> --
>
> net/sched: fq: clamp quantum and initial_quantum in change path
>
> This narrows the netlink policy range for TCA_FQ_INITIAL_QUANTUM to 1<<20
> and replaces the range check on TCA_FQ_QUANTUM in fq_change() with an
> unconditional clamp to [256, 1<<20].  fq_init() now also clamps its
> default quantum to the same range.
>
> A few questions on the changelog and on the behaviour changes.
>
> > The fq change path accepts TCA_FQ_QUANTUM in [1, INT_MAX] and
> > TCA_FQ_INITIAL_QUANTUM up to INT_MAX, while fq_init() already clamps to
> > [1, 1<<20]. A user can override the init clamp via tc qdisc change,
> > restoring the small-quantum deficit spin that the init clamp prevents.
>
> [Severity: Medium]
> Is this description of the pre-patch behaviour accurate?  The code this
> patch removes from fq_change() is:
>
> net/sched/sch_fq.c:fq_change() {
>         if (tb[TCA_FQ_QUANTUM]) {
>                 u32 quantum =3D nla_get_u32(tb[TCA_FQ_QUANTUM]);
>
>                 if (quantum > 0 && quantum <=3D (1 << 20)) {
>                         WRITE_ONCE(q->quantum, quantum);
>                 } else {
>                         NL_SET_ERR_MSG_MOD(extack, "invalid quantum");
>                         err =3D -EINVAL;
>                 }
>         }
>
> so the accepted range on the change path was [1, 1<<20], not
> [1, INT_MAX].
>
> Also, 709f34f7c28d only touched fq_init(), where the clamp prevents
> quantum =3D=3D 0 arising from 2 * psched_mtu() wrapping.  quantum =3D=3D =
0 was
> already refused by fq_change() with -EINVAL, so what exactly could be
> overridden through tc qdisc change?
>
> On the "spin" itself, __qdisc_calculate_pkt_len() in net/sched/sch_api.c
> already bounds the stab-inflated length:
>
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>
> With QDISC_PKT_LEN_MAX =3D=3D (1 << 20), the fq_dequeue() refill loop
>
>         if (f->credit <=3D 0) {
>                 f->credit +=3D q->quantum;
>                 ...
>                 goto begin;
>         }
>
> terminates after at most ~2^20 passes for any quantum >=3D 1.
>
> Would it be more accurate to state that the residual gap closed on the
> change path is quantum in [1, 255]?
>
> > Fixes: 709f34f7c28d ("net/sched: fq: add overflow bounds to quantum and=
 initial quantum")
>
> [Severity: Medium]
> Does this Fixes tag point at the right commit?  709f34f7c28d changes only
> fq_init().  Blame at the parent of this commit attributes the fq_change()
> quantum handling to 3725a269815ba6 (2015) with the 1<<20 upper bound from
> d9e15a2733067c (2020), and iq_range.max =3D INT_MAX to 7041101ff6c307
> (2023).
>
> The reproducer in the changelog
>
>         tc qdisc change dev dummy0 root fq quantum 1 stab ...
>
> goes only through fq_change(), so it would behave the same on kernels
> predating 709f34f7c28d.  Since stable selection keys off the Fixes tag,
> should the tag name one of the older commits instead?
>
> > diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
> > index 6144b5686f13f..35f940b2205df 100644
> > --- a/net/sched/sch_fq.c
> > +++ b/net/sched/sch_fq.c
> > @@ -980,7 +980,7 @@ static int fq_resize(struct Qdisc *sch, u32 log)
> >  }
> >
> >  static const struct netlink_range_validation iq_range =3D {
> > -     .max =3D INT_MAX,
> > +     .max =3D 1 << 20,
> >  };
>
> [Severity: Medium]
> Is this an intentional uAPI restriction?  With
> NLA_POLICY_FULL_RANGE(NLA_U32, &iq_range), validate_nla() now returns
> -ERANGE during nla_parse_nested_deprecated(), so
>
>         tc qdisc add dev dummy0 root fq initial_quantum 2000000
>
> fails outright and fq_change() never runs.  Values above 1 MiB have been
> accepted since 7041101ff6c307, and unvalidated before that.
>
> What bug does a large initial_quantum cause?  In sch_fq.c the only uses o=
f
> q->initial_quantum are the two assignments in fq_classify()
>
>         f->credit =3D q->initial_quantum;
>
> plus the dump, while the refill loop in fq_dequeue() adds q->quantum.  So
> initial_quantum looks like a per-new-flow burst knob that cannot drive th=
e
> refill loop.
>
> Should the changelog mention the compatibility break for existing tc
> scripts?
>
> >
> >  static const struct nla_policy fq_policy[TCA_FQ_MAX + 1] =3D {
> > @@ -1106,14 +1106,10 @@ static int fq_change(struct Qdisc *sch, struct =
nlattr *opt,
> >                          nla_get_u32(tb[TCA_FQ_FLOW_PLIMIT]));
> >
> >       if (tb[TCA_FQ_QUANTUM]) {
> > -             u32 quantum =3D nla_get_u32(tb[TCA_FQ_QUANTUM]);
> > +             u32 quantum =3D clamp_t(u32, nla_get_u32(tb[TCA_FQ_QUANTU=
M]),
> > +                                  256, 1 << 20);
> >
> > -             if (quantum > 0 && quantum <=3D (1 << 20)) {
> > -                     WRITE_ONCE(q->quantum, quantum);
> > -             } else {
> > -                     NL_SET_ERR_MSG_MOD(extack, "invalid quantum");
> > -                     err =3D -EINVAL;
> > -             }
> > +             WRITE_ONCE(q->quantum, quantum);
> >       }
>
> [Severity: Medium]
> Is the loss of the -EINVAL here intended?  After this change,
>
>         tc qdisc change dev dummy0 root fq quantum 0
>
> returns success and installs 256, where it previously returned -EINVAL
> with the "invalid quantum" extack (that rejection dates back to
> 3725a269815ba6, with the upper bound from d9e15a2733067c).  Values in
> [1, 255] that were previously honoured are now silently rewritten to 256.
>
> There is a second, less obvious effect: this branch can no longer set err=
,
> so the later blocks in fq_change()
>
>         if (!err && tb[TCA_FQ_PRIOMAP])
>                 err =3D fq_load_priomap(...);
>
>         if (!err && tb[TCA_FQ_WEIGHTS])
>                 err =3D fq_load_weights(...);
>
>         if (!err) {
>                 sch_tree_unlock(sch);
>                 err =3D fq_resize(sch, fq_log);
>                 sch_tree_lock(sch);
>         }
>
> now all run for a request that carries an invalid quantum together with
> priomap, weights or a new buckets_log.  Previously such a request was
> refused as a whole.  Was that change in behaviour considered?
>
> The same file still rejects out-of-range band quanta in fq_load_weights()
> with
>
>         NL_SET_ERR_MSG_MOD(extack, "invalid weights");
>
> and fq_codel_change() keeps the split convention:
>
> net/sched/sch_fq_codel.c:fq_codel_change() {
>                 quantum =3D max(256U, nla_get_u32(tb[TCA_FQ_CODEL_QUANTUM=
]));
>                 if (quantum > FQ_CODEL_QUANTUM_MAX) {
>                         NL_SET_ERR_MSG(extack, "Invalid quantum");
>                         return -EINVAL;
>                 }
> }
>
> Within this patch, TCA_FQ_INITIAL_QUANTUM is hard-rejected at parse time
> while its neighbour TCA_FQ_QUANTUM is silently clamped.  Could the two
> adjacent attributes signal out-of-range input the same way, i.e. keep the
> -EINVAL for quantum above 1<<20 and only clamp the low end?
>
> >
> >       if (tb[TCA_FQ_INITIAL_QUANTUM])
>
> [ ... ]
>
> [Severity: Low]
> This isn't a bug, but is there test coverage for the new bounds?  The
> tdc case 10f7 "Create FQ with invalid initial_quantum setting" in
> tools/testing/selftests/tc-testing/tc-tests/qdiscs/fq.json uses
>
>         initial_quantum 0x80000000
>
> which is 2147483648 and was already refused by the old INT_MAX bound, so
> it passes identically before and after this patch and would keep passing
> if the 1<<20 bound were reverted.  Case 845b uses initial_quantum 900000,
> below the new bound, and the only quantum case 2390 uses quantum 9000,
> inside the new clamp.
>
> Nothing in fq.json exercises 0x100000 accepted versus 0x100001 rejected,
> and nothing exercises quantum 0, quantum 1 (the reproducer named in the
> changelog) or quantum above 1<<20.  The series does update tc-testing for
> the ETS clamp but adds nothing for fq.  Could fq.json be extended along
> with this change?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
