Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43E2FF17A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593911; cv=none; b=uJvy8tUlhowXKsTSx2nFB290b1mvZ230ReNGf8UtTmfu3K0nzE+t+eEe71ckQw7/dadCvxccSsXAUvVoLVRGuvObKfDLN/kza7j2tSx88GVuk9JtaYxWMEYSZmkoX1h1tUJRX+9gfjwUsKSRYjXoekqF261Yi5kEi+ksnGpKEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593911; c=relaxed/simple;
	bh=sVuW11LYaBiSPsS9quDxD6qBeJo7yzZtxk3Le937i7o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7TqVdDyn09snGKA455vJwMnXO+WaFGgfns/50Bq6O5+pLZU5Gb7HUPtmnyNFLOq8EWWu0E5YcyMYAwXQmIXIUTU9S1h0nyIosWoww19R3H9ciY5Dpy1d7BYrR8zbsh9kQg1EUvIzRWSDaYQoDXWNWA4tG+dsslE1NH6tB7vIjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=N9b/d/P/; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="N9b/d/P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775593895; x=1775853095;
	bh=M2dhaxmek5a1rDAUNm1cQp1812Lse2fv/28+LaxuGuE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N9b/d/P/L24hDzq/HbAA8EyJRKjtyJWQ5G7s6fDjqt/O7rEUn6wNJfY+SYo7S8zxz
	 XgOPSKG6u3dX/Y5c1KBKSXVAKwcRjRzaIoZZFW//Q5+wYCd143+JjteXTsvxW0rF4X
	 XLINxbOct+38BVSbwab7/bfsnGEHaSrncTcxORTSgLSm5kvIgbDACSqvEzQttx+Qq6
	 wPa2fg7BYazr3XjVejwpJI8v4kzuP4IELfPFwZn/2JZqP4CzAiaflwcQDdZX+TEGM+
	 3sM46vZLpsH4LgiGj8+Hq8EcQ3cP5T/exyR+EpTbGs/QvzuTyy0o1MsLY/hmIDXdh5
	 wZdj62/kRCPOw==
Date: Tue, 07 Apr 2026 20:31:28 +0000
To: Sohil Mehta <sohil.mehta@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org
Subject: Re: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <adVoW4c3RhtfLy5b@wieczorr-mobl1.localdomain>
In-Reply-To: <9580a35f-afa4-41a6-b53c-1f16033cea7f@intel.com>
References: <cover.1775581451.git.m.wieczorretman@pm.me> <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me> <9580a35f-afa4-41a6-b53c-1f16033cea7f@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 15191d1d9f92f1d6bb2e70249159a50b74a0644f
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-07 at 12:52:07 -0700, Sohil Mehta wrote:
>On 4/7/2026 10:45 AM, Maciej Wieczor-Retman wrote:
>
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
>
>As Dave mentioned earlier, the default wording makes it seem like this
>can be configured. But that isn't true anymore, right?
>
>How about naming this as LAM_TAG_BITS to match ARCH_GET_MAX_TAG_BITS?

Right, I'll rename it, thanks!

>>  static void enable_lam_func(void *__mm)
>>  {
>> @@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
>>  static void mm_enable_lam(struct mm_struct *mm)
>>  {
>>  =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
>> -=09mm->context.untag_mask =3D  ~GENMASK(62, 57);
>> +=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
>>
>
>Also, would it be useful to calculate the LAM mask as a #define because
>it might need to be reused later or copied over to the selftest (as in
>patch 3)?

I think as it's only used during this initialization here it's not very use=
ful
to give it a separate #define. And if it's only for selftest purposes it's
probably not worth it to export it to userspace.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

