Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B60C64E7B
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 20:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B639B206E0
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 20:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JT8a4im5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgLAUcB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 1 Dec 2020 15:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgLAUcA (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 1 Dec 2020 15:32:00 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C62C0613D4
        for <linux-kselftest@vger.kernel.org>; Tue,  1 Dec 2020 12:31:20 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id v11so2172338qtq.12
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Dec 2020 12:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EZzwh1qZeO2b0+phIivb7f/h0/WTvwlyT6OwTCuU8Go=;
        b=JT8a4im5mRuwETNO39npw148r3340SB50NEKuWNK0T0EuLy6OY9QxvW2zT/YDF2yFp
         UDut3hb/IwScMF6t2XadwaGd+yHJh+yFtyRwrtZpeoHwNKSKSdAMjf3ot8WcDsnZjxqf
         bMAuJ4tVWjR7xLj3IP145iuAhRDUlXYWfYAEA6byKRLe3aotgpbVCFQZZ4gA8DHne6/k
         Rb5mEgw3XQWX9US8bpL1sM9eU5aL+7nYIo7rmz1/s3gQWSI6h3f+hcarRBw7d+JUJAtw
         thynGtAl3j149w2TA2Keiu7Q77qscbMbf9q8yi6/+z56GAa+epwJnUIXluzV9/0K2Q8o
         1Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZzwh1qZeO2b0+phIivb7f/h0/WTvwlyT6OwTCuU8Go=;
        b=gD/Piq8A6L8L2kmuPMbdHn8gBrreN3z5tjFOz3OqxajqlPpaTvlV7nAnNgdFvFtgKR
         WiVqjB7pdbsh4HsxMHcSuN25ldFyuG49CCsqqufMPtA5KL0C2s0jG/O0UInbi4WXNjok
         DcokbOCBvu24qjp0dlGE7qXYF2wXeFw7SsJjupEvsdb8BqRUgUX5piCZ7Jr4dV08W1cp
         3Eczas/UJVjC6lNjs4EtqMTJDUebpqZvTo7wI1Vmc56Ra3dlPs28zjlVoQjJqWigL4+B
         32LjRNG29yVvmk4Pf1yw17W/lRoaCIGNncdgf3UF9QJ2rBcE89Z2+3k3w34DBy0UXbDJ
         toeQ==
X-Gm-Message-State: AOAM5320SwByInTlw03c4Jz3db0+KO/lMZOdNp02Bp9MHCsYCkqEdwqQ
        ibmDGEJVnL9ZfMdL+WZ1WKxvB73laX1JscIoWAod
X-Google-Smtp-Source: ABdhPJwORLiqHf9AEcfRZc8YF8T9RnXczT+vC9iTlw0cFtvOwxSpw6bde3sJmjRTqSW8oC8iYZN969xbu1Qx+8dDGiA=
X-Received: by 2002:ac8:679a:: with SMTP id b26mr4823395qtp.79.1606854679256;
 Tue, 01 Dec 2020 12:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com> <20201116054150.211562-1-98.arpi@gmail.com>
In-Reply-To: <20201116054150.211562-1-98.arpi@gmail.com>
From:   Iurii Zaikin <yzaikin@google.com>
Date:   Tue, 1 Dec 2020 12:30:42 -0800
Message-ID: <CAAXuY3rE9D+QbY-0rfkeFSMUULPkzvqZGsyYhM2Fza2nNt3e3w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] fs: ext4: Modify inode-test.c to use KUnit
 parameterized testing feature
To:     Arpitha Raghunandan <98.arpi@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marco Elver <elver@google.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        David Gow <davidgow@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

>
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.

Reviewed-by: Iurii Zaikin <yzaikin@google.com>
