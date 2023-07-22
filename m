Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE62EB64DA
	for <linux-kselftest@archiver.kernel.org>; Sat, 22 Jul 2023 12:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjGVMgl (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 22 Jul 2023 08:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGVMgk (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 22 Jul 2023 08:36:40 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62D6FE74;
        Sat, 22 Jul 2023 05:36:39 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 36MCaWgd017423;
        Sat, 22 Jul 2023 14:36:32 +0200
Date:   Sat, 22 Jul 2023 14:36:32 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 06/14] selftests/nolibc: add mrproper for development
Message-ID: <20230722123632.GH17311@1wt.eu>
References: <cover.1689759351.git.falcon@tinylab.org>
 <30b7328645ad7baec6e63daaf069dd97d5456269.1689759351.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30b7328645ad7baec6e63daaf069dd97d5456269.1689759351.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 19, 2023 at 09:23:48PM +0800, Zhangjin Wu wrote:
> +mrproper:
> +	$(Q)$(MAKE_KERNEL) mrproper
> +

Same as previous one, I'm not convinced about the benefit at all.
As a user I would expect that it cleans everything in the build
directory while in fact it seems it will only apply to the kernel.

Willy
