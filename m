Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EBB503BCF
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549540; cv=pass; b=hGbpTmP2ysXHDSNiM0RC/ThM+u+gLYfDyjJMDCwfJpdouRiR6MQFsptaMiu5tSE2RKi8CmsdT301fKdEEoqZ7XMcZfdk5C7dD6OV13uM+UXLD5G395tnzKDTmqTP+M3uMt1PwXSTUMEzjOvSrQtggqQT/U3w+2+57wkHaV354L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549540; c=relaxed/simple;
	bh=T8oGRVZetWW4BSbiptnI+0JfOFjftBlNlKsV291GxEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnxD/ps95RSXRdTmjhC0Zt9VifiRyQ8sJxV8vCEXRNej5L4Tlsco0ApWSzFVoM4paa7IvNcw4CCMhm897esWLvWCgOEHQJQ6YFuf9Sk9/aGmRRFJ4kYmd/CTTNlvUJvQoLW+WcaQft3yFQUuejf3Ng8KjYx7lL4K/ugJbnz1eEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=uFz2pet5; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="uFz2pet5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1180552b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 12:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788549536; cv=none;
        d=google.com; s=arc-20260327;
        b=oZbmcEgDqyEeuoUo6XYazrf94d8a9ZyO4Bu+fhSYwOxAsK/AqR8nMHgxxDNZpjGw8g
         J2wx213VDJcJNARNRGHYKgA6f2wnMELJKTzf0MEo5HLNaJwwuEH7YkbqiIamrMKq0Met
         xkCp47gbqhuh/8EWEBQmIGROv7fB3vVU8hCnp3Ng5sMwbp2sPYfxf8H1ofRyz4em86fx
         FZ1BGcYLjrPdhaaP1+OtGSUgQ91eyO9iOG8uwIcLejSMjFkdYFwL59Ycg7ZimcWkjx4d
         xrHdrxvpa5QXEkKEYooaryJMZ5T+nj54fF/3JvCC/ig2kfb6+OZ3AY6HOK1qVfkLroCj
         5Cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjP2g4bpBWdK8v/XQipjZnBq2wtvRo6JQJKPDpSexCo=;
        fh=Xy9oQAfAKUpNmYZn9h7mIXjhB7wNqTotuEu9J759Wg0=;
        b=abRy3acoP8TCZDCFa4VgSdyOewBNEmb+Zz4LXd++ovZ4K9A4Kw2m+1J5gJFavMWRoX
         c+9zBdzYHswWynCmrkZE6eAFGMwl1EV1+V7SPR9NzJS9tHeBZY08YzxIM+WSaBtMsSta
         QaYJ6eH3WmTMvNxaI9o8thx58E2KmYxpFil010rutcgH405q7SP8vrmZmI0ISYsX+9sZ
         J0hXPnOdutyhZAqb7GcTOjWealWDyPtrm9Kw1iY9rsNsxDyIe8/q16fdCbDrEruhxzJc
         G/RmGbZiNHC7jrT4QyPaWgAJtCVaCO+CCfS+5085MSkHiEc81A3+JAujMzZJNHY2L1PB
         6KbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788549536; x=1789154336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NjP2g4bpBWdK8v/XQipjZnBq2wtvRo6JQJKPDpSexCo=;
        b=uFz2pet5V+1Sq6H5E90V3CifmKP8YRE32/teZ4ILFwzGGDv5Sie7ESXPpqQg5RsT/t
         cY1r8rIIVeTY8LWlOzt1ovKaKohoHEYIC2hcs66dIRT/FXCTQZc0ZUAxDdyxBtQLuZDK
         Rk1LMjceEeZLbHuwV858s9Co8zpxRPff5YskQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549536; x=1789154336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjP2g4bpBWdK8v/XQipjZnBq2wtvRo6JQJKPDpSexCo=;
        b=pnpfB1J9AW/GQJfH9imSPY7q9VJg0EVOBbGSytGjBKQodyiFMostzq/u8Erq3mGoXz
         RiOnWMEVtHA+NhQ8ubdcEoDLfBEMxhOlWpGXVF82SSKhUE0fQol3jr4wYrozYxumLUzM
         7+BpfXgMwvlZkulTRuE66hycVsv63N2m4+AUnPzkp1iNMHZmk3ccANPAREWtYuCodC2a
         ToB+5WUHNCgMKvt9ZS3BmsmIqIMuNK9Lr6EMndDp9HH3eS6sQBUaHJ7og3OOlN4PmGoC
         4K2XqB5w4eoZQkxJ5+EpV2ciNc+HLcU1OZRjLxChKV/q/E+ZWL3H5riO92x5oYM5P8Pv
         S2RA==
X-Forwarded-Encrypted: i=1; AKwUvBxSy7/bWkfkqTjo0stkOlkg86pxFuMcr1JCQm11G82zjs6sRBWCQmlj0tVCCJobPLmTynsnGbxNIFzttfw80/8=@vger.kernel.org
X-Gm-Message-State: AFuF++kLUhOzlNUhbuZXlz8l8nhXlpWGrfKjPE29jkEJtk3CtAqV+FnP
	s7wWBd3amo/H5RgyR8QiT+yphdIr1w1WzUL2yp1lW3DBOQVEu/5YOTuB8RwjpW0LKXJuA1NWxir
	O68ewHrt5SL/pKWsiUKBLFnwn4v0mC3ARX9VbJvxv
