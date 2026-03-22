Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1723630B9;
	Sun, 22 Mar 2026 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774210122; cv=none; b=GoeSEAj1epIZfJnTmf6Y6C2MI80eL098yfB/vt3bNKEOiCYxfx0/25JF+Q9fHYZDYqkwdkAudOyQqd6ZHcMIb9kmfBXLrYInC0ZHvik9SuE66uw7P8UHqsH6nZzrIYdEO8d7Uwee1tH38r+69PDYddpOmzlX6YjpclKToZSFiT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774210122; c=relaxed/simple;
	bh=GCQVCAGjbwNP6EGDRLsII7zElvQFCP/kqlT48Royngw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=K3gB1EUowWgrAE0q6ikS63+fPKNCDKhwFl7SWmmsvKK/fGNjmrqcfoLE7u0YUDHudPMHYobOSPKIINKdbXmTxPKmcz1JrZmkXlZraOHDpSGsqFxXx/ZrYcE2qcR3GVMVys/BmsVlrNE/770SFCwW9iUCvjmVs16A5nt6EJdvX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=hPbra4G/; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="hPbra4G/"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62MK8AKT800701
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 22 Mar 2026 13:08:11 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62MK8AKT800701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774210092;
	bh=GCQVCAGjbwNP6EGDRLsII7zElvQFCP/kqlT48Royngw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hPbra4G/5TeSK0LbEoH8nmT/cn6z/vGcMkIzV7/YaVjQW90OxmLXfl0PwJky5vzFU
	 uqSiGjfX99H9FJPf/ck/SFouhIoGF7felqB0MGYfNPXR8MxY/vc0uGzIhLr2aHjKy/
	 lIr0l7TLDWrgUlZIDNphWICUGeP1onu3b0fj93pG+qKJDFWoCYHa1ZIY6CjvP7/0EZ
	 Zh6NXcXxAeoBT+zhF2ci58EeYf3a35fCfjdqLeXFO8zeB9WJBraphmoVMg1MMhsxhA
	 sij9oDZeWI2kcHyXbMTpJuVW/r+Q8fyzavCJTMgCGGagQ4VNBWeCnEkjtjhWfFRBIl
	 4ft3NuCXKFKoA==
Date: Sun, 22 Mar 2026 13:08:04 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, yi1.lai@intel.com
CC: bp@alien8.de, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
        shuah@kernel.org, tglx@kernel.org, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_selftests/x86=3A_Fix_sysret?=
 =?US-ASCII?Q?=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com> <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com> <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
Message-ID: <E0171C35-346C-4B12-8193-29C7D3E18357@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 20, 2026 8:50:54 AM PDT, Dave Hansen <dave=2Ehansen@intel=2Ecom> w=
rote:
>On 3/20/26 08:47, Andrew Cooper wrote:
>>> First, CPUID doesn't tell you if FRED is in use=2E Is it even on by
>>> default yet? There might not be a better way to do this than checking
>>> CPUID, but checking CPUID is imprecise at best=2E
>> A reliable way to distinguish IDT and FRED mode is to:
>>=20
>> 1) Load $3 into %fs (x86_64) or %gs (i386) (i=2Ee=2E whichever isn't th=
read
>> local stoage)
>> 2) execute a breakpoint, ignore the signal
>> 3) Look to see whether %fs/%gs holds 3 or 0
>>=20
>> IRET has a fun behaviour where it zeroes NULL selectors even if they ha=
d
>> a non-zero RPL=2E
>>=20
>> ERETU doesn't do this; Andy Luto and I asked for this minor information
>> leak to be removed, and Intel agreed as it served no purpose anyone
>> could identify=2E
>>=20
>> As a consequence, you can use it to determine whether the kernel used
>> IRET or ERET to return back to userspace=2E
>
>I was thinking of just grepping /proc/cpuinfo for "fred", but that
>sounds much more fun! :)

This is a great example of why we need the patchset to clear compiled-out =
flags=2E
