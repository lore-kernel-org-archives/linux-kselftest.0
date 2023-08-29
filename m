Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A05C83F16
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Aug 2023 06:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjH2G3B (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 29 Aug 2023 02:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbjH2G2x (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 29 Aug 2023 02:28:53 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 224F8CC1;
        Mon, 28 Aug 2023 23:28:43 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 37T6SRYx011672;
        Tue, 29 Aug 2023 08:28:27 +0200
Date:   Tue, 29 Aug 2023 08:28:27 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, Zhangjin Wu <falcon@tinylab.org>,
        Yuan Tan <tanyuan@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: add stdarg.h header
Message-ID: <ZO2QC/fw6LKdtLSb@1wt.eu>
References: <20230827-nolibc-nostdinc-v1-0-995d1811f1f3@weissschuh.net>
 <20230827-nolibc-nostdinc-v1-1-995d1811f1f3@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230827-nolibc-nostdinc-v1-1-995d1811f1f3@weissschuh.net>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Thomas,

On Sun, Aug 27, 2023 at 10:00:15AM +0200, Thomas Weißschuh wrote:
> This allows nolic to work with `-nostdinc` avoiding any reliance on
> system headers.
> 
> The implementation has been lifted from musl libc 1.2.4.
> There is already an implementation of stdarg.h in include/linux/stdarg.h
> but that is GPL licensed and therefore not suitable for nolibc.

I'm a bit confused because for me, stdarg was normally provided by the
compiler, but I could be mistaken. It's just that it reminds me not so
old memories. Therefore maybe we just need to include or define
"something" to use it.

> +#ifndef _NOLIBC_STDARG_H
> +#define _NOLIBC_STDARG_H
> +
> +typedef __builtin_va_list va_list;
> +#define va_start(v, l)   __builtin_va_start(v, l)
> +#define va_end(v)        __builtin_va_end(v)
> +#define va_arg(v, l)     __builtin_va_arg(v, l)
> +#define va_copy(d, s)    __builtin_va_copy(d, s)
> +
> +#endif /* _NOLIBC_STDARG_H */

Also, regarding the doubt above, I really think these should be guarded
(maybe just use va_start as a hint), because the risk that they come
from libc headers or maybe from the compiler via another include path
is non-negligible.

Just my two cents,
Willy
