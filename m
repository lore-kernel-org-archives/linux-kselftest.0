Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90829C433E9
	for <linux-kselftest@archiver.kernel.org>; Wed,  3 Feb 2021 11:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5293064F77
	for <linux-kselftest@archiver.kernel.org>; Wed,  3 Feb 2021 11:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhBCLlp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbhBCLlh (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 3 Feb 2021 06:41:37 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ABEC061573;
        Wed,  3 Feb 2021 03:40:53 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4DW09t1PcCz9tlX; Wed,  3 Feb 2021 22:40:49 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     oohall@gmail.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
        shuah@kernel.org, paulus@samba.org
In-Reply-To: <20201228043459.14281-1-po-hsu.lin@canonical.com>
References: <20201228043459.14281-1-po-hsu.lin@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: make the test check in eeh-basic.sh posix compliant
Message-Id: <161235199965.1516112.16797710998425289109.b4-ty@ellerman.id.au>
Date:   Wed,  3 Feb 2021 22:40:49 +1100 (AEDT)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 28 Dec 2020 12:34:59 +0800, Po-Hsu Lin wrote:
> The == operand is a bash extension, thus this will fail on Ubuntu with
> 
> As the /bin/sh on Ubuntu is pointed to DASH.
> 
> Use -eq to fix this posix compatibility issue.

Applied to powerpc/next.

[1/1] selftests/powerpc: Make the test check in eeh-basic.sh posix compliant
      https://git.kernel.org/powerpc/c/3db380570af7052620ace20c29e244938610ca71

cheers
