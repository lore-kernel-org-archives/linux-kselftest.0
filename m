Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555848;
	b=0gjJLWaKyXCpDZa7b/vAZeWnMxBKE5NPZcDRfSs2sgzGoewPVWK8G2pZUky5huMh+E88
	 r7XRTQ2Y2qQgoQ8qDVW0D5P+B3yqSASGLyc0d2SA7N6tTLpo+hBty7zAGmnJAGu2G3g/S
	 ykPAdsn1PbMIONW+2K4WakXxvFDfE8GVqiaLN3ZX2g48F7/qFIxGxrBhOMhPEbB3NMMVd
	 FrczJvYu/jGwLYGUOvjt3obPJ6IrOQf9jwMYVat4MaxngDA9UQBR3U5K8EUtrGSbYb2uf
	 gCw6R0IFmB4UbH8EGDW9uS8WbguNVf0721VTPZ31pqEfNEDYSqvMtr6Em6hdpvdCS7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
	b=3dnzoBLfZVPtqXatxBXyDQd9z7Y4yKTuvaqbW3PPCqSLfGJyg6Ki7YwHExWlaWEAZ2aU
	 XPkMfGuct+hzzdPjTmqqgyWxxRJZ2kT1JMghpk7CbCT9JLsMaZWHwrI2YprjiDlbJeA6F
	 chGanDu7dXnaMo2fSxjOxHcub5J0uNyMCLeLuaofH5YbGj2M2D2RNIBnpdUDQ9vnUlBEe
	 qq0LizkG+36TpnXj2X7Ga1aLzfmIHaVTTrLp1G1Y2J9ORTWYeQu24wyWnJumQR/atzPJ3
	 iYxYXnXvjcHcI86yfLCb8BUQO43A30kEk7UNXIUrU5OwVwDl7IyHu9Zp5Y9asycGNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7r8awW4;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707D7606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 04:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 707D7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7r8awW4
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f269e335eso33928385a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792555847; x=1793160647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
        b=U7r8awW4d7wFmrFO7u1NARM3mK4MzpEMRRLD1y1k9W7ZFhRhXLQrD0Y/cQ2FjxDRjn
         b9uLKRzic+RqXsLLGCcV+2inpy4rBoaj3/7StfariJ1ab+lVBrxFhTTokOSaGMpSkzsJ
         zvSpDO34JoUyv51TVd1wfhTTqRwO0oSsyIhSXOn409U2+5TXffmQklkJvlUEhUArIcrO
         SRP8eDQrP/QZp76MP3qW3l4yf7TDGDnVMrMAOaxxHv7/oiqqpKbqI6E9uwe0LKkDdqLY
         4j6SU8tkvW5P2Uz/GEg4UQEfBDMkPvekNM5c7DPN/WXm78//kXWTQMyi+uMP3GRNUAB3
         TKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555847; x=1793160647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
        b=m//PdCz7hsRILSTlusd8Q0Ebfk5QAwbD1V6qDF6EF/7hQ9oA71wRprK9GRr5wCsONH
         BKAWCweTQkSuuEfhTa+P8pvA6c6eKLVXCFk5GO/jZxx2QCoghlReQ3h4mgjHLwOlJJtJ
         Ub3rxjkyzccnJ5grSJS0DuvPr7eyc9NO1Hfj/KTgfF3C3CVsXA442dXwiyGAcgG6+w5G
         FGtBIGlB6EzPBJKin3Iuos8kgqxQ8BWxevCMlGMdy2tbDEHPOcH017QoCyBE8FJ2Rc+9
         ptEGxlPyQlvDb/IsalPKKVtzsKeHTT1HBZvVc9GDm8oBVg9l1VxvZ7y6pmDJwhAY4diD
         40Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwcEQjUV1ekpSaA1ILUWgORZ8KyZ7VDXrazkTjLQcWVJmvf9VbXjgNL/pVRXh7oCFeG99j1VKTty5QD0jKNdRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5ilSqMMjBUD9S9xI2xQbAZhgfy1CD6EO/A2ZTNsxikD5XjfJt
	4OV3VmY6vZKc/lVJawbZjHMEug118yFX/i/uwbMRWaFkvxc9vGR5G0brEah3Zuto
