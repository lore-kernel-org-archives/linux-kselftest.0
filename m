Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4709EB64DA
	for <linux-kselftest@archiver.kernel.org>; Sat, 22 Jul 2023 12:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGVMDy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 22 Jul 2023 08:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGVMDx (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 22 Jul 2023 08:03:53 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F2AC49B;
        Sat, 22 Jul 2023 05:03:52 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 36MC3k1d017321;
        Sat, 22 Jul 2023 14:03:46 +0200
Date:   Sat, 22 Jul 2023 14:03:46 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 5/8] selftests/nolibc: add XARCH and ARCH mapping
 support
Message-ID: <20230722120345.GB17311@1wt.eu>
References: <cover.1689713175.git.falcon@tinylab.org>
 <90c1d88dabf73e100dc840965fbdfe3ad5dc550f.1689713175.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c1d88dabf73e100dc840965fbdfe3ad5dc550f.1689713175.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 19, 2023 at 05:15:13AM +0800, Zhangjin Wu wrote:
> -	@echo "  run-user     runs the executable under QEMU (uses \$$ARCH, \$$TEST)"
> +	@echo "  run-user     runs the executable under QEMU (uses \$$XARCH, \$$TEST)"

Most users will neither care about nor need XARCH and will wonder what to
put there. Since there's a fallback on ARCH, better indicate something
like:

    (uses $XARCH or $ARCH, and $TEST)

Willy
