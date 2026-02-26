Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4B3128AF
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111572; cv=none; b=t12ywOj0QbWPhocNr+UH2VIAUstBenTpF7RY8d0rslCP+wIwhPTRGYPii+S13bp4pFG7UMfV2pvUHMLpHp69q23iswM5KdfQasBbotIW9fU7jsDxjbNwBSl8FAio36EArh2+Thm9gE+QJBT2lgsSWn3FJYXVhu/FJHt4Xov+ozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111572; c=relaxed/simple;
	bh=bUKajU34nTbnmdhjV4E0C/FDXuYDhztUhWs9BNHOR80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REICTVaKiPXHm45J4jHlYgk2STHBqsCpAP2U6sNBGcJZHVxD0mvfBBheM63N93+HNuFeSlQP9xdf5BpdOOkWRvGB532Di7mhdg+ODohgAgFGeDtuKsDSrrWtzikZCFZJ4oVRCmtpzv6fzM72iwRWbZqVA5iWe53tK05vUD/Rae8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dea0e029fso214364241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111571; x=1772716371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hKnjbv3BL565dFjMkZ/BcbOnxBMvs6z5ncDkkB7tgA=;
        b=r3WI6kjlL8RKq3kB3DpeBnv4MDnzVwS5RsMEWpGJnudp4muFyZOx9GcRvPkhXvIfNM
         zsV7dqpB2J8LcJueGaptifNJ+rWlgP+8K1MrEPzd7TuKOVwWYEU4LINSvb7gJGBmEIJE
         xmBy+DO60+hKtp8lNyxjNB7C/9auZjxF8KvPV1k2xN3ghWBVoQuCINZlxKADaWPva/QQ
         7qcyU50q2qCYmPnuAYgD62cB91F6gXqZLIm/Sj5IqDCF7F6i2NBurjwtxFSLTv52F8l8
         TDM/ucovVNbQcs2NQ/SN+CsM2DEcB00UqP/IOK8hvIXWJMjBirNnqJxoPqyS7/9oGDN/
         rXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWInLq0Uqk2wGBZN43/1oaMw4WEGPIE5D4D2sfpFpZLdvZsI88I6Vh8OaFFRyKTQcddElao+VwJcOPrhFvJDpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGX3HxACCB1d1QUceAyAdkWFmQdFLAXVw/ldLAJ0AtKmCV1hu
	+UTF1fUd7cnBwvK7O0TOleI7roqbjGPPp7NZzYVcMpeS9orGAoiYKGSAt1csVZ5F
X-Gm-Gg: ATEYQzyqJ/nNQ3VN+uc3WSPRb3wWEk2taHXm412qyfMgYkNARXTptxs3dNVu35Ry4Vh
	ykpXcWuFJdgLKiE8E7Y/ONt/LB8g72jJIiwPMjCTVaI2DYbCGqZksppqTXe6RVDwqF2zCi3ZT5G
	PP/iUj1P9Gpu88BIKcWEIArm6lY26PsqoHbhhrvKiQr/jz04dl8injnblI2+WTWaTldXDub1+3K
	/yi5kU1pnFnGzsCMutFcF97899Ly9W5pmLVVy188NkUWl8Bg3OM7KJ4IkN9bW14OD0wQJMhAuYT
	ylB3OGMvlgfNyzRo8PTgCM9JbwZbrXjDh0eVY6xRs80E7Iy9ihS3dvDQVXMDMoTRjuc7BfCofCj
	YV3tu6sxsd7brXncGLVrNy8F1si37TgTiiKvaoYkrRP3Y8qBPCU00gbgefmK4Gx9UoWnXOWh8bI
	ysA7iiDFYcHKGH8x4cPBFNMKmoNt2MyrWvP7WREaIuh+7lTHxhEJqU9pghHuV/ybrB
X-Received: by 2002:a05:6102:54aa:b0:5ff:1914:6d9d with SMTP id ada2fe7eead31-5ff1914710emr1827986137.33.1772111570666;
        Thu, 26 Feb 2026 05:12:50 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm1658918241.0.2026.02.26.05.12.49
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:12:49 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a91a5e64eso292543e0c.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 05:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaodYDGd0OlM6MShczSFiZ2kCaOspwzc2qBJlLnT0cPEMZiWH0UCXEsIBw649exJynUKzu/DGTsCdKnJOXMB4=@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:5f1:4fc3:855d with SMTP id
 ada2fe7eead31-5feb311d364mr7291638137.38.1772111569094; Thu, 26 Feb 2026
 05:12:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211011846.8179-1-ebiggers@kernel.org> <20251211011846.8179-3-ebiggers@kernel.org>
In-Reply-To: <20251211011846.8179-3-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:12:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
X-Gm-Features: AaiRm52VYzvaWsbmGKoOT8WKSlc9iNIE8yX77bG4Rzm2pI7VadASzUVGgBSmV4w
Message-ID: <CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com>
Subject: Re: [PATCH 02/12] lib/crypto: tests: Add KUnit tests for NH
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Thu, 11 Dec 2025 at 02:25, Eric Biggers <ebiggers@kernel.org> wrote:
> Add some simple KUnit tests for the nh() function.
>
> These replace the test coverage which will be lost by removing the
> nhpoly1305 crypto_shash.
>
> Note that the NH code also continues to be tested indirectly as well,
> via the tests for the "adiantum(xchacha12,aes)" crypto_skcipher.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks for your patch, which is now commit 7246fe6cd64475d8
("lib/crypto: tests: Add KUnit tests for NH") in v7.0-rc1.

> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -45,10 +45,18 @@ config CRYPTO_LIB_MLDSA_KUNIT_TEST
>         select CRYPTO_LIB_BENCHMARK_VISIBLE
>         select CRYPTO_LIB_MLDSA
>         help
>           KUnit tests for the ML-DSA digital signature algorithm.
>
> +config CRYPTO_LIB_NH_KUNIT_TEST
> +       tristate "KUnit tests for NH" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> +       select CRYPTO_LIB_NH

This select means that enabling KUNIT_ALL_TESTS also enables
extra functionality, which may not be desirable in a production system.
Fortunately CRYPTO_LIB_NH is tristate, so in the modular case the
extra functionality is a module, too, and not part of the running
system by default.  Unfortunately CRYPTO_LIB_NH is invisible, so this
cannot just be changed from "select" to "depends on".

> +       help
> +         KUnit tests for the NH almost-universal hash function.
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
