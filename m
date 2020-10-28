Return-Path: <SRS0=j5jC=ED=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884B4C388F7
	for <linux-kselftest@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E07424844
	for <linux-kselftest@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="iV105EOd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgJ1Vdv (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:33:51 -0400
Received: from ozlabs.org ([203.11.71.1]:35771 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgJ1Vdu (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLWRH6t3Pz9sV0;
        Wed, 28 Oct 2020 12:37:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1603849068;
        bh=+W6nq8uvUbUREN7URCqzQyk/EDs/OsmwWsBEOh+PVKk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=iV105EOdW0+SRWXofz9e0x6vPnzNx0dwjIN+27SWDnNkceBa6Kn62O07FGMp9zLXJ
         q8RTB2E0/k4v5VpekcutfqTPiII5H81wZTMGbxtzFjKuEfnW1oZqaGwq0yj+utbFf5
         KdK2K31BH8yg2j8LaMKne1oNYOCGFHpdrGfFRJPvqN6BDsjeaT6ZhB5ysy9CZiFK9N
         ySgvFeBL5XY78lQXL5M0QqZzENmW88l2O/3j78i9M2ZR1HNF9hO1Kg55BVuodGmMYh
         HWAbTskfVkvhq1wXlv/Yr7CsOLFWAhenV35f8j7ivN7NrqAV9JlZSpRYUOypZDBmBH
         09S0E9ZVWb/ZQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Tommi Rantala <tommi.t.rantala@nokia.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>
Cc:     Tommi Rantala <tommi.t.rantala@nokia.com>,
        Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 00/13] selftests fixes
In-Reply-To: <20201008122633.687877-1-tommi.t.rantala@nokia.com>
References: <20201008122633.687877-1-tommi.t.rantala@nokia.com>
Date:   Wed, 28 Oct 2020 12:37:44 +1100
Message-ID: <87tuufw2on.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Tommi Rantala <tommi.t.rantala@nokia.com> writes:
> Hi, small fixes to issues I hit with selftests.
>
> Tommi Rantala (13):
>   selftests: filter kselftest headers from command in lib.mk
>   selftests: pidfd: fix compilation errors due to wait.h
>   selftests: add vmaccess to .gitignore
>   selftests/harness: prettify SKIP message whitespace again
>   selftests: pidfd: use ksft_test_result_skip() when skipping test
>   selftests: pidfd: skip test on kcmp() ENOSYS
>   selftests: pidfd: add CONFIG_CHECKPOINT_RESTORE=y to config
>   selftests: pidfd: drop needless linux/kcmp.h inclusion in
>     pidfd_setns_test.c
>   selftests: android: fix multiple definition of sock_name
>   selftests: proc: fix warning: _GNU_SOURCE redefined
>   selftests: core: use SKIP instead of XFAIL in close_range_test.c
>   selftests: clone3: use SKIP instead of XFAIL
>   selftests: binderfs: use SKIP instead of XFAIL

This series doesn't seem to have been picked up?

cheers
