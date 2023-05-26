Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20284C7EE23
	for <linux-kselftest@archiver.kernel.org>; Fri, 26 May 2023 07:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbjEZHAJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 26 May 2023 03:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjEZHAH (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 26 May 2023 03:00:07 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCA695;
        Fri, 26 May 2023 00:00:05 -0700 (PDT)
Date:   Fri, 26 May 2023 09:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1685084403; bh=e/0EPN0JCH/tcPW+VvvkOIq7ybBdSQzI1QOslmxOOag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AWSx7SOU6H4PLSzMqjhNuDM2e3rNCz6zAQcp4W07o1NQ9f3RMvfMr2XGW2uVd82lF
         YHjkhNLQyiMWH/yVUdLjtoM1EruYqjrTwi2kdt8cPfs5k09Lyvyevyyc4DS5LOyLJq
         rXjWMOO25mja6MJXnk2zvzyeknaZYAfmI7q0I5Q8=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> riscv qemu has a builtin bios (opensbi), but it may not match the latest
> kernel and some old versions may hang during boot, let's allow user pass
> a newer version to qemu via the -bios option.

Nitpick:

This seems very specific and hopefully only necessary temporarily.

Instead it could be changed to some generic mechanim like
"QEMU_ARGS_EXTRA"?

> we can use it like this:
> 
>     $ make run BIOS=/path/to/new-bios ...
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> index 9adc8944dd80..9213763ab3b6 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -70,7 +70,8 @@ QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
>  QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> -QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
> +QEMU_ARGS_BIOS       = $(if $(BIOS),-bios $(BIOS))
> +QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_BIOS)
>  
>  # OUTPUT is only set when run from the main makefile, otherwise
>  # it defaults to this nolibc directory.
> -- 
> 2.25.1
> 
