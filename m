Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A37F3F1AA6
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749519; cv=none; b=ViH1pSecDpIp4F+0By2lWNGY97ml+Ox2gfzAfn9FficwqU+chxwtbWJiXk26LFSpJaWeQIE3tYGGJEeSwuvyC64+vDsMHV6eu2xEZCSmuR8SIUj6uAS73f0PCRgdHT5TmLmcDbNCm1NUO5PqndrBy1L3aBLrP8CXtQCNfEug0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749519; c=relaxed/simple;
	bh=sYueyQ3bw2pc9KLgyJ1cpdzkyAoFGk1EpCG2FN7G3E4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/2ZEKeBfvBkDvccfpmEIRkhgsUvZdeh3ZbW/GglGw5CI7wNKJnsSnuRIJwvPjg2uQ8SW+rrJ9AaM2+GmxSBn/CFD6qWOZozaS94IJKOkvQhiUIvXZZ7YTypq0mGjOFrB3owQtIsTQPLeglnvqvNxd7WGmasLH21UyiRhtf/U64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bbe617d624so2586907e0c.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749517; x=1783354317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cc1AtD90QbYvJ0NtvKbjq/dL60nodyrS0aRkp51E1w=;
        b=EI1Q/9leYQMZAEnG46YHGlrLNRYqLAP1pnHv1572Fzy8peJ0jCeryTpIFzQNvQ66M2
         fZZCK830WK7A6KGlVEVs6slLvSh+JLUqrDMTEOpaHVlZPk95rQzBmBzK72Md1pCYE1jU
         I8JmnJqtIWdsi72rZ4Yyxn8PzUZ2LEzE4VZd5J6vkbAOz+bgtzEp94Jj6up85FZvUKe4
         Lsw4QFQEU9HyQMpnWtYUGqRR2cNvyQvf8RnTTm6tQE4yrTXxD0f4fyhEkmBTcILpOA/f
         ejc3mvunPF5bNw19DnLTeSYSkBOZtH6QtVBLJYR1JSeYxIIPLw/C5Xpw6NZqzt5uZ+sN
         GTXw==
X-Forwarded-Encrypted: i=1; AHgh+RribCfQuNmpIw/G0NvhfVGs8r/6pQjLSDFGkC/gE5w9sUMrQzEhXmwcshhdqzUDvjf0/evN1HekHW+vDf/GBp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsobBU6kiKLgX/pSZocI2aE64KSJuftdy9/7GFe/hxOoyI/eCi
	5lW9TcKnCCDhn8boeXB8sY2XKNl1aIb+Mmsv243hKrcos7W+/4vyuplMAInWzaSw9Ew=
X-Gm-Gg: AfdE7cnUE5ouQm9TcRwKXK+SOZn7ncdNl1AkHUTT+uwmGYR+ljePRNV3JyljzW+NRhv
	uSIrnwU3L2iCcKteTwOgFIjpLkLnVXZQ0R10PnyXszLwz4RqG2LZCV4AyJnNYTPk5GHWaAmhudz
	NUQvs/CEfAd6WqNT6Yz3gh/SoApsbBFw8cuEISjtcyJC7CeXSO+mCPm7Jrz83YvnE9f9s5yGaKG
	ScVF9xG3wS3kUgipASZxoWTLLhl3Rz0mUNBeZFClIIfYb+wvDPkJsxp1mA9R/OEqGc5LCcYcdwR
	8zvYgiIZZZWFRq1hkacAPq5gAmtVHe3E+By7AxL568HbMYXUfznjTZKmY7SWzt1nGN79Wp9I2Bi
	dFX6WRDlWuB+oQWOdqpmlxyJh3i8xvauujGLTmicBqRBgz1iJcC1kjpkLNRZrkTSPspM1tyKu1F
	lZL5m2d/MlSwZHlLnmAYTZU4zE+9ukwPZ3HfFcZ02ygUR/Avr4A25k6A==
X-Received: by 2002:a05:6122:c458:10b0:5bd:a6a3:3066 with SMTP id 71dfb90a1353d-5bdbfd3eb93mr40574e0c.2.1782749517211;
        Mon, 29 Jun 2026 09:11:57 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm2287821e0c.1.2026.06.29.09.11.56
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:11:56 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bbfc48715fso3658610e0c.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr95w4XQAe1qzn2qa7aicm4qa3X79dRBlHPUXFD561heCCCYY6iYGrcu3dRXlBO8wJO3+rfEEQEOmUK1KmGe90=@vger.kernel.org
X-Received: by 2002:a67:f887:0:b0:6c8:c356:16c9 with SMTP id
 ada2fe7eead31-72f860dfb7fmr8915583137.20.1782749516783; Mon, 29 Jun 2026
 09:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627082921.1709181-1-david@davidgow.net>
In-Reply-To: <20260627082921.1709181-1-david@davidgow.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 18:11:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfUWBQqsErAA9KAv_ReBEKVjXq-eSpYxvjd7k=HYtDMg@mail.gmail.com>
X-Gm-Features: AVVi8CcD94Y5dYPobw9El3FE0Lv2yFLbfnthke_J1JTWNkKZe4jIUyESMzVEK-g
Message-ID: <CAMuHMdUfUWBQqsErAA9KAv_ReBEKVjXq-eSpYxvjd7k=HYtDMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: kunit: Test Kconfig entries shouldn't
 select other configs
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sat, 27 Jun 2026 at 10:29, David Gow <david@davidgow.net> wrote:
> Add a note to the Kconfig section of style.rst to use 'depends on' rather
> than 'selects' for dependencies, as this can cause users of
> CONFIG_KUNIT_ALL_TESTS to suddenly grow unexpected dependencies.
>
> Signed-off-by: David Gow <david@davidgow.net>

Thanks for your patch!

> --- a/Documentation/dev-tools/kunit/style.rst
> +++ b/Documentation/dev-tools/kunit/style.rst
> @@ -164,9 +164,10 @@ This Kconfig entry must:
>  * be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
>  * have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
>  * have a brief description of KUnit in the help text.
> -
> -If we are not able to meet above conditions (for example, the test is unable to
> -be built as a module), Kconfig entries for tests should be tristate.
> +* depend on the feature being tested, rather than selecting it (so that
> +  enabling ``CONFIG_KUNIT_ALL_TESTS`` does not enable unrelated functionality).
> +* be ``tristate``, unless there is a specific reason that the test cannot be
> +  built as a module.

The addition of the second bullet is not mentioned in the commit message
(but I strongly agree with adding it ;-)

>
>  For example, a Kconfig entry might look like:
>
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
