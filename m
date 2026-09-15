Received: from mail-vs2-f30.google.com (mail-vs2-f30.google.com [74.125.227.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E03B6341
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477090; cv=none; b=A+pGDPZu155lQgwjepS+O4pHzQ/ePx3cSCHCL03sFviMTQG+84vF+YGFIqiJ9wCoM36U/2JZjfEHPyroaV1Q8mreif6KUOVnC4fgXryHwifqRXcGxEIgpVcq4z9YZdqR9IpTma9P00LnkbKd88+gleHQRxr/rfIEAVqTvbn5hmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477090; c=relaxed/simple;
	bh=BRxd8wSlB7E2SQMnKygjHENZYzxvB1TF13r/v+CPDeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lv2l6U57d75d5bbpP1Bws9ZuAAPzL2d4lKnLkN1YEqaVVX0tSNSgvEba2V3+aTjNWWyIRLLY1GNdkRAsMvVw/QJTAwVakKmk3u4+qXLIAKcoZ3jZbUDTpenK6M0fGOBkZKigh4hzy6Ee9TaMYqC3AfY09vPwd/hRJ1rErFCdOTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f30.google.com with SMTP id 71dfb90a1353d-5c7e8a17839so476823e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 05:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477087; x=1790081887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IgE9SQeMzyYPYC75O9wUrB+kCn+Vwoe0FuhgCIRqcx4=;
        b=FQEbQogfwLcgFYYKNJ7wxFDET4MmDN29iupX4y2fvgRssCUNMM0/jMc9UaSCIu1R3c
         T+xJplg+a3w8mGklrP0y7MX/uJZD6ke5SE7nmssNSzVAXTJZbUy+0AooRSYZJfjitzgs
         DwcRNJ8NNdbLCZp47Gudn82yVUj39yMtrLymnlvsIwLcSp8LfqBfLn9dxZhxojKhjpOA
         T0M2GW6vs7YIRVrGEC1LMPoxLzHdXpYM3H78HWMzsvlTBECMnPpbP7E10PfdWzLS4X+Q
         h8S7RCpuNxUZ/aeKZaadPHTIJuAgbm3Ta2Oi24us2EbIaOuhUnUEnDy31tEkiGbwy1LT
         rv6w==
X-Forwarded-Encrypted: i=1; AKwUvBzTVhV3SJX3mEWii2GPI8/QszOx2FLGCEHzbcdmbbaEggYr/xgCdaKgiKxy3eJ66e/cr1/WfxGKkfetVZQUg3c=@vger.kernel.org
X-Gm-Message-State: AFuF++mowuxZkcYM+s8NzKL/4kAelFSDjhVEpWcS2Wdkmj9EAFVsq8Ql
	Lwu0ZRWQIPbgBEiI4RHukWE2u7D2KgjuwelP6lOq6OoNLlQer1Ijnn7sSMwF2Xx3
X-Gm-Gg: AYBFou2FFIjv65QtlLG4C+jOMPbc6QVW7wkOAwhoRL9rFMYycI2wjsvysGJWinJJLdj
	/ThboEPAYa5wgcXO+8OVf324pT13JzrshWDKLYOUD8LAYcsrkKvJ7E4h1ArGjXhADxg+/MEi3lZ
	JxAsdSymMR6XMl/r89Uy8uRdCknfgFqWxYhsYwOrnnqt30I2emtdv3Uwy6E6nkiRMF9uvrwtUux
	u0DeHfM8Y7XWb35hoFcUKKYnC9Fa+30X9Tcn3RKah2Yjw3NSVy+4tmDwvRqc6r/2XH5VWgqDM9F
	VSH75RFYv0zKrFJOI2V0q/vVyp+3By3EymKPaUTyJHQuwcU+mOUR8A2yGvX/+90xIEEuP/EDLLT
	RNglHnNkP3h4ycpCr6+3TXJvlYvj2IIy+0jvERsO/M1bvKUx07nbetNonltlx0hCkCU8W7cPUwj
	ajBpJUJ3GkuFEPpV2NWMbRT+cIiv2IaWJm5dR4kPWq9JLzAdINwS3xchb8faHpndCkYRzhU+EPz
	aQFqG77RTFY0MlEUhQYXp/qomcTRlgYap0v
X-Received: by 2002:a05:6102:1623:b0:79b:29e3:2aed with SMTP id ada2fe7eead31-79d24242362mr1457973137.4.1789477087532;
        Tue, 15 Sep 2026 05:58:07 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf17fsm13023245137.3.2026.09.15.05.58.06
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:58:07 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9830aa5523bso421772241.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 05:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9MQQpwMKA9pXi8YXvaGqsZn/pbHj54W+MhgonJzZn5O+mA0MrogGg6V48ypI+0he1HPVReCUsc4NftVANIvM=@vger.kernel.org
X-Received: by 2002:a67:fd97:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-79d2757b2e3mr1341211137.10.1789477086677; Tue, 15 Sep 2026
 05:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787978627.git.kmehltretter@gmail.com> <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
In-Reply-To: <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Sep 2026 14:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
X-Gm-Features: AcwNN1We6JvHroelTMDgiuev4qCnhIIlzUn7-aK8UKQI_PPoPrsqy0x60B6d-t0
Message-ID: <CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] lib/842: add KUnit tests for the decompressor
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Haren Myneni <haren@us.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Dan Streetman <ddstreet@ieee.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Sun, 30 Aug 2026 at 05:05, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> Add table-driven tests for the 842 decompressor's output and history
> validation.
>
> Three malformed streams cover an indexed copy larger than the remaining
> output, short data larger than the remaining output, and a repeat after
> fewer than eight output bytes. Every case checks the return value, output
> length and fixed guard bands on both sides of the output. Successful cases
> also check complete contents from a poison-filled destination. The repeat
> vector's CRC includes the leading guard byte, so the unfixed decoder
> successfully validates the CRC after reading before the buffer.
>
> Three valid streams cover the same boundaries at equality: an I8 index
> consuming the final eight bytes, five short-data bytes consuming the final
> five, and a repeat with exactly one block of history.
>
> On an unmodified baseline the malformed cases fail and the boundary cases
> pass; with the preceding fixes all six pass.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for your patch, which is now commit cca072cb1423191c
("lib/842: add KUnit tests for the decompressor") in crypto/master

> ---
> Review notes:
>
>   - CONFIG_842_DECOMPRESS_KUNIT_TEST=m selects 842_DECOMPRESS=m.
>   - A fixed x86_64 CONFIG_PROVE_LOCKING=y run passes all six cases without
>     a lockdep report.

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2225,6 +2225,21 @@ menuconfig RUNTIME_TESTING_MENU
>
>  if RUNTIME_TESTING_MENU
>
> +config 842_DECOMPRESS_KUNIT_TEST
> +       tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       select 842_DECOMPRESS

Enabling a (modular) test should not silently enable additional kernel
functionality, as that may increase the attack vector for a product.

> +       default KUNIT_ALL_TESTS
> +       help
> +         Enable stream-validation and boundary tests for the software 842
> +         decompressor. The tests exercise indexed copies, short data and
> +         repeat operations at valid and invalid output or history boundaries.
> +
> +         For more information on KUnit and unit tests in general, refer to
> +         Documentation/dev-tools/kunit/.
> +
> +         If unsure, say N.
> +
>  config TEST_DHRY
>         tristate "Dhrystone benchmark test"
>         help

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
