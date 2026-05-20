Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA632D0CC
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 03:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246744; cv=pass; b=jUhY3z3eY90gzbjGzU0R1hEnCHI0Mu51eKbjOenzu2gOMSVx7U4jXebwoaas2y7qvtQOJUt479amNxuNsFrlS0B3nufC73P1o9oFLYCeTo2hH62/u5SgzsjA2v5pNmGxhTgvadfVdaIhXJkexwCFsDIuhAnk9JtUIxnY8ieohFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246744; c=relaxed/simple;
	bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgA5m1kIFZGg/AJezzs72dM/426XmDTaGpRaiZ6FMwClH31JUiincudmN7bjsMDV/9OS86mHjI2mcKqNtwg5YPqpL5t40cvvD1Pbr2vsQF3bRAgxJJdm1k+R96KG8FZeOnr8US9tiQAUzryft7WvsQlMRsQURQGuAtBZfTdpKcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeoyhOPV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeoyhOPV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bce57c132b2so1023475666b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 20:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779246741; cv=none;
        d=google.com; s=arc-20240605;
        b=ktn5y6wx58nqL3S99YspBVEhFVnf6g/bNzk7v17NodY+1vdeYmMNF1rNU99IQoGmVL
         qcNLMOaAysIqiC09RAsN0wK2DGYPVCo2CNaXoFnC7kZ+qYNfMm9/7u6EDEBrppd7a/26
         cJqaim+vWUCfjZxOGVh57sTIOon6chU0JKKhBPGoiKDdQchGoaZTxyZj2g8S/kHNsUSL
         dLKI+MPl/u6/UWAhakgvXMIkqyTpZU+Bi1ESQImsQqapGVxv+7AuE2cBeb9sQmh/dKFj
         aO+aMvxdodchPjNIu5oJJL3wHyjje54V3CdUaK+UFG++UJw/qv1lgY2Tuwzf5FRJVRJW
         HRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        fh=upJiYVe8aohDVrd0bzAFSlp/nQyNbsl7fo2PoJ9pUW4=;
        b=h7P08GWGEVqGnAffEJKOcuUAZYARolAedqTR7fgrHkmTgigRY3xCaJ9iFOba81K21u
         rb7f7pohsfCzPGjviU90H/oT2TV87rjQQeovjCCt9BV5ebk6uhoNp/kOOG44uSxyx9PZ
         SbCBDmPqAT3eTiH1ZRqf2vt9MDIbZN726KtQhSlh7+FA5Qjq2n1cPwmTXpJ7fXlzZ5c/
         bNlysVPLOxpPYaCQojAk8ZWy+BEVUO3WUkiv3qXKLZhZmPCkUycwqUn62LZeDp633/XS
         YIKgiqfihEL2Mz2lToZH/yf2msTocllGWTTqeD9PN9cMko8pG7TOKqeS+Ex6Sn9tgh+P
         Cc1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246741; x=1779851541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        b=YeoyhOPV5sKrbofkwxsSxP3WPdccEUSvVpdmOdwbfcxgzaur8OSMmUykKafMs7HiNd
         XuT2BOJmZNbSD/b5QhYrvbJN7SZ7puEVsuf/XIS1vXO4IFc5UVx2PDdiN6NvLyJEZHki
         o6PFpUCWYPkodJ1Tr5UzX18EP4LqGHnkAj/R9+aUgepEX4cnDMcp5dADgCavEsZJxZWJ
         0UJo6kx/sYDHD4SFuPkwDJZW7hTcaN3QfD+7s0p8YZaMTlT/q4/miW4/yINShwjbbmK6
         d5wfRKYGdMsMthoyzRtN1qaiwFg5/Mqq/BEt3TSiulqdWJ/Xntw85YA5Ev+s7weaJbta
         kmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246741; x=1779851541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=31w5bysxtSHbCjagIfc69GHYMAiXOOKtv+UCMGhiGQY=;
        b=DWECDxk96XqxPkRXs1Pj20LR2Sw8KGQEJtOZfyHoTmxSq4ejsu5v1h/geiZZgn0i7s
         2Hv6Lu2O3vtYdQ8QP4yzCA0LBNURr1hC+A0xLjOXjzCipWcmflECrD+v9P04qJyA7jIu
         iUZfY8/Cs0O1LhQslKksp0ptf4KMh8Ukym7+7sEvlQIpcgRzlo6p9p2z4qvVBxyIXkyT
         yFmloPFqb1DScvuPhD+ycbOtW1Aaw6IeaePlYBD1BPghQlr28f6orKTLyCc0R1wPcZge
         S7u31X3xDwv8Nu06Ta9EVZHVE5xFUVfMXdMbpY6tfq7c8AsZ8A+3dc5LLqqH08rhJkow
         W39w==
