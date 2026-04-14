Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4032E8B98
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182310; cv=pass; b=qKUPVuGQfBv4TOFrrwoFQkQ+icnHAos6M8cG5ejAOkH8bxYXQEjrxek2NNm5FMc50J6DyG01hleCdAzTtmlIEm08d16tF1q4dyKMytzDd+V4alXJmr0dDGd22JNyqAifKgLRGfNx1AdxHXE98wwARiExZFk25TCTBE7t6hgrCko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182310; c=relaxed/simple;
	bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1wR2p9ptR2BnTEeI5hw7snsumdTh3RHRJPEV6oL7r99ZyguM+piHZqBsKs6uphemlTMZINqMnjKS5Wy9XNfyBeiGBuzsYjn7iFI5ays1T8EFvHK7qTDqcQK1VWmCGwYSLPt2I3A8lQkfHnPttc9xEA7qLeJkfXV2U++JG/lfFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKYlgg83; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKYlgg83"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5812239f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 08:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776182307; cv=none;
        d=google.com; s=arc-20240605;
        b=QIfyfHLMppLNCFHDRijmL5N3DyMH3xslht+cEIw4Cc+N8Gx/aJHKisL75wfkZ/91Kn
         otLqWVmOyuB5B3M38+ZcSLqlkGfTTAxaHHZqc855m2iJdlkzF1DujQ5r3xNedtFl7na2
         MnhT4Daca/8L1EU11VxzjonBcOTRH9M+oppgX2BYl9IMDwzP965dKEjXtcmU5l223m3p
         KT4tGnVwPgPVSBDTpPXh6WUJro3tGDcIm+UpqhcYtYVVgmYBnZO9fVOgrorm4jWV/Ijv
         dCzNtMUHkP/QcMyAcxvYLQDz11s54cU9D0/vYDrt3m9rP0MWZ72hblW4oeQ4NadlfS3y
         tXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        fh=1K1yNwIH8z3wmi0G5QvcPEe2s/gE8tCNeD4rYTGBERU=;
        b=Z/o1vPEHlCK7FW764LAjtYkKQ+sRE8WRP4DkaB5a9JgKMd6I0g/CHD4QOAercPw+nK
         6cP6lKZq2VpkKNtm43NFwXj7LEN+A6bX0tLlba7WtJjYzO6mi1VJcKEwNUn213tUmjgU
         wbzH44zIh94BXZ1a1mvku8PRvC6j4taisCH3rwcNUm/rhHdD+ebWHDmrhlJ/g7QVHzC1
         c8F9mx4WdmAMe2hr5+zjpGPCYdm07KoxoOV4FiybOVJGNR5muoHoHBh56nYar41tYGGO
         C6cN9q1xU2f5qgi8Fcjjh+R8SCt5nrqxDTXtksGnLabJKIITr4/1YJkEIWRNPR9hXUft
         kzEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776182307; x=1776787107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        b=sKYlgg83+aMafRzo7fK2P1gI8+zFfGagk2TKHjtXRxXJiute1s9fc90WNnijR9DhLO
         skQFVqnxgjQMq/7mawPPILZ2euRcXU+6+1lWgX85v+xuSbV7CYJb6rU1GaEB8ASxaEsE
         /lFYcZJKaVoevV2qNV/vZWh4SW1HHvCxs6cqmQollkcJI2n9j/n/Xsloz09rhcCn1y0p
         KArILiNvk2mxZIYHymyp6DSgf3aRQf9npr3VF3f45h3yUkSnq/es5LT3nMixGBKe3TAk
         UDSjjy/0vkDVUTRYjQgALoHNM2iqF6agxUoQWa6aQ7gkK4PRCyESH1klkoY4JBmZDet3
         0KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182307; x=1776787107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        b=BlAQPSZ7GWIX1KUHGjSoQysR5bR1ukXcEGuly2mniuJ+8jSUSGWNSsuLai+nS3RKKK
         CSazASqu98OmUq0qEQi/Y+1UT+3ag02MtNZOcsRI78b20i0J+xAqASn1IwqwRWD8VUcu
         Ny0l+tGE7RZLbrCR+ztlMXretogwoh+pwAiq195n0lsIyon4XnrzjnnvQpojqvWqW5x/
         r85rUt3aq6dgohDHbE3kOsqRxuxZalS/+ycZBijn3ysJ3qy2vilKIgAaSsy7jldKneiK
         hLMWb7umBRlt++w0Mkz7e4/fyMlCu58FOQpESV8jL8ouNyTEy56u47Cmb6eBVzRdd0AW
         cwXg==
