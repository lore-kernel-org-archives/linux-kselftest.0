Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4194C433FE
	for <linux-kselftest@archiver.kernel.org>; Wed, 19 Oct 2022 19:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiJSTs5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 19 Oct 2022 15:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiJSTsz (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 19 Oct 2022 15:48:55 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14241D3A5B;
        Wed, 19 Oct 2022 12:48:53 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id o2so11434959qkk.10;
        Wed, 19 Oct 2022 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXqWYGSUyr7OrNHL1T/x/7EkjfHttBM4QCa4eRu5CdE=;
        b=ox4rhvjtu73vL7Eoxb3ELsaih0GlyG+yB5zAmkNS2KiGxZogVp8NBKoF6fDJ9BzkmB
         g5m7neSOBU7hxoeYpgeJhyW82i4iUuH+nAkA1889hB4gGWH4W84vgK2aEjqfKIUmw9e2
         6KQeu2jyaZbGrHtlleYWE765geA3KCNVdXzxzwVlSMf01m+k+kOLAS12he6YgxdoOX82
         rXVagiCyq1Cr/b1T2PqecVmN8w/Y2jDApucHSTERZlg+zPKUq8lW7N0qfzAdtRJFAukt
         UcCZNp5iz9eOTx0EkWGUMtkEpjXHNVJLVNrndqpioDkYpW6THJL9HVRtB1vn9S37Go8D
         hl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXqWYGSUyr7OrNHL1T/x/7EkjfHttBM4QCa4eRu5CdE=;
        b=FXLA2xf6CdAGhzY4bmALR2AwuCgobBh62urC+rE92sV41FHBkSv4gM5xz2qGsN8e4x
         rt1C25T3wjOH6lVWZHKE/yG5RrIyg/g+bimR0akT4a4JrmJk/IHsQ1j4uPSH2Gp7CnLD
         Wzen4PrFPJMeTEZmCfyhQG/I8ea1Qrln6BxwFM4JNcuBWsbv44n1WSYznyZqzRznnJqi
         kWdvx8yy0Ur8EPI9LnNHvEirS7S7gz4cdmgutvgmzfr2FanYU7klth70G6yBSL/4in2T
         xVckRsINL9HSO4Ptv5mFNv27yUaW7zL2i5zO56akr6lm/PpKgK0FmrzvApuOMGyJbjX3
         Sekw==
X-Gm-Message-State: ACrzQf1r0tdH4Hc0Bv/JePCYuGiougGO9/kHAi99w44TPPcxpm/7vdP/
        OXrmYZ7ZVB14jLPZYIXO92FKgCppYHQ9uyhl4Qo=
X-Google-Smtp-Source: AMsMyM67C5+6trm/g0kHA0nfVIVp7N/QTSeM9dZkG/qfb9srEg8RMwNlyV/8r8K+waGxTBLgd71QtUJMHNv6t+Se0ks=
X-Received: by 2002:a05:620a:d94:b0:6bc:5a8c:3168 with SMTP id
 q20-20020a05620a0d9400b006bc5a8c3168mr6743224qkl.56.1666208933104; Wed, 19
 Oct 2022 12:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221019085747.3810920-1-davidgow@google.com> <CA+fCnZdPwjThjY7fd7vBkMzS1eFXySR2AKrDK8weJ3p25fzS3g@mail.gmail.com>
 <CABVgOSmP1A4d_-SNrWg7VruxpKj3SZz=Bzb2Xebd=EXw1imXyA@mail.gmail.com>
In-Reply-To: <CABVgOSmP1A4d_-SNrWg7VruxpKj3SZz=Bzb2Xebd=EXw1imXyA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@gmail.com>
Date:   Wed, 19 Oct 2022 21:48:42 +0200
Message-ID: <CA+fCnZcea7UrA11HyRB80WgrUXMtEkK0AjdxEN=H-pMuWBhQyQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: Enable KUnit integration whenever CONFIG_KUNIT is enabled
To:     David Gow <davidgow@google.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Oct 19, 2022 at 5:06 PM David Gow <davidgow@google.com> wrote:
>
> > How does KUnit detect a KASAN failure for other tests than the KASAN
> > ones? I thought this was only implemented for KASAN tests. At least, I
> > don't see any code querying kunit_kasan_status outside of KASAN tests.
>
> Yeah, there aren't any other tests which set up a "kasan_status"
> resource to expect specific failures, but we still want the fallback
> call to kunit_set_failure() so that any test which causes a KASAN
> report will fail:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/kasan/report.c#n130

Ah, right. Thanks for the explanation!

> > I'm currently switching KASAN tests from using KUnit resources to
> > console tracepoints [1], and those patches will be in conflict with
> > yours.
>
> Ah, sorry -- I'd seen these go past, and totally forgot about them! I
> think all we really want to keep is the ability to fail tests if a
> KASAN report occurs. The tricky bit is then disabling that for the
> KASAN tests, so that they can have "expected" failures.

I wonder what's the best solution to support this, assuming KASAN
tests are switched to using tracepoints... I guess we could still keep
the per-task KUnit flag, and only use it for non-KASAN tests. However,
they will still suffer from the same issue tracepoints solve for KASAN
tests: if a bug is triggered in a context other than the current task,
the test will succeed.
