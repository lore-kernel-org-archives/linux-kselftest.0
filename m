Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A713B58C;
	Sat, 10 Oct 2026 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791651864; cv=none; b=HahPEPKR6vrPMCKGq8lnqJkx3EVr4RXNVTdGt0pYohF8UyP8snPOZ1sbo75SqrfARdgtHurb/V6dochHi/Fnin1wSiV5KV3HO5NnAc4bCaARtmfI+HB4/TbsGCI4cvaO+aFoA5D1clpxxqeMbwFKXnAlxDwIyu+DPcOpa6TXOnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791651864; c=relaxed/simple;
	bh=SZdAjBAi5kGrfqPWhTvqDNs0hBXrk1IaL6ZV22ncRBc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WhCLCzgz/ByfXD9w4gFfHJXKQ+zURGzLUfy4UoTNjJAwXheaeC7HpFdBWdwO7mMFjCB606OLwvYC7fqQP4Nc0iiUHJJ4GRmlx0HMzbR/k4tMoyiqDD6sbcOGu04t7MvFuB9huTMO9zlCDEW7xqRN5w1J8rbfPdK0IOoo2MJ/2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glK4w4WW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glK4w4WW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475051F000FF;
	Sat, 10 Oct 2026 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791651863;
	bh=6Bgc4G61GPBNcGeONqOBL1vjWQ26O0Slr1Q2H5a5uQA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=glK4w4WW92RImIebYdTw9ZeGHrODTW47hec/S/dJZlGvJAUlELo5auUI5IrXBr1wt
	 TnubOHw5gGUpZ7RzUp+++e0NVFhwuJ097nMH7IHr6CHA5RR0UuQxgRMOKbipEilLU3
	 Tdspl9pLFN2Ep+qU/AYVzCf7vpyC6WUMHLPEue2Q4b+qOcJrE1LhCFTQB3IRpKNRUO
	 Ms5HcCeviL9/Lu9YvqmFM6P2TZ5dLDMOjllHISfg+aLoOg3I+Zv3tfVTnZBJz6UTz4
	 cvDk/143pIPoscB1QbWfx4fm6JKmAB2pa41OwPk2gQZasc3UjRGfKRN+IqnUg3HWtx
	 1PkJGmIcoHRAg==
Date: Sat, 10 Oct 2026 10:04:21 -0700
From: Kees Cook <kees@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org,
 mattst88@gmail.com, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
