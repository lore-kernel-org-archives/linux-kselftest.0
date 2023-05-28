Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCBAC77B7C
	for <linux-kselftest@archiver.kernel.org>; Sun, 28 May 2023 07:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjE1Hhi (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 28 May 2023 03:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjE1Hhh (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 28 May 2023 03:37:37 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 15B6CB4;
        Sun, 28 May 2023 00:37:35 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 34S7bVDk001971;
        Sun, 28 May 2023 09:37:31 +0200
Date:   Sun, 28 May 2023 09:37:31 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: support nanoseconds in stat()
Message-ID: <20230528073730.GB1956@1wt.eu>
References: <20230527-nolibc-stat-nanoseconds-v1-1-3f7825caae68@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230527-nolibc-stat-nanoseconds-v1-1-3f7825caae68@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, May 27, 2023 at 02:56:42PM +0200, Thomas Weißschuh wrote:
> Keep backwards compatibility through unions.
> 
> The compatibility macros like
> 
>  #define st_atime st_atim.tv_sec
> 
> as documented in stat(3type) don't work for nolibc because it would
> break with other stat-like structures that contain the field st_atime.

Ah, good idea, I like this approach. Generally speaking I hate defining
macros to access some struct members, even though it has been done for
decades in various places of standard libs. Your solution making use of
anonymous unions is an elegant alternative to this.

Thanks!
Willy
