Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B170830
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785654434; cv=pass; b=bph1S1CsMw568oTpF+9SXB6M5jg8+WiziGUO2A+nvIKqtseNSwMuqVXA4a4bbcBGcmD1JJ1tZusyQfrsdzedlHCHFljsJMLkqgv/7dQAnrG+Ld37FKAuvqvcweZLaqHIoYrkRivLFkFCsW9p3Aa2Cbw41OxMj010HTP8IdANvz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785654434; c=relaxed/simple;
	bh=RCN2e3tVC71lg9oEPBrxox+v53mdZwdOJ8/TfLlunPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BASvaJiQ7PQmGhJkhMrdneReAOOovdizkv+32Aj00FB8tWv5cuCn+id8Dhgj7mRsyipi028lSu2CdfNZ0HGlpWbw0UDoZDeS7WYTFEqpG1M7uwpwQxPRae5k7Vfmrwu+TPhaS5FpMkoEW3r6GVTKJU2TskAJMrIvjrFnkADhrfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCnqNV8V; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCnqNV8V"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1600d040e4so359111066b.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 00:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785654431; cv=none;
        d=google.com; s=arc-20260327;
        b=jMuVXKYiqomiJnmA9N8aVPRKz7Ei/wiYJWUc1poRrvaY8dh0ciNvWWwFae4OwAFXA+
         7Hw/TWCYtaXuWMN4W+5rDYnxhJJEAtbzflrFQ7qbEhzSt7khbahqpwd3jViRbndwunoH
         00D+4ezNdnvLK+2AFYMQ3X5aHqxY7hfIAi/TOBqaU0Wzad5XktMosBMbM4vdDCdPF9X6
         m3ApKEekcssnt/psu5z42C3bn5kUxw1P+i7pMfJDgQasID8F1o7bvipo6cVnap+MEzxr
         zpvfhZhd7/VWAzhMU41v13sS8mIfJV08qUS2EgrbwvglyM23zDQ7uUANb1Knz87RyBIP
         CXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        fh=WikbPXFweu8F4+E0uGYDIlwu2ns/2MDFbc++3YERtPg=;
        b=FKWT2KxD1jxetzYQG9/BYmeHZTsF8TgVSpeSYyvU6Rv2GtyCYyLRM88uPu4Yt/MT7a
         jYRqym5EmzliN7V8SwN+36NInCU7ydlJwR4Q4GddXK4O0T9soQD2IybBks3f5TjcoGsw
         H0IiQ/m95P8VHrfx4MBTEGu+pTapijRwe5RmDGbWjxl9qFlOfXlAAXCuBl1ktWSB6HlP
         jdINAkhynIVNd/ybp5hBh5bG3GhgOgDmZMbQXE0WrZyYplYgyeM4LCt4h0xtpvhQhLvr
         sD2OJ7grEooMWE3T2dM6uRfQdEC+xFsWzR+OIgmZgO458Mw7HgFFWSoa4X36ZfAcvSId
         u8eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785654431; x=1786259231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        b=dCnqNV8VvgZXDHfSPYwus3AMaEDxmiPoXnSgAdmdmY/lh+2R4qVRW2HmOt7DaYIjKY
         g7C3EYQ21pCW/qg9yzcNA7pLCjaWtXwX8m605wr/wsWBBkJsUsqwqthAgVUlpA2zFWoS
         EkzBh4+iPSF3GQbvBI6eXThlzHvF9N+hjMA+xdqIUGsfZ6MaQwef8P7Ujy6B96KNnsee
         J7LRRMQRba4hdpqy9pwKbGgMYxG+rD59gGRjuB/VLo/uaP8eNi11e4BGS66LYByYTwMf
         z86t4i0Ael5+Bmo6R2rBWwkgULnDuDw93YYrGch66QJsJHdFSLS4wYdnKwWWbXlALKzr
         e5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785654431; x=1786259231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GogXfJJvpbK5Q9ZmEGJ4gSwznXNyZ5UbTfBDGSUOHs8=;
        b=Sz7Ndx9B4FZfcOZrY3lRpo47eWGm/4Apzf5O0Fv+S19CaOpLSnZnidjMQlNBw+YBGc
         qMlPYmR9c0SOnyxXHyzT0O9eGhZ5YJpW7qCgmAQRkkosVKJxJ6dQCgCq3LqP+S+Lkk7R
         FI8k3pDQRdhkjkm+wY+jXcsf2CbCW0LfBLCJlEN0OsH9k2mVZ9q7pNzk3WWB1sMEADmG
         xoybeU8ts27Mv+vBq9xQ5Rf/fVWN8iZz01mPf4ROaT3WXSz7H80+zVpDwpZCYAgxygIo
         17eWA/t/w8KCT4NqARKM7qb+eU7JJxVT6hU16CLXQa7PdG6gd194S3EO1EJprTBHZLvE
         SS+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqUOARadwtAoMu1GIAnXP2gq8denMi859JTEl1mgEvubF4uL7lTu26mwgFzYRP4mv04JHZK8KapYCL+8T4FjDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq68aJUjvITYa4ykAKxZmRCujQBsuRvopN/5ieuwFM3bBzgq77
	ZVrk6SMhrN6Fzuyw6UyGbA7/vMZWg7SP7DJ7g1Mod9uoWp7xEGhQxG4YxzVIHD7d42vvONknozn
	NLkdIK2beYkwhK/JhVOOeKt8DKRIKNBc=
