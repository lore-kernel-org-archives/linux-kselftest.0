Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D9C001E0
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Aug 2023 07:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjHAHeW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 1 Aug 2023 03:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjHAHeW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 1 Aug 2023 03:34:22 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7171726;
        Tue,  1 Aug 2023 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1690875259;
        bh=qNGRHKsnBf+CzrhykXYrpIFs3s6raNyDUWsZW5CWNow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YLyJZJ8k1oRfvQd2F2WbhPPAW9vDexfyDyYd9i2aMcHbw1VWqzMRQEVc0VkK/nqfU
         sQU2bwlXxslCCqHQIt3pGKwZlwQlkH8vQ4n3lEvn5lf9BbOPKw1NNA+XbQUtgHzg5e
         STxXs07pQAXghKHPZ56wWLOGMZf5VNIvxcCx4JLA=
Date:   Tue, 1 Aug 2023 09:34:18 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yuan Tan <tanyuan@tinylab.org>,
        Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH v2 06/10] selftests/nolibc: make functions static if
 possible
Message-ID: <bf97900a-98bb-45dc-9451-b9728173136e@t-8ch.de>
References: <20230801-nolibc-warnings-v2-0-1ba5ca57bd9b@weissschuh.net>
 <20230801-nolibc-warnings-v2-6-1ba5ca57bd9b@weissschuh.net>
 <ZMiro1pwVvAzNel5@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMiro1pwVvAzNel5@1wt.eu>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2023-08-01 08:52:19+0200, Willy Tarreau wrote:
> On Tue, Aug 01, 2023 at 07:30:13AM +0200, Thomas Weißschuh wrote:
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > index 1555759bb164..53a3773c7790 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c

> [..]

> >  /* prepare what needs to be prepared for pid 1 (stdio, /dev, /proc, etc) */
> > -int prepare(void)
> > +static int prepare(void)
> >  {
> >  	struct stat stat_buf;
> >  
> > @@ -1208,7 +1208,7 @@ static const struct test test_names[] = {
> >  	{ 0 }
> >  };
>  
> For these ones it will prevent gcc from putting breakpoints there, which
> is counter-productive.

Indeed.

An alternative would be to add -g to CFLAGS (and remove -s from LDFLAGS).
This way we get full debugability including breakpoints for everything.

I didn't find the reasoning for -s in LDFLAGS.

Thomas
