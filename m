Received: from terminus.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D00E126F0A;
	Sun, 22 Mar 2026 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774162155; cv=none; b=nPlHVvp5DrW9dMqzHOPIHj8nrRRz0aEBWpHtnQHoUGnpM0y/IvfELtByCkHF9dOXqzqfMRVFzKhdS+uWB8x1R2nHSd21Dy+y7JRnUbrBklBJOUDU6mHSoRkCXfiWgmX4s7xuiDO3P1E2NbnDQkwDMRIJ6ab6GOfhKeKL+o/1Rjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774162155; c=relaxed/simple;
	bh=bizCZbi0OVovpEnf9armCj9nReAL8eXX8LofR1yr1q0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DDG+MddgXy94jt5pOfUXqYSuqhpKlo3HJEzuK3qtHMk0HVRE+sNHVYqwoX+bncqsZiTm8rw2Sb6ZBHtWRmSzrXUd4cezlTXK1l5T8YzMheR6ZdCvooV0CZi9HD8/nQbj8dM910AyyOOev6f5MriRLGM/MlYqyoBjJZu7YjC8bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=KzOjtry/; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="KzOjtry/"
Received: from smtpclient.apple (c-24-130-165-117.hsd1.ca.comcast.net [24.130.165.117])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62M6DdB93697582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 21 Mar 2026 23:13:40 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62M6DdB93697582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774160021;
	bh=bizCZbi0OVovpEnf9armCj9nReAL8eXX8LofR1yr1q0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=KzOjtry/DG4t8K8k2/qVagmh+E8onU86komMxX89mqwxCpbUq8liIUGnAUUuf6FBL
	 dJfJwFn+XuyQ5rZmxKc29f05DWrKZSSDUMjKAwK3I+DMvD1kngHpkE341t/d5uTS5R
	 bN0BjZdRVw/SdGLAf+/hgCLbT3oihrFksHxyko1a+5S1Q1+8u/abL5Kkkgjxn5+xFt
	 3fjFZNu9MNlT8khtfRbiBlbRKdKtJaO35F9rZN+B9d/N1uUMcR40O7G4ryVh8Z205y
	 BYnysx/JJlbc0YVdvAto7MQhaMuXfyd0FaGMXWTm6FrUDEoyqSTybtlpC8rlhmu/2A
	 xr32KF1UfSk0g==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
From: Xin Li <xin@zytor.com>
In-Reply-To: <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
Date: Sat, 21 Mar 2026 23:13:29 -0700
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, shuah@kernel.org, tglx@kernel.org,
        x86@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
X-Mailer: Apple Mail (2.3864.400.21)



> On Mar 20, 2026, at 8:50=E2=80=AFAM, Dave Hansen =
<dave.hansen@intel.com> wrote:
>=20
> On 3/20/26 08:47, Andrew Cooper wrote:
>>> First, CPUID doesn't tell you if FRED is in use. Is it even on by
>>> default yet? There might not be a better way to do this than =
checking
>>> CPUID, but checking CPUID is imprecise at best.
>> A reliable way to distinguish IDT and FRED mode is to:
>>=20
>> 1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't =
thread
>> local stoage)
>> 2) execute a breakpoint, ignore the signal
>> 3) Look to see whether %fs/%gs holds 3 or 0
>>=20
>> IRET has a fun behaviour where it zeroes NULL selectors even if they =
had
>> a non-zero RPL.
>>=20
>> ERETU doesn't do this; Andy Luto and I asked for this minor =
information
>> leak to be removed, and Intel agreed as it served no purpose anyone
>> could identify.
>>=20
>> As a consequence, you can use it to determine whether the kernel used
>> IRET or ERET to return back to userspace.
>=20
> I was thinking of just grepping /proc/cpuinfo for "fred", but that
> sounds much more fun! :)

+1 :)

This serves as a key architectural differentiator between FRED and the =
legacy
IDT framework.

For additional context, here is a fix to user segment selector values:
=
https://lore.kernel.org/all/174069328263.10177.6796873487608898067.tip-bot=
2@tip-bot2/

It=E2=80=99s worth noting that there was an attempt to fix this bug =
roughly three years
ago:
=
https://lore.kernel.org/lkml/20230220030959.119222-1-ammarfaizi2@gnuweeb.o=
rg/




