Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F75C433EF
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 May 2022 21:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbiEKVBU (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 11 May 2022 17:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347907AbiEKVBT (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 11 May 2022 17:01:19 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2964ECE1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 May 2022 14:01:18 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so6418695ejb.8
        for <linux-kselftest@vger.kernel.org>; Wed, 11 May 2022 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1tl7xXEv44Olrg0x8oVrp2Kssd8uEg1zywWFAnvX38=;
        b=pvc4prrKU6XYpVg12K45Z7E2sOJoKAGRX2na2HU3OywNrKnH7faNKDEESDjHs7Hlf/
         PLVlxIB0eZVlZwE63sN+qwm6mJPQKBIjefbBqJsDf45ATJX+0LrqD26TiwiZxME9STRA
         kfVcKOqr5+c0sXl5Xl7sHhIc6hljvb4RCd0LB8FQLkRkLXNWOYMN/sDYyo5zohhg/MzG
         sxyfA9ZEzFEQlqXpNdykAd7UrFXNhlMnWqR+zMQmzzVYzYepY0F4Usx/4OROO6TYgp70
         VulMgiiSLQZUQUXX1/cHfC0NUtSNNAX/ViwOsE5wqYe1Xima8kW4Sg9wll5H0yJvp7Bw
         XQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1tl7xXEv44Olrg0x8oVrp2Kssd8uEg1zywWFAnvX38=;
        b=axAanaTdXXVvNqCT1zqsAWwn7xxL1QqT16Tvu1degblcG+T4uUspGnX7TvVndI+eLh
         3zVq8rpAlC875VZMmfjKkM/DO/UhwTD9zBvg414KqzuDAfSpgOS9zBvu0QjUcFtxXx8R
         1DwByC6kjRDf0WdwS9801gUkSvdc5cFPUFZDIuoGLsZTP/uRYBOk+Due4K9/tuoQYsVh
         KpCO5RuovqFZww3gPJ/RPRlP0CowbxDUev27wuJ47PvXLko0XKPl7q38uwtSqmQbPzbM
         3KTtYh08VX2myAfHOzDpEaLWT6YuVCgUDJ9kOTiqbprm+HQR3DHFOwtUAFG/YgA3LaO3
         AvaA==
X-Gm-Message-State: AOAM531yl6kdX9C09ACRAdnTNlhyRprZMHWVJlkTu959H/ZHt9YhhyRq
        WPtoDltNXfAP9l7SIfNkhxXWSnDMs0YQs4uhOJG8WA==
X-Google-Smtp-Source: ABdhPJwUSKpTjorzdIPUZWjpRBG2eay5ikujKcbGi97kVFsww2FYroBfaYoh59bIWj6/q4C3u2tbKhV/fDB6bfzdRt0=
X-Received: by 2002:a17:907:8a14:b0:6f4:4365:dc07 with SMTP id
 sc20-20020a1709078a1400b006f44365dc07mr25673197ejc.693.1652302876658; Wed, 11
 May 2022 14:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220329214248.1330868-1-dlatypov@google.com>
In-Reply-To: <20220329214248.1330868-1-dlatypov@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 11 May 2022 17:01:03 -0400
Message-ID: <CAFd5g46VNn=6t-xuwyBJ0uuzHGY26eoxO-CmKjs3m50yMHwN=g@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: print clearer error message when there's no
 TAP output
To:     Daniel Latypov <dlatypov@google.com>
Cc:     davidgow@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Mar 29, 2022 at 5:43 PM Daniel Latypov <dlatypov@google.com> wrote:
>
> Before:
> $ ./tools/testing/kunit/kunit.py parse /dev/null
> ...
> [ERROR] Test : invalid KTAP input!
>
> After:
> $ ./tools/testing/kunit/kunit.py parse /dev/null
> ...
> [ERROR] Test <missing>: could not find any KTAP output!
>
> This error message gets printed out when extract_tap_output() yielded no
> lines. So while it could be because of malformed KTAP output from KUnit,
> it could also be due to to not having any KTAP output at all.
>
> Try and make the error message here more clear.
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
