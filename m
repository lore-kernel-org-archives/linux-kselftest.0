Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799965;
	b=XZ11yiDvBpPErLdCsGDzaJSMqWG+RhP1Uk8bGGtEk+ZFiuYIwtRusrznYLIJr6NZpogB
	 Su5aTeN+SBUA9hv/eDpnPwHJV07N4XXgBJu0V5gFFqiTlIrxqPNCX/iT74sjR0K/sPJrc
	 EJqxLxqTSd75SQkPXy2YdCQrQmuGzE0eAK4JwbTdpfOhgi9sGCRcUeoJyT+iN33uNE8ws
	 wBqnVeci/vBfwdG9A/YdQxdYfwwLsAauFRwyoPmr5QL88WFw0FBmbh8JLO5scJGdAJWNc
	 2VT8u9h0FYRiZHKQjrckmk+5mU5u8XgZZPT6gc5Ym/L6t3OwVfBVhVRyLUyP203gwzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
	b=Ka9iCQnw2jLQLpBDHfQ3mVxTlY9/CC9E+PazLGnXYBVWWhVupJyJbXoUmABP+4JYYq4x
	 ZXrLGglizA2KR6COs34kvTCGSjHMeW/L5mSwQ1InASJFpz4EqV+Q52geepQeUl90vp5ql
	 v5HBPOJUaVjMLfhjhCJcHAJEAMuT36K1aOAKQzkzfNwAO0hbnWpcSfCFUDt6o9oUu54dy
	 A661a9Ck3PxUudBbyeFJ/V+mvMLOU+TJuCe65jNi5mT4HPlwQc1siD85gdT4tyd6eBc2m
	 IafrkCCTEsRsCU7xn+lfetikr1cSz42V0A0S8j6T5Z7z283AGBLw0KgGDePg8TxvOXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWnrTbvS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30C606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D30C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWnrTbvS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so1320605eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 05:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799964; cv=none;
        d=google.com; s=arc-20260327;
        b=bMCgFQKA6XtG/GpNgO9PjjuU7JOmlwEfEyNf9i+p6GXkyldSJA7LLia7zbCR04MA0m
         sT4zs/aD2vZAkdCZJCVnAE7jFCPzUdZWc+YjHF8r8yIjxr4S6pBkh4abGoAze4Tf0hZE
         a42uxhsjBi/Yxnj6k6qoUj5hzRcwvXpzJyo7dcbw7T0djXm8KeQwE6Et2cWrXalCRVaq
         WjPXZk7rhluUr10bQSCMevQg/tBWeDxl5FnX+96HUN2qXCHX0rQmuUb/mgRjyRVf0ev6
         2egzGRMdWHsRNAKtvm2DOGq8MpqRRcjoZqtcxWSDc3NGjEhmj34F/8MVhgcRrZ/dWrr+
         MJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        fh=mn6nQxPHACiLSEfU+z+QfJoNmCLxnYp3i1ns6MPjaZA=;
        b=sC2CyGXs8Pf8dUdhvYgIAmv/w0hSq+w59xFoYmKslTnlr2/p4w+5HA5yZmGzidcdLh
         HZW3WjNmMyJZbrxqLLM8xnfgYzhnV/cXvMe2zEyuOdRZN8OIm0FaC4l2BGeVzEgVkOaC
         nOUeYIJM9xcdQ1HYvrGhfpdJsBrYdTMM4H11ZvZujAbwPhw7Zh5qMIunaobgwtxRw857
         OA1Zuhv3HhEZDXBcZW6hPIgkKuV+II45yFjbNaE9PL8inGHNlN2oWlUSJY3e/AYmx8Dd
         Yz68LBNDng+V5T1WlBMCByKXBClAcKeme/DlF0TnQ/dMun673I+RLPBtpGgWLqi9Ebz7
         PFiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799964; x=1794404764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        b=GWnrTbvS0F9bkzFJf2YKx2DDnNs+0A1dHAWUjES1lhkTBtV9QDnEi8sSDNDKgZPDIK
         7v2jIJ3TXFbkvjS8dNnV/U9d0chBoDIlAD8hefNyFrl3FAW/IT285psEyhx7VYr7hJmo
         VjHW6gmKDMXjunXTyuFWf+1YrfETdOi4Cj2lW+rhV+L7i/EZr9aa+gBWkJqBaI66+bar
         XZHSydiJQGoS0TRYPKJQEw56ivHiy+j4xOrLSCAcxrN6paJJ6z6Hm0g/cKSubnG0YV2v
         IAdNpWaA36s8MIFqY1Q4nmfAfZWgcL9n2+YpIySavEqqke2iA2YUwU84UVoR2kv3SbvQ
         nAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799964; x=1794404764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        b=L6vAoQxcQBIgGnMd/fZlhDTC0wV4huNBsPc5I4QrXndutukypaGQ+OVxYqMPfG0RoJ
         wTdQr97Y1hgjtHGDtc6yOaakr6s3Jea2nfL+eV7kU/D/JrKpSd33BPWD9e8cIyuQuFhL
         l5VIEvxy3+JSjH0FAhmSNDWtuyjWt7dv4KO+DqcttQ4097PVBEF+uqCnmkMK66azSE5q
         MDDTXEH/2u1kzgEXuG9NxAf9vsFhnhf5cm5NwpMBGMWNDzGGdfaLyc85IJVq7R7WufM1
         a+j5E3X7DIirN1drKSer79Q4wu1h5QNQmNhPBrRDADhbjvNNREh6GBuw/sdGJ/SOlttD
         eFTw==
