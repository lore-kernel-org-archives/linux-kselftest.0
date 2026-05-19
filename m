Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAED327C0D
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159324; cv=pass; b=u8srqn5aof9V5MtDJMJeCHDEWQSjvv1IXCM7AGWf3AK4AMgFAT1Y9B7QkP6zPFxVG445kHV4wk++8EAfW4QIzIWBJXINr0bCR9WKZ/ZNLxo6Z8hWlYhzYd9e5KRZGj/pGr4mVIvvbj1gegy8uoxHtzBV4IyFpsBslJJWzPX9mYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159324; c=relaxed/simple;
	bh=7UyJCqBRdDQbRUMfdCvNywEZmQykXXP5gBZZWpmEPYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX2il3HHfz/M1Esjuuecb3mkUXrOfrMwRP8GiIGTyPlvrLeq9v8UZlVNcuK5hb7Pdf7nokk8WwFDC8/kAFEl5RLPo/I6pVeSGIcdjT+ehUWvGP4xbDfN3r00yybsPyPAVze4N3cYGReLwJsAXj85ml0vNxV9ZRYloQlAv8Ph2DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LHig9NhB; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LHig9NhB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bd266f6fc0so14268505ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 19:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779159323; cv=none;
        d=google.com; s=arc-20240605;
        b=DBc8oRE7nPFtSMbmQDfTzppTqDcAT4PJgBndcelND+PyZZonitzKgo06XMr/GfGj7H
         vdzygJ8L/JPbB0el+r8lPJR1caWd73/EC/ZsMmWGoiYZzncXYToENnl/4SLQP+2PqpMb
         s8LnEah9sUqKJa5YUm+5NS/8ImvuBZ/YppCH5zaBkBdGmfUFX1F2MLtIn/S4C1BN/HyQ
         dvlaNEafoINgge6A10CKR5Njgi7vOeRkAWw5G054XSNcq6o5ZBPv1/+6x0HIbXS8tRfD
         ndMtIuCJDt/gmde+eGwPHPv4FmpzyZPNiizzw7/Vt0sV3qxLVxQe2yPqnfoxy/tdkw6k
         F05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        fh=E7NiPvydiXEt8oZyun2lSzAGbSSVUl3SS6Apiqetpmk=;
        b=agBX0j7qJLEfBSPPCGB53pf2TCHm2i8xCkzE0vSRd2UTbN7jbqBMTAkZYgjblVjQOF
         pybvMiQsBiM/2i2tPvqW/5S/XLeZ1pPvvhi/DejGgV+WMvKYwuQZWtBiQuAdC/jih5aa
         Hx2wD9BFeXPBYSg7EwHP42/bKsB87wqW/4uFhMAgJVDbGDNgNA0mP92OlP4hbbce2MyY
         z/oCRe06kqJIT8pEqtbLQ8D2mzuNvzGi7LzxLmVpCDOjLpp+kf1OxeNaMSp42hQqTj5o
         TiuwKFE3+Y1rkCtwz5iLvac200VtXpCXov1hVcWwb67iMO6+dkx3CLqTCKw37ga8RAN0
         820g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779159323; x=1779764123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        b=LHig9NhBYcp4lvu9FsDgRb8HDOdpTciWKsFU0bX2LCajRvpkNxObfIMDmhbSB8zXoM
         y7KuHzobb9crsODCEHkINJ38esHDaFhWFxEsNa/7rSvANhMEbWEOjH7/CUoPeU01RGz2
         orqC8Np5R/PrR6zsxIfNkWHQc2puRSbAmXmob1Jvx2P0JMBZj16WkbRJobH2GXBGpbUq
         AaJuMKdEsWXtAV2E7Uq3T/B9Y1otAYfrPiruwuhkQXXK3IOAY5heSjjvxAkbq2biXcQo
         CHbyGUzBuM8FEuHef0eEWxXyqV0D7IG3N4PKmgkIiEtcb8LPpw9+5aB0+qaDFmanYJVr
         0ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159323; x=1779764123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48t5Wp7GpUaD4JVHMYGaZTa+PdE+2hwEulXY2P1l2dE=;
        b=cYJcqfzJxhzO4JeANc5Mq2irQRK9pAHgiTOFonEL1/Iu/d4Yg+/oDlMEd3sCPoLUbQ
         ljuqv551mxtkglszs/VCjrrthAfwDoPHW8HEO9GidTJ5kFGysPDHjJ14mszCY5efniUX
         BgxMeIU9xpLIWZwYf7x2koWr1mr/neeeTwJMY93ikZJHCjuoG0pHL0t1SlpiLwduMjkc
         rpiTVXYFRkv0DMcXjzGQviGZD9Bvlidt21M98UR1dCWq8+ezl5bMz3aTFz9Ed5UYjusL
         NrXRLxg3ymWFdHF8YIZA1dlwN2lFZXYZoXTvawwAtZDNzxO0sKvDLXfhVGoPxz4dZ5dE
         cGdg==
