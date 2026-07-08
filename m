Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000238B12F
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552880; cv=pass; b=OVo6H1bNksLYiHPfA3fOgB6YHnykGe8IYnv05RqP5kfJU9nmi2JgDbeTVv3Nve0LPjgSr2IsxuKEEFfq+gNl1/yxOQGO1LeG6AvTGCFn6qnOIwthnc/ucbOIUB2qeG1Zotm0L/EViLnCjUXZ6PX0pLTMrduGxK69D12/3BHjkHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552880; c=relaxed/simple;
	bh=Si58MwwR0R4nPH3wEqDN3oC8Ft08dj098I58rvvbsZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adv/o+5SRX9xcyydFpzNOWnB5SemblZzJX+PH18PwJUhdjTzxL94A8kiyCAl6s+Btk/VNFuddHquZy5MGOhXC8yD2oox+ehDKavLYV3OQi0adp/+yZmymBuhgR6Csc7nm/Tv3MWUoSk6oWeaGOaMmR0w3GgxnME6I9JuShh5HsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PVsBrZ4+; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PVsBrZ4+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84832ec2615so327264b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 16:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783552878; cv=none;
        d=google.com; s=arc-20260327;
        b=HRLLSUDyHq0VNUVTXGs9XeRtYqy7FLTBJT9W3oiO2FIVQ7loREZdeaIPKlKtDCe/73
         pZWY4rYlHiGmow3jmHp4GCrA/AnUTzzeuo/IK8Fe3wrT8Tv+LVh1tdaJPOLn29oTf6iO
         tgPN0lZ5h7tiOoaEgHY/d3Lq6ICN8ycSWjHJk7tBCzyqHETQ12l0DASV2NFPy2sByjNR
         rAV2m7VPvtk+VURtrY1KMCvQx2F/Xzkf2h/TVg69cwzzAiSXYzj4Iue7ymkluD7IUB5v
         1x/ogI5ngFzAONQR0fRzCE6PNXj8afZm0EdnFyZS87C+m5nfyrZyioXBNsiHaeeE9tG8
         tw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Si58MwwR0R4nPH3wEqDN3oC8Ft08dj098I58rvvbsZk=;
        fh=eWiFGlWpcwgK9DKqCC8wwazxYW9yZwBk60E2mc6go3E=;
        b=LXUyghtobL/QGISLyo7d4PLXks/MCkMivQk+wJJTosrGAws+nwHvNM1OhlqciOHZ7r
         o2GLO/UcE8gWPDuKxpn4H1gkTiFcBTDLbf167aJmPi3+DRknj0UsZ+4+k/Y0bSbd7q51
         xqvzWHU/ALylto7Ti6lppyqpyx2GJn2RBobZ8oL4y6eLRcaFTfzBeblQaONHy4IE6O9C
         7lgcN5z4VPLb7UxhEDAiGFp3dp0mwmcwW22RwrZumtLghdXdwE7UHCf2PvvOdm/kWi8F
         kZ7lF/xXfLqOhIPDglay2btfhCsOmAqccDfoJBGAYjHsTf5kSCgPh6U10jfetD2Ek5aH
         Aamg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783552878; x=1784157678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Si58MwwR0R4nPH3wEqDN3oC8Ft08dj098I58rvvbsZk=;
        b=PVsBrZ4+JFgSUFVDXZTfvx5+k91snFFf118B8J8KcRHFYnZ9Q1qXkwL2dcRIyRi5FQ
         J5BFBzBBrHNdP5b81M+Cto4Wizx0ffjYLj7ie2OTjeoEXBlO5Xk9UcBtmOixl9iflEFn
         NrvMiZG95DrkiwXBDiNC/GayJoKQnPQMplMzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552878; x=1784157678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Si58MwwR0R4nPH3wEqDN3oC8Ft08dj098I58rvvbsZk=;
        b=iAeFGLZxPSo8IfY3KYPQUrNXzXaygbTTIMhgn+7HcuLHkvQnQXIs2xi/yVsYg7dd16
         Wscs8SJUwyh6hlOAaJWLJqk4imPqSTaJ1rRuFsTl373HKBm97CNc0L/Ws+d07hgigil/
         E7hPob/IqweEjnQhKd6iWXSlcXFKz1nAu/1ROf7wLp0AmrnyIFx/3gG5LyGErXHNX/Zl
         gDoUPj6R3umIb8xAcjmD7Rs2l8lmskNUe6A+Gw3hnyGO03hX8kVzkFPAGU+nFGC1MXSZ
         VeaTa+bDcJkB0/aMRDlHLGShKfTxbdFa1/hbWk8x885fj9jxldv/u9m2q+tePfvdAHFs
         lnEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpp2GBoBLGXbWqIp/2tSGhUgKtr143byy6p0OmOs/xbJA6OJa1KxegHi6ZdE7Ej8c5qCDUFi9I5Aw87bCPg/tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG/dXRcIKQPF/p+OU6EkAmuVIn9vO/TCK57h3Trex3bkxrFE51
	SzuiovtfoJX41C57s/Cr9p7o1pPO/SjFtM2IR/ZSmCPhGKesiBk9YThYNQA+Ukw1X1EjKa8Tcmx
	yjfQ4Jl3tZ8+bVA835b3FrIHj6cc6DsalmHLqY1/q
X-Gm-Gg: AfdE7ck3t3Ez/WQlm7GjL34tZU35iI9BQ7OWAfbaS8UOD79Y+KJe/O4CBHqiNZi8QIW
	ZU/XOmvwNEB326/aw6MsHn3vHq/ckLXyOswW5EU1c8igq6DgdppGNkQrrZtAYC0ke7ENqW8qquG
	IROdY5k0NwYT2+EePAe+PYvniiD7lvtltwDSROb62ZgKnBq3/LRT7fcy7Rk5DbWZyNgrJXBufZe
	FHUkpnNu9qUxW786ZnOU0H4ukK08pRkXUTmwDTn9nuTiLPyEAeSiVYPqaHP9cG9BHOjEfXbgvTj
	K7vWQ8yRMdJWSH0Klsrqf2FbD6VI
X-Received: by 2002:a05:6a00:4c1a:b0:847:82db:9046 with SMTP id
 d2e1a72fcca58-84842f00dbdmr4365684b3a.26.1783552878209; Wed, 08 Jul 2026
 16:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
In-Reply-To: <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
From: Venkatesh Srinivas <venkateshs@chromium.org>
Date: Wed, 8 Jul 2026 16:21:05 -0700
X-Gm-Features: AVVi8CeP1VoVeqewdtp57_vO2BAV6unD_oVl0VPPp1k1i64pkIKTMSgUeWMHSGA
Message-ID: <CAA0tLEpxE-YAigp-j6jC4pyQTv9vOPbs030Fs3kVFkczC9Etkg@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Jim Mattson <jmattson@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 6:34=E2=80=AFPM Jim Mattson <jmattson@google.com> wr=
ote:
>
> On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> > I will take another look for the next version and try to handle the
> > remaining pieces properly, while also making sure we don't expose stale
> > or incorrectly synthesized decode-assist state for emulated exits.
>
> Naples erratum 1096 seems to imply that the instruction bytes stored
> in the VMCB are not necessarily the same instruction bytes that were
> fetched and decoded to lead to the #PF/#NPF. Hence, in the case of
> emulation, it might be sufficient to read the instruction bytes quite
> late in nested_svm_vmexit(). That would certainly simplify the
> plumbing.

Would not passing through this feature when erratum 1096 is present
simplify this?

-- vs;
