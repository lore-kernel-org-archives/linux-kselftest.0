Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2C286D4D
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 21:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775598821; cv=none; b=WIj4xwS+DO7WbRiFd+JD1aqvrMUM6AN0YxbOoLcEuihSaV1i3l0zbkSVckpxlCs7baot/h9Jon34tsfjnfSXAWzUL9/5aTUmS0Gu36j+duTX/BfHIESffCrFBvL7TaJ0kmxyTNl5yG1EzVhZtwTCOaGdk9ExNHTPrMsc9eYYA1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775598821; c=relaxed/simple;
	bh=nDGRA1dVc+zMm6xix9z14BOPIJ4hQqawL48JO3o5Oc0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhlJ5scib1yBFnrWJ4QtUn/rSIRz8HXHEagFF6sfqDjpufGAoXSbX6dXt/0wncy/t0SZ0yuOtW36BaYao25uqqzA3fj8Tc9vbDOUDy1EmYY9vlyZ0dNe034+oAFkIT2VVyW9ho0uWG3GqrlYW9E/nhgBmT1BC4gTxWm8zzJ5E/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bPRdq/WW; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bPRdq/WW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775598817; x=1775858017;
	bh=DSUgFzdAxPjca4t+zuNIh7QvUqDZGy5gCIdrscNNXM0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bPRdq/WWdRrAqs5DaYRbXSioo0j8OlaVKAkGO1m1Sr8MipoWK4GfjNlSPcO1DU8Oo
	 ise5uHiHC/MwQJ4pP0B4XKpk8gkwp+uQBWKlWhipo4K/TP0uJdJiA3xhfg6rCyEKWa
	 5gbqq6zffVrbfUVtMxanQ3aFegX/712XnV0n2/HxheKDsiiOVq0sj1crZx2coHPaxv
	 wIKNfQRa0WbpL3PX8W+nuFY6zh0Pz9zSHByyhMeDd3/NGTERrU6xWzbBSXBQmLV393
	 4hu8xg/723haRE4e2NvW0JMx2TiqZ9/yCK0vATuwhR0uYRwsPKduyZEPRMalyD6eD4
	 rUAtVN2D3tUQA==
Date: Tue, 07 Apr 2026 21:53:32 +0000
To: David Laight <david.laight.linux@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org, x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <adV6bnZC_2BEZxjk@wieczorr-mobl1.localdomain>
In-Reply-To: <20260407223653.2d3d3c60@pumpkin>
References: <cover.1775581451.git.m.wieczorretman@pm.me> <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me> <20260407223653.2d3d3c60@pumpkin>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: f9b628deaa561712126be6ae7e691ade2191b19a
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 22:36:53 +0100, David Laight wrote:
>On Tue, 07 Apr 2026 17:45:20 +0000
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:
>
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> With the announcement of ChkTag, it's worth preparing a stable x86
>> linear address masking (lam) user interface. One important aspect of lam
>> is the tag width, and aligning it with other industry solutions can
>> provide a more popular, generalized interface that other technologies
>> could utilize.
>>
>> ChkTag will use 4-bit tags and since that's the direction other memory
>> tagging implementations seem to be taking too (for example Arm's MTE)
>> it's reasonable to converge lam in linux to the same specification. Even
>> though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
>> 4 bits as ChkTag will likely be the main user of the interface and such
>> connection should simplify things in the future.
>>
>> Shrink the maximum acceptable tag width from 6 to 4.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Ditch the default wording in the patch message.
>> - Add the imperative last line as Dave suggested.
>>
>> Changelog v3:
>> - Remove the variability of the lam width after the debugfs part was
>>   removed from the patchset.
>>
>>  arch/x86/kernel/process_64.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
>> index 08e72f429870..1a0e96835bbc 100644
>> --- a/arch/x86/kernel/process_64.c
>> +++ b/arch/x86/kernel/process_64.c
>> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *=
image, unsigned long addr)
>>
>>  #ifdef CONFIG_ADDRESS_MASKING
>>
>> -#define LAM_U57_BITS 6
>> +#define LAM_DEFAULT_BITS=094
>>
>>  static void enable_lam_func(void *__mm)
>>  {
>> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>>  static void mm_enable_lam(struct mm_struct *mm)
>>  {
>>  =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
>> -=09mm->context.untag_mask =3D  ~GENMASK(62, 57);
>> +=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
>
>I'm not sure that GENMASK() is really the best way to describe that value.
>It really is ((1ul << LAM_BITS) - 1) << 57 and even the 57 shouldn't be
>a magic constant.

I recall people were annoyed when I previously open coded something that co=
uld
have bee na GENMASK() instead. Is there a downside to using GENMASK() here?

>I also wonder how userspace knows which bits to use. The other patches
>just seem to handle a count from userspace, but you aren't giving out
>the highest available bits.

I'd imagine if someone was writing a userspace program that'd interface wit=
h LAM
they'd have to know which bits are okay to use.

But maybe I'm misunderstanding what you meant.

>If this had been done for 48bit vaddr, you would really have wished that
>that bits 62-59 had been used not 51-48.
>
>=09David
>

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

