Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693B35A3B9
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181186; cv=none; b=SENAn1gcYKKKHHsQQZkzK177VFL2aQtmn3sQi1h53YpaNMIUhMARTsgUsdhZHl4IadfUjF83AzLnMn0X0K6NsmdLkwl/9shyghAlfrDzV33dl2ZvvNuXPdU+JqoEM0Rcd55WAXCjMVdjHRSlwkXCobKl36aIhX5TqS6zLkOkH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181186; c=relaxed/simple;
	bh=3RupPG3bVf8o1iXp3/mZ55D1C9CIdFksOYT0HhrFzOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuHNd2xdYiYHyvQLKSA4NRQs9xntoJh61s1R9rC5or/Fg9yxfcdLvkvrX0fVfSjHd5u7N0Bx2QGnuqceLbSl9wAer1NmoXMRPNzOmb5KG2Mw5oQJjqCJ6TqdKDda0SoSJNftWDDots+9yuAzVwQFEBLDOBzJqOAn1rnFPwWmmgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a973a7bdfso1737984e0c.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 00:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772181184; x=1772785984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dEzLMMeMCHGMsmtD9q5xZQbfso5OBJS8UWwuF8jf68=;
        b=uJ2obMHdscrgodTsORzEci67Y4FNrLzsbvJ44jMaRTr9EbXausMwE7aQp9cDIPupYP
         GhLuZfvaH2uhGw7dGXl8Px7DyLAOoG4hRwxVKCTi0j8TzjmXwIlHhs4b5yrTauTEq1Qs
         YvoC/aBbkdQt5NJNYM7jC6nS6PiD0fyuNOvi1/WONheznqOX1K7XSXkW2Gjefr/0vzei
         2TNgJxh6Xh/835czy7CXz3Ls8srrZdksN0CgFh+fyaG+5zi1uvrKcIovDCGk7LNXeoft
         kyo4yAyyWlT+fSb346QUQW3MKsMp8Al0TqMQJnAwmj4E+Qd7CSx9E062r/kf6mxtX8+7
         7UMw==
X-Forwarded-Encrypted: i=1; AJvYcCWSVHSbhyb1cNuHOEackFVx+kiU22ZMRTAhhrbmHDun2HEvujb2FRcc0YKxk2tUdgLA9F/N7S14NCrZprAkolY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw193gZiPN831Lfm5tACVRtOq7X4UDn+5yJcsDzZONC5LrVdSUP
	L1sjBDi/2xr6tDytLZ0V/fJNU1R18x2ufM+QDBFZLD1wrvVpudSXSft80MnSbiB48y8=
X-Gm-Gg: ATEYQzw9/CrX1p7va9Gt5dcIb3I0P05Yb1WQ/Ner3C2sZcwIMAi8kzCrKpBFTX32LMu
	975axT8/tIcgaP+0IR9XGhkI1ZQ7qcO6QAovkdCB2cQvQe2tb/l4/56GCF23IIS0CfgIxkJJCQY
	1KAXUd67sMo+yesTQpoxXD4i82aqOhXFkINxIslf1wF5/xXzQAAQ5WEBljG8vNYc9y73TNeyP1e
	0OTIk0wiPyJa583mG6GPz/7APvO/AtF4Ej3GehnLvJfNVr/B4wXqGhhDVQbvLngLSf5ODyqtCYR
	gezrTULeekOwwlFV10ODk8wNhu9e8a/M3+JZ84X9c1RgO5qGBpcsTbEgQp9jvxjq8wsKMSzJKJu
	zQ50Ki94CEpj1SvwvIHfm5unOWHpxI5EE6nqsPEIjmVIfwVE/EFpvEm1Gt+L31ezahJTotY1RMC
	3vcjCFyvwy1PXJIYYmpHoQcOBgLUlfUA2XHhvK9UZh37Yk/WMyBLfcNDmMhzQS
X-Received: by 2002:a05:6102:3e95:b0:5ff:172c:2d92 with SMTP id ada2fe7eead31-5ff322d9081mr1307256137.8.1772181183624;
        Fri, 27 Feb 2026 00:33:03 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577693sm3912758241.9.2026.02.27.00.33.01
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:33:02 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so1355518241.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 00:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv5PTwFHQ2Mh4VQbXA3JHdaGWBnlIkdWLMie86wwGsvKZ/BXPPA+tHFGcnif2fziRF3a7feSlBqIFrIgLuvGY=@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5f5:487c:83d2 with SMTP id
 ada2fe7eead31-5ff325d53c9mr1297367137.38.1772181181577; Fri, 27 Feb 2026
 00:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226191749.39397-1-ebiggers@kernel.org>
In-Reply-To: <20260226191749.39397-1-ebiggers@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:32:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXH94DvcDKN1zTzTBOrcn_zAfZZZJCyGbxjfs8DBya5_Q@mail.gmail.com>
X-Gm-Features: AaiRm52H2NMgOqKerYwyHCRsXF_5j9O_JAbJk1Fw4Sl8AnR8WmXboXf1vEA3uZA
Message-ID: <CAMuHMdXH94DvcDKN1zTzTBOrcn_zAfZZZJCyGbxjfs8DBya5_Q@mail.gmail.com>
Subject: Re: [PATCH] lib/crypto: tests: Depend on library options rather than
 selecting them
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

Thanks for your patch!

On Thu, 26 Feb 2026 at 20:20, Eric Biggers <ebiggers@kernel.org> wrote:
> The convention for KUnit tests is to have the test kconfig options
> visible only when the code they depend on is already enabled.  This way
> only the tests that are relevant to the particular kernel build can be
> enabled, either manually or via KUNIT_ALL_TESTS.
>
> Update lib/crypto/tests/Kconfig to follow that convention, i.e. depend
> on the corresponding library options rather than selecting them.  This
> fixes an issue where enabling KUNIT_ALL_TESTS enabled non-test code.
>
> This does mean that it becomes more difficult to enable *all* the crypto
> library tests (which is what I do as a maintainer of the code), since
> doing so will now require enabling other options that select the
> libraries.  Regardless, we should follow the standard KUnit convention.
>
> Note: currently most of the crypto library options are selected by
> visible options in crypto/Kconfig, which can be used to enable them
> without too much trouble.  If in the future we end up with more cases
> like CRYPTO_LIB_CURVE25519 which is selected only by WIREGUARD (thus
> making CRYPTO_LIB_CURVE25519_KUNIT_TEST effectively depend on WIREGUARD
> after this commit), we could consider adding a new kconfig option that
> enables all the library code specifically for testing.

You can make those library symbols visible if KUNIT_ALL_TESTS, like
I suggested (after I sent my earlier reports to you) in [1], and like
Vladimir already did in [2].

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdVFRQZXCKJBOBDJtpENvpVO39AxGMUFWVQdM6xKTpnYYw@mail.gmail.com

[1] "Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity()
    and phy_get_tx_polarity()"
    https://lore.kernel.org/CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com/
[2] "[PATCH phy-fixes] phy: make PHY_COMMON_PROPS Kconfig symbol
    conditionally user-selectable"
    https://lore.kernel.org/20260226153315.3530378-1-vladimir.oltean@nxp.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
