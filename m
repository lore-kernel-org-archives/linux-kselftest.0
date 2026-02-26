Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65130DEA7
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111401; cv=none; b=kPLixL0vvlossvPNNRK7OD7VCupuM6RVxaenbp2+WYNPg5g2zAgSFWxVPixGBH/WiQlQTNDCQX3FKL5T0tUuDhATcjZrto5mWV80ic9ey79llvUyem7v40i9QYCvALbTgIhGXeXHXG+G3HQDsSUTSTRSsldtwSu/4Gyl2S7IGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111401; c=relaxed/simple;
	bh=a1p1msLbl85XGiJLc5pnzixV/EAE95C8WZQeXpg7yPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oI9pAJ/j4O48Ro8Gk3yklKdgBBMoiIBRvszVKZOcH4u4d+0PP92Ebs+MSZYaqKgtkbFOU9zI3FVoJZnrxVew4+r5yM5w4mUlQOTapg8EvKUw8beJq54ia42A1NyiDWPmOuYWBaaK4IqszZzsediqt/5FU/M2yvCNJEMJqyCGxCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a973a7bdfso657394e0c.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111400; x=1772716200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFo4C5bqe5c13AwLxjM1MlDIBZrqfqokVA35lsfZfy0=;
        b=nNSvvYhroanbvdwYpG5PREEr/rNyuwIEMxOHZtOiOQQaDa3GIxDmNSt5mhkW2HXof0
         wY8Svch1SumzKZjIfYkMHtvLrs8ccCoUvRZZaJwr87BI0f+vw2lCwbQz+KA5HFQmbivb
         dvuJiIz2y8rCzMbjDRshoilJ4EyLCUSfrNQsSfgZl+jGkm8trzuj4v+ouW1f8UhIyQgz
         Ol2MhnKBipt1HUOvgoR6dpF1vfEyerGqu+Fx/PNh8XnswVLFDpWEivs53mH7www4a6gG
         QBGBjMr1uxzV681QBpjxZUXnyVNnlh6Z56ds3dAfwaUwJ0EdPnlfRL0LaykyuL4dkebP
         N12Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWY0nqDBfxRm/ttmwshkbZ6mOhrXVg36DSveBpTK4cO4OeOJzqsGK8v8WL6cYM/tJINUWACqs4+AMlnnvsMx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwScD0sPnLmCMcH8JquSOhtBBhi/BrbXJtQRaEItnIWQdXbh1Qv
	r8E0pi/qqrwiRQ/Mt2JnjXxuHDrUaWnB0rA7Gcgdn8cuBnAwCU2b+WffpbAbqYC8
X-Gm-Gg: ATEYQzxSrouACae6gzIhItlIiGeSs7PnPAwxGOE0hIVp0BGUpLCR/Hj/TNrq3bSbulm
	AYSaXwmIsZ9xpl9x7VOUOe398+s7W1vFvAi90JtNq9Jg08acdTr9ROc7CpmN9wdoHdcAaNPPw1F
	j+3cM2OwSovWDGoULmeAm1Ei2DOGPMrtf+sdYCXqP8bFr3E+t5YGfOAW7fRmR9G4bqAY4ENNTH/
	3F1qIu+FkykFpvqYDmgwhNWaBfVGwOLFoa+/9JXSNBU6VL46nrND4fCO8pHMEIxauVsb3dsCxLA
	3t01edCa9mLk3TZjv+TB2r2MkPfMd9XXEg1zU4b4acW+t2inNUwlJfXadGQ0z8+EnKU1raMDv7o
	Yy2puXP52JbWolQ7Cxklhj7XYn0awNvs2PPOapnTlCVl1lpc9JnxZ3vrrIh0RUi0Lde3MA5fuHk
	lYf7ArD0+LQCiJaZpQYYgUibXW8jByycv0Q97BKY0HHFlONPMB1hg/F+R0s0FCDHvbcQKq8fk=
