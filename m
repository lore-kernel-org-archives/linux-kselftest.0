Return-Path: <SRS0=8eoq=BG=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7241C433DF
	for <linux-kselftest@archiver.kernel.org>; Mon, 27 Jul 2020 21:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A258920809
	for <linux-kselftest@archiver.kernel.org>; Mon, 27 Jul 2020 21:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F2PfHOk3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgG0V3a (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 27 Jul 2020 17:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgG0V33 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 27 Jul 2020 17:29:29 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0A2C061794
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2020 14:29:29 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o1so8859082plk.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2020 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Dff01qDEzYUZSwTQN0UlukOdsjfAdYMLKRwTiRnLfE=;
        b=F2PfHOk3i81XGbMwyfnrAK3zT4wm2DI1ZObsHr5Bgo4hnK7LXNOa5J6ekBBFJUztW3
         k2DwMR4Gi8JuiSOf22EpQwTqiNnnVlEwkL8bhOIi1dRwpteCw/t5trwL+UC96d4Vxm6j
         7eKiG4ik250N4LaPpmqVznQPZZ55y2/dVWK2rcYXZGfPcm6zm6Q5EQPHaEGm5bTTy/9x
         6QDwtWoCPrVb/+WZBmOWMu811dNpz4XdhG1joPzH/432NQDWs2hms48s3Ym/3CDuB+fG
         MitfRutOeCcPgXBnpZOacWaAOCQUEkmg5FKK3nxQcfi0QccLGSFNrF0n8M12vo8eQ9IP
         rxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Dff01qDEzYUZSwTQN0UlukOdsjfAdYMLKRwTiRnLfE=;
        b=ZuMB1iU6E9jO7inklftCYDd0kkAlz97lu9xhh0/lXCqOphkVFn4kFhLejeVdkQczrn
         pXzhuCMvkzCyjxRClz8WmZXmKpQRiEChnA9avt3yGzNAKyin+g82WoH6PUHpVpOm2q0T
         7LtZoTHOsOq+GoHgqmKgH3W1qTzMfmHqtfLNwbLQP2y2vfNlXvRDV58ESEMq5OW5y7MA
         CECUq9eWODSRG2XstVF7AD8dJDjbP6NnhOwQVcubL1DjZUfs0S31ZcnLtvhBC/EMqokx
         iAxtqOujPucMpXGH0WxYK/2RTd5pjgH3DJl30OhTLp0YFK2sZN5Q44M+QtbJfvS2ZKa0
         6VdA==
X-Gm-Message-State: AOAM531qqDFhRVgmTk61789fb8p4z0DxN1FmAeJExo7qu0/y2CfUcR+P
        9ZXyI5ac2W5ECeFJw0k14dh//Xdaw0RrB12/2GB/rQ==
X-Google-Smtp-Source: ABdhPJwABsvL++WC69nH+pz/KcjSYeHWHJ1OYasPRSG+MTz1Iwp1u2HACpLc59l6eoPEidE1dZOVrog2phspyb+Q1S8=
X-Received: by 2002:a17:90a:362e:: with SMTP id s43mr1140553pjb.217.1595885368949;
 Mon, 27 Jul 2020 14:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFsOrFOQBrZv6qBbcQ971acEM0XxLWKqBJvEspoQ3UOHUQ@mail.gmail.com>
In-Reply-To: <CAF12kFsOrFOQBrZv6qBbcQ971acEM0XxLWKqBJvEspoQ3UOHUQ@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 27 Jul 2020 14:29:17 -0700
Message-ID: <CAFd5g47cQ6tC3cLOqFiHHNO9XjgpTQLNsw=-bBKvsPMs+DGrLg@mail.gmail.com>
Subject: Re: kunit compile failed on um
To:     Cixi Geng <gengcixi@gmail.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>, zhang.lyra@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Jul 27, 2020 at 3:01 AM Cixi Geng <gengcixi@gmail.com> wrote:
>
> Hi Brendan:
> When I run kunit test in um , it failed on kernel 5.8-rc* while
> succeeded  in v5.7 with same configuration. is this a bug?
>
> Here is my operation:
>  gcc version 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)
>
> the kunitconfig:
> Cixi.Geng:~/git-projects/torvals-linux$ cat .kunitconfig
> CONFIG_KUNIT=y
> CONFIG_KUNIT_TEST=y
> CONFIG_KUNIT_EXAMPLE_TEST=y
>
> command:
> Cixi.Geng:~/git-projects/torvals-linux$ ./tools/testing/kunit/kunit.py run
>
> the Error log:
> [17:51:14] Configuring KUnit Kernel ...
> [17:51:14] Building KUnit Kernel ...
> ERROR:root:b"make[1]:
> \xe8\xbf\x9b\xe5\x85\xa5\xe7\x9b\xae\xe5\xbd\x95\xe2\x80\x9c/home/cixi.geng1/git-projects/torvals-linux/.kunit\xe2\x80\x9d\n/home/cixi.geng1/git-projects/torvals-linux/Makefile:551:
> recipe for target 'outputmakefile' failed\nmake[1]:
> \xe7\xa6\xbb\xe5\xbc\x80\xe7\x9b\xae\xe5\xbd\x95\xe2\x80\x9c/home/cixi.geng1/git-projects/torvals-linux/.kunit\xe2\x80\x9d\nMakefile:185:
> recipe for target '__sub-make' failed\n"

So we have a fix out for the cryptic error messages:

https://patchwork.kernel.org/patch/11652711/

But I believe it has not been picked up yet.

In the meantime, you should get more information by running

ls .kunit
make ARCH=um O=.kunit

Let us know if you have any additional questions.
