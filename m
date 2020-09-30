Return-Path: <SRS0=5jaa=DH=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13E1C4727E
	for <linux-kselftest@archiver.kernel.org>; Wed, 30 Sep 2020 20:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A0F720709
	for <linux-kselftest@archiver.kernel.org>; Wed, 30 Sep 2020 20:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EV5XhCUN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgI3UAi (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730056AbgI3UAi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 30 Sep 2020 16:00:38 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D3C0613D0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2020 13:00:38 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id e18so1755716pgd.4
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2020 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C0buDk1lfDRicXKleSWOOo9Y20Ops+3/WyFLps1JySo=;
        b=EV5XhCUNe6y83dRgMKFB0HticDojrwQpNxo5x7bP53L+fWEdlwjwXTQaZ6J6WEE88B
         4bV1hKYhbKv/JUXq7GCHrVpZRCwJg+wbp8awPqKvm30odArcSKQNCFbJWkZ+Fq9hXv6w
         ARrv4zfEmj+jLaj8pp2hHjgqbkGrR5rDL1kKWC+kNEYvfYS/olANfEsiKGlXeiU3VtFj
         pMII41Ld0BsWzkpffWTu6+dJHQD9D8txkcih6OoW7TWatCYZNb/RufyjslpfThDIBQ+5
         OzILzJ+0aQgXHwMOGq0q64dmU2TozsHn12nKhPYOVXQFLF0QcDoHOpt1LzdjHAek7kSj
         KDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C0buDk1lfDRicXKleSWOOo9Y20Ops+3/WyFLps1JySo=;
        b=sfBJySyTa+t52EqMFXDqeUITPDgu40aaN9D7QDJHGxwqIcksqngDs/sTlZ7l3j5xLo
         DHP3Kw7e5BcLrb313pzTvqFe0MzaIfCISuzQOjit7a09wXTu/tlAhe4blvc+xyKhyhZS
         uN7n3QL1pvxXfZIBnxiXnYb2BGm8CM9PU++RYZo9YYhXguvafzfXpcTQ5NU19J5WYqy9
         5tiPpRhj1pPDh/0vu4tCETIfi3+ybA1/cGByzPnmQ29maIFXPSUzLbIho9ESTZOhK8MY
         4Z1GB/MfNFbTBTlj2awNqFfRAtMS/qwsWRCfhpBVcCEHRW0eRtF+G9A+oLchbUQ5d7mn
         DUqg==
X-Gm-Message-State: AOAM5301LNO2vZGu3M3kUKGbX9lWl2WlbMBbkr2nA8InO/w8/oYne884
        eVjyjvvPP+d1iMZVhCwkE1kCkD88nf5NfglGJzP6Ng==
X-Google-Smtp-Source: ABdhPJxhC4SP22BPP1/0YwmVb7IS+5dNDlIGPGllujnuENj2Vxw8bvt70ZGHQUs+1ybXPXt9/JKYGiZxLP6SdYS+8XQ=
X-Received: by 2002:a63:703:: with SMTP id 3mr3330942pgh.159.1601496037519;
 Wed, 30 Sep 2020 13:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200930183151.1046716-1-dlatypov@google.com>
In-Reply-To: <20200930183151.1046716-1-dlatypov@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 30 Sep 2020 13:00:25 -0700
Message-ID: <CAFd5g44XTGbWnW+Khb3RLpWd4_nQtn=C_LAR4Ju+1_6VBOh2LQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: fix display of make errors
To:     Daniel Latypov <dlatypov@google.com>
Cc:     David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 30, 2020 at 11:32 AM Daniel Latypov <dlatypov@google.com> wrote=
:
>
> CalledProcessError stores the output of the failed process as `bytes`,
> not a `str`.
>
> So when we log it on build error, the make output is all crammed into
> one line with "\n" instead of actually printing new lines.
>
> After this change, we get readable output with new lines, e.g.
> >   CC      lib/kunit/kunit-example-test.o
> > In file included from ../lib/kunit/test.c:9:
> > ../include/kunit/test.h:22:1: error: unknown type name =E2=80=98invalid=
_type_that_causes_compile=E2=80=99
> >    22 | invalid_type_that_causes_compile errors;
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > make[3]: *** [../scripts/Makefile.build:283: lib/kunit/test.o] Error 1
>
> Secondly, trying to concat exceptions to strings will fail with
> > TypeError: can only concatenate str (not "OSError") to str
> so fix this with an explicit cast to str.
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>

Cheers!
