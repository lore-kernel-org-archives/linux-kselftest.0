Return-Path: <SRS0=cfcg=DQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A02C43457
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1AA821D6C
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732686AbgJIMCb (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:02:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56987 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732646AbgJIMCa (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Oct 2020 08:02:30 -0400
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kQr6T-0007yp-4p; Fri, 09 Oct 2020 12:02:29 +0000
Date:   Fri, 9 Oct 2020 14:02:28 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Tommi Rantala <tommi.t.rantala@nokia.com>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>
Subject: Re: [PATCH 04/13] selftests/harness: prettify SKIP message
 whitespace again
Message-ID: <20201009120228.obldfel5pyfqg7xr@wittgenstein>
References: <20201008122633.687877-1-tommi.t.rantala@nokia.com>
 <20201008122633.687877-5-tommi.t.rantala@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008122633.687877-5-tommi.t.rantala@nokia.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Oct 08, 2020 at 03:26:24PM +0300, Tommi Rantala wrote:
> Commit 9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")
> replaced XFAIL with SKIP in the output. Add one more space to make the
> output aligned and pretty again.
> 
> Fixes: 9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")
> Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
> ---

Thanks!
Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>
