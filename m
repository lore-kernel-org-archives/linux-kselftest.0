Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D862AC77B73
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Jun 2023 03:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbjFED0o (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjFED0n (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 4 Jun 2023 23:26:43 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08E80CC;
        Sun,  4 Jun 2023 20:26:40 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 3553QJ3J005056;
        Mon, 5 Jun 2023 05:26:19 +0200
Date:   Mon, 5 Jun 2023 05:26:19 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Zhangjin Wu <falcon@tinylab.org>, thomas@t-8ch.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: nolibc patches, still possible for 6.5 ?
Message-ID: <ZH1V21rhUQlvRgnU@1wt.eu>
References: <ZHyPi29q3MKiNAQZ@1wt.eu>
 <5494ac68-b4b9-434f-92c1-7e197c92a4ab@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5494ac68-b4b9-434f-92c1-7e197c92a4ab@paulmck-laptop>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sun, Jun 04, 2023 at 03:57:54PM -0700, Paul E. McKenney wrote:
> On Sun, Jun 04, 2023 at 03:20:11PM +0200, Willy Tarreau wrote:
> > Hello Paul,
> > 
> > Thomas and Zhangjin have provided significant nolibc cleanups, and
> > fixes, as well as preparation work to later support riscv32.
> > 
> > These consist in the following main series:
> >   - generalization of stackprotector to other archs that were not
> >     previously supported (riscv, mips, loongarch, arm, arm64)
> > 
> >   - general cleanups of the makefile, test report output, deduplication
> >     of certain tests
> > 
> >   - slightly better compliance of some tests performed on certain syscalls
> >     (e.g. no longer pass (void*)1 to gettimeofday() since glibc hates it).
> > 
> >   - add support for nanoseconds in stat() and statx()
> > 
> >   - fixes for some syscalls (e.g. ppoll() has 5 arguments not 4)
> > 
> >   - fixes around limits.h and  INT_MAX / INT_FAST64_MAX
> > 
> > I rebased the whole series on top of your latest dev branch (d19a9ca3d5)
> > and it works fine for all archs.
> > 
> > I don't know if you're still planning on merging new stuff in this area
> > for 6.5 or not (since I know that it involves new series of tests on your
> > side as well), but given that Zhangjin will engage into deeper changes
> > later for riscv32 that will likely imply to update more syscalls to use
> > the time64 ones, I would prefer to split the cleanups from the hard stuff,
> > but I'll let you judge based on the current state of what's pending for
> > 6.5.
> > 
> > In any case I'm putting all this here for now (not for merge yet):
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git 20230604-nolibc-rv32+stkp6
> > 
> > I'd like Thomas and Zhangjin to perform a last check to confirm they're
> > OK with this final integration.
> 
> Given that the testing converges by the end of this week, I can't see
> any reason why these cannot make v6.5.

Perfect, thank you!

> (There were some kernel test
> robot complaints as well, valid or not I am not sure.)

You mean in relation with nolibc stuff (or nolibc-test) or something
totally different ?

Best regards,
Willy
