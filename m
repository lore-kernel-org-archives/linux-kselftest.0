Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29299C4332F
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Nov 2022 05:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiKJFHg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Nov 2022 00:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiKJFHe (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Nov 2022 00:07:34 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A0826AC4
        for <linux-kselftest@vger.kernel.org>; Wed,  9 Nov 2022 21:07:33 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i3so834618pfc.11
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Nov 2022 21:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ovlTRAkdLt9KQSpb5O+DaKbezf0Iebj6nMnxwqTxEE=;
        b=qi9/5+wKBO/EPtZg9f390btCgXHIipSNoFNqfZZEaYDTzAGEUMmICBMlVwNnliqMbD
         tVNkX0J2FfzD0/c5Ao+E3j6QdKzhslfjS5BUMzLimYfi5XPR8Cwsdugui1a4Q6Sb3099
         wYsrx3qVlBOiLNWLa7QACGUnlunV25FH7++PNL3n24x77RluakDb2G3Mr5FJDt6Wn1x2
         vD44K0GRSiK31kNHmjKeAqaqKxQmx2fw8DEq0MUGZbtOYvLsCYfnbT+fqsFZOtbuX7+X
         1SNDsWD2pLPneZsCf+OlU7k1qyS1PZvVg6il08vP4olD1oaxj42RRJFG7ZyCk49zYlWn
         CRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ovlTRAkdLt9KQSpb5O+DaKbezf0Iebj6nMnxwqTxEE=;
        b=QiW2X1CNFGsjT6y7eLmB5WW+g3VGyJ5QbQvH9obqregOErXUYuM8PlJiX6ptbc+6KA
         mER474K2nxxesDbxG4d9nLWO5r6wQ+EfHFLoig2w2EJ1YS7HhQhCtXZjqLBVT7Lq7K+6
         NfU7bOTCrYPGB6MC8if7DdHscmnJj43YP33u8tjBjXfIeUFTfgb+PO3W7lTgpt5F5iC7
         JDNUQRoQfVdA3UM7rpuVg+YUXl2ZemalewUJG81srHxAZsVwr2sKm7UNW7SJaLo5+FEk
         B9qYLBv2J3KzxPeOn2nmynmQgtNWjec4iy9JtvRQAuOhok8XBJ9rtiO6UqDQuy2L9Cg7
         wO1A==
X-Gm-Message-State: ACrzQf3RUHBobhZ4DDebKSZuPylYeuyBfYI2iwuLUsZRN5xX1xB6qrRN
        yPlwhO+uj/a8AnlEHuVwCU35D2+BW0yVomfj0OJBdQ==
X-Google-Smtp-Source: AMsMyM5Eu+TMkyrNrhfDTfsVn0nghSVf5ExpwddCT2j/bz8l8WgtEfn76/9sKEqQpCXrxKx5tSgMP/KbtSdlHZUJFZI=
X-Received: by 2002:a63:fb0b:0:b0:46f:a98b:5685 with SMTP id
 o11-20020a63fb0b000000b0046fa98b5685mr49590361pgh.393.1668056852935; Wed, 09
 Nov 2022 21:07:32 -0800 (PST)
MIME-Version: 1.0
References: <20221109003618.3784591-1-dlatypov@google.com> <20221109003618.3784591-2-dlatypov@google.com>
In-Reply-To: <20221109003618.3784591-2-dlatypov@google.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Thu, 10 Nov 2022 10:37:21 +0530
Message-ID: <CAO2JNKUTiVM8YPgy0nz7W1GJtSVURhc1YkMgUWgs-rShNY0Zaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: KUnit: reword description of assertions
To:     Daniel Latypov <dlatypov@google.com>
Cc:     brendanhiggins@google.com, davidgow@google.com, rmoar@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Nov 9, 2022 at 6:06 AM 'Daniel Latypov' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> The existing wording implies that kunit_kmalloc_array() is "the method
> under test". We're actually testing the sort() function in that example.
> This is because the example was changed in commit 953574390634
> ("Documentation: KUnit: Rework writing page to focus on writing tests"),
> but the wording was not.
>
> Also add a `note` telling people they can use the KUNIT_ASSERT_EQ()
> macros from any function. Some users might be coming from a framework
> like gUnit where that'll compile but silently do the wrong thing.
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> ---

Thank you, Daniel. This looks fine to me except for a small typo in
this line "to abort
the test if we there's an allocation error". Also, I have reworded
that paragraph a bit
as below. Please feel free to ignore, if you do not agree:

In this example, to test the ``sort()`` function, we must be able to
allocate an array.
If there is an allocation error, the test is terminated using the function
``KUNIT ASSERT NOT ERR OR NULL()``.

Reviewed-by: Sadiya Kazi <sadiyakazi@google.com>

Best Regards,
Sadiya



>  Documentation/dev-tools/kunit/usage.rst | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index b0a6c3bc0eeb..8060114e3aa6 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -112,11 +112,14 @@ terminates the test case if the condition is not satisfied. For example:
>                         KUNIT_EXPECT_LE(test, a[i], a[i + 1]);
>         }
>
> -In this example, the method under test should return pointer to a value. If the
> -pointer returns null or an errno, we want to stop the test since the following
> -expectation could crash the test case. `ASSERT_NOT_ERR_OR_NULL(...)` allows us
> -to bail out of the test case if the appropriate conditions are not satisfied to
> -complete the test.
> +In this example, we need to be able to allocate an array to test the ``sort()``
> +function. So we use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()`` to abort the test if
> +we there's an allocation error.
> +
> +.. note::
> +   In other test frameworks, ``ASSERT`` macros are often implemented by calling
> +   ``return`` so they only work from the test function. In KUnit, we stop the
> +   current kthread on failure, so you can call them from anywhere.
>
>  Customizing error messages
>  --------------------------
> --
> 2.38.1.431.g37b22c650d-goog
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20221109003618.3784591-2-dlatypov%40google.com.
