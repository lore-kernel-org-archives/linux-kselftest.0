Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EF1320A34
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769628143; cv=pass; b=MB3r694gnvRHSLqcgFqpZSpb8v08xhtHCc5HQljcm1k2gWIqCI3iXnxYtPFS74A7vKCmfcMRmOfUGMaaKC+QMajA6dDMWyqrMr2Xo6I6acpobSXX2966QGPWXGVpY76cHUfO0fmbdTsYbDrZENTg1DReRZpmbiHdQxTCZzJNb3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769628143; c=relaxed/simple;
	bh=muM66N/w6WMow/K5blj/8GJE8PANhztwu4Gao3MXNL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/jq4KYIDanT1YEijvWBsE8mfFioSg/NYHynGCcT0Sj67Cc83PCAjRxY8mX3Iqql/j2G2+wpcVvU6vSgcmHxP4YsrAzh0InbncHSAg5sK7esZXyHzQn4Rl5OVjR1TdFDcEpnjDdZi30nPnVoUgYojXsF+Kxi4yqqBynqXyIxq3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g20JaKHk; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g20JaKHk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso1189111e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 11:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769628140; cv=none;
        d=google.com; s=arc-20240605;
        b=BAYaNWdAPY73Cax81StM82xj3+s0n9cfDguTOYtp4ClOWB01hR6uI1HKfcchGMC3BS
         69+qX6JOI/Yba/UPSRBpFrPUDdaYtbqvbeMnTSNmF6okq/1aiOddNkdtw6t9bfjA6Fhe
         Yxfg6bQZ1vtQ25kdKxXfvGRAQG8U6am9dQYB2S/Po54JGDTWcSlNVD6VyzCAQ3RzDrxU
         4Rqqb4tEUR4AfMZjQxD/geZYpDUlpeZv1g6iA1bO8crQw+YZnq0vFjvT0u0pexhPU+zF
         /kuh7HUJu03eGF2xoO+ZwYfsDxdzyQ6Y3X4ZxhFmBbYfZcDyOyRjymgfr0V17AFb2V6r
         sJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=muM66N/w6WMow/K5blj/8GJE8PANhztwu4Gao3MXNL0=;
        fh=ORpVwfQsI41EHRuMS9tQJBi64GNuGsu85m4OpXdFiMU=;
        b=NWAbtaA19XoQ3HVjpXYV4+gPo01MWIqDnrk2ExmnB6e+tstzELBqoX6aDTjxel9x0g
         4J1cxmYiYGPgFkK94YEQBUmkGXkmRCY1n3SWa9ykSa99Q1rmVFTB1sxh936bxK6abKfZ
         Qp6b2ym38PA/EXYNgo8Dhv+dnigQbfUGQysAm5QuAGL0C7zAMznJKuC3AkiuRoN16vwz
         FxdIYgBJM+tXdTISHQTtRnGigN+v4SWkz+2Rscf45+NeRGGFw+2YknDa0H3v/4EaG7mi
         X/kvuj00vymZ9yRx4bAlCo7kSQbYQ9lt3M1rNkRoggrFyJIBA4sSOUvqgEmiH8LEul06
         fFeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769628140; x=1770232940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muM66N/w6WMow/K5blj/8GJE8PANhztwu4Gao3MXNL0=;
        b=g20JaKHkG5DIJyuD5PsbLEKitIgXuQ7qgxNVeS/3JjpIWL75cl7BGG+OvNzXYlf7zJ
         sUMl0zY5ujj/BdsFj/PifyTRCUSBeVxDpkvDgkJHvFxGm6SscXpTBWjEVJBEtlV0ScsH
         QphfEkoMOKlPkb2VZc8sjCaRF1w8Qll6HQm67GbuvAI8zRHZ6fJqjvKZYQQHz/RUH/W4
         euNJI70cbVV/ndYa9U0vEezzNFIX3xEecuKnW3ptSbpnmDNLkVBmzkRoQ1vx/Ew7BR0S
         YgmvOe7CUxAp1X5pRLmJslUX4X+9EhqR9LQczrqAnOlCCejyhqQbVASPnuYUed0YrJIG
         2z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769628140; x=1770232940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=muM66N/w6WMow/K5blj/8GJE8PANhztwu4Gao3MXNL0=;
        b=AR98Tp4Ud1LZCXSVL3x0xKEHfXZqF3MOU2kkwrzw2/3nqctDYsrarb1qsfSdqf6AiU
         bgsDxqa1bDY6lVfSQyy4u61/dPmIrf/GAc2T5gwdbXVvzPe+ZzXn2FH/1CqxV4PS9mZo
         xcbhv0aeoDA1qSKAqyjuQ2jU51LJ2JorPy0yaigcdE9w/vWXmV13h0d/OL6djcJpRQ98
         pJ7c2q1JkN8xn7br0noRYpGvt+CfpNKcUfQjYcenXWjlkrKZU8jM6eXRx96g6ugJDvcI
         6TLSKoBg89VfzJg2jQbtKWMscYKJISGz9L+p1UdVj0gNT6gG+VJrMz5/aOxBHNb/dSPW
         E4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgyUo0UpaSyB6UO/A67Mbkc6UglgtUmI4Bv++vX3iMouN3R5uVgW8xqudBOsNtgAICk1avVcwm625Knu+/CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6oNpWvHdOc7X/IiTSdPAoAcPlNWgftwZc/KPalASXYEHeRV2
	R3ovMAZq6N6OgpT+m//aCk0si5ZX/kl0n9gUXzelWjz9JHxqfutnf7tE5CvjjQGG5gtyX+FmBHk
	4W4CkE2m7bD1QKj1DjjqmCiMz+LK547HIY3As+1yI
