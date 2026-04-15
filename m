Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8D3DCD95
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267768; cv=none; b=VUujfIWPyPc0nBKYNUlqLZCRgeXUtX/1OqDrgB3yRwM1SkpGvsk3HWEThodqHJFyW3kDPyNVQF7At2zWoiNkDhqmH2PuOmhYnZ/XP0oqmCaJLx9tnMTxce+5xE5+KJ57me+Lov5s5MrrrtMMTOM4pq3ta4BxwQ2MDmbmTSyyW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267768; c=relaxed/simple;
	bh=dDijZuor1xvmTBogTjju/PAPbY/PQMGI1uljwU/belg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XJYDT44br1x1qGKIpqft3DLUhIEjqSILgIumnmrPeWtScl/17H9Od6GDI8RVxs/+69CfjAtwJDTOJASsBeSeAqu7hGm4X7WOh+skeDJDCO3z+enZlR+qLlPLplkOOgB/G4ISn5zBbE++P+huzSl/37w6ybE9900YBnla8zsbCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YgPMBjBI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YgPMBjBI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso65672875e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776267765; x=1776872565; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BvjwjAzTjY/jU9mV6i6higD+5qPV14w0YtVebluUHw=;
        b=YgPMBjBIzkwymkGdPggQLhS/aMLYFQ8XOej0VFMyFcxtyGqIdYxEnWEniUhpatV6gR
         panPQL9RHnLe61uh5JUojJkZnxh+NXjImsl8gOkZJZQvDMJA7yQeMIYjB9QQY9wfqK7e
         QpYotYfOjp+s5rHq1GsQSDr8htabVfnNaNaa1Pm+FYX7cSILPjyHO3fvxdE5c2I4IaiE
         juS1tdY/uUOc04h2egRgiSI9x0fzRwCULqoeCIRg77uCMxY92OoXy2TcNZSxVO0A/kFm
         kxlS9G1sx9oHw0EAUov3iD1fUchsvsaVSX2GsC6KDrYNDZ+MCgJWzP9i2YRaWV6tf8gO
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267765; x=1776872565;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BvjwjAzTjY/jU9mV6i6higD+5qPV14w0YtVebluUHw=;
        b=GnV5fDVYSZowtIGWrV+3OlNa3iWJYD5N4xT1A3WwK3fvKEyQLJ2g+Whi+wHXdanxkj
         ygBLJ4Trk8uqTW7HACiQxfg8OygQQIfirJk4nMyHHpnKTTj1I/wqoK43PwWdn4nt2OAG
         IwRYUuNJCT0NiWqMJ5wutn/3bezwXWH+tA6FHBu81vsUz6rveyAz1A3leoVWwdYE5Irw
         Vkxxy2NnfIWN3MKgWgNkJ2i5zzaByI51l4G2wglYXe2YJNyM+DvCQ+9o+QOLK4OGcOAF
         oZjmG18kRJFRUdYCZZiw+jNB8hzrXUEICEPrTi2KPaOyH2rl7jYrP+WujtyYEOGgz5lC
         bWWg==
X-Forwarded-Encrypted: i=1; AFNElJ9BvTYhuoC9GBb65+GWAjMdD5eCWHDn8N3Z1iX9CDpjzNsCyhsNFIuwOPEi48MnFKvPm7IrUbPxtfnBcbll1JI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9vYroQUNv1/bcQVeDAqxot7VQaYlRTcGjxxkFyxxR/iHy6t3
	CFMGFo4+4HjTsG94vmAEd6P6Szc6lQmsNP8PLv3KsuDOl86jNRP1cBhX6baMyqvyIcc=
