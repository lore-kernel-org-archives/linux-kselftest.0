Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C33EB64DA
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Jun 2023 08:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbjF3Icw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Jun 2023 04:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbjF3Ict (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Jun 2023 04:32:49 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566F21FD8;
        Fri, 30 Jun 2023 01:32:48 -0700 (PDT)
Date:   Fri, 30 Jun 2023 10:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1688113966; bh=BkiwGuJMVKtfu7Ksbjowv+/DuKYlRrT7rCpnnxYVSmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfzpAQo4qj8b/f5EBhZEtav3Mirn7HJzxYXCgEyd4w5YS4zuPIbqwqW8PagkMbaNf
         vUjUdFerUmCJ2V4fkuyIpc8d7apOKEGfj7J0E7C2TXjcVhSbJ8iv412dexeY1TB29P
         O6y5LO+v59di0tI21s0jN6aFx8Jdv/oR41luVEEE=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 11/15] selftests/nolibc: prepare /tmp for tmpfs or
 ramfs
Message-ID: <457759dc-cd95-4474-a184-242bdb028445@t-8ch.de>
References: <cover.1688078604.git.falcon@tinylab.org>
 <9dc032064dde254a03e2111da1e58344deca6522.1688078605.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc032064dde254a03e2111da1e58344deca6522.1688078605.git.falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2023-06-30 07:52:03+0800, Zhangjin Wu wrote:
> Let's create a /tmp directory and mount tmpfs there, if tmpfs is not
> mountable, use ramfs as tmpfs.
> 
> tmpfs will be used instead of procfs for some tests.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index c0f5302ada5d..8e3e2792f5e3 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1054,6 +1054,10 @@ int prepare(void)
>  		}
>  	}
>  
> +	/* try to mount /tmp if not mounted, if not mountable, use ramfs as tmpfs */
> +	if (stat("/tmp/.", &stat_buf) == 0 || mkdir("/tmp", 0755) == 0)
> +		mount("none", "/tmp", "tmpfs", 0, 0);
> +

mkdir()
mount()

without any error checking should do the same and be easier to read.

>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 
