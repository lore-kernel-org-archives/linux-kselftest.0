Return-Path: <SRS0=QLj4=Z2=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E6EC43603
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Dec 2019 21:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B88C220674
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Dec 2019 21:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JqDkuBSi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfLDVr5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 4 Dec 2019 16:47:57 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46079 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfLDVr5 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 4 Dec 2019 16:47:57 -0500
Received: by mail-qt1-f195.google.com with SMTP id p5so1307398qtq.12
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Dec 2019 13:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gshFHlXorZRPtuUvzsvKwY0wqb/ip/BbpBdjdSR2BMY=;
        b=JqDkuBSiekK3DptglgzAw7HGuRWyFqFz75JZHEAei1eKHrWBQFIwYR9AXtkHwhAQP4
         x3tfzWPJqM7BeS9hzrQ2N8hLaN63z8d43YxjSmiJESSMABJ9YkImVKEi2QhlLsWNyVPd
         XJBc/x2R657X/QRphac+28VMFRTXyAu6yP+Lr2GmPpWQhwB0hTdf8o6FVtxOzdIw2U8K
         OvOTp7lGcxp6WteJo2ld9wK6/MK91m33Xer8x5TTlOrYDe0Oc1YFhp69Thl8Vf7z7pUb
         3Nd7TTj+pDQ5WOfUV2sqpGHiz/XSNSquOApVPsyx182yHcUZn6zxTbvR9i/1yXKfaQe8
         i/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gshFHlXorZRPtuUvzsvKwY0wqb/ip/BbpBdjdSR2BMY=;
        b=eAknN1aPKdqIeaQGgY+QewDS3kXQR+/+bk9uwGgiCqM/nyXxWF/72Q2/4uiFJEzWKR
         jn/pBJLcBJCfi2mm6cdMXWYj5J91NSW8ZJVqjg6Y8OOXb8EiH/TSYqrY3kW9Fh1NP1rD
         FGcTRGNIndU6k4w5XIoiu3QjO7A1BEvWj8XRkQG9FgVjgj0vV6XG1e+3/CXHW68xOP1+
         D3tkeyLOpvHqQuJVOQ4quHS1ItWzgLCn+o38c5Mj4iCtKBZN+SCBgEu+Zwhs8uiSxRCW
         eQGLse80xHfVyCB0VtrM6dDuuItbCWfqAVtC4s9SS1HVyXz/LUecpRRQhjQSWu88HxF+
         PVTw==
X-Gm-Message-State: APjAAAXFmSspPqxfMOQRVYZmwa7Felgv3sv5agj+rP6OYEDsu8s+BJXF
        7iAxBDeq8EJ0OZWf5KvXqZw1N2ySX3w35K8ENJib
X-Google-Smtp-Source: APXvYqxMahnD1mAZ9M4Iwjc54yKiqmHeapB+BulPXaLMVztIApxI04y4AAKBeOqMVvJEDxgBX0C1cizqGeaFFrtc6HY=
X-Received: by 2002:aed:2041:: with SMTP id 59mr4801904qta.79.1575496076161;
 Wed, 04 Dec 2019 13:47:56 -0800 (PST)
MIME-Version: 1.0
References: <1575473234-5443-1-git-send-email-alan.maguire@oracle.com> <1575473234-5443-4-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575473234-5443-4-git-send-email-alan.maguire@oracle.com>
From:   Iurii Zaikin <yzaikin@google.com>
Date:   Wed, 4 Dec 2019 13:47:19 -0800
Message-ID: <CAAXuY3ruLdiLQaswFB=bhEnjvyTgzCwAhPOxThSyC1Md26km+g@mail.gmail.com>
Subject: Re: [PATCH v6 linux-kselftest-test 3/6] kunit: allow kunit tests to
 be loaded as a module
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>, akpm@linux-foundation.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, urezki@gmail.com,
        andriy.shevchenko@linux.intel.com, corbet@lwn.net,
        David Gow <davidgow@google.com>, adilger.kernel@dilger.ca,
        "Theodore Ts'o" <tytso@mit.edu>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Dec 4, 2019 at 7:28 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
Thanks.
Acked-by: Iurii Zaikin <yzaikin@google.com> # For inode-test, sysctl-test
> --
> 1.8.3.1
>
