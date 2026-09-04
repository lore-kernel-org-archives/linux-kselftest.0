Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5C3D47C8
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557786; cv=pass; b=kZQNhkIwZdT/wMchlVngetqFmOOUJWDPGQmVOR2JvHLFk5iTCWiNJO84mTKMu+KyESSmCqmxkxkZwHarmEHWa+tm38jzcumYwvQpjetQvTf7VIq2dfKkAcPFPpDXHPbRRQ4/fFx8BAuSRWl22H8DsAIpnW84r4ZlO3fQzTPXHCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557786; c=relaxed/simple;
	bh=3lo3qrRtIe4+ljGHirIsW2nt6lBq86dk1MmVX4naxMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=My8aDnfEU27baIERB9EsRLMtpJ8Q6l48MUmig2bpV1AlXKCKrS7LyU8otfOKSeI34CwYPt5eHXnc0OgHNL+XvXi5di0DuoM726TQdjaPrsS31bTod8Vzv4TlCHsNiWZaMBkieVVkS9+uvQpvmBIy4AHl0UB1cdZ0xOKuEwKvqjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=XQasX8BB; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="XQasX8BB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1008682b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 14:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788557784; cv=none;
        d=google.com; s=arc-20260327;
        b=Rz5CmpyEE+qoul6ck/O5db9CaKXqwPFnB66UfdepIfNHtfIuzRdOCprlqdpTsjrT8w
         e3Ks2YvlObECguRtsOAPO1TdTUUJ084zsIG1gqaQU8JpPCL1Epajkx228SrcOB3wD/+m
         kKfTdtTVje7eTFkVS6NdG/KH8HgG9Av3y63uBiBbjirwTfPCCbi9BGWUqZcQTGptEcbh
         7FnNp4OVuevjO0q9UCIY2wu+SNx6SQkkkogslccVl5wj69/xjIdKNlj390oxPF56ix8W
         Mo8Lm03vjBHlpSFAc+p/g+JA35yYo522dxR/g1hnxyWfMebFWmfu2X0Rlw1jEUxkRsY7
         uwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo4x4Ggaou9AjUhv6Fk871jpbvjAaDAFo132WJylUiw=;
        fh=FKg7VUJuWp1XuTKK7nodoTMRUXCr9eHgRwSu6SKW2zw=;
        b=YzDGEUknfJpWXO0UyAAq50n4eazBi7I/Wdkxi74R9cCLkJROCUfRGI/NiD1xWh8lVb
         pekVBE5Kj5JNx+cK+6En7m38LGeMiC/yb9OSRKOXQdsG6Fy3CZ7+7+BEqiZCao/9hcuY
         u4gw7uCtClh7N3P+6676q5XwV1MuRLxdcKpuZe92havvWpoNHxqONTgN82vL2JtpjcFX
         SDzqb36q83gr43lY5ToIUmMZUR5oRdx+qcIdVHInUiexRaRI0140k5z/EOir98ICXC1V
         iIZdRjOXJRgT3aLthuORKkMuPoaS50RCD7nFYS2kyb5k7tkr9L+la87pS12XYBUD6UBC
         lVPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788557784; x=1789162584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jo4x4Ggaou9AjUhv6Fk871jpbvjAaDAFo132WJylUiw=;
        b=XQasX8BBn6HPKEfCOfoksO69qSLUdV4xSBh849uhPn5EzMOcuMiJp5gq+tCRclFZAu
         jvHo3Sju7XJBZT/2vLFZ4FQq5FbTn8ghvZ23tif+xDN1rJSysNv2j6zcvd8HdUE2SrAU
         dMXu33RCcamKorPANiOupCXGN1nd23oOroiPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557784; x=1789162584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo4x4Ggaou9AjUhv6Fk871jpbvjAaDAFo132WJylUiw=;
        b=nqngFsYvIawsqUrUeCigtlX6XGszSv1G/2w6qhE3Z1q6RQeFUc7bcgcMj6P25kwR4W
         bTO4fsLz+49CsHJ9U6sVFRiAmdAm+q4E3kJhvGsvcoGvAyJFbXje7CKODG2niZ9m9zSe
         xJbkVEtT7OpnluSzmn/Kn2pfblWEkFN1iGL0CZqGHfyxjEK3KKurYDyqwjrzhnYI+lUo
         tbEnMjBXPeuk4GB7cncrQVXNf3pcLsz9pGZ2+EZa2yVK8xNTS8BO4EP8Z8LEpuV5QTga
         VSejlIPoLAwA/Guq3xuKekgNSjs3SSfBu/hlCF7eV7uxh4/lm6JrhKzBy/gSeQ4+luRi
         nMKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKYpfaSOXkrkh+1ABhCB4NL0fdK4j4AbtD+4zu4aF8xfgOwj96X9fx5GKBGEg2hHauhzRoc7zriU/niWey8hU=@vger.kernel.org
