Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A14C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 23 Mar 2022 21:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239268AbiCWVSd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 23 Mar 2022 17:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbiCWVSb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 23 Mar 2022 17:18:31 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E2084EF7
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Mar 2022 14:17:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u26so3349783eda.12
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Mar 2022 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9Hg8/L/wr7RnygS3OokjP5227FjsrevJV37KK/fvWQ=;
        b=TH81aSeEBrU5nfaLwaLJQAGX3Z6ZLCWH1wdAWIOuywFPVQ0v9G/npRHhAuHnehjEjy
         9XNqgZIgF5esR6SQqPO3MCQnYhv6HiRf2Z0xmRlgmINvXUVM78eEfc7+S2gGfUnmzxsw
         oqf7iAE0/gxyxVnDpnnft0UfRWiZOXlhhh/pfwG3vy6cU5NoafG2lPnn1inxnM4JEfgH
         Gk7Ryx2JYKJb4ZdN5MKkH/rJvrLezgT9cIIWFgWV+WGgorkvsAPb/z/m3PCDLy0WV+jv
         fyvYtPtCxjVRW/ImZeYsFqOutCVqofDZCtQAcPnH6hwV0JkjsZsuUgcLq1TxTHCCbVLW
         P42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9Hg8/L/wr7RnygS3OokjP5227FjsrevJV37KK/fvWQ=;
        b=jFaCWsNS3OVebEtagwFp4n4mntZW6kK40tXecjoCjHdhg7O9IypV4nOfueLNPsLIQU
         2SONtIWjkT/DTm4yVD0X0IupvFpSMRdn9NIsO16xb1VOwRDBu9GPkRQ885w1fP6cu2+v
         N9E3FXxqtNOswWDAnz4Ukw9baGWWGVF7oC9tkqBqA3ome2FB2Cp40O1GBWYGM8OMz7P4
         qxHbmjzHiR5mmxeeER9WQAu9xyyn0Sy7dOmlalDX2k4Oz5pVz8GVlm7p1VwemRmgjMdz
         ShLHku41f2Ps09X7k0CgJmxsNTwGOjJQ9eQSEdl6dA4QvCp8UlbOmTzu2Pjz6mAdLcqh
         +WeQ==
X-Gm-Message-State: AOAM5336rZTc6pDdLL6dVtDsJ7y/Tn8Nca0jt+iRfInDK57zSs1aDNFw
        QgSxfgXLpm/jDOmiw9Il/yQnm1nITed/Ybo1DWilLw==
X-Google-Smtp-Source: ABdhPJytjdt/Dnc34nGkK+GF4EYRFsgt2UIzCvzSliu9yZHaHhWUZv0wOtzGiwGig0xtblWnqhcajp1UVm2CNnz8vjk=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr2750389edb.118.1648070220127; Wed, 23
 Mar 2022 14:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220211164246.410079-1-ribalda@chromium.org> <20220211164246.410079-5-ribalda@chromium.org>
In-Reply-To: <20220211164246.410079-5-ribalda@chromium.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 23 Mar 2022 17:16:49 -0400
Message-ID: <CAFd5g46fAbfgWdJD5Fcjn2v3nnQ0d_qXqQBZ_Cuk7WqRLnzEpQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] mctp: test: Use NULL macros
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     kunit-dev@googlegroups.com, kasan-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Feb 11, 2022 at 11:42 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace the PTR_EQ NULL checks wit the NULL macros. More idiomatic and
> specific.
>
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
