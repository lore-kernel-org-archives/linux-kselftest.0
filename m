Return-Path: <SRS0=hXTE=C2=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85FBC433E2
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Sep 2020 04:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 967DF208E4
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Sep 2020 04:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWkfh3O1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgIQExY (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 17 Sep 2020 00:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIQExY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 17 Sep 2020 00:53:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0AAC06174A;
        Wed, 16 Sep 2020 21:53:23 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n13so1006884edo.10;
        Wed, 16 Sep 2020 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wNz+JDmGulPqE8+DTCTJLtF5IeVLMfodqV1In4Cvwrk=;
        b=cWkfh3O1pmoPFlb9+Bpb4H2BQ3nv+Kv6cCuPpr5pvvxnkuPYWuFpt0GTlzBKd+32sf
         CPUKpm93fQwhnsl+h+GyVV7AHWEVD+4cy6dsBdVlcA8g0eCBR7gaImP84mgamWkRY0+V
         hbXnWKpA+iaIVbISSAFrmwOj8iUcQKw5QTt6oEzWg2laRshTUJ5x+rSxt8JYGHhusJk9
         TgPnnupskVfvEYOjpJDGzL6wEIKeLIhlAwRjgqoULK9OJbAwavothw6ngfiEBRJnfrtz
         m+4UQceeSdEUAM/d1mnYjYwHZ1tYxv3veSDaly4idJcynIXSisTtlDKu05Xx6VqTUi29
         2eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wNz+JDmGulPqE8+DTCTJLtF5IeVLMfodqV1In4Cvwrk=;
        b=toLEs/U3DYywK0RuyxUsjUJs7D91mDmYIyNhwt8UiLE/IXTpyWZl9rXOYzKuSE9C2G
         +Kl0cI0jLq1w0Hs3p0WDInEPvzFexNwr1nGINc1AnLAD7RC36uCygen9RYsVP1ViRrIX
         53OekzKAfXySIkgiDKghTOJcR6Tp7B8oqB/oGIhR1WQD5db+hIdGCe9jyZfKtIIEH3fN
         q/Yx+TF/wzuD4tY3Rlr2vdkVPHWriJGO8ONi2fTFq+SG64PlLhz2iJ6iMPg7uVjTEW+Q
         HQDYvUysw4Gr1IHRdD6DkX/7JpfQudx5E3uzkLs6Y0kn4TL8A8SH9jF7H/RsgDiENsLJ
         Perg==
X-Gm-Message-State: AOAM5327RGLdONscTYEICSttMegr78uONf0U1y2zBjvHRNVJT02UoQaE
        1dhN0z/vQx4KOv+eMBL9J0RZcwzvKkSwd5mKAKM=
X-Google-Smtp-Source: ABdhPJyfxIhb0SFURnjpqQqvr7KfX6wMi9QQkMZ1Vn6LiDhGFm0z9kbD/RGpx3LGwhIbEQjGjkjDlZaX8HQpG4EFIo8=
X-Received: by 2002:a05:6402:1353:: with SMTP id y19mr31405733edw.71.1600318402672;
 Wed, 16 Sep 2020 21:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200917041519.3284582-1-mpe@ellerman.id.au>
In-Reply-To: <20200917041519.3284582-1-mpe@ellerman.id.au>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Wed, 16 Sep 2020 21:53:11 -0700
Message-ID: <CAMo8BfJ5j4nG0z1Bk00J=3xPM++J68Hp2idJ-D5aHT84-vOzsQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/harness: Flush stdout before forking
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 16, 2020 at 9:16 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The test harness forks() a child to run each test. Both the parent and
> the child print to stdout using libc functions. That can lead to
> duplicated (or more) output if the libc buffers are not flushed before
> forking.
>
> It's generally not seen when running programs directly, because stdout
> will usually be line buffered when it's pointing to a terminal.
>
> This was noticed when running the seccomp_bpf test, eg:
>
>   $ ./seccomp_bpf | tee test.log
>   $ grep -c "TAP version 13" test.log
>   2
>
> But we only expect the TAP header to appear once.
>
> It can be exacerbated using stdbuf to increase the buffer size:
>
>   $ stdbuf -o 1MB ./seccomp_bpf > test.log
>   $ grep -c "TAP version 13" test.log
>   13
>
> The fix is simple, we just flush stdout & stderr before fork. Usually
> stderr is unbuffered, but that can be changed, so flush it as well
> just to be safe.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  tools/testing/selftests/kselftest_harness.h | 5 +++++
>  1 file changed, 5 insertions(+)

Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
