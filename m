Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D475C433E0
	for <linux-kselftest@archiver.kernel.org>; Thu, 14 Jan 2021 22:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E227123A34
	for <linux-kselftest@archiver.kernel.org>; Thu, 14 Jan 2021 22:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbhANWX3 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbhANWX2 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 14 Jan 2021 17:23:28 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF1DC061575
        for <linux-kselftest@vger.kernel.org>; Thu, 14 Jan 2021 14:22:48 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id j1so3655695pld.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 Jan 2021 14:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPoRrdNOROxhDdivXc5/hBDstOmigIbTotdHJYVBUnc=;
        b=Gl7VzU68aXvVthH+6Gl9dZWAF446iYZ2MmeURfD41BpkgfV0RubdRRjfrP+cT7vsZ7
         0kSJfwjdx62rBTPtTzJJlhsItuv+deusw75OcuP968ghNGtG4e+28NKWKyBZT+/n3y/Q
         xDgjn2GH5dtxvNJ9huFPtJNF2bhn3DsII1bEBkUnf8nJX5YJ3yYQKd9ILOyMELEVokVN
         S2HIMDCBxBGx8xlyNkzQCIMKhO0eNdvhR2+WmfboxpN4UbOYRAXrkAY9uv8X+Q4L0EZu
         jva2V+WGCggFVtGIF3CPoyleAMvDFgYdlojKA8GkThou1EyOmtJVDb/kPMWG6u4MmBhN
         Mgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPoRrdNOROxhDdivXc5/hBDstOmigIbTotdHJYVBUnc=;
        b=O4qWzu5crARAJ7glwBjSKhABV0EcXSr3yH7J604NRNF7A+fzW6ehV2JWKju4Jtre7U
         wSZSiXXYTk4b2IJMRl6m/tBbP785GPNA962dHnQb4Fqr5mOfkszUeT94ymT8MCdLQ6NZ
         4WKz4R+nnBSyvQXXotYOlFrmVLta6F7Vxf9wJrbmXIHoCdZAj1AxFieNMp7LlWaoEk4U
         2733toBj5+XcguqABJIBlWIfWm1/EEz3b2A9QW1iWopu0uoavs8Ooj6m38ppy01W7VRM
         5MAgvOSNyuCS++m5V7OmsAqmeBfAJjAX0MUSFWcIJeWtdFgzdzUCp4XfYxylRJxV7jQc
         Mp5A==
X-Gm-Message-State: AOAM531SDmqQeoGlk4TEaRtutl0+AySm4G1aqGLTigXBbfnfUnjbj4dZ
        1UR5JGiWKyOkVufr8TZLABp3KgggKj0D0Dnb5WMXOYF+9qkoKg==
X-Google-Smtp-Source: ABdhPJwDc0GflSHuCpK/boQQ7/hHPtQr9mbcFd52Lo7g2yixnRhfFKhYIAk5fu+WmHgfp85SbqmwSWC8+45NCWOUoLs=
X-Received: by 2002:a17:902:fe87:b029:da:5d3b:4a84 with SMTP id
 x7-20020a170902fe87b02900da5d3b4a84mr9579301plm.51.1610662968164; Thu, 14 Jan
 2021 14:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20201202190824.1309398-1-dlatypov@google.com> <20201202190824.1309398-2-dlatypov@google.com>
In-Reply-To: <20201202190824.1309398-2-dlatypov@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 14 Jan 2021 14:22:37 -0800
Message-ID: <CAFd5g47S7-0AFDWZy5qeZV+syT_6x3jeGEgZO6X9tVNweBS2eQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] kunit: tool: stop using bare asserts in unit test
To:     Daniel Latypov <dlatypov@google.com>
Cc:     David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Dec 2, 2020 at 11:09 AM Daniel Latypov <dlatypov@google.com> wrote:
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

Tested-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Brendan Higgins <brendanhiggins@google.com>
