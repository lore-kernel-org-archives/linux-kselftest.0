Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114F3D3D11
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228392; cv=none; b=YWq0xMwr/ZV2qYCqFP8bPEa67EG2o8srZa5z54vJ38U6sDwt+hm7JeQv6bwjIv8KVqBwIROHNnPFjfJikVHrAM7+QWDWnjy2eXA1/nCulqe7QQhkjeM3ZKL7hScJ2NORihtAs/q4T8W/WLbgWLOXy6ZRX9Fmpj4yHEX/GEbuKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228392; c=relaxed/simple;
	bh=DLea7GDB+WBJ7RoAC77zyEKX0QnwByXNUQOxrZdvpNM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYfqxU/o7L//S3rWw/xo0Ov0BSTVlpkFBP/hSO8XklnHheV+mitaKLewYkGSI64Ee5ixMlLB7ght4FTHdD1FRKvMVmADEglXD/JuDLlCz1bwpzkj6/5ylRRlwrBFJ7sMT75JZgFP7szpzIJQxK/8oEH/BraupetJLIbWmcs1eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdyzDaLq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdyzDaLq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23397565e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228388; x=1785833188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TY5i83xUXytTq3W3hDjBOHFIBU26TkcCDfOy7gh1KLI=;
        b=pdyzDaLqNNd7Xs/JYwRF0Mqn3R+HXD3Ec5us/7Vb8W81DDyWCDKu5bDkH7GALWFg52
         VMVkU/sHu/BoXpTJqZ6ZvNIfmouSE75isrGyKfgY2nm7aUaoeoYSMb0dVwecuoaYJ4Oc
         DlYP5TUspsRf6Whep/Ki9+NGHuXxT5p1YoGjAbo7PwaiwWq7A0zG6SyYJWoQnRm3HWIg
         bHrL84ouUh5Fw5ZGrk5fo6tElEnNpG2lE+LnonZn9PVMLpbIRFnN+NWRYMT+x8VpG/d7
         zeO2rc/Dd6rMXYJ7cSpexdQrCB5UVz4nXJvs0ju5EWKOfpXz7beAsSZjiTBW1AplvZg7
         n+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228388; x=1785833188;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY5i83xUXytTq3W3hDjBOHFIBU26TkcCDfOy7gh1KLI=;
        b=qbQQSP5Z1GjaRQt7diubQgAAfZwZ/d/5aYmvdL4ZiULMSGgFhrjms4fJ55vQbq2VHT
         jizLPpC0U+AhODxN0tkCIaCz9QRdQozYxar88pqluWUvY3r5+5bWgfgrIj7gCdQ556VR
         pVPjl8AFrAFGeKwtssoyPHzLonGLN4FDOlst5EpmLBqfnSZ3k21RLmkbnMcfT5pet42k
         c2Nejcd8A4RRBNO1Sdp+07cu+7FQOpE524fHg5bDqqT1hMTURFBhJT96In++T3+7BiDW
         rfpAJnm7YS2HxGYNkbVbDSw/4bk54AalQwYnQNSXdYnOzRnOMceGGOxUYoCeozQ2ThzD
         UXlA==
X-Forwarded-Encrypted: i=1; AHgh+RpNU5m/CkNno+z+k1yF6GRbOw/WN6Wn3l7VdTalEm1QK7G61+YRhRtlYaj79U4QQmxwWjHyF6cpAJdEevHYPok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIsd8/srfy0QxD55PRP75YwRLUFcDzKs7RCs0GgSXMaN1PuLl0
	wb9WKkUV3g/1eHAehk8b4ULW79Mz/ui7BF4SlOObwxDdFt7qG1AwFhqs
