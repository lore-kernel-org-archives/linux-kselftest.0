Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07AACD98E6
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 Oct 2023 03:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345050AbjJKDZS (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 10 Oct 2023 23:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345040AbjJKDZQ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 10 Oct 2023 23:25:16 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EFD191;
        Tue, 10 Oct 2023 20:25:13 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 39B3OvDC007909;
        Wed, 11 Oct 2023 05:24:57 +0200
Date:   Wed, 11 Oct 2023 05:24:57 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH] selftests/nolibc: use qemu-system-ppc64 for ppc64le
Message-ID: <20231011032457.GE7515@1wt.eu>
References: <20231008-nolibc-qemu-ppc64-v1-1-29e2326e0420@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231008-nolibc-qemu-ppc64-v1-1-29e2326e0420@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Thomas,

On Sun, Oct 08, 2023 at 02:34:01PM +0200, Thomas Weiﬂschuh wrote:
> qemu-system-ppc64 can handle both big and little endian kernels.
> 
> While some setups, like Debian, provide a symlink to execute
> qemu-system-ppc64 as qemu-system-ppc64le, others, like ArchLinux, do not.
> 
> So always use qemu-system-ppc64 directly.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Sorry, I missed this one. Of course: Acked-by: Willy Tarreau <w@1wt.eu>

Thanks,
Willy