X-Forwarded-Encrypted: i=1; AKwUvBxrrQw4/21kIrVaNhNdrWpw+IgFBNaGeVMg1O4WCebInUcnIdg6cyw8uPjI21FgxyiB6kbdJxyJ2NmIJME90cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88F7NBzXgM56KNXxAHhSj08QE91tImH+MEA0VN3zYXOqbxZSxl
	vsJOpvn57xC0Q95JOE+VKuZKQtJLeEdI30yh8UZxpsyddH/eBOp+n8AvbrrgqnssUa2sHLnCgf3
	ca09s4l7AcPQjBqbnheYCy6Ecz6YDE1ZM6w==
X-Gm-Gg: AYBFou0BwB/lHwI/YUY8FGjDyOo+pT/46uKkTKRR6XUVswtvgdGMz/28ex1ICLvR26q
	tXCciwm12zyB9Pt5IMCulP/IJDBRiNOZLXvLV6NSI5W6p+h8JT5MXfq7R2bqd9u0O1HCTD/A6Qu
	h43E2HZIDv0zh+Twy98wYhfl82VhF8jdITiq8X8VV/Ox3frNCjMn9kfZr5EJen01IW3ngFMZu0S
	cK75GlO4BhkW26f2yab/Ddh6p33Q564sel06s+YLGMvsNr8PKtGSzZQhf/mZLQl4m5ZvolM8dA/
	AzPVyBjpdVPDQetFkD/njQHTvGolphH85c0DG3q5BQfBBtyiXWMa1jOHnNkdRRmrVJ5oVwb3v+z
	r+DYs/UwnUmnUnuxx0bPQ4T+OD1hChBgn792Yf9mC/5hvo6uK9hSj9MfzY6ZRiKyR47DcNzHoHO
	1XNb0JlN+92FEtF/11peTvaEfcPO86/EZLlusmwyUXb+JyBxahlUg2Ujg8tpmsckeNo5bp99DZY
	g9dFv4=
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id
 5a478bee46e88-36a423624d5mr22803491eec.9.1793799964016; Wed, 04 Nov 2026
 05:46:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163921.641347-1-sashal@kernel.org>
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 4 Nov 2026 13:45:52 +0000
X-Gm-Features: AclHuK9zoI5ijuNEFX4IBI1jXKyfQ9YWFXRsUdy_iBMcms1sD0iTaUorTso-rIM
Message-ID: <CAJwJo6bgZKyU5zWzTG7-zvFCVbh=A4bd_qCmHEj9NTOMJ+_5EA@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:39, Sasha Levin <sashal@kernel.org> wrote:
>
> gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
> - 1. On 32-bit architectures both shifts are as wide as the type, which
> is undefined:
>
>   aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]
>
> Convert n to uint64_t first and mask with 0xffffffff.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks!

> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
>
>  tools/testing/selftests/net/tcp_ao/lib/aolib.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/aolib.h b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> index 53be1744237ee..71ff975533089 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> +++ b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> @@ -226,8 +226,8 @@ static inline union tcp_addr gen_tcp_addr(union tcp_addr net, size_t n)
>         union tcp_addr ret = net;
>
>  #ifdef IPV6_TEST
> -       ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
> -       ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
> +       ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);
> +       ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);
>  #else
>         ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
>  #endif
> --
> 2.53.0
>