X-Gm-Gg: AR+sD13SAcMcXlEEliaZqeUc2QirEfLtdbetDByMJW+3PvcUYe1ZF94r8iifyCZrv8G
	Hvb4PFKSBstIdVTDIUkx310FaYiuYIL7g/eepOZhMekE5qtRUCW4lY1pKy9uFVfYUswoNgHMDwT
	M7s7FB9ruP85JIqCcLe/uQRe0DkoUZ4ByplD7qcIXj6cWaSa9SzDLccWQ94xggyODjTbp37/RXM
	iynO2GLBaPzemY2FXoBBS9bymj0avrF0VHRkk/pAlN46FS6bZ36aWdzT9PoUv+JKKJMHAosMAjc
	Dtz0lYfwxYM/q38CZFJAaBZRsab8tytuZGSrIMJ8GirDH0OLKbpQMgcgwcl1lx1vu1WQZ0GSCvM
	jXuU/lGwzLUuD7pesn/E0alIu9j2tp0MR7xEF6/mZ3SaRGWKPuOp5ZYLlLsm8T+hkpF48TL0jC2
	NqmzuJRxSs6ME9Tu0AT7pi+wgjYMAh4FF1+3gDOsLhXHDWHurd2A==
X-Received: by 2002:a05:600c:3b13:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-496c653d3dcmr17415025e9.7.1785228387869;
        Tue, 28 Jul 2026 01:46:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9b8b67sm340321705e9.4.2026.07.28.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:27 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:46:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List
 <linux-kselftest@vger.kernel.org>, LLVM Mailing List
 <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, Alviro
 Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan
 <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in
 abs() and friends
Message-ID: <20260728094626.0fb1a467@pumpkin>
In-Reply-To: <20260726101306.3772237-3-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
	<20260726101306.3772237-3-ammarfaizi2@openresty.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 17:13:03 +0700
Ammar Faizi <ammarfaizi2@openresty.com> wrote:

> Negating the smallest negative value of a signed type overflows, which
> is undefined behavior. The selftests are built with:
> 
>     -fsanitize=undefined -fsanitize-trap=all
> 
> so a caller passing INT_MIN does not merely get an unspecified answer,
> it dies (on both x86-64 and i386):

Thinking more, that is probably the correct thing to do.
'Undefined behaviour' means exactly that.
It tends to be used for things that might cause traps on some architectures.
But I believe 'undefined behaviour' is exactly that, erasing your hard disk
(or starting a nuclear war) are both valid.

	David


> 
>     A simple test program:
> 
>       printf("x = %d\n", abs(INT_MIN));
> 
>     $ ./ab
>     Illegal instruction (core dumped)
> 
>     (gdb) bt
>     #0  0x0000000000401009 in main ()
>     (gdb) x/6i main
>        0x401000 <main>:     mov    $0x80000000,%eax
>        0x401005 <main+5>:   neg    %eax
>        0x401007 <main+7>:   jno    0x40100b <main+11>
>     => 0x401009 <main+9>:   ud2  
>        0x40100b <main+11>:  push   %rax
>        0x40100c <main+12>:  mov    $0x80000000,%esi
> 
> Negate in the corresponding unsigned type instead. The value still
> cannot be represented in the result type, so the minimum is returned
> unchanged.
> 
> Cc: Yichun Zhang <yichun@openresty.com>
> Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
> Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
> ---
>  tools/include/nolibc/stdlib.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> index 1816c2368b68..8d86044f759f 100644
> --- a/tools/include/nolibc/stdlib.h
> +++ b/tools/include/nolibc/stdlib.h
> @@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
>   * As much as possible, please keep functions alphabetically sorted.
>   */
>  
> +/*
> + * The absolute value of the smallest negative value is not representable in
> + * the result type. Negate in the unsigned type so that the overflow is
> + * defined and return it unchanged, like the other libcs do.
> + */
> +
>  static __inline__
>  int abs(int j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (int)-(unsigned int)j;
>  }
>  
>  static __inline__
>  long labs(long j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (long)-(unsigned long)j;
>  }
>  
>  static __inline__
>  long long llabs(long long j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (long long)-(unsigned long long)j;
>  }
>  
>  /* must be exported, as it's used by libgcc for various divide functions */

