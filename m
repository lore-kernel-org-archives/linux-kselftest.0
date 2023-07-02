Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A823EB64DD
	for <linux-kselftest@archiver.kernel.org>; Sun,  2 Jul 2023 19:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjGBTdW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 2 Jul 2023 15:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjGBTdV (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 2 Jul 2023 15:33:21 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F3D8A6;
        Sun,  2 Jul 2023 12:33:19 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 362JX6cW017544;
        Sun, 2 Jul 2023 21:33:06 +0200
Date:   Sun, 2 Jul 2023 21:33:06 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Message-ID: <20230702193306.GK16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <90179484b62c0bafb0fad9b03680136bd6fedee3.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90179484b62c0bafb0fad9b03680136bd6fedee3.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Zhangjin,

On Wed, Jun 28, 2023 at 09:51:57PM +0800, Zhangjin Wu wrote:
> Three mmap/munmap related test cases are added:
> 
> - mmap_bad: the length argument must be greater than 0, otherwise, fail
>   with -EINVAL.
> 
> - munmap_bad: invalid (void *)-1 address fail with -EINVAL.
> 
> - mmap_munmap_good: mmap() a file with good offset and then munmap().
> 
> Note, it is not easy to find a unique file for mmap() in different
> scenes, so, a file list is used to search the right one:
> 
> - /proc/1/exe, for 'run' and 'run-user' target
>   'run-user' can not find '/proc/self/exe'
> 
> - /proc/self/exe, for 'libc-test' target
>   normal program 'libc-test' has no permission to access '/proc/1/exe'

Strictly speaking, if your executable is not readable (e.g. chmod 111
due to a restrictive umask) it will also fail that one.

> - the others, for kernel without procfs
>   let it pass even with 'worst case' kernel configs

You should include /dev/zero, which is commonly used to allocate anonymous
memory and is more likely present and readable than any of the other files.
And another file of choice is obviously argv[0] ;-)  In this case you don't
need any of the other extra ones. Thus I could suggest that you try in this
order:

    /dev/zero, /proc/self/exe, /proc/1/exe, argv[0]

and be done with it. That doesn't prevent one from extending the list if
really needed later, but I doubt it would be needed. Also, it's already
arranged in a read-write, then read-only fallbacks mode, so if we later
need to add more complex tests involving writes, the writable /dev/zero
will have precedence.

Willy
