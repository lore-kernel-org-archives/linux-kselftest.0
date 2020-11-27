Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24417C63798
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7D042223F
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8TlO/HS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgK0PzZ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 27 Nov 2020 10:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgK0PzY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 27 Nov 2020 10:55:24 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4E5C0613D1;
        Fri, 27 Nov 2020 07:55:24 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id v92so4927807ybi.4;
        Fri, 27 Nov 2020 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OXr+s5wAAmU9q3J5K/pMxQtkv/iCji6oBFIpmoY8EgU=;
        b=i8TlO/HSrIZgKHzub2Hkh91MLq6st6QSaekpQByjGZrJpv1XY0neQO2ef8ged8QYKT
         mgRqw9QF3RrXK2LkdBc3z3quag556lJnifjP1/6NoKnkgi4Ey8tMkT8n6nQx5Dzs42IX
         MEAiOwMggWPv9nhbQ2CEV1lqvw3GPfp0L2zk7Mke/zgnt7oc/YLWT2U04RD9p1j/dbk1
         prPugYZEgA6xu3qIAkFkxH4NUf0v0kosbhheWtUdyIg7BDhvfH870QDFY8YHSmqG4TC7
         Vgg2sYrlLRzXN/mqI8f3zt3o1dOprEssbaAdl7AufRg7tIWkKlKhe9vhjnlOsDwZ7MPV
         Vqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXr+s5wAAmU9q3J5K/pMxQtkv/iCji6oBFIpmoY8EgU=;
        b=o/5zk7XqF3KliZPF51QWINWcEn9wleUekpNQtWo4SH5wb0/gx2ewSoyvPdYu+BqYLw
         BenVqhF27FtRymbAPJyuHQ5yqpqr6wAgl/3hw82Wdiy83UybgvdV+dWH7MWo1uFNHqTw
         fjNt6AuSHCQfwwJTt7pfxkJ0ySkUvtnHPcg6vEz8NBoHPYNw2iw868o3CvqZEvFEF1nD
         7R7tBFNwawgDXz82DV2z81DUTWFQa5ciBT55VJn2HhBot+sq/UgzLcQmrceu2nISMzUk
         aZIAlfzv5YyBWos6IMi6n1GNiZua5rzI/WHcbSz8/h9OPEvKkC1esRGR+7/S5hUfHFsp
         C7yg==
X-Gm-Message-State: AOAM531ERTRFWWTfiCCJqRT2DbJXEHHL16KD1aTAmZ3lx6KtyOGvpgNz
        i9SoLwwE0dfFEZ0klOq9mZXbHXyNvM8MuMafCpbVQa1vvVu47A==
X-Google-Smtp-Source: ABdhPJyXmEKyWzC59hbBxUJqm85YZ2F5NFkm6gYoisaDevi695oBAQHt9/vpckMGq4moEpoQrAtQNC2b2N6x+m/6t5g=
X-Received: by 2002:a25:df55:: with SMTP id w82mr9664030ybg.135.1606492523532;
 Fri, 27 Nov 2020 07:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20201121194339.52290-1-masahiroy@kernel.org>
In-Reply-To: <20201121194339.52290-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 27 Nov 2020 16:55:12 +0100
Message-ID: <CANiq72=oFrCtd1rYw3p=AUyp6WzLoMqE2iC-2M9ndcBWBMfzFg@mail.gmail.com>
Subject: Re: [PATCH] compiler_attribute: remove CONFIG_ENABLE_MUST_CHECK
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Nov 21, 2020 at 8:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Revert commit cebc04ba9aeb ("add CONFIG_ENABLE_MUST_CHECK").
>
> A lot of warn_unused_result warnings existed in 2006, but until now
> they have been fixed thanks to people doing allmodconfig tests.
>
> Our goal is to always enable __must_check where appreciate, so this
> CONFIG option is no longer needed.
>
> I see a lot of defconfig (arch/*/configs/*_defconfig) files having:
>
>     # CONFIG_ENABLE_MUST_CHECK is not set
>
> I did not touch them for now since it would be a big churn. If arch
> maintainers want to clean them up, please go ahead.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Picked it up through compiler-attributes with the "appreciate" typo
fixed on my end. I did a quick compile-test with a minimal config.
Let's see if the -next bots complain...

Thanks!

Cheers,
Miguel
