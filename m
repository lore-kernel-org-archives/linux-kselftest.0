Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8DFC433FE
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Nov 2022 21:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbiKOVDB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 15 Nov 2022 16:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiKOVC7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 15 Nov 2022 16:02:59 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D5A248FE
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Nov 2022 13:02:58 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so19193327ljh.13
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Nov 2022 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oe1c7i8iQlKmhCbzQLnmtoa4F3nkS3hG3cn5OwmGmYc=;
        b=jHcXSSxYAsVbBz4HlCYZuOlIpBaoMOvkA9BxPFmpHRjn6/yhCFnvBVbBFMlx3yC7oY
         SojTvgG0RxshUbM7ZGiH+8Mm/gHrwYbYPTRXVgHlmOwzzPzFgO5c+/CkXZIUCpKRfGFV
         eVWWu4ryIIrVw6ybBey13WjSCnM+rC/t2ja6OQLVypba33QV3gdAEzHXmMwfN6cGxeRb
         HSSSd5rN0n6UeAygkOZUc2hm5fJC6SbWjyd0vy1YzEbV5oeVqiKdMiBEJYBItMF73TXw
         tQWqxDK+C9v7uR68PNrdN0a/eAmxPiQq/ugFIGkStJ31cQ5OxI58I9kNX9CNvnNjXjAf
         hVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oe1c7i8iQlKmhCbzQLnmtoa4F3nkS3hG3cn5OwmGmYc=;
        b=do6D5i2y57ChYr+YLO+zLAzV6EQ6VbSzlj0f1ScI6pZyOGGHyih4GREW8gyj9DBaKo
         Jp217EDb4YdEO+tTEMN1+AjwyMGLIv3MQNm/8I3xxFzrcHkZttHMG2dPRdUlFQCpuLNj
         meoni/Mq36+AdbL0b1zTw2nIh3HHcrmAtLGPtoYhwbh0J624JMld2cDpVwjdFcYCuC7v
         sOnHtRHan0iYjt4RoAzOMh9nNQs2G97Bo81ZpGM91SVFr6FjBNaaeAC8cWvdUgf5dhTV
         2oiI1Pguzo1CJdvPzxiU2YoDeruMdrq0JQx3r4EG5VMG4YiFf3RQ1pOqU9dTQsO0RRDn
         YQVQ==
X-Gm-Message-State: ANoB5pnPTSKGI/onTPNIKkDgd7JzUCP7PLewe8bFttOuzentZrvcHmco
        OG4UycVayB3ogCxK42ewivvdhm3Qtlhe9WM92/4mUQ==
X-Google-Smtp-Source: AA0mqf56Y1aqUrWgCUKz9IlmRzpyGNMlqe9QnHWfjWUy49bOaWTXrHFYv/1tc0cM1gd8NWMj/pwQ3Yri6jdD3HZSpZ4=
X-Received: by 2002:a05:651c:3c4:b0:277:10b2:47e5 with SMTP id
 f4-20020a05651c03c400b0027710b247e5mr6367989ljp.502.1668546176254; Tue, 15
 Nov 2022 13:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20221013121319.994170-1-vannapurve@google.com>
 <20221013121319.994170-3-vannapurve@google.com> <20221013140056.a6nw7fouxp6yuqx2@kamzik>
In-Reply-To: <20221013140056.a6nw7fouxp6yuqx2@kamzik>
From:   Peter Gonda <pgonda@google.com>
Date:   Tue, 15 Nov 2022 14:02:44 -0700
Message-ID: <CAMkAt6pPW=k=dQ2sf3pAdRy2AFGWscjs8sLQQq3Z0W5P=yri3g@mail.gmail.com>
Subject: Re: [V3 PATCH 2/4] KVM: selftests: Add arch specific initialization
To:     Andrew Jones <andrew.jones@linux.dev>
Cc:     Vishal Annapurve <vannapurve@google.com>, x86@kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, pbonzini@redhat.com,
        shuah@kernel.org, bgardon@google.com, seanjc@google.com,
        oupton@google.com, peterx@redhat.com, vkuznets@redhat.com,
        dmatlack@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Oct 13, 2022 at 8:03 AM Andrew Jones <andrew.jones@linux.dev> wrote:
>
> On Thu, Oct 13, 2022 at 12:13:17PM +0000, Vishal Annapurve wrote:
> > Introduce arch specific API: kvm_selftest_arch_init to allow each arch to
> > handle initialization before running any selftest logic.
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > ---
> >  .../selftests/kvm/include/kvm_util_base.h      |  5 +++++
> >  .../selftests/kvm/lib/aarch64/processor.c      | 18 +++++++++---------
> >  tools/testing/selftests/kvm/lib/kvm_util.c     |  6 ++++++
> >  3 files changed, 20 insertions(+), 9 deletions(-)
> >
>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Reviewed-by: Peter Gonda <pgonda@google.com>
