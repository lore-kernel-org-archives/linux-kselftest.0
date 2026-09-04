Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA643DDDC1
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557391; cv=pass; b=Z4g7gpr/qvQVDNiipTf3ZaJybUzXWLWhSjZBidi/dVqGV7x34s9rZuGUNuq3KkkeGicZ06fsyqiRllwpP9Ik1YbzQhoACjwIRyMSyBz0gsgQ6e08sIpEaNBQrKAZXUFtMch+VlHvZGPVszxQXKeEn/odlgs08dIsuagfGIFaaWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557391; c=relaxed/simple;
	bh=3d1vkgI84hQBi3kuPYOf5ln8pN5idT6w9VdywJOlu+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOEB2WQp/j7T1gpyHceUM6+yaigOjctSzLU9ouRE8R8Zae0mHx5z6K28mXFXGhgsd/+olfxFBDjE5NMszw0cH1zmHAF0RSofEww4w9iYggOFfJf5z48Eff7MOWrywhqj9GEEEAR/nkFJ9s5PGPIDnxalELg1L8USa9cteej1+xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=c9g5T1ex; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="c9g5T1ex"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853c07a76adso1349034b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 14:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788557387; cv=none;
        d=google.com; s=arc-20260327;
        b=f1dYTqNv0OPGyorgeTcyese3Ug81aetWBYPJBtwN+IxvtDI6gtEdWtjp7vPN2M6kFh
         tNCRcN0HL70UeF6yjqQusrywtj98+XCSuNDq1gnRuuRDH4kAC3IPp7AFls/QKEYudXkP
         Fs0qk9vjThptfrohVFWMH+z4TeMlC1WSajM+gxC1LlGFQkPILRStzbitjAeDMEMbzGsb
         HsNmnalxDMR2yWuVot/TCsSF+wP4oRu+MbiZ/5zg4vX5UYC9upxAdgzOErNScvcmySk+
         TLvZ0OxSPkUKb2eqXmW/GIk/lRcEb/r6qbCbfU9RPnzK8NMcwvCMY+sZ9akDL2eid9Ee
         rTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYuo2e9/LK+OYjvIIcV/9NWInrCLREGV2FS/gJsKCmc=;
        fh=W9NvSxKQG9uGeNyt/Eqoi7BT+m9ZYOrMlmYDcq/VTcg=;
        b=LHnfkrQJodHIrxdWA2as3C5ilTKhdjs8WeDv/gzL/bWjgL5BOORPHIMgiN5bdbjCUQ
         dmJp1SkADKOJDBvwgCZ6cJuyt/UeTH0G7734wH6/FWui5UE8IN2ftwZILVaLaxBcJekR
         wA4e/Hp0XR7ZnI8uWY/njLG17SI0ZHrtDnBqxUmUJmp5i/5PouVBD9F2lAd3KNhR4wGL
         bbie2diz2MpXS/3tmIbprD0zSH0XpOMCQ1Ysqz0Si9HTnrNG7O5BWPWEIghDjtd7Irxz
         Wu/ocNCjy4LAN5Ce9wV7E6q47T/uH6gmAsd1TNcfbfogVJ/AH5inGYKPXLjbOAEsjNBh
         wRWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788557387; x=1789162187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYuo2e9/LK+OYjvIIcV/9NWInrCLREGV2FS/gJsKCmc=;
        b=c9g5T1expr5/T2mbEPXvZ83Ssya2QaMbLsmjnJwOxG+o3NnvsjFlMTP6rKmuWYKLD1
         Td8AGFZ+0duUNHUs3zIFmIZLymeo9UcP8tBB466pLM8VzsruXkE9LTxVk52dVId2YBo8
         UwMre5JXWaMtH7MO7/neT4ykcL6il6n7LPOec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557387; x=1789162187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYuo2e9/LK+OYjvIIcV/9NWInrCLREGV2FS/gJsKCmc=;
        b=l4cqQxLF4e8LEhVHnfdrseM1flRmF1CQ/sSU5JozWeFGFQ1i4SeIw16K6txiXLKvsZ
         yTBtRg19RtVR0HLWHEETHAEBy5AUntxKArTzzHR2pUz9OeY35++ToiRuWAGj+NosLvMW
         6pdMY0jmz/iRN+wUYN2MLeSbcvJefQafP79+j7LjVCgTEFOe4/YNHluKgAArpdQ+ExXN
         tg7aA+CMlI60O0y+WNN6oqRBiTRqBA4N11/Y4VSoC0WBQcOYf7+W0aZDxNlTXer/6lWK
         Vu8J2NNMqZotqAj2hbptnmQCbF/xI4ZOgRP6X6IQCipFtUO+9cIDPqbFFI3oXElgYFIz
         PN0A==