X-Forwarded-Encrypted: i=1; AFNElJ8c6BlTz2xxJcrNQMlbm6EkcwY0nPCJh1UfWLboBSt/c4yqW/YkiHcwHwjrbR+Huhm/WYy9iQUeRKMkWH1aVs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYT6qhkeuYeyyO5alPJwI60kz52cAcQ3flM2EGS1r2H0yXmlzJ
	L/mP6vuD5KytCNHCa1L02BlWDRMC42DBTaWPAT0ce6JGL3WfWh0/N8d2TGgw6fA3FPzzZn9vjHK
	+AJwBTH5VhDMM88wwEsmliZ21E03xSo8=
X-Gm-Gg: Acq92OHQ55F8Z5YATH+feprXXYYiThnGuINW4L0hUQL3DaaUOYVw75X54P2D5Sms5NP
	qyIHj/ZTaKjvojR9wqGr4lpZuX1vfhuLDfyudKOaS8kHoi9hLS/gQGwJ0dYdRQQNLvEWO6gFeHK
	6O3BYWYQn4kah+KU2AOlRPrbAfRSWpT6Vvguhx2sSbESEJsW/NoF5p/NHV93w5sEEzkv+gBY3m4
	Nfq18RzO3xm9m/2UxxqWd7JEClnWdWrWzjDRQ9YuI7Yf6eCopkDtwM7smzFrzjtSFEV9c4Wz8B5
	LMq5Zvymea4wpfGSBSQ/sXtdIt0c8egdk0DnnBbG9A==
X-Received: by 2002:a17:907:1888:b0:bda:24df:21c with SMTP id
 a640c23a62f3a-bda24df0842mr166491266b.17.1779246741329; Tue, 19 May 2026
 20:12:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com> <20260516182556.66af27a9c63208435911990b@uniroma2.it>
In-Reply-To: <20260516182556.66af27a9c63208435911990b@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 20 May 2026 12:12:08 +0900
X-Gm-Features: AVHnY4KTNuJSbb9D4nUNQUegv6_rAFJNR8Egb-FQK8FpKvIA1CC8ZYCh7vjvMDc
Message-ID: <CAGCJULPdm8jbveZsUm467_LBHRf5g=Jqd=XvCVKdNE1F2U99jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Justin Iurman <justin.iurman@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, stefano.salsano@uniroma2.it, ahabdels@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 1:26=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma2=
.it> wrote:
> RFC 9433 Section 6 is titled "SRv6 Segment Endpoint Mobility Behaviors",
> but Section 6.7 defines H.M.GTP4.D as "SR Policy Headend with tunnel
> decapsulation and map to an SRv6 policy". This behavior receives IPv4
> packets and is not bound to any SID, so it does not fit the endpoint
> model that seg6_local implements. Placing it there required relaxing the
> ETH_P_IPV6 guard to accept ETH_P_IP and adding input_family to
> seg6_action_desc, for a single behavior that does not share the endpoint
> model.
>
> seg6_local is not the natural place for this behavior. The UAPI cannot
> be undone once merged, so where it should live needs discussion on the
> list before we proceed.
>
> Given the volume, moving the MUP code into a separate seg6_mobile.c
> (say CONFIG_IPV6_SEG6_MUP) would keep seg6_local focused on the RFC
> 8986 endpoint framework.

I will move the MUP code out of seg6_local into a new
net/ipv6/seg6_mobile.c under a new Kconfig symbol, and register the
behaviors under a new lwtunnel encap type rather than
LWTUNNEL_ENCAP_SEG6_LOCAL.

For naming I was thinking CONFIG_IPV6_SEG6_MOBILE and
LWTUNNEL_ENCAP_SEG6_MOBILE to match the file name, but I have no strong
preference over CONFIG_IPV6_SEG6_MUP if the list prefers that.

Once LWTUNNEL_ENCAP_SEG6_MOBILE is its own encap type, it feels
natural to me to put H.M.GTP4.D there too rather than adding a
separate LWTUNNEL_ENCAP_SEG6_MOBILE_HEADEND. What do you think?

