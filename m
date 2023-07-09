Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171ADEB64DD
	for <linux-kselftest@archiver.kernel.org>; Sun,  9 Jul 2023 09:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjGIJao (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 9 Jul 2023 05:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGIJan (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 9 Jul 2023 05:30:43 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5071891;
        Sun,  9 Jul 2023 02:30:42 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 3699UYeY019515;
        Sun, 9 Jul 2023 11:30:34 +0200
Date:   Sun, 9 Jul 2023 11:30:34 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH] selftests/nolibc: simplify call to ioperm
Message-ID: <20230709093034.GG9321@1wt.eu>
References: <20230703-nolibc-ioperm-v1-1-abf9ebe98a80@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230703-nolibc-ioperm-v1-1-abf9ebe98a80@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Jul 03, 2023 at 10:11:08AM +0200, Thomas Weißschuh wrote:
> Since commit 53fcfafa8c5c ("tools/nolibc/unistd: add syscall()") nolibc
> has support for syscall(2).
> Use it to get rid of some ifdef-ery.

Queued, thank you Thomas!
Willy
