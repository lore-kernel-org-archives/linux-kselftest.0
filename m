Return-Path: <SRS0=aVlM=ZZ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD17C432C0
	for <linux-kselftest@archiver.kernel.org>; Tue,  3 Dec 2019 23:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F03A206F0
	for <linux-kselftest@archiver.kernel.org>; Tue,  3 Dec 2019 23:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZUIf5jn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfLCXob (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 3 Dec 2019 18:44:31 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45349 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLCXob (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 3 Dec 2019 18:44:31 -0500
Received: by mail-pg1-f195.google.com with SMTP id k1so2363608pgg.12
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Dec 2019 15:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmVwi65CWiJjwCJUR0CFb8uCvZ6Xi+9s8UtGSyRd46k=;
        b=MZUIf5jnSV7XWugzNbjYEJQilfXNtwyyP5KRIeWEbvC8koooPV6r+OX+f4CPnp5HIr
         UPttTaGiY5cZeuO68HkXYF1zbXFbgNJXB0tybDsLlJaafZYuTzoV+I+kldkVXP2X7Axm
         iTdlacJqYZ43+ojAzHaF/lJWCc8bFIFCpmD6J/0QePnso0ukb478GzP0Op8ZFw3qW3uR
         MIXDD/rsPJpTqszvu7O+lbHLoh28HGNkNaf73lRTn+u3JXvhWBw0kkGvJxAYaYAUbpiW
         4NJubPjdkIDP7cArLCISmyKmAptza1qRgXCZxSU8/+wTHcd0thCY7wU3X/6kxdz7nKD2
         vMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmVwi65CWiJjwCJUR0CFb8uCvZ6Xi+9s8UtGSyRd46k=;
        b=eH/Pa5grKkfWJfFAlCPVqE0HC76N+qqaazD/CY4aeDakaspBY+ul+SC7C9mbb9lP+q
         1p/kerHojd4k67CT99xpfjkaLGw9kG1h9DHNrDfxldI0Rm8jH3RWB+roykLGiyfd5TgA
         Y4VvnvyHIKCYkviSagFK6nRX+BsF+2gesewMKYcUZ1eKzGUl2hKybACSTFITTmikuCD4
         VI8LCYANZTi6qO44xCO4PnDI1PQUrA22BTEVLhrVO7LW3w5soj+sYxCptMckn0bJ/arV
         CCqILv11z6+qWCVejZfIziAYbqkITaaDoNCaf9TORuXH/v0OFubeF9QwFvId7tSK+2nV
         k0Hg==
X-Gm-Message-State: APjAAAWEU9kTevPAXy4ENpH/c/3UKBIsS/7cdKMlRkNIX6ABd58vObml
        zAycMSLeR+sQWQAjayYJByM8iZ9wdTnyszYnc/FaJLeXNFeo2A==
X-Google-Smtp-Source: APXvYqyv4i+NpsBtYtRV3LYVXtRCPYQX4vOZgjxEtoC6uhZ4RpjVYWwnLfHiarLH5P/evG9t3D/1hcDpDqsveH3CAeY=
X-Received: by 2002:a63:480f:: with SMTP id v15mr278308pga.201.1575416669991;
 Tue, 03 Dec 2019 15:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20191121235058.21653-1-davidgow@google.com>
In-Reply-To: <20191121235058.21653-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 15:44:18 -0800
Message-ID: <CAFd5g46Z_vVb92Y-sfWi68=HFy5+kukZXvT9usEEnhBUvPg3AQ@mail.gmail.com>
Subject: Re: [PATCH kselftest/test] kunit: Always print actual pointer values
 in asserts
To:     David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>
Cc:     shuah <shuah@kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Nov 21, 2019 at 3:51 PM David Gow <davidgow@google.com> wrote:
>
> KUnit assertions and expectations will print the values being tested. If
> these are pointers (e.g., KUNIT_EXPECT_PTR_EQ(test, a, b)), these
> pointers are currently printed with the %pK format specifier, which -- to
> prevent information leaks which may compromise, e.g., ASLR -- are often
> either hashed or replaced with ____ptrval____ or similar, making debugging
> tests difficult.
>
> By replacing %pK with %px as Documentation/core-api/printk-formats.rst
> suggests, we disable this security feature for KUnit assertions and
> expectations, allowing the actual pointer values to be printed. Given
> that KUnit is not intended for use in production kernels, and the
> pointers are only printed on failing tests, this seems like a worthwhile
> tradeoff.

I agree. However, I also remember that others in the past yelled at me
for assuming that KUnit would not be built into production kernels.

I feel like +Kees Cook would have a good opinion on this (or will at
least CC the right people).

>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
