Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854F4C64E7B
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 07:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2062F22210
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 07:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akz0P6W9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgLAHeO (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 1 Dec 2020 02:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgLAHeO (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 1 Dec 2020 02:34:14 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89929C0617A6
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Nov 2020 23:33:27 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id a9so2208989lfh.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Nov 2020 23:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uB5Ijg4lsZ53TyQb8q6EyzIkeiWhB7LJL2nbLGLbbto=;
        b=akz0P6W9TIvX78pdFt3x1U3pOjYlqQeMGEzmtvBMIB7TAf7CvTdet57qNnnk+fYXqk
         n/bustEJOYl3nW96Q39N7Vj3BFZNrTCaldycgXwTGZfE8AnbP+znwmlmJu97uoVON+j2
         cmsgPfJ1PvqMyrKpkC69OW2HWuQvr9YMvfjckOCVxsY16OFqckUFEwB3XFkFj3/9lZCi
         m7SAGUHReP+zQCVCHaMmCWi68toEWHtTTjm1x6E5SwXFexDCyJTnCeS54k5zePf3D5ah
         vSGQU2msLdAFtdco/MlcyD9KUECAhQyYmIDfZCcrh/E9jadPwJw0a9GFcpMuU6YMwvaV
         5MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uB5Ijg4lsZ53TyQb8q6EyzIkeiWhB7LJL2nbLGLbbto=;
        b=Cbk/5yD+j005O+JiplAhfjlYg6FdyDXHvlwHAAk8jWi6SabLrX5uwkwG/ePwBaxanS
         qdd4GiRAO6NDGsvak/wOana6OrL+sS/AjGJCfC8UNN5yICKLMa4WdJlqCUeA9MYCD4R9
         yqisiyMBEcXc7zCaIsvlRzo4QwIwrsXg1aPTQYzo244eM1nWm+ywsxvKkZzASkgFNLMW
         4a4WIMqStP5/O3Y6ARtCdrUdymPfj1OhIH0jlfzEwnqTbqZWMR0NG4C+OUyKToAWmyJM
         VVaGgWP58n6OaqRLguKKSLZKEffHn1DF4PJaYURDdwam+T3Ggq+7EBtRapiHmF6bT5Bp
         /93A==
X-Gm-Message-State: AOAM531mZdRy1CZO4CPRmtSELxevwBmc2iFlncixUBALDhgfZY8t+vkE
        WpBax8ajn7WLaSCM+O30wJBKFTmP7LW341kecUFQRA==
X-Google-Smtp-Source: ABdhPJw+XQSv9wF8wBAXUMZzU8fnW1PAeTTRaqJ6mMpsxVkNfJgpjkifY9dpiOSjGroEUQc9aGDQJKIDRBP7fLA6khE=
X-Received: by 2002:ac2:528e:: with SMTP id q14mr579418lfm.34.1606808005880;
 Mon, 30 Nov 2020 23:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20201130233242.78413-1-dlatypov@google.com> <20201130233242.78413-3-dlatypov@google.com>
In-Reply-To: <20201130233242.78413-3-dlatypov@google.com>
From:   David Gow <davidgow@google.com>
Date:   Tue, 1 Dec 2020 15:33:14 +0800
Message-ID: <CABVgOS=91XtTv5j71MiE15pMBLj=VVqqK6XzCHX4LfndrsMYxw@mail.gmail.com>
Subject: Re: [PATCH 3/5] kunit: tool: stop using bare asserts in unit test
To:     Daniel Latypov <dlatypov@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Dec 1, 2020 at 7:33 AM Daniel Latypov <dlatypov@google.com> wrote:
>
> Use self.assertEqual/assertNotEqual() instead.
> Besides being more appropriate in a unit test, it'll also give a better
> error message by show the unexpected values.
>
> Also
> * Delete redundant check of exception types. self.assertRaises does this.
> * s/kall/call. There's no reason to name it this way.
>   * This is probably a misunderstanding from the docs which uses it
>   since `mock.call` is in scope as `call`.
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> ---

This works for me, and seems pretty sensible from my rudimentary
python knowledge.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David
