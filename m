Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06513C77B73
	for <linux-kselftest@archiver.kernel.org>; Sun,  4 Jun 2023 10:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjFDKuP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 4 Jun 2023 06:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjFDKuN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 4 Jun 2023 06:50:13 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 561E7B4;
        Sun,  4 Jun 2023 03:50:12 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 354Ao34u001739;
        Sun, 4 Jun 2023 12:50:03 +0200
Date:   Sun, 4 Jun 2023 12:50:03 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Vincent Dagonneau <v@vda.io>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: ensure fast64 integer types have 64 bits
Message-ID: <ZHxsWyTf5K5bJqi8@1wt.eu>
References: <20230530-nolibc-fast64-v1-1-883dea6bc666@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530-nolibc-fast64-v1-1-883dea6bc666@weissschuh.net>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, May 30, 2023 at 11:18:00AM +0200, Thomas Weiﬂschuh wrote:
> On 32bit platforms size_t is not enough to represent [u]int_fast64_t.
> 
> Fixes: 3e9fd4e9a1d5 ("tools/nolibc: add integer types and integer limit macros")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Cc: Vincent Dagonneau <v@vda.io>
> 
> Note: We could also fall back to compiler-provided data like:
> 
> __UINT_FAST{8,16,32,64}_{TYPE,MIN,MAX}__

I'm fine with the way you did it. I'm wondering how we managed to miss
this one given the tests in place!

Now queued, thank you Thomas.
Willy
