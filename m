Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CC8C001DC
	for <linux-kselftest@archiver.kernel.org>; Sat, 29 Jul 2023 07:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236627AbjG2H3p (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 29 Jul 2023 03:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG2H3p (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 29 Jul 2023 03:29:45 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1F7649D5;
        Sat, 29 Jul 2023 00:29:43 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 36T7TXZF004173;
        Sat, 29 Jul 2023 09:29:33 +0200
Date:   Sat, 29 Jul 2023 09:29:33 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, Zhangjin Wu <falcon@tinylab.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: avoid buffer underrun in space printing
Message-ID: <20230729072933.GF956@1wt.eu>
References: <20230726-nolibc-result-width-v1-1-d1d2dc21844e@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230726-nolibc-result-width-v1-1-d1d2dc21844e@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 26, 2023 at 08:08:13AM +0200, Thomas Weiﬂschuh wrote:
> If the test description is longer than the status alignment the
> parameter 'n' to putcharn() would lead to a signed underflow that then
> gets converted to a very large unsigned value.
> This in turn leads out-of-bound writes in memset() crashing the
> application.
> 
> The failure case of EXPECT_PTRER() used in "mmap_bad" exhibits this
> exact behavior.
> 
> Fixes: 8a27526f49f9 ("selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied, thank you Thomas!
Willy
