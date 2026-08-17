Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0463AF665
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787007254; cv=pass; b=UhuRfHN+0LJ2w95UZXrVQAW6LyBksgRqi9raRkGniocXFvPEDS2FdVmJPM77A79dvN7nnamRdPLzK0k99G00pfQ3c/YckQ/Gp3ZkXJaprUvOADdnL0LJn/CPZwAznJbAaYslrzhh2qXP8tv2o0vFMoBSsy3TFbPlLEpFF0uvz+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787007254; c=relaxed/simple;
	bh=iJ1GSAg/wc98Z92pYDWBr9C6hm164sk6lWEx3mFGpic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2R1pmjO/pMu7LlcNulVBOQd6NWEqY6kcc4jHcCVfw23ts5NUNBQ6LeJp8/vi8EJtv944GJKeKCpslKgAbUK8P5iNqXkthHfQWB3rsi9tKniFLFfz6jYqFa2kidojc7fRjmRKqGGUZ0GlZBoGBfKUp5eTgKgCmhSBCA/1MFRzIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTCduUPt; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTCduUPt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c197eaaab00so745408666b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787007251; cv=none;
        d=google.com; s=arc-20260327;
        b=RNjqslFNAS8sBoAycYKCHxg1t/SSEre7X73hcwUoxCrLKpQVWRc2afcrAQ+fzyOfh4
         F0Fcgy0LcteyCdlMx9Sn6nDj7PQL1a3JpNwIGYWUf3gVc1ddFxST5DzRZxX3OkGxE6I+
         B1MTtFu7IyCPFnz2ufqDJOuUOvOViOgOzt8M8Jyl+vx9iRb6wRKh7sEFZxV6ANjXDU1B
         xOidEk0nc/OqeISNXtk1gI1fTKJRmCNMyw2geLkzZkldY37hSUtPo2soG+x+qVLshO7f
         48lPc0wGEuVKoF1CLvjyjd9wymF0MVlDmZAI6E2x9af+1REIeQvlFW+ekm1bg9xr3yMM
         i7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        fh=05LAwNsZTA0Zj/A/HuiH15Dp1X+ZvKhCHOObz17G/js=;
        b=cin/NC9TfMlcec4DNUMrLLVdsK/pTwQCFw0L2n5xNu8YwPlqP5Ya13SlMClvx3B8EJ
         xrap/esxEd81AkHRHyH7ULjyCW7LnBhdvPcFuMtwY4XXNapYanqDol0AdsdlVoHmJCIg
         mF1Xg/dv12p7lpd4sH9/SbV9nO/hGIwRmyNkIawh3vPeXXdyjf1BM0Or6vBwHEh/e5AL
         b+x/hTE43TRD6j4TWJgIb1ZyE477f1p3AGMPATb50Y5YSYC7cNm8vNYXLvghQ2RCZTvs
         dHSQ0wXV8/abGwhAmyKa6pW64CzeqXS8GCqnNvhCBl1aIFsawGi0RBLFpPFZYba2/Qco
         8cig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787007251; x=1787612051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=DTCduUPtaFabXyL30AOrGzUf5HCTkJHC+Hu0k5+p+Y/4ZNS8/b9drXvEtWoYMPlVaH
         7hzl1ElSvpvxEwnlqOBUyz+VptQQgMerBz6+N32CA5lRlc74NIScza3HQ2f56yHMkvoI
         IQWBLshhvOIJVCU7qSF6ZiYtT5ntEgAh4EYiiJnHBYyWJr5EihrSN3FdDMisKkCe2RtQ
         OcO3FhM5Gs/zhD7PmmEO9HdCKpz6Lx9FGYC9HRVunMDHtDKvNefaiPn7NLfOj8r3HvMj
         E6Ezv718N+voCNU39B1N9843xraHeQ4R3GSk3UEMqdWz+vhA295wlaIDdZcsNfqVXIcW
         3pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787007251; x=1787612051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=Dj8Gr6beHRUqAAO7aE0lpiu/3+Lf87Jkb9otKB90aVTkMyDAF2BfvbiaTDoxM0bJvQ
         yWbmIetoDPzcC1jfkgq8s8esubJeeLeW/nsFPZ+Zf3uK6vSlainqrcx3FUi6fVcMdGlH
         25fxYGI866Wd4zQFpkTRJIxTaCUbmWJhkFgfVHcYAIPGYRWGlJ9OSFX2AZpRZUljkmcm
         XFHyULkY6jgMR+zRKyjK6lBKOazcqNAujxT1uaxlB8r5LKPG/+gFRU2ad1TpyDY/AwpP
         wRndPEufK2T5xTRzsRrYCkzqaZaptfx73uOekwOcUDypOqsKYbaaI2iGrjlVPWeTWTYU
         r4FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4asjB0kTWUObVVo1wq34CPa+GYg2LoANi16pSeQ50NJA+Wst1j7p84KZYqtyH2tV6lSCGhfe47S9CvnAK0ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJPD0pT/Jjpghb6JByrgB9OJSmsWwXzdaaYkecjYJBpuZQPBn
	4HenUijTQyEDstPl+YbNXwSOyUE8qi5m8e1juTGqhb9/HUd1EmVABzKVWth/Sm1Hk5AQLZ6R8zk
	E3ON+h5NtxFIV5Cb0zT+uLe7iZ4+gmS2fYoIhQpRA
