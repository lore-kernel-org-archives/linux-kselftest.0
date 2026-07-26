Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC823BC68A
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785075221; cv=none; b=O8YiuC48sLfIYN3wnOepXUdetu0plYZcU44Y/VQol9ElQeP1WjyAIGI0FkAscwnnCGsYYyVcP5t9bxtvIVSQr44dpt6bsBFipoQhrAL1tsTCHbgAWEeGwyMRM7w9nyjdEanqrdM16m9G6ai6ORFdhhlKtvHqcx20pBLDtJl70Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785075221; c=relaxed/simple;
	bh=5EVN9kcvU5gVRWVLO/DSXXNw7Y1dcHFYAtzffkegbYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPMGdR+JdFAAMC40ncwFCaI4k6Sclm8NYiRnCaloWm6MiIJsLRAU088Jua6gCGRGxAUuMguZBVnPK4Kh6yLWuz0UUO3YGN2s8T4Q7/NVCc6yvWncHUv9K8hBr/igURM6ujb3kZj5J2CI+4VsBYboHeBxzxoWA3U6gOzOAMF21MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+Lo3fbk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+Lo3fbk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1548092f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785075216; x=1785680016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4g2kK4jDWITUw2uejvAMiPY148LZbRyudfCDbQMRog=;
        b=f+Lo3fbkFWziCCFqgSZ7a3VVIyir8921yRM2wZPvoUKspT81feXkpn6GDJLvVUH4X0
         WnXGo+lq0aEjXBr44a9z4QVBDnuFxeJJ576MO+4LS/3vTa15Dau6pdRmssNyn17C3eb1
         mlt1GLa4aNnDxAN1ya8BTK6YV5YMoM/RgutOG2oKkwWe8FhAuNSXz+eRofSCi1GFDvRj
         Y56YZ6zIR15hV2ZKqoL5aFaR4Lxe6rgW+xs496tMwQJP/GPJgl2GPet7/JHJerV20qbr
         Q32p5qI95f48SHONq++dKQBj9c2YW2iuT8HI+dzs6bduDYc89ntYhOJFqG/s+1n+sWrl
         ZMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785075216; x=1785680016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4g2kK4jDWITUw2uejvAMiPY148LZbRyudfCDbQMRog=;
        b=Qd5XdpEbMjgzoYcvxw3J3RQMQPRZaWos8APocKV9reX8GL1nlM7owBaGCAjMxySDvs
         qEM8FJaoyuZjpLTm+WXjDjKcfWDrwJ8HjseGD0AEaLApLbO5FrtkaIX7r6cAAOWienae
         RvZgQgpifTgYa8fu1quRCJBoI+LDCGAVcnymCV+HD2/YIQzBTjygNyCPW6cPvhd3cg6L
         OvSWz3tflW1oGMWtpYxljOuGRwDfZHV5cADPxZLKp6/TbKRdVJn5JogBVhBwvdVXXAXY
         mG2p56O1E/jtXOCIUTU+VMiIwr/eF5IRrC4ciotyanuv7yqoHZtsCngGxQ9jpM4PN0Ha
         +/sA==
X-Forwarded-Encrypted: i=1; AHgh+Rqfila907cI4WZ1Gsv8mHZoamREBkQMnumJI4cgqtmEeQAdpuk7On1LtPEpu6ER1IqE9Xmbwh6T98A/Rvb9tdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBPD7hH9NsCzsi/q6d8bRVt/boJJJ9zLhTO3F+fnGBwQYVaEMN
	NfTScoI57FQ8552QeCZBFgpITKbVxKfUsb5QiY9OKQJ8UDvSWxibp07f
X-Gm-Gg: AR+sD1010hq18In8a+mqHVgcF7GdGKIt5Utyldnnx/8gMBNwzTJ1WXcH4gJt156vCZi
	/YGL1Cm6XaurvAUqja8dMKwbR9eW30uon31HDnxHbZb88YGbAC42L0MxyVutWo1OKXuaa1ueg6w
	WxNi265tePGwMyEZGQJd5JXTDwJLqzBj6NsDx29dnR7J//9rj7VRvUrKaRa1UyyJhoev4+hg0eH
	nH6+1hfhKpoo0FjXOn2ZPI4SHp5kUeRnoqsmxfz9wrrPUriwDQgZhdLofQ1tMHzHylH7ZauPv+M
	MhxtgZhnd3LLa6heuHSBaGxuCA6CvHvsz77C0KVnXrjQiqnrZ/VQw4NBBxSVlJddXyroK6nhFay
	Eag2yuKw+QEVDZlIVBfuGKvoZj0PS48jxmZ2Tw2lBzLqZIU/3TmbayRhWw747eXmwkQT3uJWtYk
	MzXonYPEDSQvsWEf+LIR5kaQ9kRvtdI4Y5LtcE3Is=
X-Received: by 2002:a05:6000:188e:b0:47f:921f:3a37 with SMTP id ffacd0b85a97d-47f9fea4346mr6495997f8f.35.1785075215987;
        Sun, 26 Jul 2026 07:13:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm39925390f8f.33.2026.07.26.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:13:35 -0700 (PDT)
Date: Sun, 26 Jul 2026 15:13:34 +0100
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
Message-ID: <20260726151334.4c1ec6f1@pumpkin>
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

An alternative expression is -(j + 1) - 1
gcc (and I think clang) optimise it to just -j.

	David


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

