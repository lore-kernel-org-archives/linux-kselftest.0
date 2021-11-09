Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825CFC433EF
	for <linux-kselftest@archiver.kernel.org>; Tue,  9 Nov 2021 15:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CEBF61057
	for <linux-kselftest@archiver.kernel.org>; Tue,  9 Nov 2021 15:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbhKIPFE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 9 Nov 2021 10:05:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236189AbhKIPFD (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 9 Nov 2021 10:05:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48CF861052;
        Tue,  9 Nov 2021 15:02:13 +0000 (UTC)
Date:   Tue, 9 Nov 2021 16:02:08 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     shuah@kernel.org, christian@brauner.io, nathan@kernel.org,
        ndesaulniers@google.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] selftests: cgroup: use function 'labs()' over 'abs()'
Message-ID: <20211109150208.rzzvteprq2tp5biq@wittgenstein>
References: <20211105162530.3307666-1-anders.roxell@linaro.org>
 <20211105162530.3307666-2-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211105162530.3307666-2-anders.roxell@linaro.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Nov 05, 2021 at 05:25:30PM +0100, Anders Roxell wrote:
> When building selftests/cgroup with clang, the compiler warn about the
> function abs() see below:
> 
> In file included from test_memcontrol.c:21:
> ./cgroup_util.h:16:9: warning: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Wabsolute-value]
>         return abs(a - b) <= (a + b) / 100 * err;
>                ^
> ./cgroup_util.h:16:9: note: use function 'labs' instead
>         return abs(a - b) <= (a + b) / 100 * err;
>                ^~~
>                labs
> 
> The note indicates what to do, Rework to use the function 'labs()'.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