X-Gm-Gg: AYBFou2y5aTBy+UvgRRD24sETcQSw0XRBZZzNxZntiesJ5Li+cxXOEVjOaQWKbXV+H1
	H7OvU/AZ2SNDDNw8dB5V4p7YvG404HHPag3+Xfv9mcrtONbtpyeU2pALs9YxHQT64Qi2KFmmMZk
	TNlgppHmgdBqhZMMEx+Pkp7kKt55cPknqTRirVP1zN+BG53CbHhp/qrBcAqtPeLSZRFR9DHp4qa
	sJv/gl5MrM6B9Rz4bjxYQGKbF0As5hDefByOGdKwaowtvyfYQfApKapVGIYDwFEnFED046/J+qo
	M0p/l3YK5kH9ego5W12x9EsPP1t7byNwrvmXLLxiEbHaJmqXmEpAyyD9FR+i7DQai1HscdRmHX6
	XuPTwQn6pog3j7E65CNYIaFyTokOvIumxhsxq7b+3P8bOrxc16C+hWSjkEdxl0II0u5MeKs+fbM
	fcyz2wrXw9tf5ce//GMOxxiwzyJ32xEcj0Fd3/aZDbrjFG5ThtXtdmoz9RsNT3cTSd2rcK7+9QG
	T3oMsHH18cqsF4dgg9tF0kOPUyEZE/lJPOC59nXNcO821+BlDcHK70ffxSM/dw8APUdC/C2bxru
	ZW7H0AM=
X-Received: by 2002:a05:620a:44cd:b0:93f:2c95:658c with SMTP id af79cd13be357-93f57f1ed0amr231705985a.14.1792555847390;
        Tue, 20 Oct 2026 21:10:47 -0700 (PDT)
Received: from keith-pc.taila86f15.ts.net ([2600:4040:50fa:9200:fff4:6e82:93d2:837e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e247ffsm149480485a.39.2026.10.20.21.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:10:46 -0700 (PDT)
From: Keith Teeple <keithrteeple@gmail.com>
To: szwyb123@gmail.com
Cc: akpm@linux-foundation.org,
	axboe@kernel.dk,
	david@davidgow.net,
	kunit-dev@googlegroups.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Keith Teeple <keithrteeple@gmail.com>
Subject: Re: [PATCH v2] lib/sbitmap: add KUnit test suite
Date: Wed, 21 Oct 2026 00:08:49 -0400
Message-ID: <20261021040849.688374-1-keithrteeple@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073253.520971-1-szwyb123@gmail.com>
References: <20261016073253.520971-1-szwyb123@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 15:32:53 +0800, Wang Yibo wrote:
> v2:
>  - Test sb.alloc_hint as a plain boolean: KUNIT_EXPECT_NOT_NULL() passes
>    its argument through a const void *, which a __percpu pointer cannot do
>    on architectures that keep percpu data in a separate address space, so
>    the test did not build on x86 (David Gow).
>  - Use a BITS_PER_LONG-relative bit number in sbitmap_test_iterate_set().
>    The hardcoded 130 lies past the end of the test bitmap when
>    BITS_PER_LONG is 32, so that bit was never visited and the test failed;
>    assert the precondition while at it (David Gow).

I am new here and trying to be helpful by testing others' patches. I
reproduced both v1 failures and confirmed the v2 fixes, applied on the
stated base (4056b3c9d3c9) and built with gcc 16.2.1:

  - x86_64 under QEMU: v1 fails to build at sbitmap_kunit.c:38,
    same as you saw with gcc 15.2. v2 builds and passes 8/8.

    One detail: this needs CONFIG_SMP=y as well as
    CONFIG_USE_X86_SEG_SUPPORT=y. Without SMP, __percpu has no address space and v1
    builds and passes. The kunit.py x64_64 QEMU config leaves SMP off by default.

  - i386 under QEMU: v1 fails sbitmap_test_iterate_set with
    nr_visited == 5 (expected 6). v2 passes 8/8.

  - UML: v2 passes 8/8.

Tested-by: Keith Teeple <keithrteeple@gmail.com>