X-Forwarded-Encrypted: i=1; AKwUvBxBirsrb/0rQvJXmk/P5KcLLVP1+0cyJXMFCOcjaX1Gd66PTCCPJpaE7K1gXEbLfg9asPptE3C++ZFytSOtVCE=@vger.kernel.org
X-Gm-Message-State: AFuF++k3Eg7vF9w0NqaFpb+FPxIm6NFrk0NpycJM8MuRFSOvbqIDNEvt
	9a4sUWa41mCqVx9rtVrN/Pn66UNArdJzk5fZdiiYG0Lb75M60N98Y7I3+c+XG/zemUaR/w900xv
	Lbl6Pt8CQc6YYuVkpT41NMJ80r/gro2SUEiRtTL0j
X-Gm-Gg: AYBFou0+j+7oCCSzRTEYnVsm9RVPUdGFv6oBKKXRlI1692fr5vHUmg80W3jBZigclKX
	74fgcMV4LbTkAtw2IAKrfl7qvhA+ajLP+89BztOjfOoPPuu19obAfbD2YpOhZys2mW7SxEB+4oF
	XqOgtMezyGRy2jZGtlT74TNMmFDSPiC8v6LLpKhvPsfNP17jr0tKC9d6T8kDokf78Oe/zqqfbSP
	4la0vwKlDYBd6MBfvabDYqtw3awNroMu7czWELEVJQYAmghaDrgkBPz+93Vnps1HVXNwbeqpORC
	E5H5Uav6Y77ImHsdOHIbejMoGcdhWgKh5Kf6mu+m2gCDcclyAueHh2ACNd86wFDKwgkPCm4L+Ox
	+ywkWpTkEjHNW1WZKMwgcCG4=
X-Received: by 2002:a05:6a00:808a:b0:857:72f8:dc97 with SMTP id
 d2e1a72fcca58-8616977b053mr12667765b3a.24.1788557387074; Fri, 04 Sep 2026
 14:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.9> <178851497008.4131868.6834762541956235085@kernel.org>
In-Reply-To: <178851497008.4131868.6834762541956235085@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 17:29:34 -0400
X-Gm-Features: AcwNN1VgjJiDKuhAvHiF0siM9pZXFRYtiT4AAxHA52SjWBc9duKRFlown7YPYKA
Message-ID: <CAM0EoMmd4_0qS=PWyGkbrpUenZK=5r_d1-ZNfF=+hraFVKApQw@mail.gmail.com>
Subject: Re: [PATCH net v3 8/9] net/sched: ets: clamp quantum in parse and
 fallback paths
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
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 1
>
> - [High] ets_quantum_parse() (net/sched/sch_ets.c:82-88) no longer
>   validates user input at all: the explicit rejection of a zero quantum=
=E2=80=A6

Well... same argument as previous patch on drr.
The suggestion to mirror drr's reject-then-clamp (keep -EINVAL for 0,
clamp the rest) is reasonable but only if i have to resend.



> - [Medium] The clamping added to ets_quantum_parse() contradicts in-tree
>   tdc test cases that are NOT updated anywhere in this series.

Disagree.
Our own tdc tests show 386/386 pass on the patched kernel:
iproute2 rejects a literal 0 client-side, so e51a/e7f2 never reach the
kernel with 0. The tests keep passing; they just no longer exercise a
kernel-side check.

> - [Medium] The commit message's "Conditions to recreate the bug" command,
>   `tc qdisc add dev dummy0 root ets bands 3 strict 2 quanta 1 1`, cannot=
=E2=80=A6

Valid.
with bands 3 strict 2 the first quantum lands in the last non-strict
band and the second value trips the band-count check (-EINVAL, tdc
fe3c). The recipe should be `quanta 1` (single value) with a huge-MTU
device.
Iff i have to resend...

> - [Medium] The changelog's causal premise =E2=80=94 "With a crafted size =
table
>   qdisc_pkt_len reaches ~2 GiB" =E2=80=94 is stale for this tree.

More changelog wording.. if i have to resend...

> - [Low] The comment introduced in ets_qdisc_change() states the fallback
>   bands get a "quantum of max(MTU, 256)", but the code immediately below=
=E2=80=A6

 cosmetic; correct as written since psched_mtu =3D mtu + hdr_len.

Summary:
Only the "high" issue might be worth considering (for consistency with
drr, not that it breaks anything)
Others is just Documentation/changelog, some worth changing if we resend.