X-Gm-Message-State: AFuF++l81YAE7vapuLWOVgEXx73LmhtG0rcLoJ0ymexVhVkbcNCNdYS6
	dAW/9LZb3lhc6nPVW25rwI0pAzVOANXa+zxrl2BucaNoLQZ1Dsl7MbJRlZ2xM8MWBDy4lQTdOyx
	7IGtPPYdJmb0jGd5K99Q6IujdpWx0nDOeTwgwHkLI
X-Gm-Gg: AYBFou1mNuRNHEt4sodsk1+5W6QAvqW4xlCQZcaZNQJLUQ46wfssShzE86mZz2R6aeS
	SOAJUn+mppaoesupRlH4LEQWcp3hv0rKQ7fyhesR4UtEJP6M1G7JVGSZghAqTk0C3nrRpHO17nS
	3q/u7GYsmWjP+R50WRlxsN8MCuVOw/5ZVnhtzXBlhfKXmWlkP8/c6psFftZveEMTv64u9hkqTr4
	WEFLaWrVSiNII5OXJMTLFo78TxUzwnqjGU/yoHRiJaMNtT6VubgNXS+mJOirrFgHHWXIz4IwLeO
	Xbb8TChhN3gQRW8SON2jasm2Qs8plmqtyWfc+RnKp/eszVj/GOBcdZ1K86eRFWOIN1V5wMjYcCl
	49aT0xs98TTl7qG6alqMK9vk=
X-Received: by 2002:a05:6a00:3c89:b0:853:2e35:ad84 with SMTP id
 d2e1a72fcca58-8616858e931mr10880855b3a.14.1788557784154; Fri, 04 Sep 2026
 14:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-0CFC.v3.20260901204856@mojatatu.com.10> <178851497140.4131868.17681128693200676725@kernel.org>