X-Received: by 2002:a05:6122:4b85:b0:567:4616:1ddf with SMTP id 71dfb90a1353d-56a93141db9mr1170624e0c.12.1772111399652;
        Thu, 26 Feb 2026 05:09:59 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c96fsm2467706e0c.2.2026.02.26.05.09.58
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:09:58 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso615764241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXK/+8DtBCyWax8/TlymdUPVz6Id6DoHHPIY5UBUEzw1eYTb3b+g6rvop8SBll+odkVPPheUFA+P7LgwkOlCdA=@vger.kernel.org
X-Received: by 2002:a05:6102:5112:b0:5dd:c3ec:b66 with SMTP id
 ada2fe7eead31-5ff20c30021mr989167137.30.1772111398038; Thu, 26 Feb 2026
 05:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251214181712.29132-1-ebiggers@kernel.org> <20251214181712.29132-3-ebiggers@kernel.org>
In-Reply-To: <20251214181712.29132-3-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:09:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULzMdxuTVfg8_4jdgzbzjfx-PHkcgbGSthcUx_sHRNMg@mail.gmail.com>
X-Gm-Features: AaiRm51PaPKg5xcCQeCnUb9vy0Lr9tZrrIwLkmaSIGSq-OyO54vQniCM8N9qQps
Message-ID: <CAMuHMdULzMdxuTVfg8_4jdgzbzjfx-PHkcgbGSthcUx_sHRNMg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA verification
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>, 
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

CC kunit

On Sun, 14 Dec 2025 at 19:18, Eric Biggers <ebiggers@kernel.org> wrote:
> Add a KUnit test suite for ML-DSA verification, including the following
> for each ML-DSA parameter set (ML-DSA-44, ML-DSA-65, and ML-DSA-87):
>
> - Positive test (valid signature), using vector imported from leancrypto
> - Various negative tests:
>     - Wrong length for signature, message, or public key
>     - Out-of-range coefficients in z vector
>     - Invalid encoded hint vector
>     - Any bit flipped in signature, message, or public key
> - Unit test for the internal function use_hint()
> - A benchmark
>
> ML-DSA inputs and outputs are very large.  To keep the size of the tests
> down, use just one valid test vector per parameter set, and generate the
> negative tests at runtime by mutating the valid test vector.
>
> I also considered importing the test vectors from Wycheproof.  I've
> tested that mldsa_verify() indeed passes all of Wycheproof's ML-DSA test
> vectors that use an empty context string.  However, importing these
> permanently would add over 6 MB of source.  That's too much to be a
> reasonable addition to the Linux kernel tree for one algorithm.  It also
> wouldn't actually provide much better test coverage than this commit.
> Another potential issue is that Wycheproof uses the Apache license.
>
> Similarly, this also differs from the earlier proposal to import a long
> list of test vectors from leancrypto.  I retained only one valid
> signature for each algorithm, and I also added (runtime-generated)
> negative tests which were missing.  I think this is a better tradeoff.
>
> Reviewed-by: David Howells <dhowells@redhat.com>
> Tested-by: David Howells <dhowells@redhat.com>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks for your patch, which is now commit ed894faccb8de55c
("lib/crypto: tests: Add KUnit tests for ML-DSA verification")
in v7.0-rc1.

> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -36,10 +36,19 @@ config CRYPTO_LIB_MD5_KUNIT_TEST
>         select CRYPTO_LIB_MD5
>         help
>           KUnit tests for the MD5 cryptographic hash function and its
>           corresponding HMAC.
>
> +config CRYPTO_LIB_MLDSA_KUNIT_TEST
> +       tristate "KUnit tests for ML-DSA" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> +       select CRYPTO_LIB_BENCHMARK_VISIBLE
> +       select CRYPTO_LIB_MLDSA

These two selects mean that enabling KUNIT_ALL_TESTS also enables
extra functionality, which may not be desirable in a production system.
Fortunately CRYPTO_LIB_MLDSA is tristate, so in the modular case
the extra functionality is a module, too, and not part of the running system
by default.  Unfortunately CRYPTO_LIB_MLDSA is invisible, so this cannot
just be changed from "select" to "depends on". But as CRYPTO_MLDSA
also selects it, perhaps the test can be made dependent on CRYPTO_MLDSA?

> +       help
> +         KUnit tests for the ML-DSA digital signature algorithm.
> +
>  config CRYPTO_LIB_POLY1305_KUNIT_TEST
>         tristate "KUnit tests for Poly1305" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
>         select CRYPTO_LIB_BENCHMARK_VISIBLE

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
