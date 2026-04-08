Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA23AE188;
	Wed,  8 Apr 2026 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643558; cv=none; b=iLWm4/xDxOJAHZEw5siSdPZmMt2bm2VAtM1XfzJjnAe1cHyc7lxiy2rb1jX/mBNW1wQBjpabVfVAnapUyOA51rxsEHHZMzM4dfRqTIzRGCQbsrG7m3MLaZ4z97QrVGVZ8P4c7d62p65WMGuv1j3Py8Ai5J2WH6FvTyrgpo/dyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643558; c=relaxed/simple;
	bh=dre3rW09kmKIPewO51tT+umscmYa5BiVPC3lw2HO+wI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6f4j7ENkmkFwEJGxeMB6J5BRJHetXGwth0ZkqaHwKAggCItgFKXTaDoZp5NH43n9wEljzRtGgnVYHVxXqK6lx1jfsIbzikf/7ym3RcZ0QbjwEWIysbg5TBFZo3ChYKcNBUSpdNfSEiWySU6ETHdPRGr8zOFNzjlwzNYPhcwmPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=n/e/4rUS; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="n/e/4rUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775643550; x=1775902750;
	bh=rBVnsKBA+0u3UnYtAa1qrYzIEPQ/2sPw8CkzUVbdSgY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n/e/4rUSYHIYkxPqBaQ3HGmwx8gJZQ/DMQRKbnPQdovN/EdCgjSxNW5xGcKt732Cl
	 84kTuzPbZrvoTKXw3UZz2jxxpurrd3Rp3pHRPduCbwss5GjzoFN+94jfTcJjjXG/aE
	 CCMWQst5bLVYrh9E8zrJyujFkbqcW/pbY4aOOECy/4FuXjtGvKFzfo8U2xtGJT/drX
	 gqC2fSWilW0n3Q2F7b0tR1yoT9IBeOUasRRt0pzITqh+snwCMiIA2My3LPDkkIsv6a
	 fkKZ5V2rGITdy0j6Tt+cgjFV4TophFnK6NQFqNYm10D5a/XNNyXbduG/6DV77WPSPG
	 nKFvavrV0Za9Q==
Date: Wed, 08 Apr 2026 10:19:03 +0000
To: David Laight <david.laight.linux@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org, x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <adYi_iBbwq4t-ADP@wieczorr-mobl1.localdomain>
In-Reply-To: <20260408095144.41ee4cbc@pumpkin>
References: <cover.1775581451.git.m.wieczorretman@pm.me> <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me> <20260407223653.2d3d3c60@pumpkin> <adV6bnZC_2BEZxjk@wieczorr-mobl1.localdomain> <20260408095144.41ee4cbc@pumpkin>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: cf08e65c10d0b14a89340bc02ef5d1d14a756597
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-08 at 09:51:44 +0100, David Laight wrote:
>On Tue, 07 Apr 2026 21:53:32 +0000
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:
>
>> On 2026-04-07 at 22:36:53 +0100, David Laight wrote:
>> >On Tue, 07 Apr 2026 17:45:20 +0000
>> >Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:
>> > =20
>> >> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> >>
>> >> With the announcement of ChkTag, it's worth preparing a stable x86
>> >> linear address masking (lam) user interface. One important aspect of =
lam
>> >> is the tag width, and aligning it with other industry solutions can
>> >> provide a more popular, generalized interface that other technologies
>> >> could utilize.
>> >>
>> >> ChkTag will use 4-bit tags and since that's the direction other memor=
y
>> >> tagging implementations seem to be taking too (for example Arm's MTE)
>> >> it's reasonable to converge lam in linux to the same specification. E=
ven
>> >> though x86's LAM supports 6-bit tags it is beneficial to shorten lam =
to
>> >> 4 bits as ChkTag will likely be the main user of the interface and su=
ch
>> >> connection should simplify things in the future.
>> >>
>> >> Shrink the maximum acceptable tag width from 6 to 4.
>> >>
>> >> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com=
>
>> >> ---
>> >> Changelog v4:
>> >> - Ditch the default wording in the patch message.
>> >> - Add the imperative last line as Dave suggested.
>> >>
>> >> Changelog v3:
>> >> - Remove the variability of the lam width after the debugfs part was
>> >>   removed from the patchset.
>> >>
>> >>  arch/x86/kernel/process_64.c | 8 ++++----
>> >>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_6=
4.c
>> >> index 08e72f429870..1a0e96835bbc 100644
>> >> --- a/arch/x86/kernel/process_64.c
>> >> +++ b/arch/x86/kernel/process_64.c
>> >> @@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_imag=
e *image, unsigned long addr)
>> >>
>> >>  #ifdef CONFIG_ADDRESS_MASKING
>> >>
>> >> -#define LAM_U57_BITS 6
>> >> +#define LAM_DEFAULT_BITS=094
>> >>
>> >>  static void enable_lam_func(void *__mm)
>> >>  {
>> >> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>> >>  static void mm_enable_lam(struct mm_struct *mm)
>> >>  {
>> >>  =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
>> >> -=09mm->context.untag_mask =3D  ~GENMASK(62, 57);
>> >> +=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 5=
7); =20
>> >
>> >I'm not sure that GENMASK() is really the best way to describe that val=
ue.
>> >It really is ((1ul << LAM_BITS) - 1) << 57 and even the 57 shouldn't be
>> >a magic constant. =20
>>=20
>> I recall people were annoyed when I previously open coded something that=
 could
>> have been a GENMASK() instead. Is there a downside to using GENMASK() he=
re?
>
>Some people do like GENMASK(), personally I don't think it helps in many c=
ases.
>Fine if you are describing a hardware register that has some single bit
>fields and some multi-bit fields - especially if the documentation uses
>bit numbers (which is often true).
>But here you want something that has a base bit number (57) and a width
>(LAM_BITS) and that isn't GENMASK().

Would GENMASK() be okay if I put a define on the bit numbers?

=09#define LAM_LS_BIT=0957
=09#define LAM_MS_BIT=09LAM_LS_BIT + LAM_DEFAULT_BITS - 1 /* 60 */
=09...
=09mm->context.untag_mask =3D  ~GENMASK(LAM_MS_BIT, LAM_LS_BIT);

LS/MS as in least/most significant bit.

>>=20
>> >I also wonder how userspace knows which bits to use. The other patches
>> >just seem to handle a count from userspace, but you aren't giving out
>> >the highest available bits. =20
>>=20
>> I'd imagine if someone was writing a userspace program that'd interface =
with LAM
>> they'd have to know which bits are okay to use.
>>=20
>> But maybe I'm misunderstanding what you meant.
>
>That is exactly what I meant, how do they find out which bits to use.
>The API seems so let them say how many they want, but not which ones.
>
>=09David

Oh then the arch_prctl() call for ARCH_GET_UNTAG_MASK is what they'd want t=
o
use. It returns the untag_mask.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