X-Forwarded-Encrypted: i=1; AFNElJ/DMj79EVA1P5t71USMY43p+ldtdLIMMiMEqNkl5gz6kV35aA3PlXLAo6TRN4wxykdLEkDaC7mWRgjrYU+ESW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylVDlYTsxFEaMWTWgDyxUqu+6ocr70ZBtrbC8GW/11Kmy3RcJj
	dWGm+fuGgXx5gaxfKEm1HvBqbAGiEHdVJgKLqowEfC6Pet/bBIOEyntgVMDvD6cXzqvspuUIiCe
	YvZmB0G2D7RUCtemh2a9tyQYza/XB710=
X-Gm-Gg: AeBDietMAyRD82jBL+aO9xsPHAGgeUR8O/35wcovEMMJPsModa4q1dnyKLJ61jpU+7b
	h7JRjXLST9X0bLmlRaU+aAg1XSJbEWWtJWSEE+AybiGVvmiTV8as2mAkoXm6Zc84u2PaqcTu1dk
	rXz1CKdN3KKhm9OUguvfv4dev0PEhzTLLhdFTY8aaSYIFFTO/ENBX5gXog9GnJE8rhNqXYvnAu0
	bKUkNNLfGOxNktGjxBIlq17AzfgY7f5NWv0LklZxuBuMu+m68MnM6yURCch+F8/mjRCrLbTJAq/
	TpzWJwq+0jglWlshMdaXNwHFmymhekAc2pC1UN8G1LMTq+Rv336PbwbDKj60izwhBSRwxgzJxz7
	L8jES8YoXzax+4dsbjw6d4/IToCSlgJk3yw9H
X-Received: by 2002:a05:6000:290b:b0:43e:a703:3665 with SMTP id
 ffacd0b85a97d-43ea7033872mr4250710f8f.25.1776182307210; Tue, 14 Apr 2026
 08:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
In-Reply-To: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 08:58:15 -0700
X-Gm-Features: AQROBzCLeOrIcZKaiQb6Cd-OuEC8rfDXHtXvBFTPGfyaVO0Jqt2FWke0BxyjjQs
Message-ID: <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 8:10=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Apr 14, 2026 at 4:36=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > > ACK, I'll try to use those kasan_check_read and kasan_check_write rat=
her
> > > than __asan_{load,store}X.
> >
> > No. The performance penalty will be too high.
>
> With using __asan_load/storeX(), it will be one function call to get
> to check_region_inline(): __asan_load/storeX->check_region_inline.
>
> With kasan_check_read/write(), right now, it would be two function
> calls: __kasan_check_read->kasan_check_range->check_region_inline.
>
> I doubt an extra function call would make a difference in terms of
> performance: the shadow checking itself is also expensive.
>
> But if the second call is a concern, we can move kasan_check_range()
> and lower-level functions into mm/kasan/generic.h and include it into
> shadow.c, and then it will be just one function call.
>
> To improve performance further, the JIT compiler could emit inlined
> shadow checking instructions, same as the C compiler does with
> KASAN_INLINE=3Dy.
>
> > hw_tags won't work without corresponding JIT work.
>
> You probably meant SW_TAGS here.
>
> HW_TAGS will likely just work without any JIT changes (even the
> kasan_check_byte() thing I mentioned should not be required), assuming
> JIT'ed BPF code just accesses kernel-returned pointers as is.
>
> > I see no point sacrificing performance for aesthetics.
>
> With the change I suggested above, there would be no performance
> difference. And the code stays cleaner.
>
> > __asan_load/storeX is what compilers emit.
>
> For Generic mode. For SW_TAGS, the function names are different.
> Keeping this detail within the KASAN code is cleaner.

I think we're talking past each other.
We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
We're not going to modify arm64 JIT at all.

This is purely KASAN_GENRIC and only on x86-64.
JIT will emit exactly what compilers emit for generic
which is __asan_load/store. This is as stable ABI as it can get
and we don't want to deviate from it.

The goal here is to find bugs in the verifier.
If something got past it, that shouldn't have,
kasan generic on x86-64 is enough.
