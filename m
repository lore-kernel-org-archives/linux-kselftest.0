Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB40C433B4
	for <linux-kselftest@archiver.kernel.org>; Wed, 21 Apr 2021 13:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B170B61440
	for <linux-kselftest@archiver.kernel.org>; Wed, 21 Apr 2021 13:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239718AbhDUNKa (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 21 Apr 2021 09:10:30 -0400
Received: from ozlabs.org ([203.11.71.1]:56825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242016AbhDUNJo (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 21 Apr 2021 09:09:44 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4FQLVG0bD4z9vFD; Wed, 21 Apr 2021 23:09:09 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Shuah Khan <shuah@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andrei Vagin <avagin@gmail.com>,
        Dmitry Safonov <dima@arista.com>
Cc:     linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <469f37ab91984309eb68c0fb47e8438cdf5b6463.1617198956.git.christophe.leroy@csgroup.eu>
References: <469f37ab91984309eb68c0fb47e8438cdf5b6463.1617198956.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] selftests: timens: Fix gettime_perf to work on powerpc
Message-Id: <161901050320.1961279.8916640678733082942.b4-ty@ellerman.id.au>
Date:   Wed, 21 Apr 2021 23:08:23 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 31 Mar 2021 13:59:17 +0000 (UTC), Christophe Leroy wrote:
> On powerpc:
> - VDSO library is named linux-vdso32.so.1 or linux-vdso64.so.1
> - clock_gettime is named __kernel_clock_gettime()
> 
> Ensure gettime_perf tries these names before giving up.

Applied to powerpc/next.

[1/1] selftests: timens: Fix gettime_perf to work on powerpc
      https://git.kernel.org/powerpc/c/f56607e85ee38f2a5bb7096e24e2d40f35d714f9

cheers
