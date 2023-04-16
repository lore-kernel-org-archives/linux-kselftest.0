Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F7C77B72
	for <linux-kselftest@archiver.kernel.org>; Sun, 16 Apr 2023 05:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjDPFdZ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 16 Apr 2023 01:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjDPFdY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 16 Apr 2023 01:33:24 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E604326A8;
        Sat, 15 Apr 2023 22:33:18 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 33G5X9Oi022476;
        Sun, 16 Apr 2023 07:33:09 +0200
Date:   Sun, 16 Apr 2023 07:33:09 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH 0/2] tools/nolibc: fork: fix on s390 and add test
Message-ID: <ZDuIlQ4mR9Ic116I@1wt.eu>
References: <20230415-nolibc-fork-v1-0-9747c73651c5@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230415-nolibc-fork-v1-0-9747c73651c5@weissschuh.net>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Thomas,

On Sat, Apr 15, 2023 at 11:28:46PM +0200, Thomas Weiﬂschuh wrote:
> The generic fork() implementation in nolibc falls back to the clone()
> syscall. On s390 the first two arguments to clone() are swapped compared
> to other architectures, breaking the implementation in nolibc.
> 
> Add a custom implementation of fork() to s390 that works.
> 
> While at it also add a testcase for fork().
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thanks for these. Please always Cc the authors of code you're fixing
(e.g. there could be more subtle details that only the author knows
about). Here I think it's OK, but I've CCed Sven and will add him to
your fix.

Thank you!
Willy
