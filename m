Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524D33C53F
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594075; cv=none; b=Xf3B2yv4fmGq5DcO1VzMbXGd/LVwx34PGQcPC/M1PUh5RjSaHpIv+axP5CDKM/DKHZMcSWdVZKcqD/BOiH14oM6waxUu3DdRw+KqgSfWsbnVqXTm1D8pHNlfrSg24OVYChjYWEwn3Ime+5Hhbogz8kFGWRY90FSS9UVhhySZwTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594075; c=relaxed/simple;
	bh=0x0qy3E6DJvIQCaZ9GxqRKVqT7Yh26bwvBayEXCsDmY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8BF94U8J6W+qnv747tEzFu/kKd3OMsCuWJiUsc5ptJqNXEFOYRpZKIVzL4ck7BxItJbRaA3WvDJq5d4q7Q97UVPzHfKQP5VvJBkRb/CEhqarfHJ+87y95TxWdsNCe1MROPBC6MeAoMTIzjRtM75dXNdklXgMo6mbGz4unqY0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QnJAvnYV; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QnJAvnYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775594063; x=1775853263;
	bh=MZ6LWGm0NdukXfKvLR88V5KYYkT1JmHJBU7HHw1dCME=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QnJAvnYVW3pf2a2jFnTYSoSqyKZnDYBKk+APNvFt+rdBiCgqxTo+Wa6eBA7MdFyvO
	 BEGkx7wbddvwOIVXYQorS7QmewF/SS/fFCy3ly4lK1tLvfxb5KQpq8fFHAcVQ+DSL+
	 5I88voFjXQE5FsFi5nb88F/mOJasycaboykgLzRaV779xbJF61W3/0vueUwl2qFfKn
	 2Lb99VEGZXWgwrN4wwcr8QitiRWtK7lpf1t4yQbW+EoUqQZm2uMufTeK2gDn50p8sm
	 PkSe2QIErCVsD3M+n0hpzr8PMEK+8NHN2LojnGe6zWL7erj3k77MacUj+qasXeXxwM
	 03k0+vxcQaAtw==
Date: Tue, 07 Apr 2026 20:34:17 +0000
To: Sohil Mehta <sohil.mehta@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org, x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 3/3] selftests/lam: Add test cases for different LAM tag widths
Message-ID: <adVpx8yRh-OuMIpY@wieczorr-mobl1.localdomain>
In-Reply-To: <39edd67c-c718-4005-87b9-f16392fa4841@intel.com>
References: <cover.1775581451.git.m.wieczorretman@pm.me> <91141bc8dc7241b0c77208c743a7e051c782ccef.1775581451.git.m.wieczorretman@pm.me> <39edd67c-c718-4005-87b9-f16392fa4841@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 0a2b844c29aa822ba19316bc3dfa80a11c5e1023
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 13:06:40 -0700, Sohil Mehta wrote:
>The subject needs a change. No new tests are being added now, right?

Oh, right, I'll correct that.

>On 4/7/2026 10:45 AM, Maciej Wieczor-Retman wrote:
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests=
/x86/lam.c
>> index 1919fa6daec0..d27f947ea694 100644
>> --- a/tools/testing/selftests/x86/lam.c
>> +++ b/tools/testing/selftests/x86/lam.c
>> @@ -26,9 +26,9 @@
>>
>>  /* LAM modes, these definitions were copied from kernel code */
>>  #define LAM_NONE                0
>> -#define LAM_U57_BITS            6
>> +#define LAM_BITS                4
>>
>> -#define LAM_U57_MASK            (0x3fULL << 57)
>> +#define LAM_MASK                (0xfULL << 57)
>
>How about calculating the LAM_MASK from the LAM bits similar to the core
>code in patch 1?
>
>Also, when copying over the defines it would be useful to name them
>exactly the same as the core code. That way any name changes would
>happen in sync.

Yes, both of these sound handy, I'll change it.

>
>> @@ -247,10 +247,10 @@ static uint64_t set_metadata(uint64_t src, unsigne=
d long lam)
>>  =09srand(time(NULL));
>>
>>  =09switch (lam) {
>> -=09case LAM_U57_BITS: /* Set metadata in bits 62:57 */
>> +=09case LAM_BITS: /* Set metadata in bits 62:57 */
>
>This needs to change to 60:57 similar to the change below.

Hah, thanks, I thought I got them all :)

>
>>  =09=09/* Get a random non-zero value as metadata */
>> -=09=09metadata =3D (rand() % ((1UL << LAM_U57_BITS) - 1) + 1) << 57;
>> -=09=09metadata |=3D (src & ~(LAM_U57_MASK));
>> +=09=09metadata =3D (rand() % ((1UL << LAM_BITS) - 1) + 1) << 57;
>> +=09=09metadata |=3D (src & ~(LAM_MASK));
>>  =09=09break;
>>  =09default:
>>  =09=09metadata =3D src;
>> @@ -291,7 +291,7 @@ int handle_max_bits(struct testcases *test)
>>  =09unsigned long bits =3D 0;
>>
>>  =09if (exp_bits !=3D LAM_NONE)
>> -=09=09exp_bits =3D LAM_U57_BITS;
>> +=09=09exp_bits =3D LAM_BITS;
>>
>>  =09/* Get LAM max tag bits */
>>  =09if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) =3D=3D -1)
>> @@ -719,8 +719,8 @@ int do_uring(unsigned long lam)
>>  =09=09=09uint64_t addr =3D ((uint64_t)fi->iovecs[i].iov_base);
>>
>>  =09=09=09switch (lam) {
>> -=09=09=09case LAM_U57_BITS: /* Clear bits 62:57 */
>> -=09=09=09=09addr =3D (addr & ~(LAM_U57_MASK));
>> +=09=09=09case LAM_BITS: /* Clear bits 60:57 */
>
>Just like this one.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

