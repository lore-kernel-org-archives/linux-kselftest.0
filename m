Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4462264A7;
	Tue,  7 Apr 2026 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597814; cv=none; b=LRcJDznpDvHhgXvWK7lnmyfDODiGkMQEq1taqu0u22KaC+GeriNU5KH2rANX0yd3Yuh+0ORqRrRDsv9hCWeebgWg8hdlJjhSmNyRbN7/FeEHjY6S5he+7r0YCUfBY7ZPZRBGJPo4HPi+UIwAFTxWeXNGqZ908cAk0cSgYqi8XJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597814; c=relaxed/simple;
	bh=VV2DLHDkUYmweu70iPgg9cSzYoSNSmYwg3QVRy+IJ30=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUro6sV27x5oPPRg3FghOrr1Hw7NkccAo6m4PLrp2m71hHZxTag2SzGW1NpIdqlNk01dWxPwmCfESIh2LN2L58Yd0NALg8NfZpQgCN58OKwZiQgLVE8hJ6JzNDwBMiCBAnV7GXOVeM5XmcpST7iuEex4jdZHUCvToKl/YYzsi+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=m5/UsWOi; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="m5/UsWOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775597803; x=1775857003;
	bh=fGB8FbfU0Kyqf6BkI1H8MpJadVUI+5wtvAaZq+8IQ+M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m5/UsWOiKCVtpV9MlttuVHJ6f6UOwFkzOFmojmuXFDymNGTJNsY564hGSmzvRbp6L
	 NFDekljiFaCusL/SLqtpydw66+PLWNScPqn3+WzkSp8TzvV/TqiYhI9rcMQ9yp5laC
	 AcE2soJ95KxNPcKs6JCrIAAY0Ew4XvReDyQN+H/hK5T3DdPT4sM9iZd9NV4dIeCGnB
	 S0b9KWTEiAVvL5OUs3kXNWCqosrcza8I6HaCoAv8YQr2P3mGJLsN3Yw5RhOBI3O1hx
	 XjYxr0dROTre8LN1RQ2HJYsuGsqlnwDqefWZoRB5FQp9JUa+mo9XPttZaqdHDYByS/
	 uU+MFJ58Qh4uA==
Date: Tue, 07 Apr 2026 21:36:37 +0000
To: Sohil Mehta <sohil.mehta@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <adV4Kp7Dzss5M0n4@wieczorr-mobl1.localdomain>
In-Reply-To: <85358f27-1666-421e-83b2-fb403b109c91@intel.com>
References: <cover.1775581451.git.m.wieczorretman@pm.me> <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me> <9580a35f-afa4-41a6-b53c-1f16033cea7f@intel.com> <adVoW4c3RhtfLy5b@wieczorr-mobl1.localdomain> <85358f27-1666-421e-83b2-fb403b109c91@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: fafc6178fa67ba903b73ac8c1f5e30b3eba48a60
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 14:30:32 -0700, Sohil Mehta wrote:
>On 4/7/2026 1:31 PM, Maciej Wieczor-Retman wrote:
>> On 2026-04-07 at 12:52:07 -0700, Sohil Mehta wrote:
>
>>>> +=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57=
);
>>>>
>>>
>>> Also, would it be useful to calculate the LAM mask as a #define because
>>> it might need to be reused later or copied over to the selftest (as in
>>> patch 3)?
>>=20
>> I think as it's only used during this initialization here it's not very =
useful
>> to give it a separate #define. And if it's only for selftest purposes it=
's
>> probably not worth it to export it to userspace.
>>=20
>
>Oh, I didn't mean export to userspace. I just meant having these two
>defined together in arch/x86/kernel/process_64.c mainly for readability.
>It makes copying the define over to the selftest easier. The names also
>match ARCH_GET_MAX_TAG_BITS and ARCH_GET_UNTAG_MASK.
>
>#define LAM_TAG_BITS=094
>#define LAM_UNTAG_MASK=09(~GENMASK(57 + LAM_TAG_BITS - 1, 57))
>
>To me, it makes the resulting code significantly more readable. I am
>suggesting it because you are already touching these lines in patch 1
>and 3. I'll leave it up to your/maintainer's preference, but personally
>I like the below result:
>
>diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
>index 1a0e96835bbc..745e16bde227 100644
>--- a/arch/x86/kernel/process_64.c
>+++ b/arch/x86/kernel/process_64.c
>@@ -797,7 +797,8 @@ static long prctl_map_vdso(const struct vdso_image
>*image, unsigned long addr)
>
> #ifdef CONFIG_ADDRESS_MASKING
>
>-#define LAM_DEFAULT_BITS=094
>+#define LAM_TAG_BITS=09=094
>+#define LAM_UNTAG_MASK=09=09(~GENMASK(57 + LAM_TAG_BITS - 1, 57))
>
> static void enable_lam_func(void *__mm)
> {
>@@ -814,7 +815,7 @@ static void enable_lam_func(void *__mm)
> static void mm_enable_lam(struct mm_struct *mm)
> {
> =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
>-=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
>+=09mm->context.untag_mask =3D LAM_UNTAG_MASK;
>
> =09/*
> =09 * Even though the process must still be single-threaded at this
>@@ -850,7 +851,7 @@ static int prctl_enable_tagged_addr(struct mm_struct
>*mm, unsigned long nr_bits)
> =09=09return -EBUSY;
> =09}
>
>-=09if (!nr_bits || nr_bits > LAM_DEFAULT_BITS) {
>+=09if (!nr_bits || nr_bits > LAM_TAG_BITS) {
> =09=09mmap_write_unlock(mm);
> =09=09return -EINVAL;
> =09}
>@@ -965,7 +966,7 @@ long do_arch_prctl_64(struct task_struct *task, int
>option, unsigned long arg2)
> =09=09if (!cpu_feature_enabled(X86_FEATURE_LAM))
> =09=09=09return put_user(0, (unsigned long __user *)arg2);
> =09=09else
>-=09=09=09return put_user(LAM_DEFAULT_BITS, (unsigned long __user *)arg2);
>+=09=09=09return put_user(LAM_TAG_BITS, (unsigned long __user *)arg2);
> #endif
> =09case ARCH_SHSTK_ENABLE:
> =09case ARCH_SHSTK_DISABLE:
>diff --git a/tools/testing/selftests/x86/lam.c
>b/tools/testing/selftests/x86/lam.c
>index d27f947ea694..4e514cae27f2 100644
>--- a/tools/testing/selftests/x86/lam.c
>+++ b/tools/testing/selftests/x86/lam.c
>@@ -17,6 +17,7 @@
> #include <sched.h>
>
> #include <sys/uio.h>
>+#include <linux/bits.h>
> #include <linux/io_uring.h>
> #include "kselftest.h"
>
>@@ -26,9 +27,9 @@
>
> /* LAM modes, these definitions were copied from kernel code */
> #define LAM_NONE                0
>-#define LAM_BITS                4
>+#define LAM_TAG_BITS=09=094
>+#define LAM_UNTAG_MASK=09=09(~GENMASK(57 + LAM_TAG_BITS - 1, 57))
>
>-#define LAM_MASK                (0xfULL << 57)
> /* arch prctl for LAM */
> #define ARCH_GET_UNTAG_MASK     0x4001
> #define ARCH_ENABLE_TAGGED_ADDR 0x4002
...

Oh, okay, yeah, that does look better. Thanks, if there are no objections I=
'll
apply that!

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