CC: Shuah Khan <shuah@kernel.org>, wad@chromium.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3] selftests/seccomp: add Alpha support to seccomp_bpf
User-Agent: K-9 Mail for Android
In-Reply-To: <CA+=Fv5R0fiZuzDLPOZcZt6p1CtSnATELgvns_nKA1qwemKHvWA@mail.gmail.com>
References: <20261010134214.974565-1-linmag7@gmail.com> <CA+=Fv5R0fiZuzDLPOZcZt6p1CtSnATELgvns_nKA1qwemKHvWA@mail.gmail.com>
Message-ID: <3866F071-9B50-4712-B640-EB757068C1B5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 10, 2026 9:24:16 AM PDT, Magnus Lindholm <linmag7@gmail=2Ecom> =
wrote:
>Hi all,
>
>On Sat, Oct 10, 2026 at 3:42=E2=80=AFPM Magnus Lindholm <linmag7@gmail=2E=
com> wrote:
>>
>> Enable the seccomp BPF selftests on Alpha with a fallback seccomp sysca=
ll
>> number and architecture-specific syscall register accessors=2E
>>
>> Use the NT_PRSTATUS register layout rather than struct pt_regs=2E The
>> register set contains r0-r30 followed by pc and unique=2E Read and upda=
te
>> the syscall number in r1, and set both r0 and the r19/a3 error flag whe=
n
>> synthesizing syscall results=2E
>>
>> At syscall entry, r19 still contains the fourth syscall argument, so
>> callers setting a synthetic return value must also set the syscall
>> number to -1 to skip execution=2E
>>
>> Signed-off-by: Magnus Lindholm <linmag7@gmail=2Ecom>
>> Reviewed-by: Matt Turner <mattst88@gmail=2Ecom>
>> ---
>> Changes in v3:
>> - Drop the /proc/self/syscall availability check and its commit-message
>>   paragraph=2E Alpha selects HAVE_ARCH_TRACEHOOK=2E
>> - Document that setting r19/a3 at syscall entry requires callers to als=
o
>>   set the syscall number to -1=2E
>> - Add Matt Turner's Reviewed-by after addressing his review comments=2E
>>
>> Changes in v2:
>> - Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET=2E
>> - Set the Alpha return value and error flag together=2E
>> - Check for /proc/self/syscall at runtime (removed in v3)=2E
>>
>> Validation on AlphaServer ES40, GCC 15=2E2=2E1, running
>> 7=2E3=2E0-rc1-es40-tsunami-v5a+:
>> - Standard v3 and the original baseline binary both report 98 pass,
>>   1 fail, 12 skip=2E The common failure is the 30-second timeout in
>>   user_notification_wait_killable_after_reply=2E
>> - A separate diagnostic build extending only that test's timeout to
>>   180 seconds completes it in 34=2E938 seconds=2E The full diagnostic r=
un
>>   reports 99 pass, 0 fail, 12 skip=2E No timeout change is in this patc=
h=2E
>>
>>  tools/testing/selftests/seccomp/seccomp_bpf=2Ec | 26 +++++++++++++++++=
++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf=2Ec b/tools/te=
sting/selftests/seccomp/seccomp_bpf=2Ec
>> index 0622bc2=2E=2E79e8eb3 100644
>> --- a/tools/testing/selftests/seccomp/seccomp_bpf=2Ec
>> +++ b/tools/testing/selftests/seccomp/seccomp_bpf=2Ec
>> @@ -136,6 +136,8 @@ struct seccomp_data {
>>  #  define __NR_seccomp 354
>>  # elif defined(__x86_64__)
>>  #  define __NR_seccomp 317
>> +# elif defined(__alpha__)
>> +#  define __NR_seccomp 514
>>  # elif defined(__arm__)
>>  #  define __NR_seccomp 383
>>  # elif defined(__aarch64__)
>> @@ -1754,6 +1756,30 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>>  # define ARCH_REGS             struct user_regs_struct
>>  # define SYSCALL_NUM(_regs)    (_regs)=2Eorig_eax
>>  # define SYSCALL_RET(_regs)    (_regs)=2Eeax
>> +#elif defined(__alpha__)
>> +/* NT_PRSTATUS contains r0-r30, pc and unique, not struct pt_regs=2E *=
/
>> +struct alpha_regs {
>> +       unsigned long regs[33];
>> +};
>> +
>> +# define ARCH_REGS             struct alpha_regs
>> +/* The kernel keeps the mutable syscall number in r1=2E */
>> +# define SYSCALL_NUM(_regs)    ((_regs)=2Eregs[1])
>> +# define SYSCALL_RET(_regs)    ((_regs)=2Eregs[0])
>> +/*
>> + * Alpha returns positive errno in r0 with the r19/a3 error flag set=
=2E
>> + * At a syscall-entry stop, r19 is still the fourth syscall argument=
=2E
>> + * Callers must also set the syscall number to -1 to skip the syscall
>> + * before replacing r19 with the error flag=2E
>> + */
>> +# define SYSCALL_RET_SET(_regs, _val)                          \
>> +       do {                                                    \
>> +               struct alpha_regs *__regs =3D &(_regs);           \
>> +               long __ret =3D (_val);                            \
>> +                                                               \
>> +               __regs->regs[0] =3D __ret < 0 ? -__ret : __ret;   \
>> +               __regs->regs[19] =3D __ret < 0;                   \
>> +       } while (0)
>>  #elif defined(__arm__)
>>  # define ARCH_REGS             struct pt_regs
>>  # define SYSCALL_NUM(_regs)    (_regs)=2EARM_r7
>> --
>> 2=2E43=2E0
>>
>
>Kees,
>Would you be OK with me taking this patch through my Alpha tree?
>The Alpha kernel support is already upstream=2E
>
>v3 carries Matt's Reviewed-by=2E On my ES40, it matches the baseline:
>98 passes, 12 skips and one timeout=2E Extending that timeout gives
>99 passes and 12 skips; that adjustment is not part of the patch=2E
>
>Link:
>https://lore=2Ekernel=2Eorg/linux-alpha/20261010134214=2E974565-1-linmag7=
@gmail=2Ecom/
>
>Thanks,
>Magnus

Yup, totally fine=2E Thank you!=20

-Kees

--=20
Kees Cook
