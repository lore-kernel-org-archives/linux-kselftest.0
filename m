Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C01AEB64DD
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Aug 2023 08:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjHAINT (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 1 Aug 2023 04:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjHAINS (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 1 Aug 2023 04:13:18 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AF71199E;
        Tue,  1 Aug 2023 01:13:16 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 3718D7Lu031066;
        Tue, 1 Aug 2023 10:13:07 +0200
Date:   Tue, 1 Aug 2023 10:13:07 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yuan Tan <tanyuan@tinylab.org>,
        Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH v2 06/10] selftests/nolibc: make functions static if
 possible
Message-ID: <ZMi+k0HsMGJxbs7V@1wt.eu>
References: <20230801-nolibc-warnings-v2-0-1ba5ca57bd9b@weissschuh.net>
 <20230801-nolibc-warnings-v2-6-1ba5ca57bd9b@weissschuh.net>
 <ZMiro1pwVvAzNel5@1wt.eu>
 <bf97900a-98bb-45dc-9451-b9728173136e@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf97900a-98bb-45dc-9451-b9728173136e@t-8ch.de>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Aug 01, 2023 at 09:34:18AM +0200, Thomas Weißschuh wrote:
> On 2023-08-01 08:52:19+0200, Willy Tarreau wrote:
> > On Tue, Aug 01, 2023 at 07:30:13AM +0200, Thomas Weißschuh wrote:
> > > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > > index 1555759bb164..53a3773c7790 100644
> > > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> 
> > [..]
> 
> > >  /* prepare what needs to be prepared for pid 1 (stdio, /dev, /proc, etc) */
> > > -int prepare(void)
> > > +static int prepare(void)
> > >  {
> > >  	struct stat stat_buf;
> > >  
> > > @@ -1208,7 +1208,7 @@ static const struct test test_names[] = {
> > >  	{ 0 }
> > >  };
> >  
> > For these ones it will prevent gcc from putting breakpoints there, which
> > is counter-productive.
> 
> Indeed.
> 
> An alternative would be to add -g to CFLAGS (and remove -s from LDFLAGS).
> This way we get full debugability including breakpoints for everything.

It wouldn't change much because while it would allow the debugger to know
where the function was possibly inlined, it's still not very convenient:
you believe you're in a function but in fact you're in the caller. It
really depends what you're debugging but here I don't see all that as
providing a value, at least it brings more annoyance and little to no
gain IMHO.

> I didn't find the reasoning for -s in LDFLAGS.

It's historic, because normally when you want small binaries you strip
them, and the command line was reused as-is, but I agree that we could
get rid of it!

Willy