X-Gm-Gg: AR+sD1147rW8MglBgaHYElF4AvMUsr+vMmiwIDdJabVXOYW7tleUHec213i7gP8MAwF
	j/fLBOlQ64LS1LHKitV8rKfwAINxgvOes8A3q6sNFnFNAW5/m3ezZiNJHzMsSJwjPiTthTOSiRJ
	Oi2HehQ1p5PFzKAyW6UBUURW6m+/Y8ktDz6hT8oR/BdpzhmTrOdTe0bDQ/d80lyK6yWVgEYRy78
	CGthHcLHyhl6HbWtHEnFQASt5xW3ndmLtxM9C73gorfhYYcXAotHpbzVvp4wC4/nrXhg/cfk4qp
	RA2GaqFUUL3zzFQyWoiuuhUUmgDxi2NpFEkysiGEyi4u6iX6h1hft+xOHGvC5+p370lHm0+9uVA
	iwCnf9vfzC1JRpWRUSDKktq32o4MAn8Q2NxdFsRvwc/xv5LhyEYg5emHk
X-Received: by 2002:a17:907:d08c:b0:c21:180c:d82d with SMTP id
 a640c23a62f3a-c212a1858femr1259170866b.20.1787007250883; Mon, 17 Aug 2026
 15:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813075304.75988-1-thuth@redhat.com>
In-Reply-To: <20260813075304.75988-1-thuth@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 15:53:59 -0700
X-Gm-Features: AcwNN1XLIBynaITswGLdvzxuB2Uj3-hZ60VtqOVVnBmJvH47W0N_DNVtiARsPdg
Message-ID: <CAKwvOd=B2o5bdup0YRoKdN0J3GrZh+4M6VLamDAmit0k53o=0A@mail.gmail.com>
Subject: Re: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:53=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> From: Thomas Huth <thuth@redhat.com>
>
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.

Thank you for the patch.

Correct!
$ clang -dM -E -x assembler-with-cpp - < /dev/null | grep ASS
#define __ASSEMBLER__ 1
...

> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.

Yes, thanks for cleaning up this legacy cruft. Godspeed on fixing the
rest of the kernel.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/testing/selftests/riscv/cfi/cfi_rv_test.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/test=
ing/selftests/riscv/cfi/cfi_rv_test.h
> index 1c8043f2b778b..184df6903d01c 100644
> --- a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
> +++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
> @@ -56,7 +56,7 @@
>
>  #define CSR_SSP 0x011
>
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>  #define __ASM_STR(x)    x
>  #else
>  #define __ASM_STR(x)    #x
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
