Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832D27E049;
	Tue, 24 Mar 2026 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364636; cv=none; b=nNpHhPFcfHvvSR1Dpw3cYTcbiuYPSX72qUT3G7IxjErhWlJfwgwYCpE+ZGiLaQDsneykFUDTfcaimrvyRrVoK0rAaD8c+lh72a5VVNTiKNwre9HvL4LFZO923OGP8IhJTtyrzuivhmpPoL6MEVumbJZV872XoK97J4/3M1AGYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364636; c=relaxed/simple;
	bh=rkabINP9EHZi4OdSPaCS5XIC6HceDioT6mfws4ogP7Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=A7y9DFLOtrUiXmWnj+a6MT04yVq7PF5iNpBELii9Cv/JFRmmMEBlxTIVKMll8yxdwMYXWyLWFZj55Ub3XsT4QhUeGS0befdNfhMr4tXw9KSyKFcIxvQqPKANi50bJdo/sMgCfm0rvquB731KGdVR+6/W4wjTdwBzurLK9LNdqqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=VF6Pn6rB; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="VF6Pn6rB"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62OEVgRG680477
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 24 Mar 2026 07:31:43 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62OEVgRG680477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774362703;
	bh=UD0/QOairViSQySbPoXFpAkI5LCOmZRz/vTSGStKEaU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=VF6Pn6rB9UCSoaVZUFOKH/pUYU/WQFzxlPjE2xviQ8eFe0INd7WT26F5LekefLRXH
	 Q4FGfI/BaAWIUQlhLtiQzqqN+5/GwjSAowWKx0qnH1aZaGMPsgbBBhevPDku2YPG88
	 uMZY851wat/0Xu2SReVMs1cxL+zwXk5txN34w1pH7oHyriBUtjNgH1njvkJvxiZh2Q
	 qMPovUTQOXVq8emOBZFxq35IUQIhhO/IQ9Gan0XZurUm+zdOutf52qditkuHssit7C
	 4UTTxyEWMg/hIhf7fFFjh4KR48WUIbqNBOaFCP9G44S7LxLwXY8bZpiy3D8pz1u+x5
	 7usXnuZQ38lgg==
Date: Tue, 24 Mar 2026 07:31:36 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>, Yi Lai <yi1.lai@intel.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_selftests/x86=3A_Fix_sysret?=
 =?US-ASCII?Q?=5Frip_assertion_failure_on_FRED_systems?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260324110856.5e9e9c76@pumpkin>
References: <20260320063301.489599-1-yi1.lai@intel.com> <20260324110856.5e9e9c76@pumpkin>
Message-ID: <1AAFF9EC-A964-4DAD-922B-5CD9A1AB6B82@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 24, 2026 4:08:56 AM PDT, David Laight <david=2Elaight=2Elinux@gmai=
l=2Ecom> wrote:
>On Fri, 20 Mar 2026 14:33:01 +0800
>Yi Lai <yi1=2Elai@intel=2Ecom> wrote:
>
>> The existing 'sysret_rip' selftest asserts that 'regs->r11 =3D=3D
>> regs->flags'=2E This check relies on the behavior of the SYSCALL
>> instruction on legacy x86_64, which saves 'RFLAGS' into 'R11'=2E
>>=20
>> However, on systems with FRED (Flexible Return and Event Delivery)
>> enabled, instead of using registers, all state is saved onto the stack=
=2E
>> Consequently, 'R11' retains its userspace value, causing the assertion
>> to fail=2E
>>=20
>> Fix this by detecting FRED support via CPUID (Leaf 0x7, Subleaf 0x1, EA=
X
>> bit 17) and skipping the register assertion if FRED is present=2E
>
>For the selftest can't you just allow for R11 being unchanged?
>That would be much simpler=2E
>It isn't as though the test is doing much more than checking that
>R11 is corrupted by being overwritten by EFLAGS=2E
>
>	David
>
>>=20
>> Signed-off-by: Yi Lai <yi1=2Elai@intel=2Ecom>
>> ---
>>  tools/testing/selftests/x86/sysret_rip=2Ec | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/testing/selftests/x86/sysret_rip=2Ec b/tools/testing=
/selftests/x86/sysret_rip=2Ec
>> index 2e423a335e1c=2E=2E0228d6174d5b 100644
>> --- a/tools/testing/selftests/x86/sysret_rip=2Ec
>> +++ b/tools/testing/selftests/x86/sysret_rip=2Ec
>> @@ -21,6 +21,7 @@
>>  #include <sys/user=2Eh>
>>  #include <sys/mman=2Eh>
>>  #include <assert=2Eh>
>> +#include <cpuid=2Eh>
>> =20
>>  #include "helpers=2Eh"
>> =20
>> @@ -64,9 +65,18 @@ static void sigusr1(int sig, siginfo_t *info, void *=
ctx_void)
>>  	ctx->uc_mcontext=2Egregs[REG_RIP] =3D rip;
>>  	ctx->uc_mcontext=2Egregs[REG_RCX] =3D rip;
>> =20
>> -	/* R11 and EFLAGS should already match=2E */
>> -	assert(ctx->uc_mcontext=2Egregs[REG_EFL] =3D=3D
>> -	       ctx->uc_mcontext=2Egregs[REG_R11]);
>> +	/*
>> +	 * SYSCALL works differently on FRED, it does not save RIP and RFLAGS
>> +	 * to RCX and R11=2E
>> +	 */
>> +	unsigned int eax, ebx, ecx, edx;
>> +
>> +	__cpuid_count(0x7, 0x1, eax, ebx, ecx, edx);
>> +	if (!(eax & (1 << 17))) {
>> +		/* R11 and EFLAGS should already match=2E */
>> +		assert(ctx->uc_mcontext=2Egregs[REG_EFL] =3D=3D
>> +		       ctx->uc_mcontext=2Egregs[REG_R11]);
>> +	}
>> =20
>>  	sethandler(SIGSEGV, sigsegv_for_sigreturn_test, SA_RESETHAND);
>>  }
>

I thought we already made it do that a while ago=2E=2E=2E