X-Gm-Gg: AeBDietwgmLkUeuhVPwwmNtip4Y6GTKWQu66Cav9TEuSOAY7vIVc02cFOhAnPjYUS14
	5TwK/onPhNjMj1AMwaXQeGL74e09n4vMzlfnBaMJ4Uzg+t/GiX/da7vtd8WgwZvv+uZ0rb56gZ/
	+/X/ya/niVF5Sxvap406htDujSMHioUSM3+uA59Da+vXnFnlVnLsl2a3oEpJCwLD8AW55iWHLud
	bxTKHArw/DUcnomTdHqUdaztoT/gh/BcPNTcWJy36sBei98qXetSwG0EqrlJqmVFqSZLW+InhdU
	3ARoCe9r2+zOSmUOW4LwwkyP1pp4axPf6mfa9Xc33jubgoAXpWQ9whBVT3SkDP1N9xEeLNogynJ
	P4JlEQpt1aea/kfwul+3vwpTd8ZECXQ3rBKdtbnfRnfEgtTJFImiMxMseLaPqIxtrYN8cdgQ5/9
	aS0Qxw5E+1JA==
X-Received: by 2002:a05:600c:19cd:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488d67e3671mr305346955e9.10.1776267765033;
        Wed, 15 Apr 2026 08:42:45 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:8620:c31f:89a6:1fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c605883sm2995905eec.10.2026.04.15.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:42:41 -0300
Message-Id: <DHTUDCIYT34R.3VKGNDGUUKS84@suse.com>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?= <rbm@suse.com>
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in
 all/install
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <Aishwarya.TCV@arm.com>, <ben.copeland@linaro.org>,
 <kernelci@lists.linux.dev>
To: "Shuah Khan" <skhan@linuxfoundation.org>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmU=?=
 <rbm@suse.com>, <torvalds@linux-foundation.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-120-g22b95d38161f
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
In-Reply-To: <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>

On Wed Apr 15, 2026 at 12:40 PM -03, Shuah Khan wrote:
> On 4/15/26 07:58, Mark Brown wrote:
>> On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marli=C3=A8re wrote=
:
>>> Track failures explicitly in the top-level selftests all/install loops.
>>>
>>> The current code multiplies `ret` by each sub-make exit status. For
>>> example, with `TARGETS=3Dnet`, the implicit `net/lib` dependency runs a=
fter
>>> `net`, so a failed `net` build can be followed by a successful `net/lib=
`
>>> build and reset the final result to success.
>>>
>>> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, s=
o
>>> the top-level make returns failure when any selected selftest target
>>> fails.
>>=20
>> This patch, which is now in mainline as 7e47389142b8, is breaking a
>> bunch of CI systems - at least KernelCI, our Arm internal CI and my
>> personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
>> the top level Makefile, the prior behaviour where the exit status of the
>> top level Makefile ignores failures from individual directories is
>> desirable since by default we try to build almost all the selftests but
>> between quality issues and build time dependencies it's very common for
>> at least one of them to fail.  With this commit unless the user has
>> configured a more restricted set of selftests it would be surprising if
>> we manage to get a successful build and install.
>>=20
>> As well as being a poor default due to the very high likelyhood of build
>> failures this also has the undesirable effect of causing a build failure
>> in one selftest to cause the whole install target to fail, meaning that
>> the build failure is escallated to a complete lost of coverge for all
>> selftests in common CI usage.
>>=20
>> This wasn't showing up in my -next build tests since I set FORCE_TARGETS
>> and explicitly choose a restricted set of kselftests which actually
>> build with my system and configuration.  It was less obvious than it
>> should have been with the other systems since they did not expect there
>> to be a complete failure to generate a kselftest tarball and variously
>> masked the error or reported it in a manner that looked like an
>> infrastructure issue.
>
> I didn't see it when I did test on linux-next and my repo. I did install
> to catch problems.
>
> Sorry for not catching this. We can drop this patch.
>
>>=20
>> It would be really nice to get to the point where we can reasonably do
>> this but we're simply not there at the current time.  At the moment if
>> people want to see build failures reported at the top level that really
>> needs to be opt in, we have FORCE_TARGETS for that.
>
> Good point - I will go look and see if we document this in kselftest doc
> and add it.

It's not documented. It would have solved my issue, sorry for
overlooking this!

>
> Mark, would you like to a revert for this?
>
> thanks,
> -- Shuah

