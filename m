Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C71C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed,  9 Feb 2022 21:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbiBIVFY (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 9 Feb 2022 16:05:24 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbiBIVFV (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 9 Feb 2022 16:05:21 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E8DC002151
        for <linux-kselftest@vger.kernel.org>; Wed,  9 Feb 2022 13:05:23 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id y8so3820555pfa.11
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Feb 2022 13:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V84L2PoKJ1SmhfGQgH8rqYWxNln8hG0mJ8WVBKOnt3Q=;
        b=sxNtbNCZEokf3B1RoGKT7dlAEffUINIeEFABt3fmJSI+VGY6xPCg7vNYjI15/XyyE7
         Q6nOQ5pU6KXaG+6jnvqPwzPd7Qr8Pc4bA99jReE/w66g82YhE5wX/5MDUmdPAvMkVBVx
         QKNh5g4PIXQ+x49j4ljJhoke+zjFN0RdYp+kawuCxmUWb7PlY2mRtwxOoI23vbsFebzm
         OY4vieCp5OxdWT/vzM7gZ//GQ81rkCtMNBX5Al0Ug33sw4qsIoXB/3O++0CRbjJyRRZi
         uu4JpsPSNYOH5v54WvmbUidJGr5TTJ06VtYmDZ/jgXVqy9FeLQKq7gQN45w44n+DHU5i
         s9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V84L2PoKJ1SmhfGQgH8rqYWxNln8hG0mJ8WVBKOnt3Q=;
        b=ntgJfM+Au+r9QuI+3aYGGOLNO5sxNkEKfExOsn0415+TPInRDvw/jRFiDoZ6oDJDs1
         blZ7ccacZS9oo1Ia89cFdkg5Jupd6Th4btq+gWYVbSFW/Ok9pWgkQCSQwxDNGWUx+X/J
         pWRW8lvfGmAW3fxK3vU3Xjpoz/niHc0ZFbCfpe8FjEUbVfgo4UhK3iXnBB6RvnI3A0r3
         qZvIH2i5agXNgms+jQYMMdfpx+LDgIeblUQpNVS2zlWroE3ly8l5hyf55uIxEmFjHCi6
         fV28l8jPVHuWaeggp6QXXUMv0ByJfLNc99pQJKM+lX2wzOVaWcrGHF1rAsqKj7zpdhY9
         wTxA==
X-Gm-Message-State: AOAM532MTBw9AqParITcG5T4RsHWd15azC/b3Q7N7dx6+aIxwbbS53v/
        r+A2rHIF4QjQ3qxaObQJB/V8hf61Sje+uTnmF3+MFA==
X-Google-Smtp-Source: ABdhPJyXbBzM+PYAVpFMyuzeTUB6sZNGpVumQ1wq9htswSzcySEzXgz2P3nOlDcszfR3ss9oaB4i/ny9IpO38FCVaMo=
X-Received: by 2002:a63:2a95:: with SMTP id q143mr3411045pgq.407.1644440721971;
 Wed, 09 Feb 2022 13:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20220208114541.2046909-1-ribalda@chromium.org> <20220208114541.2046909-2-ribalda@chromium.org>
In-Reply-To: <20220208114541.2046909-2-ribalda@chromium.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 9 Feb 2022 16:05:10 -0500
Message-ID: <CAFd5g46AupffbhjXce_T_NrYZvBxHDE0-cTph22bMDCJ-wyj6Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] kunit: use NULL macros
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     kunit-dev@googlegroups.com, kasan-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Feb 8, 2022 at 6:45 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace the NULL checks with the more specific and idiomatic NULL macros.
>
> Reviewed-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
