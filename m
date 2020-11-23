Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3498C64E69
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Nov 2020 13:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75B5120575
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Nov 2020 13:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjKKxvzD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388717AbgKWNIX (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Nov 2020 08:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388711AbgKWNIV (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Nov 2020 08:08:21 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F03C0613CF
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2020 05:08:21 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id g19so15778330otp.13
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2020 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOXAAY/4nvkcRrNExNVW2w/236SkW1Wa7iXXWBvmVzk=;
        b=TjKKxvzDW2xRKxIFZmHVFhGbVxv0QEA4azsjh4Se746LrbtvwDBbIpopLLJPcdhJuI
         o1UN/Sgy+csMwaKTMGZjpYSYYvmIyiPIPJb0BBaL970Yx0co3l6w5RlEUi5zoeO3a41o
         ixa59nJIh/qvyqIxi1Oh0NLbZPaCS9YL7gDr3qR0euTD9h1m8ImjYcjwxjtWd+Hb9JxT
         oySzIQ0UlURtEcJqYo1XjJlylqzaWFr1Zysp2vrEeH7IiLXI1zCnOHsBDlOqNUItHNct
         4XZv1QveWS5lUpstKQIx2lAfZBxr0/GA6fXyIxSheWczhQdhMpmv184qnScvo2+vRaoE
         m1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOXAAY/4nvkcRrNExNVW2w/236SkW1Wa7iXXWBvmVzk=;
        b=LjA9PXEO8s2DYbU1CcABDv9jZ3Jizh5b+3AYgt6WthU05UdNGnc9dtoxZVpmvl9pJ8
         N2S6RpLoJBingtnWt68YmQI3/W/K9owLZyJ56SF7JQz+XsDzRQ7YeRrGNxtxRq5d1t4P
         HVUmyAr2VRdCjF+48FXmt/wf7y1FcuADlN1v/2GSHJgOdpsjT3JgbtPbeWkPveE4JZYo
         KWNMHbj2bJOU4G3FdFwf6LRtpkpU3fIZf9D93kfQNlB8tWKutjyv9In73iZk2gHtmTng
         Gy1kn3+8TZNht147kixsBZCbteT1NgazT4/M/wmRD+DWH3X/ewCHtegFZ9X4Ie9v1mQ+
         1FXw==
X-Gm-Message-State: AOAM532Bsc/g9GpbqKcfXg3Q4WGUHzE/d/6dPJzJQFwunONHMaHD/zMc
        gwV3v+YNbtrHy2xHFv3qVkKSWrUoxLybFdU8d7ZIRg==
X-Google-Smtp-Source: ABdhPJzr6yHUX5v7BGEcMhUDV1cUCOAKiltj24nnnPzP6TuGA0Pq1ldfeUd2BvVxt3jSHtlqeTvapEQeBsyIkpdrGqc=
X-Received: by 2002:a05:6830:1c76:: with SMTP id s22mr12465867otg.233.1606136900157;
 Mon, 23 Nov 2020 05:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com> <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
In-Reply-To: <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 23 Nov 2020 14:08:08 +0100
Message-ID: <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] kunit: Support for Parameterized Testing
To:     David Gow <davidgow@google.com>
Cc:     Arpitha Raghunandan <98.arpi@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
> On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >
> > Implementation of support for parameterized testing in KUnit. This
> > approach requires the creation of a test case using the
> > KUNIT_CASE_PARAM() macro that accepts a generator function as input.
> >
> > This generator function should return the next parameter given the
> > previous parameter in parameterized tests. It also provides a macro to
> > generate common-case generators based on arrays. Generators may also
> > optionally provide a human-readable description of parameters, which is
> > displayed where available.
> >
> > Note, currently the result of each parameter run is displayed in
> > diagnostic lines, and only the overall test case output summarizes
> > TAP-compliant success or failure of all parameter runs. In future, when
> > supported by kunit-tool, these can be turned into subsubtest outputs.
> >
> > Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> [Resending this because my email client re-defaulted to HTML! Aarrgh!]
>
> This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
> both worked fine.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Tested-by: David Gow <davidgow@google.com>

Thank you!

> Thanks for sticking with this!

Will these patches be landing in 5.11 or 5.12?

> -- David

Thanks,
-- Marco
