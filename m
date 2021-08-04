Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319DDC4320A
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Aug 2021 01:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 175F360295
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Aug 2021 01:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhHDBzE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 3 Aug 2021 21:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbhHDBzD (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 3 Aug 2021 21:55:03 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D16FC06175F
        for <linux-kselftest@vger.kernel.org>; Tue,  3 Aug 2021 18:54:50 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y12so1490934edo.6
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Aug 2021 18:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwYC/1Gaei+t62tNQY4YFdCc3ENCGWe2M7gmqksCaew=;
        b=KHb4cAohmBF1wfyoLs/rl9cOV9WjJt9nG6P38g00AdqrxqLV5mua3SEFz/TSWaLCqs
         oH4d8ZTRnjv+7LOQHJ2pBW+uZuSvZRByXOwXRnPc39/EERKz9KXuz/K174nu9vFg+ZQK
         TL4g2fX+oge1hfeOB9BCHoi7Dvgl96FMp4AA8b4V4JkQBwmGssIOwB+yjnSeH+vR/6gn
         Damiwu22iVbNL+LuUSuyUQC30j3SUFER1qnBQwYcVsALj8ngBP3vTKh06LJnT+y+3Z3H
         eSnmKh09Cm7+6J2sRBuYoIyG4hnKb9KMoVUQ+7zdC2w7KL4BPXZAxUHb++++iemZVIJm
         MIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwYC/1Gaei+t62tNQY4YFdCc3ENCGWe2M7gmqksCaew=;
        b=qksI+YTW1qUzq41UDor76jsgFtFVYIaR6PjdhTsiSdQvCnT09Ufnlh3kbTiihLLU2h
         L1XhLugDy7dDVZXHm1KTJFnjesZDBxkg7fUijl8L2uyVeY2MbwCBxK3uP5OA+7CcR9O3
         nxCIq+zJqjXZmCwX9Jnv04ippwFdPn/GYynIIvmKU9jRuKqmrxBa2maZpG7daBTcc0An
         juPdlvaA2sOmQftadRu6Wo/hyKvMiszKHbE37h24s9+RVMblRpSK5/YHk90Cs1+5fDXd
         P8jEVPWNc4lo+vsuDjZUz8NnXJGTHfzQLYYK/D3zvyNEWoOJ9xvhXGvZaOgiOsByPTeT
         nIPA==
X-Gm-Message-State: AOAM5311Kdx5gpjwi9N5CMt20NC6S+PAQywMMWY9L3ksnifMKPr+4rxA
        /z3OfIjc6/c5Fx/3qgDObar5FvEGuyLPwyeMvQAAyQ==
X-Google-Smtp-Source: ABdhPJyDcdBun5ArBBclPVQ3zL16nLtGBhsP9+jwmxqLDtzBCI+VKFyx/007H8oKIjwZRLdTTG+gAaRt9+6z8JS0H20=
X-Received: by 2002:a05:6402:2043:: with SMTP id bc3mr29167190edb.62.1628042089213;
 Tue, 03 Aug 2021 18:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626252248.git.zhansayabagdaulet@gmail.com> <90287685c13300972ea84de93d1f3f900373f9fe.1626252248.git.zhansayabagdaulet@gmail.com>
In-Reply-To: <90287685c13300972ea84de93d1f3f900373f9fe.1626252248.git.zhansayabagdaulet@gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 3 Aug 2021 21:54:13 -0400
Message-ID: <CA+CK2bAGr1SB3Y0ZPBkuPvEKEMd1LkecpPoXNhwPN=1vd3KqBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] selftests: vm: add KSM merge test
To:     Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc:     shuah@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 14, 2021 at 4:56 AM Zhansaya Bagdauletkyzy
<zhansayabagdaulet@gmail.com> wrote:
>
> Add check_ksm_merge() function to check the basic merging feature of
> KSM. First, some number of identical pages are allocated and the
> MADV_MERGEABLE advice is given to merge these pages. Then, pages_shared
> and pages_sharing values are compared with the expected numbers using
> assert_ksm_pages_count() function. The number of pages can be changed
> using -p option.
>
> Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>

No comments, because I have already reviewed this series for Zhansaya
as part of the Outreachy internship, so:

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