X-Gm-Gg: AZuq6aLdU8eQ7DMsyIKio/FnMULNzxAdhCL+eFk1q+Ps1GU4gFbCOZpAm/lal2iRuDp
	GH1++sROKZSKFr1wXNFUPbgASXAHO3nwJR1jNMkxcCQwlmDOUEyy6WO3UjAV+3H9I07dJsaGNnd
	Yt0uVdilsBfAsvYoVXnuH8lF4xax8D5LXhnD6aSFffinoxRv160O0mp7SPvze+zJskctTl0C7vI
	9QlI4PhhhwGj7xrCaj45dE3VDVeHGkKZyY89elM24XA4mS6GtBBHMKkNMxIMygqTi3vfw==
X-Received: by 2002:a05:6512:3ba8:b0:59d:4a12:5e9 with SMTP id
 2adb3069b0e04-59e0d89dd1bmr203716e87.14.1769628140094; Wed, 28 Jan 2026
 11:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128183750.1240176-1-tedlogan@fb.com> <CALzav=dMhycS2iBxkhPCz3tMUKxkfgr1dCLFGYzGuXZCeYhijw@mail.gmail.com>
 <9d992d4a-1aea-42a7-aa79-4ede80293f9b@infradead.org>
In-Reply-To: <9d992d4a-1aea-42a7-aa79-4ede80293f9b@infradead.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 28 Jan 2026 11:21:52 -0800
X-Gm-Features: AZwV_QiIycZYlMzR9c8qjKHTfTE9zLaHWTJ8OVCHhljFei9sVjKoLDHMigoIZpI
Message-ID: <CALzav=cWEoydGBpf4j5gPWy0TzLoAPP3YeG3VocbeEzytHTFrw@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: fix format conversion compiler warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ted Logan <tedlogan@fb.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Alex Mastro <amastro@fb.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:12=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> On 1/28/26 11:06 AM, David Matlack wrote:
> > On Wed, Jan 28, 2026 at 10:38=E2=80=AFAM Ted Logan <tedlogan@fb.com> wr=
ote:
> >>
> >> Use the standard format conversion macro PRIx64 to generate the
> >> appropriate format conversion for 64-bit integers. Fixes a compiler
> >> warning with -Wformat on i386.
> >>
> >> Signed-off-by: Ted Logan <tedlogan@fb.com>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lk=
p@intel.com/
> >
> > Thanks for the patch.
> >
> > I've been seeing these i386 reports as well. I find the PRIx64, etc.
> > format specifiers make format strings very hard to read. And I think
> > there were some other issues when building VFIO selftests with i386
> > the last time I tried.
> >
> > I was thinking instead we should just not support i386 builds of VFIO
> > selftests. But I hadn't gotten around to figuring out the right
> > Makefile magic to make that happen.
>
> There are other 32-bit CPUs besides i386.
> Or do only support X86?

At this point I would only call x86_64 and arm64 as supported. At
least that is all I have access to and tested.

If there is legitimate desire to run these tests on 32-bit CPUs, then
we can support it.

Alex, do you test on 32-bit CPUs?
