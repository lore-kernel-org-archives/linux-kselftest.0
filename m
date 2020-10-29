Return-Path: <SRS0=rw0z=EE=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40815C388F7
	for <linux-kselftest@archiver.kernel.org>; Thu, 29 Oct 2020 01:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7E9B2192A
	for <linux-kselftest@archiver.kernel.org>; Thu, 29 Oct 2020 01:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tiC/AVoV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgJ2B4R (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 28 Oct 2020 21:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgJ2Byf (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 28 Oct 2020 21:54:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9253EC0613D1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2020 18:54:35 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r127so1251685lff.12
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2020 18:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KdFzVv58H65jJdmf3Ufqe4CniXPY8PDzCg5XmX8U0Sk=;
        b=tiC/AVoVMmn8tilMgdX+in8K0Yjj4INH3BlSiJE1i/FYsg5/tdHYBPHV8a6SM+mjLf
         p2LtCkHoBgwc/uCSaWm0K/UgbEqo/zbgJBhcsG6FKaeb9oPjL8/1k8O2KdNBlI3kqxPA
         0ptuwCxuUeJopPXLCfmFKPToBf+aJ9489F2hcG6WUdFwQEyHQdpKhGBkyjwBnm47mK8o
         7/HpY2jimntzVbQDlxOO5FE0zN3R5/7+JsgqFa24E/KzZjHu/0JRQbLqb8EguIWoCQBY
         xZFoiNwFyIpu/8JjUkjEKYbqhcXN0fvI0gqflwj9S4pQDKkceoD+HBU6S7ErkW0xMrrO
         cdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KdFzVv58H65jJdmf3Ufqe4CniXPY8PDzCg5XmX8U0Sk=;
        b=Vi2Pj+HaE5xdpdzrOi/wctoxnV/HM7B03+Oh1/KHOqeh2Rw23kOE4Y1AaGkLypllgD
         kHZWiEpzlh6WbW4R/jQKYL9+aRcPCfHT6bwTcjyBcpVyOeppMPohj7WPoQpX9ejIkPia
         zdW4TD2F84a2TYKStsllLuOp1NVvR581wAXJg60sP2VZAESPVeoA9kqOPbr5xtEWSNCH
         GQKsdeNB6toB5f9d06lHWzS1HppjMayXjGyofydrIRSGwYOB66OkDU1U3aYROXDoB6ap
         3Q656paENS3NHdo4dhSj82rKW+PCGreP1PdtuXY/vref4ZW/elA/C+GYzWeaZGF0L9BI
         cCwA==
X-Gm-Message-State: AOAM531H41SgEcxzi9WoCQ2b+g3CpptHvCqFoVDyyxGOmOXrifLOGBtF
        QOqxpJOsRvNO6MtD9Aa6G0+wu1oM26jkuB5kkCH/uQ==
X-Google-Smtp-Source: ABdhPJwauBImhfKJM6NoGIwTjek7s8o4dkYW2qotO1xbRGWxPztTmolQB6je1z2UiNNM0Z4FnaKpNsbAdrRpO7nIh0c=
X-Received: by 2002:a19:c357:: with SMTP id t84mr620041lff.34.1603936473887;
 Wed, 28 Oct 2020 18:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201028174218.11750-1-rdunlap@infradead.org>
In-Reply-To: <20201028174218.11750-1-rdunlap@infradead.org>
From:   David Gow <davidgow@google.com>
Date:   Thu, 29 Oct 2020 09:54:22 +0800
Message-ID: <CABVgOSnNU1dOGEGhtRW=odkwjDDk7B_=FvdDmxAB_t-mNVY-9g@mail.gmail.com>
Subject: Re: [PATCH v2] KUnit: Docs: style: fix some Kconfig example issues
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Oct 29, 2020 at 1:42 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix the Kconfig example to be closer to Kconfig coding style.
>
> Also add punctuation and a trailing slash ('/') to a sub-directory
> name -- this is how the text mostly appears in other Kconfig files.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Gow <davidgow@google.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: David Gow <davidgow@google.com>
> ---
> v2: covert spaces indentation to tabs in Kconfig example
>

Thanks! Sphinx is still converting the tabs to spaces for its HTML
output, but this is nevertheless an improvement.

Cheers,
-- David
