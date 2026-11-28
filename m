Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795881730;
	b=cfFOnfPPTaM69q5XE2zJvaqnCM2QAkXa8+9buz1uMCsQ81b2gsX0yAbrXC9yY8tTw4+p
	 Rsnn6f4bwgOXcAxPtBUzLQfumstLDZxsptpnSbKK033jFUiN2G5ybGIphNCC/NP+nhTUy
	 fLdaRZbkkgxEACF2kkoBTaYYcMF5fDD5Z8sI5itCdb2gWO536SV09IDvHQrnHAfMibiM3
	 q34oPYWkIyVCph/TtvmwiAKgV5m5s7uF5ThL7vRGNc3EasJ69Pa+VZFymESfgg3v8hM3I
	 kJ35gcapb2cEcKGx9K2Z3hZ49a3Gq9kTUt+0/uAzzSySphMvO3dWHQfyYs5xOit9S9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
	b=RavmoawRHxyHTmrWavjhHp7fqoWE1uwFld+MxjVDk4+2ygvIuZ391lURpQga1OyfJxVC
	 E7Udio7NwqWfrpHZSRPe3HJNtPBfZ7vYPbQkiZ3ibMZzrqW8/72s1JgxHc6/Wt0uW/cEe
	 4sffzsJmdb6593q4feg6lqIue6HlHVQrQ6Fqb+HeD5LLZPGrH3+113z4tTkv3DSTWQhXy
	 sRKVoY77DV5HhcjIUQXESi8vthBtDqowSfs7GJoPqYwOdfTYGxNhLeMHgnXTpOUx+lQNg
	 e0zp43XSWLTzPMnfcmHnkUAhxKniKLI12lA1qHa2/4areuAt7wcmGd3hkC9onevpZ3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmk8WOA6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEDC606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 16:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FEDC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmk8WOA6
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f048476ab9so62770555ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 08:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795881730; cv=none;
        d=google.com; s=arc-20260327;
        b=HiSfOSLqKLrszWUaWgXSjqpqOQHvUr3xMBbd/h594pJlq0bWi3PIVdg8Aj3BZo2kHN
         4vhLKFsj4YuXxgucfydvHNVPcgJaYTl+NAZjIHRbye4prH61iFRHRJ3OPxoZO6wCrXxE
         R84KEzY6Pk2bW3pOVcb+hQJXgnbCjDgVpvWam6cdJEwU+6+JxKyI4qbKql90ZEn1T/Tb
         wTKFm4vd9HU3eG2HKcUcC/pnsmUspeAdh6+svr5/KT6YvxX9pm1rLqxMkJKaE3F+mphO
         yHu4GupklncwpsKknHYtT6r/ha2svjcKWPPj5o8NvNxHHUFM0WmY/gisi05VZe0s9ir+
         xOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        fh=GcjjKlVrgWOfCOsTNSUkqU3PQ0/gvGFF7mq/J2xbzqM=;
        b=CwfdYvHClp81gNn9TJ9ja2oAcg0/fDJ6VK9Osy1ZReY+GFVCIpHqrqPZCimf5KvOT3
         TAG3mMqfG5xeOMOgWvsMdzHhRZzSeiKpPS+Be/hONnMmKItgAOSGljfnjkBtXwcnyeeu
         hBadYqwSJWZrUXu1ayzEphWWVoMx4frO/U7FxDbZ9p11VpoAnMFU8277AwwxyL+tRoC4
         XoLZ77ZDiiVWCEyxvzmuo/oW9seSSSajt32GKhKSlVU/aexnDhhQS2pTE7uqNq5pIwU4
         pSK/P65datr4zC9l5gzQXFet0OyQwjwH/YQIriGfoYECUZXA1zDwbG8WeC4irILg5gus
         Y7lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795881730; x=1796486530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        b=zmk8WOA6FUDJXkzrmiZ27RPo5EKYS6p5UA0inW4mHOCJ1hJB6wDY9hKSR+17ZPcZnY
         2kTnILZGlnJ1GJmQ0pDqJi4wslgtc0ZMHodhjVE5ntoT4d8YZlOCNUvl/+pZ6GdGYLT0
         ksYHLFxcrRzQ2dhPZd5HqXFiPB36u7RMvM+ghU3XdamPndXpYdMC0fMF8097QQEMsC6j
         dI9QBAnJXx76IjDCn6o609q0v/ZwaWdDb5Ybxq20pCnoVKJQt0BK5pSX26gu0PvWUqmz
         ZFdibwAJBT3b/c7hZvl4zfDW3pS+A2X83GREaAKemKnW6khlworuZeIsiDzWRgv8oqKR
         Zptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881730; x=1796486530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        b=QYLQbZkWNgoWqS30hrDE6MMQc5GbqDMOg4w+S0YWaClZcOXOmt3mwxhnDZjTaSolv6
         wp6KrXU/nCfz7OCkt176ib/aty8AKI2aGYes/8jOZX6r+xyjFyKpyxvK+4mKHPmghjaA
         1nlf24fpuHb2Ts7EV93bkx4JA4NOQ5EnZMByhlx3nvvWVrBkQi2WDQlZifeORErazEH9
         tHTHuiRCklkF7naaLMGFrONa/+r27uTj63Vzor8zYWD74p9lXmKcbsExgifz7cAVWFGt
         a/9ZzK2SZLPGNRNJfw9WPyZcB7B+bsITDrkQY9AEqNyR+X5ENZgX/0w55d+OiwdjPU88
         B3gA==
