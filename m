Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BA3C4332F
	for <linux-kselftest@archiver.kernel.org>; Sun,  5 Nov 2023 10:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjKEKiG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 5 Nov 2023 05:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKEKiG (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 5 Nov 2023 05:38:06 -0500
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4EA28EB;
        Sun,  5 Nov 2023 02:38:03 -0800 (PST)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 3A5AbrO4002752;
        Sun, 5 Nov 2023 11:37:53 +0100
Date:   Sun, 5 Nov 2023 11:37:53 +0100
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, Zhangjin Wu <falcon@tinylab.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/6] tools/nolibc: MIPS bugfixes and refactoring
Message-ID: <ZUdwgch90saH7xVQ@1wt.eu>
References: <20231105-nolibc-mips-be-v1-0-6c2ad3e50a1f@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231105-nolibc-mips-be-v1-0-6c2ad3e50a1f@weissschuh.net>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Thomas,

On Sun, Nov 05, 2023 at 11:09:54AM +0100, Thomas Weiﬂschuh wrote:
> Two bugfixes and some minor refactorings of the MIPS support.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

besides the small comments about o32 and olddefconfig, consider this
series as:

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
