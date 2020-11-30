Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5668FC71155
	for <linux-kselftest@archiver.kernel.org>; Mon, 30 Nov 2020 22:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E773720709
	for <linux-kselftest@archiver.kernel.org>; Mon, 30 Nov 2020 22:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y3lGqGYO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgK3WOn (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 30 Nov 2020 17:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgK3WOn (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 30 Nov 2020 17:14:43 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4F1C0613D3
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Nov 2020 14:14:02 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b6so11336524pfp.7
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Nov 2020 14:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKeppEv6PxhpaKISV122YrtS5AvgtBbtMsR/8wmYbyU=;
        b=Y3lGqGYO/7M9p+z2hXtjP7WuIHaHG8DZl4ziWsAfd8PA6E5+xhzEu7ZMVFwcGYj6pN
         fr9blZ8XcH6UKrSguCKiyOejzgp+lXi6oVmXrGAbcuG5PWrUCyzTPQzuIB49fN9pkNLN
         rKd1IzRP/KiyVYXVvp4OBqhA0DF9XQkr80DXkA8f0YFYaYJ+X05YZpbMANcJqFG9zRjN
         +AyX77nKcVK7TvY0AsDwdjIs8xlswcm9ZBX4MozPqcvNEy1PdYLf39ImR3hsfOCiFNfL
         /s9LXejjHWbOdD3T/aVGnoGCehMHMGcsMbKeig6EzQFIzYO7TpXFZOXenQGiZP1pkiGL
         LJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKeppEv6PxhpaKISV122YrtS5AvgtBbtMsR/8wmYbyU=;
        b=C2VJQ/9YEgqb4lKApSZWDLoAW1yXwkdvZq3k4aCMUXu43rvfhjGstfwhA1T2MkYhlh
         BAxQE8tug/3P2toE9BGG6MiOsRcGjFG/WdrzhIcmlTznNbPEmvbVKpcFxiZnHExcw2mQ
         nnpbP+6uPDCkuaHvWLUl68u8zCAOY0Xgu8YgsnrkwmfQUYRcIoA8wNp42tRFcaXmzL2f
         yw5nMIAD8N+D//HofX6PZdQzXiTQzXM5MG1ZaVArFrA4FW8ZSOzBJXf+P4zPzoszQWZk
         bK4yFGcS95RyTuiNQA5eZRRWSbpxNxVtzfTgYiX4/OkTJq8xlpaxkO95SXkmMCG1JmtK
         XvUA==
X-Gm-Message-State: AOAM53062K35plJV7amCmPRVN5fa0h4Ym2W+s2QWS67ZzEs6x5FX7TL2
        08oBLi38j7LgAeeprESPC/Y/0d9N3AX1OF1OGp4WgA==
X-Google-Smtp-Source: ABdhPJwP1AffYTptZdTji0rnn0WFzX3DAWXDOotDTZ/j+UDPrqUpGPJjtDW3DClRkD19T0Bt1RYkstZ/IzSVRmeDuxo=
X-Received: by 2002:a62:ed11:0:b029:19a:e1cd:ca96 with SMTP id
 u17-20020a62ed110000b029019ae1cdca96mr7046798pfh.38.1606774442044; Mon, 30
 Nov 2020 14:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20201123225759.3658122-1-dlatypov@google.com>
In-Reply-To: <20201123225759.3658122-1-dlatypov@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 30 Nov 2020 14:13:51 -0800
Message-ID: <CAFd5g44JgvUBZteUY=KVCiiD+yu1DtYE+phm4R4uxcH7N22Ffw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: provide guidance for testing
 many inputs
To:     Daniel Latypov <dlatypov@google.com>
Cc:     David Gow <davidgow@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Nov 23, 2020 at 2:59 PM Daniel Latypov <dlatypov@google.com> wrote:
>
> usage.rst goes into a detailed section about faking out classes, but
> currently lacks wording about how one might idiomatically test a range
> of inputs.
>
> Add a new chapter for "Common Patterns" and group "Isolating behvaior"
> and this new section under there.
>
> Give an example of how one might test a hash function via macros/helper
> funcs and a table-driven test and very briefly discuss pros and cons.
>
> Also highlight the KUNIT_EXPECT_*_MSG() variants (that aren't mentioned
> elsewhere [1]) which are particularly useful in these situations.
>
> It is also criminally underused at the moment, only appearing in 2
> tests (both written by people involved in KUnit).
>
> [1] not even on
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/api/test.html
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