X-Forwarded-Encrypted: i=1; AL+hErEEqpEOTNFcw5mn2jCZdeIyBUAuhSG7Axa2he1QoJVFHvzuWLEb6jsnxTcQ17ChbADlUNg4O6oTvymN7TZN9hg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0he72Od+C24KLG1V25fk06ndeEyQIdIoHMC0dEFtOa8YM6xAA
	Xty0uYStmi6ihuhY9n6aCRtruR+qKWw+clPKE37fl47S/FuDaiVH310W+C6Ii5k3yRvs2rQVE05
	DCMPNf1TF9yMUaD56lxR2a3XlJKkjUp8=
X-Gm-Gg: AZFdTZdSx8OethLUN8Ww9uJ1zzJ5GIERmYiL4fQ/TpvbqvVCFtaoPrnvszrJb5T5QAO
	yfz83YdTFKvsPxL1iThw6Pyr73RAiNL+heRuARPDvhjjR9YSqe/T896a6K5G6k/3Z630o9D8ZJn
	fXDPBy/gmGGqN1zSouALXZ/RPQWWiaYrfgIY2ZF6kR5vJCW+cUSEYd1rPZP84aF8wB7ogbtyATn
	bg4Sbj27h+U7+GBvW7L/hgcEwuMlFiwmyGuBZuBRja4K+xEgXFeRLKfAgvd/Wmpy8pFKzwWxfUb
	DOc+pBpEnmtAlhpjnvSzmNPon0Wekyhr5iwq96krwx+EvAjnc7mUvbUJ9CUXnmSpdwA0Sihi4Hz
	l7ebVah+xr1/kF5LbljuGC6HagZz5AKHr2cQwFAPgb6DpnV/Y6+pwZN9QBf7tNse+XeOX53E8aM
	1al6mCFn/gy5oM0hLzVjT0fkq7j1gQMq7hwkKQQC98cRcH9iai0Wnj
X-Received: by 2002:a17:902:dacc:b0:2ef:d54b:fb64 with SMTP id
 d9443c01a7336-2f03f16ca9amr296567885ad.47.1795881729557; Sat, 28 Nov 2026
 08:02:09 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017182455.1884-1-aamsdoumani@gmail.com> <20261017182455.1884-3-aamsdoumani@gmail.com>
 <awnPKRtczyTiEcN0@willie-the-truck>
In-Reply-To: <awnPKRtczyTiEcN0@willie-the-truck>
From: Abdalla ElDoumani <aamsdoumani@gmail.com>
Date: Sat, 28 Nov 2026 10:01:39 -0600
X-Gm-Features: Aa3M54p_u_6mkEHPaD6ExPttp73kj64YHWdX--Ern0ly-UwQ8x2k4BuVhLkwJnc
Message-ID: <CAB8CcCh+kCbC=5mM6ueqObnDudAkXAw+dv3oG01MdnKUC1__5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT
 survives a second exec
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 06:42:49PM +0000, Will Deacon wrote:
> Since this TODO list was authored by Mark (Brown), it would be good for
> him to assess whether or not your patch implements what he had in mind.

Mark, I took it to mean checking that the flag survives a second exec(),
since one fork() and exec() is already tested. Happy to change it if you
meant something else.

> I can't see where the initial parent touches the prctl() and the way
> you've added the fork() before we even print the selftest header looks
> a bit weird to me.

It's in the existing part of prctl_set_for_child(), just above the
hunk. It sets min_vl | PR_SVE_VL_INHERIT and writes max_vl as the
default. The middle process never calls prctl(), so the grandchild
only gets min_vl if the setting made it through both exec()s.

The early return in main() is there because the middle process is
vec-syscfg run again through /proc/self/exe, and it can't print TAP
output. I can move it into a small helper next to rdvl-sve and
rdvl-sme in a v2 so main() is left alone. I'll wait for Mark first.

(Resending as plain text, the lists rejected my first copy.)

Thanks,
Abdalla