X-Gm-Gg: AYBFou15c/h9mjoSRQ4wE+Ig0s+0AtBVZOytct9RYoJ+HcdW1hdjRc2IB6zKmGdU9zM
	T7j99x/AUfegaZhoYMARuEGqf127R3FeQb4YmKVhpCoLIRkBFfksSuyJKhh+SuqusYgGG1YX4X/
	M+YyWpllb+Rvm+AF0ttH48GCsGlyiDFMtBkrqBnwNaV+Jnbye5Oz/b7cc66gwjTpWg7/rSzgmum
	dzCb5WmvxZjwHQoyAkQirptT/tdULh0FMiu37RX9wJgvVYx8ctDOD4OsZ6bc+MX3CMsAqfAr3uY
	sKCber8x2yqjy0Om5BbsVEwM63eajo0tfUZpO4xne9xzKfFC4YDJdUEplXz0JHybwd1pssLF6OP
	x/4A/Gd8tdvb3jstaQ+m1Blk=
X-Received: by 2002:a05:6a00:400e:b0:84e:e741:174f with SMTP id
 d2e1a72fcca58-861669c6df9mr13575676b3a.7.1788549536465; Fri, 04 Sep 2026
 12:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.7> <178851496747.4131868.17944512399699900309@kernel.org>
In-Reply-To: <178851496747.4131868.17944512399699900309@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 15:18:42 -0400
X-Gm-Features: AcwNN1WqxnmG7XJP9xus-rjvXfHWjN_e7YaJplwGyG90ehZAnfEN97msYOXBnTM
Message-ID: <CAM0EoM=NzniseZ=5LDAmoRBWXzwYDF6t6QACxt1t51zAH=86+Q@mail.gmail.com>
Subject: Re: [PATCH net v3 6/9] net/sched: pie: clamp psched_mtu in pie_drop_early
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] The commit message's "Conditions to recreate the bug" section
>   does not reproduce the described bug.
>
Valid
The clamp fix correctly hardens the mtu=3D0x80000000 case; the
changelog's reproducer and premise need the `ip link set mtu ...` step
instead.
Documentation-only fix.

Note: same wrong-reproducer issue as patch 5 (dualpi2); both
changelogs blame a stab path that psched_mtu() never reads.


cheers,
jamal
>
> net/sched: pie: clamp psched_mtu in pie_drop_early
>
> The patch clamps the value returned by psched_mtu() in pie_drop_early() t=
o
> the range [1, 1<<20], with the stated aim of preventing a very large devi=
ce
> MTU from zeroing the bytemode drop probability. The change itself is a
> one-line clamp_t() in net/sched/sch_pie.c.
>
> >     pie_drop_early() calls psched_mtu() with no clamp. With mtu=3D0x800=
00000
> >     the bytemode divide silently zeroes the drop probability, disabling=
 AQM.
> >     Clamp to [1, 1<<20].
> >
> >     Conditions to recreate the bug:
> >       CONFIG_NET_SCH_PIE=3Dy. Requires CAP_NET_ADMIN (namespace-local v=
ia
> >       unshare -Urn suffices).
> >
> >       tc qdisc add dev dummy0 root pie
> >       tc qdisc change dev dummy0 root pie stab data 32768 size_log 15 c=
ell_log 0
>
> [Severity: Medium]
> Do these two commands actually reproduce the described condition?
>
> The clamped quantity comes only from the netdevice:
>
> include/net/pkt_sched.h:psched_mtu() {
>         return READ_ONCE(dev->mtu) + dev->hard_header_len;
> }
>
> Neither "tc qdisc add ... root pie" nor "tc qdisc change ... stab data 32=
768
> size_log 15 cell_log 0" changes dev->mtu or dev->hard_header_len, so dumm=
y0
> keeps its ether_setup() defaults of 1500 + 14 =3D 1514.  That is already =
inside
> [1, 1<<20], so clamp_t() returns the same value and the reproducer sees n=
o
> difference before or after the patch.  Shouldn't the steps include someth=
ing
> like "ip link set dev dummy0 mtu 2147483634" (which dummy allows, since
> dummy_setup() leaves dev->min_mtu =3D 0 and dev->max_mtu =3D 0)?
>
> Also, does the size table have any bearing here?  A TCA_STAB table only
> affects qdisc_skb_cb(skb)->pkt_len via __qdisc_calculate_pkt_len(), which=
 is
> already capped:
>
> net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
>         ...
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>         ...
> }
>
> and pie_qdisc_enqueue() does not use it as packet_size:
>
> net/sched/sch_pie.c:pie_qdisc_enqueue() {
>         ...
>         if (!pie_drop_early(sch, &q->params, &q->vars, sch->qstats.backlo=
g,
>                             skb->len)) {
>         ...
> }
>
> Finally, the divide the message blames is gated on bytemode:
>
> net/sched/sch_pie.c:pie_drop_early() {
>         ...
>         if (params->bytemode && packet_size <=3D mtu)
>                 local_prob =3D (u64)packet_size * div_u64(local_prob, mtu=
);
>         ...
> }
>
> and bytemode is off by default:
>
> include/net/pie.h:pie_params_init() {
>         ...
>         params->bytemode =3D false;
>         ...
> }
>
> Since the listed commands never pass bytemode, is that branch ever reache=
d in
> the reproducer?  Could the "Conditions to recreate the bug" section be up=
dated
> to raise the MTU and enable bytemode, so that the Tested-by tag correspon=
ds to
> a sequence that exercises the clamped value and the divide?
>
> >  {
> >       u64 rnd;
> >       u64 local_prob =3D vars->prob;
> > -     u32 mtu =3D psched_mtu(qdisc_dev(sch));
> > +     u32 mtu =3D clamp_t(u32, psched_mtu(qdisc_dev(sch)), 1, 1 << 20);
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
