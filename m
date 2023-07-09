Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E399C001DD
	for <linux-kselftest@archiver.kernel.org>; Sun,  9 Jul 2023 09:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjGIJaD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 9 Jul 2023 05:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGIJaC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 9 Jul 2023 05:30:02 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0BC691;
        Sun,  9 Jul 2023 02:30:00 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 3699TlvO019485;
        Sun, 9 Jul 2023 11:29:47 +0200
Date:   Sun, 9 Jul 2023 11:29:47 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     linux@weissschuh.net, arnd@arndb.de, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        shuah@kernel.org
Subject: Re: [PATCH 0/2] proc: proc_setattr for /proc/$PID/net
Message-ID: <20230709092947.GF9321@1wt.eu>
References: <20230624-proc-net-setattr-v1-0-73176812adee@weissschuh.net>
 <20230630140609.263790-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630140609.263790-1-falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi,

On Fri, Jun 30, 2023 at 10:06:09PM +0800, Zhangjin Wu wrote:
> Hi, Thomas
> 
> Just applied your patchset on v6.4, and then:
> 
>   - revert the 1st patch: 'selftests/nolibc: drop test chmod_net' manually
> 
>   - do the 'run' test of nolibc on arm/vexpress-a9
> 
> The 'chmod_net' test of tools/testing/selftests/nolibc/nolibc-test.c
> really failed as expected (and therefore, should be removed):
> 
>     11 chdir_root = 0                                                [OK]
>     12 chdir_dot = 0                                                 [OK]
>     13 chdir_blah = -1 ENOENT                                        [OK]
>     14 chmod_net = -1 EPERM                                         [FAIL]
>     15 chmod_self = -1 EPERM                                         [OK]
>     16 chmod_tmpdir = 0                                              [OK]
>     17 chown_self = -1 EPERM                                         [OK]
> 
> So, If this test result is enough for this patch, here is my:
> 
> Tested-by: Zhangjin Wu <falcon@tinylab.org>

Now queued, thanks!
Willy
