Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC52EB64DC
	for <linux-kselftest@archiver.kernel.org>; Sun,  9 Jul 2023 09:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjGIJic (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 9 Jul 2023 05:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjGIJib (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 9 Jul 2023 05:38:31 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC40D131;
        Sun,  9 Jul 2023 02:38:29 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 3699cLu5020669;
        Sun, 9 Jul 2023 11:38:21 +0200
Date:   Sun, 9 Jul 2023 11:38:21 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, thomas@t-8ch.de,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v4 13/18] selftests/nolibc: prepare /tmp for tmpfs or
 ramfs
Message-ID: <20230709093821.GH9321@1wt.eu>
References: <cover.1688750763.git.falcon@tinylab.org>
 <ef82268ef4a9ae263a17cd1a3533842271c5520c.1688750763.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef82268ef4a9ae263a17cd1a3533842271c5520c.1688750763.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Zhangjin,

On Sat, Jul 08, 2023 at 02:38:57AM +0800, Zhangjin Wu wrote:
> create a /tmp directory and mount tmpfs there, if tmpfs is not
> mountable, use ramfs as tmpfs.
> 
> tmpfs will be used instead of procfs for some tests.

Just curious, in which cases do you need this ? We're building an
initramfs for the root that's already read-write, so without mounting
anything you already have write access. I'm taking it anyway for now,
but if you figure it's not needed we can later drop it (or just drop
the mount part and keep mkdir).

Willy