X-Forwarded-Encrypted: i=1; AFNElJ8btKYv0VuwGNZGtKHwfHgY6DCLbV3SzpejHEkE4EA/Y90JAczRc9OxxJDksopHr9a6Wryum2BqAOZIyk239rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKt7morV54o46bQJ96G8USqX1Kpv2a30JrHKQaQfkonTyawmr
	5v5q47BlhYmY1zZFgU6UyI2EyLhBlhbOZsDjXzeyoDk6xpxAYioK2iaD7qu3x0m6YuaB6Gws1E2
	1tXxAuppaH1Xh/jyh6yeMWz2GXLvR64KP/9Z6srQn
X-Gm-Gg: Acq92OGb+8/YnhNTa2lI+v4kVsedr0nFdxSa6rd5M6ImtVr1ThUjBJpr7tFQn4bZYlJ
	P2qhxXOFpOYHhRJ2nEDhAPLdf7LYvaH4IwOAeLey8eHdyz33N3NV13HUpNj6mljhjNZpJ8aDFd2
	g3Rc2MjMZflg8LJsuRSc30uArPFtp0XxMnmUIB3bZJn33adwCWEPgFiTAD2AK+OPCx+muoU0P58
	wTSJBbbETXo3IZyoN52pNeEU38uHjWQz63/9X+r/rIbmJiI4XR/GzkTIS7/frnojF7lSr/q9VSO
	7xnaeQc=
X-Received: by 2002:a17:903:17cd:b0:2bd:8938:b811 with SMTP id
 d9443c01a7336-2bd8938b845mr174842955ad.34.1779159322627; Mon, 18 May 2026
 19:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
 <CAPhsuW5jQOzRTi1ea+=UPhx5W9bkBdivPagRE=O=nx0zf_vb8w@mail.gmail.com>
 <CAHC9VhTGDOJZDzEA31qc0S6FJpYNC4oD__HQ-65wqqwhng=V9Q@mail.gmail.com> <CAPhsuW7Js0Z6tU30RphbUjWsJXETkxaGOArfGZpDjNPmZFUpuQ@mail.gmail.com>
In-Reply-To: <CAPhsuW7Js0Z6tU30RphbUjWsJXETkxaGOArfGZpDjNPmZFUpuQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 22:55:10 -0400
X-Gm-Features: AVHnY4IvhqH391i3RQ33XvQXVamFfTLljbGCppZ7t8Skv2w-HCikKnYPe2_pXNI
Message-ID: <CAHC9VhRiDyGT6R+yqxS_oMBSiD6x01HNTb9jWq6B55sfdDkqbw@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 8:01=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Mon, May 18, 2026 at 4:57=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Mon, May 18, 2026 at 7:23=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > > On Mon, May 18, 2026 at 2:29=E2=80=AFPM Paul Moore <paul@paul-moore.c=
om> wrote:
> > > [...]
> > > > In my opinion, making killswitch an LSM is more of a procedural ite=
m
> > > > that deals with how we view a capability like killswitch.  I
> > > > personally view killswitch as somewhat similar to Lockdown, which i=
s
> > > > why I made the suggestion.
> > > >
> > > > The use of kprobes, while an interesting idea, presents problems as
> > > > allowing any kernel symbol to be killed introduces the potential fo=
r
> > > > security regressions.  As a reminder, some LSMs, as well as other
> > > > kernel subsystems, have mechanisms in place to restrict root and/or
> > > > enforce one-way configuration locks; while many people equate "root=
"
> > > > with full control, in many cases today that is not strictly correct=
.
> > > >
> > > > Yes, kprobes have been around for some time, this is not a new
> > > > problem, but killswitch makes it far more convenient and accessible=
 to
> > > > do dangerous things with kprobes.  If killswitch makes it past the =
RFC
> > > > stage without any significant changes to its kill mechanism, we may
> > > > need to start considering more liberal usage of NOKPROBE_SYMBOL()
> > > > which I think would be an unfortunate casualty.
> > >
> > > I don't think we can use NOKPROBE_SYMBOL(). There are functions
> > > that we don't want to killswitch, but still want to trace.
> >
> > That was exactly my point, but we need to figure something out so
> > killswitch doesn't make it easier to cause a regression.
>
> killswitch is making it easier to fix a CVE. It can surely make it easier
> to cause a regression. AFAICT, the only protection here is "it is only
> for root".

As I mentioned earlier, several LSMs have the ability to restrict root
beyond what is possible with traditional Linux accesscontrols.  For
example, with SELinux one could deny root a specific privilege while
also blocking changes to the SELinux policy; the root user would not
be able to restore that privilege without rebooting the system.

On a killswitch enabled system the ability to restrict root is lost as
root would be able to kill the enforcement of those access controls.
Presumably one could have the LSM block access to killswitch in this
particular case, but that defeats the purpose doesn't it?

The audit subsystem also has a somewhat similar one-way configuration
lock, which when set does not allow even root to unlock it, a reboot
is required.  By a bit of luck with regards to how the code is
written*, it may not be vulnerable to a killswitch regression but I do
wonder if there are other similar things in the kernel which would
have the same type of problem.

* This is probably the first time I think I've ever considered myself
lucky with respect to the audit code implementation.

--=20
paul-moore.com