In-Reply-To: <178851497140.4131868.17681128693200676725@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 4 Sep 2026 17:36:12 -0400
X-Gm-Features: AcwNN1XA0CNvG31L9KVaV2Dah6gb_K5L-qSmSxWhn4H41Crfa2y7-yoRIruaIMY
Message-ID: <CAM0EoM=7mQbKeWzUbRrUK7BuQ0e0KJmH8SyLpNfPgm8-hKUqvw@mail.gmail.com>
Subject: Re: [PATCH net v3 9/9] selftests: tc-testing: update ETS test 41f5
 for clamped quanta
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
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0 (1)
>
> - [Medium] Incomplete selftest update / undisclosed behavioural change:
>   the accompanying commit 0bbbcd21591a ("net/sched: ets: clamp quantum=E2=
=80=A6

Note: the e51a/e7f2 breakage branch is wrong (verified: iproute2
rejects the literal 0 client-side, both tests pass on the patched
kernel per our tests).
Note2: The underlying point is fair, though: the error-contract change
for TCA_ETS_QUANTA_BAND =3D=3D 0 deserves one changelog sentence.

> Pre-existing issues:
> - [Low] Concern that test 41f5 ("ETS offload with out-of-range quanta
>   clamped") only checks the software qdisc dump via `tc qdisc show` and=
=E2=80=A6

That matches the file's existing goal; the retired sum-wrap case is
indeed unreachable with the 1 MiB per-band ceiling (16 bands x 1 MiB
<< 2^32).

IMO, other than the changelog change for "medium" - nothing else to see her=
e.

Phew! Cant believe i went over all that. I thought this new era was
about keeping up with huge influx of bug reports - but the influx from
the bots is higher. I am sure the s/w quality will improve but man oh
man this is too much work (change the changelog, no human has ever
asked me that!)

cheers,
jamal


> --
>
> selftests: tc-testing: update ETS test 41f5 for clamped quanta
>
> This updates tdc test 41f5 in qdiscs/ets.json so that its name and match
> pattern reflect the new quantum clamping to [256, 1 << 20] introduced by
> "net/sched: ets: clamp quantum in parse and fallback paths".  The test
> still passes "quanta 4294967294 1 1" but now expects "quanta 1048576 256
> 256" in the qdisc dump.
>
> > diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.jso=
n b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> > index ee09e6d6fdf3c..d2eab61c099a8 100644
> > --- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> > +++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/ets.json
> > @@ -987,7 +987,7 @@
> >      },
> >      {
> >          "id": "41f5",
> > -        "name": "ETS offload where the sum of quanta wraps u32",
> > +        "name": "ETS offload with out-of-range quanta clamped",
> >          "category": [
> >              "qdisc",
> >              "ets"
> > @@ -1002,7 +1002,7 @@
> >          "cmdUnderTest": "$TC qdisc add dev $ETH root ets quanta 429496=
7294 1 1",
> >          "expExitCode": "0",
> >          "verifyCmd": "$TC qdisc show dev $ETH",
> > -        "matchPattern": "qdisc ets .*bands 3 quanta 4294967294 1 1",
> > +        "matchPattern": "qdisc ets .*bands 3 quanta 1048576 256 256",
> >          "matchCount": "1",
>
> [Severity: Low]
> This isn't a bug introduced by this patch, but a note on what the renamed
> test now covers.
>
> The verification is only "$TC qdisc show dev $ETH", which reports the
> software qdisc quanta.  The quanta actually handed to the driver are
> filled in separately by ets_offload_change() in net/sched/sch_ets.c:
>
>         qopt.replace_params.quanta[i] =3D quantum;
>         qopt.replace_params.weights[i] =3D weight;
>
> and netdevsim's nsim_setup_tc_ets() in drivers/net/netdevsim/tc.c does
> nothing with them:
>
>         case TC_ETS_REPLACE:
>         case TC_ETS_DESTROY:
>                 break;
>
> so nothing tdc can observe reflects the offload request itself.  That is
> pre-existing and matches the idiom used by the other cases in this file.
>
> Separately, since each quantum is now capped at 1 << 20 and there are at
> most 16 bands, is the u32 sum-wrap condition the test was originally
> written for still reachable at all?  If not, the rename retires that
> coverage without a replacement.
>
> [Severity: Medium]
> Should the two neighbouring tests in this same file be updated in the
> same patch?
>
> The kernel-side commit in this series also removed the explicit
> zero-quantum rejection from ets_quantum_parse(), which now reads:
>
> net/sched/sch_ets.c:ets_quantum_parse() {
>         *quantum =3D clamp_t(u32, nla_get_u32(attr), 256, 1 << 20);
>         return 0;
> }
>
> The previous "ETS quantum cannot be zero" -EINVAL and extack are gone,
> and nothing else in the path rejects 0: ets_quanta_policy declares
> TCA_ETS_QUANTA_BAND as a bare NLA_U32 with no range, and
> ets_qdisc_quanta_parse() only runs __nla_validate_nested() plus the band
> count check before calling ets_quantum_parse().  A band quantum of 0 is
> therefore clamped to 256 and the qdisc is created.
>
> Tests e51a "Zero element in quanta" and e7f2 "Sole zero element in
> quanta" still encode the old behaviour, for example e51a:
>
>         "cmdUnderTest": "$TC qdisc add dev $DUMMY handle 1: root ets quan=
ta 1000 0 800 700",
>         "expExitCode": "1",
>         "verifyCmd": "$TC qdisc show dev $DUMMY",
>         "matchPattern": "qdisc ets",
>         "matchCount": "0"
>
> If tc forwards the literal 0 to the kernel, which is what 41f5 suggests
> given that it passes 4294967294 and 1 through unmodified, then the add
> now returns 0 instead of 1 and "tc qdisc show" prints "qdisc ets", so
> both tests fail.  If tc filters the 0 locally the tests keep passing but
> no longer exercise any kernel check, and nothing covers the new
> accept-and-clamp semantics.
>
> Either way, could the removal of the zero-quantum -EINVAL and its extack
> be mentioned in the changelog?  Neither this commit message nor the
> kernel one notes that the netlink error contract for
> TCA_ETS_QUANTA_BAND =3D=3D 0 changed, and sch_drr.c deliberately kept its
> explicit zero reject.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-0CFC.v3.20260901204856%40mojatatu.com
