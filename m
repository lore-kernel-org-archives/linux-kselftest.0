Return-Path: <SRS0=cfcg=DQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91503C433E7
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55AE922284
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388335AbgJIMG2 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:06:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57138 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730726AbgJIMG1 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Oct 2020 08:06:27 -0400
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kQrAI-0008IL-4z; Fri, 09 Oct 2020 12:06:26 +0000
Date:   Fri, 9 Oct 2020 14:06:25 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Tommi Rantala <tommi.t.rantala@nokia.com>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 01/13] selftests: filter kselftest headers from command
 in lib.mk
Message-ID: <20201009120625.yh7peipfjpj2c6sv@wittgenstein>
References: <20201008122633.687877-1-tommi.t.rantala@nokia.com>
 <20201008122633.687877-2-tommi.t.rantala@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201008122633.687877-2-tommi.t.rantala@nokia.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Oct 08, 2020 at 03:26:21PM +0300, Tommi Rantala wrote:
> Commit 1056d3d2c97e ("selftests: enforce local header dependency in
> lib.mk") added header dependency to the rule, but as the rule uses $^,
> the headers are added to the compiler command line.
> 
> This can cause unexpected precompiled header files being generated when
> compilation fails:
> 
>   $ echo { >> openat2_test.c
> 
>   $ make
>   gcc -Wall -O2 -g -fsanitize=address -fsanitize=undefined  openat2_test.c
>     tools/testing/selftests/kselftest_harness.h tools/testing/selftests/kselftest.h helpers.c
>     -o tools/testing/selftests/openat2/openat2_test
>   openat2_test.c:313:1: error: expected identifier or ‘(’ before ‘{’ token
>     313 | {
>         | ^
>   make: *** [../lib.mk:140: tools/testing/selftests/openat2/openat2_test] Error 1
> 
>   $ file openat2_test*
>   openat2_test:   GCC precompiled header (version 014) for C
>   openat2_test.c: C source, ASCII text
> 
> Fix it by filtering out the headers, so that we'll only pass the actual
> *.c files in the compiler command line.
> 
> Fixes: 1056d3d2c97e ("selftests: enforce local header dependency in lib.mk")
> Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
> ---

Thanks!
Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>
