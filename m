Return-Path: <SRS0=cfcg=DQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01865C433E7
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B22A422276
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 12:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbgJIMFA (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:05:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57080 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732585AbgJIME7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Oct 2020 08:04:59 -0400
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kQr8s-00089q-Bj; Fri, 09 Oct 2020 12:04:58 +0000
Date:   Fri, 9 Oct 2020 14:04:57 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Tommi Rantala <tommi.t.rantala@nokia.com>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 08/13] selftests: pidfd: drop needless linux/kcmp.h
 inclusion in pidfd_setns_test.c
Message-ID: <20201009120457.wlkneubeotyxibjt@wittgenstein>
References: <20201008122633.687877-1-tommi.t.rantala@nokia.com>
 <20201008122633.687877-9-tommi.t.rantala@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008122633.687877-9-tommi.t.rantala@nokia.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Oct 08, 2020 at 03:26:28PM +0300, Tommi Rantala wrote:
> kcmp is not used in pidfd_setns_test.c, so do not include <linux/kcmp.h>
> 
> Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
