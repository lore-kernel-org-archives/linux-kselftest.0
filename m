Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EB8EB64DA
	for <linux-kselftest@archiver.kernel.org>; Sat, 22 Jul 2023 12:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjGVMK1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 22 Jul 2023 08:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGVMK1 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 22 Jul 2023 08:10:27 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59FF09B;
        Sat, 22 Jul 2023 05:10:26 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 36MCAJDO017335;
        Sat, 22 Jul 2023 14:10:19 +0200
Date:   Sat, 22 Jul 2023 14:10:19 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 8/8] selftests/nolibc: add test support for powerpc64
Message-ID: <20230722121019.GD17311@1wt.eu>
References: <cover.1689713175.git.falcon@tinylab.org>
 <dc634a44cf1a132d607e2c83874cda6cd6d6283f.1689713175.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc634a44cf1a132d607e2c83874cda6cd6d6283f.1689713175.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 19, 2023 at 05:18:32AM +0800, Zhangjin Wu wrote:
>  # ARCH is supported by kernel
> +ARCH_powerpc64   = powerpc
>  ARCH_powerpc64le = powerpc

And similarly let's simply call this one ppc64.

Aside these few comments, the series looks nice, thanks!
Willy
