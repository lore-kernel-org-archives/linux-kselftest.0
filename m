Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB4AC77B73
	for <linux-kselftest@archiver.kernel.org>; Sun,  4 Jun 2023 11:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjFDLFy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 4 Jun 2023 07:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjFDLFx (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 4 Jun 2023 07:05:53 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1B54CE;
        Sun,  4 Jun 2023 04:05:51 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 354B5Ij4001769;
        Sun, 4 Jun 2023 13:05:18 +0200
Date:   Sun, 4 Jun 2023 13:05:18 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, thomas@t-8ch.de
Subject: Re: [PATCH 0/4] selftests/nolibc: add user-space 'efault' handler
Message-ID: <ZHxv7kIm2kEAfin2@1wt.eu>
References: <cover.1685443199.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1685443199.git.falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Zhangjin,

On Tue, May 30, 2023 at 06:47:38PM +0800, Zhangjin Wu wrote:
> Hi, Willy, Thomas
> 
> This is not really for merge, but only let it work as a demo code to
> test whether it is possible to restore the next test when there is a bad
> pointer access in user-space [1].
> 
> Besides, a new 'run' command is added to 'NOLIBC_TEST' environment
> variable or arguments to control the running iterations, this may be
> used to test the reentrancy issues, but no failures found currently ;-)

Since the tests we're running are essentially API tests, I'm having
a hard time seeing in which case it can be useful to repeat the tests.
I'm not necessarily against doing it, I'm used to repeating tests for
example in anything sensitive to timing or race conditions, it's just
that here I'm not seeing the benefit. And the fact you found no failure
is rather satisfying because the opposite would have surprised me.

Regarding the efault handler, I don't think it's a good idea until we
have signal+longjmp support in nolibc. Because running different tests
with different libcs kind of defeats the purpose of the test in the
first place. The reason why I wanted nolibc-test to be portable to at
least one other libc is to help the developer figure if a failure is in
the nolibc syscall they're implementing or in the test itself. Here if
we start to say that some parts cannot be tested similarly, the benefit
disappears.

I mentioned previously that I'm not particularly impatient to work on
signals and longjmp. But in parallel I understand how this can make the
life of some developers easier and even allow to widen the spectrum of
some tests. Thus, maybe in the end it could be beneficial to make progress
on this front and support these. We should make sure that this doesn't
inflate the code base however. I guess I'd be fine with ignoring libc-
based restarts on EINTR, alt stacks and so on and keeping this minimal
(i.e. catch a segfault/bus error/sigill in a test program, or a Ctrl-C
in a tiny shell).

Just let us know if you think that's something you could be interested
in exploring. There might be differences between architectures, I have
not checked.

Thanks,
Willy
