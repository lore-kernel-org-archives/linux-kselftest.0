Return-Path: <SRS0=Ftq8=XS=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5FAC432C2
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Sep 2019 22:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 204A9206C2
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Sep 2019 22:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kx9JUt2t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503293AbfIWW0m (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Sep 2019 18:26:42 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:32823 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503270AbfIWW0m (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Sep 2019 18:26:42 -0400
Received: by mail-pg1-f170.google.com with SMTP id i30so3100141pgl.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Sep 2019 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7nipH9zG++CLnj8HfTjF5tjnqkrNdGCCf/hz+lbeTwU=;
        b=Kx9JUt2t3ePYvFLe/gVyfIDDM2egwRgosWaAj0q6x349J3KFmf3nW7g0OE5H1XKM9M
         QwMf1vrJYvP0A/57vcDNsedzf5XaOCNOX+cuid4L/pg103a/qaDLmu9+ClI4EAu2PSP1
         CFYV6GU5qDYDawu0j8FstW3O56lfPXfQLqmbvp38mTb6upCa9ygGKcwkgzRAlkGUc6ZS
         jYNPuFSq/cks7SgRwhzbq4wpbtzyqzGjBFxMYbsjf+Bora2U4vJARGe8fgtKQMaAcLHR
         hIEgcGduuksqiItcB4zHHy/EgEncqy9/LGPm/8evBPVMc/jezyKb2YVEdVJjiP6xCANn
         Muig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7nipH9zG++CLnj8HfTjF5tjnqkrNdGCCf/hz+lbeTwU=;
        b=RqwlnHj0+E14M1vOh5lQ9eztk7BYTOSVOdGL7PVEXrvomGs9wdtZEAAqoeiuuFG/C0
         JLkg1cC3/BL+lOp4q3TmZuKF0a1SzIF7111zU8GLRGhPh4W2QEfcvrf2k9vCC/phIkcI
         CzvvxTJLsf3jhNl1jj2eIMiAyNtnAx0ILfT08PY55s2DiqiHIzYErWQl43/89xXEWPEJ
         XRKPmG1xWy297q4MzZbFUQiDJ+cpDthdaWsj1UpIua/D/1B+034iADKx7cqv6fhudDuj
         bGUnS8b7/s3+oeLDQ+UV4HK6t0qEUlslUlKn1/O+PX3+3CF5VkDAFV9hcGjU/HVCR+D8
         Y/Ng==
X-Gm-Message-State: APjAAAU0nhO4UGB/Y993646F+fuwhk4kmmD45eo2ur+HP238tIkBsixX
        t8u6fPmiyet8+0lVanX2SRHtM9PLdhrDtoHzEBzpRw==
X-Google-Smtp-Source: APXvYqxpb3asv5G5pLgVYoK15UlJPC/yc1AM8BPSCQ98/lTFu2dwvZLw/d6KrlSZ/OQlskYmwlryql1nM84kaQFbLtI=
X-Received: by 2002:a17:90a:8d83:: with SMTP id d3mr1872304pjo.131.1569277599845;
 Mon, 23 Sep 2019 15:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <CABVgOSk79D0pmcWn-ynwGMfSxiD5AGrYWHmcQ5awre7QnQoKPg@mail.gmail.com>
 <CAFd5g4659KMmAtJshzs0n=rPZX5EGFBgYfNkH5RznZH=JnxeHQ@mail.gmail.com> <2ff728c5dd5f4ca6a2c70734bdf0f967@MLBXCH16.cs.myharris.net>
In-Reply-To: <2ff728c5dd5f4ca6a2c70734bdf0f967@MLBXCH16.cs.myharris.net>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 23 Sep 2019 15:26:28 -0700
Message-ID: <CAFd5g46T52W2vVZCdTwL1RtS31YRqByLb_tQ1ZxKeqq1NxAz-g@mail.gmail.com>
Subject: Re: kunit: what do we do with the 'kunit/alpha/master' branch?
To:     "Siebert, David" <David.Siebert@l3harris.com>
Cc:     David Gow <davidgow@google.com>,
        David Chiang <davidchiang@google.com>,
        Kees Cook <keescook@chromium.org>,
        Mike Salvatore <mike.salvatore@canonical.com>,
        Pei Huang <peihuang@google.com>,
        Sagi Shahar <sagis@google.com>,
        Sangsu Ha <sangsu.ha@samsung.com>,
        Shuah Khan <shuah@kernel.org>,
        "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Sep 23, 2019 at 2:45 PM Siebert, David
<David.Siebert@l3harris.com> wrote:
>
>
> Right now I am focused on the mocking and getting that to work. I am still have some very strange issues with mocking some function calls including kernel panics.

Okay, I just responded to your last email on the topic.

> Your plan seems logical but just how useful is it without mocking?

It depends on what you are trying to test. We have a number of tests
so far that do not require mocking (there are several in the initial
upstream patchset itself). A lot more can be tested with the
appropriate use of dependency injection.

In anycase, we are still planning on upstreaming support for mocking,
it is just going to take some time.