cheers,
jamal
> --
>
> net/sched: ets: clamp quantum in parse and fallback paths
>
> This moves the quantum floor from the psched_mtu() fallback in
> ets_qdisc_change() into ets_quantum_parse(), so that both explicitly
> configured quanta and the MTU-derived fallback are clamped to the range
> [256, 1<<20].
>
> A few questions about the changelog and about the parse path below.
>
> > net/sched: ets: clamp quantum in parse and fallback paths
> >
> > ets_qdisc_change() falls back to psched_mtu() with no floor for bands
> > without an explicit quantum. With a crafted size table qdisc_pkt_len
> > reaches ~2 GiB, so a zero psched_mtu on a headerless device makes the
> > deficit-refill loop spin under the qdisc lock.
>
> [Severity: Medium]
> Is the "~2 GiB" premise still accurate for this tree?  The baseline alrea=
dy
> carries a 1 MiB cap on qdisc_pkt_len:
>
> include/net/pkt_sched.h:
>     #define QDISC_PKT_LEN_MAX   (1 << 20)       /* 1 MiB */
>
> net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
>     ...
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>         qdisc_skb_cb(skb)->pkt_len =3D pkt_len;
> }
>
> with the comment there saying the value is capped so that deficit
> schedulers such as DRR/ETS terminate their refill loops.
>
> If qdisc_pkt_len cannot exceed 1 MiB, then the only non-terminating case
> left in ets_qdisc_dequeue() is quantum =3D=3D 0, where
>
>         cl->deficit +=3D READ_ONCE(cl->quantum);
>
> never grows and the while (1) loop spins under the qdisc lock.  That case
> comes purely from the unfloored psched_mtu() fallback on a device whose
> MTU + hard_header_len is 0.  With the 1 MiB packet-length cap plus the ne=
w
> floor of 256 the loop is bounded to 4096 refill passes, so the fix looks
> adequate; could the changelog describe the actual current failure mode
> instead?
>
> > Conditions to recreate the bug:
> >   CONFIG_NET_SCH_ETS=3Dy. Requires CAP_NET_ADMIN (namespace-local via
> >   unshare -Urn suffices).
> >
> >   tc qdisc add dev dummy0 root ets bands 3 strict 2 quanta 1 1
>
> [Severity: Medium]
> Does this command actually install a qdisc?  ets_qdisc_quanta_parse()
> starts assignment at the first non-strict band:
>
> net/sched/sch_ets.c:ets_qdisc_quanta_parse() {
>         int band =3D nstrict;
>     ...
>                 case TCA_ETS_QUANTA_BAND:
>                         if (band >=3D nbands) {
>                                 NL_SET_ERR_MSG_MOD(extack, "ETS quanta ha=
s more values than bands");
>                                 return -EINVAL;
>                         }
>     ...
> }
>
> With bands 3 and strict 2, the first quantum lands in quanta[2] and band
> becomes 3, so the second quantum hits band >=3D nbands and the whole add
> fails with -EINVAL.  The tdc case fe3c (bands 4 strict 2 quanta 1000 2000
> 3000, expExitCode 1) encodes that same kernel-side rejection.
>
> The quoted command also has neither of the two ingredients the message
> says are needed: there is no size table (stab ...) to inflate
> qdisc_pkt_len, and dummy0 has psched_mtu() of 1500 + 14 rather than 0.
> Could a reproducer be given that reaches the psched_mtu() =3D=3D 0 fallba=
ck,
> so the Fixes: tag can be evaluated by stable backporters?
>
> > diff --git a/net/sched/sch_ets.c b/net/sched/sch_ets.c
> > index 25fcf4079fece..6cc902a038387 100644
> > --- a/net/sched/sch_ets.c
> > +++ b/net/sched/sch_ets.c
> > @@ -83,11 +83,7 @@ static int ets_quantum_parse(struct Qdisc *sch, cons=
t struct nlattr *attr,
> >                            unsigned int *quantum,
> >                            struct netlink_ext_ack *extack)
> >  {
> > -     *quantum =3D nla_get_u32(attr);
> > -     if (!*quantum) {
> > -             NL_SET_ERR_MSG(extack, "ETS quantum cannot be zero");
> > -             return -EINVAL;
> > -     }
> > +     *quantum =3D clamp_t(u32, nla_get_u32(attr), 256, 1 << 20);
> >       return 0;
> >  }
>
> [Severity: High]
> Does this change user visible behaviour in two ways that the changelog
> does not mention?  The changelog only says the floor is moved into
> ets_quantum_parse().
>
> First, the -EINVAL for a zero quantum disappears.  ets_quantum_parse() is
> the sole validation point for TCA_ETS_QUANTA_BAND, reached from both
> ets_qdisc_quanta_parse() and ets_class_change(), and it can no longer
> fail:
>
>         tc qdisc add ... ets quanta 1000 0 800 700
>         tc class change ... ets quantum 0
>
> Both used to return -EINVAL with an extack; now they succeed with quantum
> silently set to 256.  The extack argument and the int return of
> ets_quantum_parse() are both dead now, and the if (err) branch in
> ets_class_change() is unreachable.
>
> Second, a new 1 MiB ceiling is applied to explicitly configured quanta, s=
o
> quanta 4194304 1048576 (a 4:1 ratio) becomes 1:1, and quanta 1 1000000
> becomes 256:1000000.  The installed band ratios and the weights handed to
> hardware in ets_offload_change() then differ from what was asked for.
>
> The mutated value is stored in cl->quantum and echoed back by
> ets_qdisc_dump():
>
>         if (nla_put_u32(skb, TCA_ETS_QUANTA_BAND,
>                         READ_ONCE(q->classes[band].quantum)))
>
> so user space can only discover the change by re-reading and diffing its
> own configuration.  The declared policies still advertise the full u32
> range:
>
>         static const struct nla_policy ets_quanta_policy[TCA_ETS_MAX + 1]=
 =3D {
>                 [TCA_ETS_QUANTA_BAND] =3D { .type =3D NLA_U32 },
>         };
>
> Would it be better to follow the sibling patch in this series,
> "net/sched: drr: clamp quantum in change class", which keeps the explicit
> rejection and clamps afterwards?
>
> net/sched/sch_drr.c:drr_change_class() {
>     ...
>                 if (quantum =3D=3D 0) {
>                         NL_SET_ERR_MSG(extack, "Specified DRR quantum can=
not be zero");
>                         return -EINVAL;
>                 }
>                 quantum =3D clamp_t(u32, quantum, 256, 1 << 20);
>     ...
> }
>
> Only the internal psched_mtu()-derived fallback needs the floor for
> ets_qdisc_dequeue()'s refill loop to terminate.
>
> [Severity: Medium]
> Do two in-tree tdc cases still assert the removed rejection?  In
> tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json, case e51a
> ("Zero element in quanta"):
>
>     "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quanta 1=
000 0 800 700",
>     "expExitCode": "1",
>     "matchPattern": "qdisc ets",
>     "matchCount": "0",
>
> and case e7f2 ("Sole zero element in quanta"):
>
>     "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quanta 0=
",
>     "expExitCode": "1",
>     "matchPattern": "qdisc ets",
>     "matchCount": "0",
>
> After the clamp, 0 becomes 256, the add succeeds, tc exits 0 and the qdis=
c
> is present, so both cases fail on expExitCode and on matchCount.  Exit
> code 1 in this file is the kernel-rejection code (cf. f7c8 and fe3c),
> versus 2 for tc-side rejection in 65b6 and 9877.
>
> Diffing ets.json between this commit and the end of the series
> (2ebfd9fc19fbc4d4615473751bf847fc57e820fa) shows only case 41f5 changed b=
y
> "selftests: tc-testing: update ETS test 41f5 for clamped quanta", so e51a
> and e7f2 are still broken at the tip of the series.  Could they be update=
d
> in the same series, or the zero rejection kept so they keep passing?
>
> For completeness, the related 41f5 concern (the dump no longer echoing
> quanta 4294967294 1 1) is resolved later in the series by that same
> commit, which rewrites the pattern to "quanta 1048576 256 256".
>
> >
> > @@ -632,11 +628,13 @@ static int ets_qdisc_change(struct Qdisc *sch, st=
ruct nlattr *opt,
> >                       return err;
> >       }
> >       /* If there are more bands than strict + quanta provided, the rem=
aining
> > -      * ones are ETS with quantum of MTU. Initialize the missing value=
s here.
> > +      * ones are ETS with quantum of max(MTU, 256). Initialize the mis=
sing
> > +      * values here.
> >        */
> >       for (i =3D nstrict; i < nbands; i++) {
> >               if (!quanta[i])
> > -                     quanta[i] =3D psched_mtu(qdisc_dev(sch));
> > +                     quanta[i] =3D clamp_t(u32, (u32)psched_mtu(qdisc_=
dev(sch)),
> > +                                         256, 1 << 20);
> >       }
>
> [Severity: Low]
> This isn't a bug, but the comment says max(MTU, 256) while the code below
> it computes min(max(MTU, 256), 1 MiB).  The upper bound is missing from
> the comment, so on a device where psched_mtu() exceeds 1 MiB the describe=
d
> behaviour and the actual behaviour differ.
>
> >
> >       /* Before commit, make sure we can allocate all new qdiscs */
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