> I think this patchset should be broken into smaller patchsets, one per
> behavior, each with the behavior, its selftest, and any needed helpers as
> separate patches. The same approach was used for End.DT4/End.DT6 and
> End.DT46. End.M.GTP4.E alone is ~1.2k lines in a single diff.

Will do, following the End.DT4/End.DT6/End.DT46 model: one patchset
per behavior, with the behavior, helpers, and selftest as separate
patches. The new code will be aligned with seg6_local.c style as
part of this rework.

> The series reuses SEG6_LOCAL_NH6, SEG6_LOCAL_SRH and SEG6_LOCAL_OIF with
> semantics that differ from the existing behaviors. NH6 today means
> next-hop in End.X/DX6. This series reuses it as DA replacement in
> End.MAP and as prefix template in H.M.GTP4.D.
> SRH is inserted verbatim in End.B6/B6.Encaps but augmented per-packet in
> the mobile behaviors. These attributes have established UAPI semantics
> from their existing behaviors. Giving them a different meaning in new
> behaviors is a UAPI semantic divergence.

The mobile behaviors will define their own SEG6_MOBILE_* attribute
namespace under LWTUNNEL_ENCAP_SEG6_MOBILE, with no reuse of any
SEG6_LOCAL_* attribute. That keeps the established SEG6_LOCAL_*
semantics untouched.

> The selftests use OIF on all five GTP behaviors to select a VRF for the
> lookup, but that is what TABLE and VRFTABLE are for (End.DT4, End.DT6).
> OIF in the existing behaviors means output interface (End.X) or L2
> egress device (End.DX2). VRF support is a nice-to-have that can be added
> later as a separate optional attribute.

I will drop VRF support from the initial behaviors and revisit it
later as a separate optional attribute.

> The user-facing parameter names and their semantics are defined in the
> iproute2 series (where the man page lives), so that is probably the
> better place to discuss keyword choices and attribute naming.

Thanks for the pointer.

> We could think about a prep patch introducing SRv6-level drop reasons
> (SEG6_INVALID_SRH, SEG6_HMAC, etc.) that both the existing behaviors and
> the MUP ones can share.

Good idea. The prep patchset would introduce the SRv6-level reasons
(SEG6_INVALID_SRH, SEG6_HMAC, ...) and convert the existing seg6_local
and seg6_iptunnel call sites to use them. The mobile-specific reasons
(BAD_SID, BAD_GTPU) would then be added together with the first
behavior that uses them and reused by subsequent behaviors. NOMEM and
MTU_EXCEEDED would be dropped in favor of the existing generic
reasons, and the current INVALID_SRH_SL / BAD_INNER misuses would be
replaced by the new SRv6-level reasons from the prep patchset.

Would you prefer to lead on the prep patchset yourself, or would you
like me to prepare it?

> Selftests for the five GTP behaviors heavily depend on python3 and scapy
> heredocs embedded in the shell scripts for packet construction and
> validation, which adds an external runtime dependency. A statically
> compiled C helper would remove it and avoid embedding python heredocs
> in shell scripts.
> A few cases worth covering: SRH and no-SRH input paths where the
> behavior accepts both, missing SRH where the behavior requires
> it, malformed SRH, and invalid attribute values.

I will replace the python3/scapy heredocs with a statically compiled
C helper for packet construction and validation, and extend the
selftests to cover the cases you mention (SRH / no-SRH input paths,
missing SRH where required, malformed SRH, and invalid attribute
values).

> The dst problem is pre-existing from 7a3f5b0de364 ("netfilter: add
> netfilter hooks to SRv6 data plane") and affects seg6_iptunnel too. Both
> issues need a robust fix before this series can go in. I want to look at
> this myself and will Cc you when I do, as the five new behaviors may need
> to be adjusted on top.

Thanks for taking that on. Given the cb/dst issues you described, I
am inclined to drop NF_HOOK support from the initial mobile behaviors
and add it in a follow-up patchset once your fix lands. The initial
behaviors would then do a direct input -> output flow without the
cb-context/finish-callback pattern, which avoids the issues entirely
on day one and decouples this series from the pre-existing fix. Does
that work for you, or would you prefer NF_HOOK to be present from the
start and rebased on top of your fix?

Thanks,
Yuya
