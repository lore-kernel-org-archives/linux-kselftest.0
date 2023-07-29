Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EA2C001DC
	for <linux-kselftest@archiver.kernel.org>; Sat, 29 Jul 2023 06:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235939AbjG2G2P (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 29 Jul 2023 02:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjG2G2O (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 29 Jul 2023 02:28:14 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383F746B9;
        Fri, 28 Jul 2023 23:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1690612090; bh=sWBcNalLZmmlyvZxEpLjLttGZmhdBmkqaHEFAhhU2uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RN49eR8X4XFoRNEO8vMmllStiL+TfqE/aFbq+esLOdgCQcYrfMwubKA4Kd44X4lUb
         8mxigBy/HN10IK8UzdlNjLlzawnTpKIWFNIR0cqqZ12zZwOBB1Fas4ftNxwCTee2cc
         NsgTDBdaNCA4PueNUwf2YJVxqWVpr05PZTZS1PO8=
Date:   Sat, 29 Jul 2023 08:28:09 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 01/12] selftests/nolibc: allow report with existing
 test log
Message-ID: <aa604c61-281d-42b0-85dd-d7a08cdaee6d@t-8ch.de>
References: <cover.1690489039.git.falcon@tinylab.org>
 <50b239f40ddbf4bd3e067c39330f99bf63c71147.1690489039.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b239f40ddbf4bd3e067c39330f99bf63c71147.1690489039.git.falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2023-07-28 04:22:42+0800, Zhangjin Wu wrote:
> After the tests finish, it is valuable to report and summarize with
> existing test log.
> 
> This avoid rerun or run the tests again when not necessary.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> index 2e9694370913..75419b695f0d 100644
> --- a/tools/testing/selftests/nolibc/Makefile
> +++ b/tools/testing/selftests/nolibc/Makefile
> @@ -207,6 +207,10 @@ rerun:
>  	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
>  	$(Q)$(REPORT) $(CURDIR)/run.out
>  
> +# report with existing test log
> +report:
> +	$(Q)$(REPORT_RUN_OUT)

Isn't REPORT_RUN_OUT gone in this revision?

> +
>  clean:
>  	$(call QUIET_CLEAN, sysroot)
>  	$(Q)rm -rf sysroot
> -- 
> 2.25.1
> 