X-Gm-Gg: AR+sD11vo4bnc5B7DCwcBL6uHXBpyxlDx+dnQevvAZIrxIjdSEXI7lc6q/maqxD6uZ7
	q03G+He7VV1AqrV5lzoZ+Z5nGdcEsl6bQp6TUq/5DpnqCbAzXUBzzuHS+xXGNW3PpSRpwfMFBYZ
	Ia0W+7+MULe9KBmxZmoM3pN1GX4cburPzQqbc9Z3kHPFfUJNFwBRNML/YAoc+88nIap7punRha4
	0K15r5XtuzDF+beoSDP0zPPIk2piw2fAwPCWwFi8WKsYWvE/5kDdYl6KErOyXBQNXlr0+h96vyU
	y/RDRDKuN0K2PXL9WzipF6OJphAO1rSU1H7GdchDa149OrCXseCd1w6rcX7+Uc7fMF5zkYIEhtQ
	Aq3URTCfBa7Y=
X-Received: by 2002:a17:907:7b8a:b0:c1f:2cb2:c448 with SMTP id
 a640c23a62f3a-c1fd316b628mr516066466b.7.1785654430688; Sun, 02 Aug 2026
 00:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
In-Reply-To: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 2 Aug 2026 09:06:59 +0200
X-Gm-Features: AUfX_mwtfmgkviDvjezx7grGX0HL0Gh9d0-llhAlAkkyNEcBgh-xOD72oQTUSZg
Message-ID: <CA+=Fv5QROOqTtQL7y7x8FDfL2ejJY+P5mCfDR1khJBDEGFCDOg@mail.gmail.com>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
To: linux@weissschuh.net
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Jul 22, 2026 at 3:28=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:

> + * Syscalls for Alpha:
> + *   - registers are 64-bit
> + *   - syscall number is passed in $0/v0
> + *   - the system call is performed by calling callsys
> + *   - syscall return comes in $0/v0, error flag in $19/a4

typo in comment ? should be:
 syscall return comes in $0/v0, error flag in $19/a3

> + *   - arguments are passed in $16/a0 to $21/a5
> + *   - GCC does not support symbol register names
> + */


> +#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)            =
      \
> +({                                                                      =
      \
> +       register long _num __asm__ ("$0") =3D (num);                     =
       \
> +       register long _err __asm__ ("$19");                              =
     \
> +       register long _arg1 __asm__ ("$16") =3D (long)(arg1);            =
       \
> +       register long _arg2 __asm__ ("$17") =3D (long)(arg2);            =
       \
> +       register long _arg3 __asm__ ("$18") =3D (long)(arg3);            =
       \
> +       register long _arg4 __asm__ ("$19") =3D (long)(arg4);            =
       \
> +       register long _arg5 __asm__ ("$20") =3D (long)(arg5);            =
       \
> +                                                                        =
      \
> +       __asm__ volatile (                                               =
     \
> +               "callsys"                                                =
     \
> +               : "+r"(_num), "=3Dr"(_err)                               =
       \
> +               : "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_ar=
g5)  \
> +               : _NOLIBC_SYSCALL_CLOBBERLIST, "$21"                     =
     \
> +       );                                                               =
     \
> +       _err ? -_num : _num;                                             =
     \
> +})

One observation, although I am not an expert on GCC inline-assembly constra=
ints:
in the four- through six-argument wrappers, $19/a3 contains the fourth
argument on
entry and the error indicator on return. Would using a single read/write op=
erand
for $19, similar to the handling of $0, make that transition clearer?

Michael=E2=80=99s successful testing on both XP1000 and ES45 also shows tha=
t the current
implementation works correctly on real hardware, so I do not consider
changing the
operand representation a requirement for v3. From my side, addressing the $=
19/a4
comment typo, together with the "TASK_SIZEi" typo already noted by Willy,
would be sufficient.

Michael=E2=80=99s testing should be sufficient, but I also have access to A=
lpha hardware
and would be happy to assist with any additional testing if useful.

Thanks alot for taking the time to do this.

Regards,
Magnus
