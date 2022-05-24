Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D9CC433F5
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 May 2022 11:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236505AbiEXLPp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 24 May 2022 07:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbiEXLPh (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 24 May 2022 07:15:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F236FA0D;
        Tue, 24 May 2022 04:15:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7X3Nb6z4ySs;
        Tue, 24 May 2022 21:15:36 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Shuah Khan <shuah@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kselftest@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220319232025.22067-1-colin.i.king@gmail.com>
References: <20220319232025.22067-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] selftests/powerpc/pmu: fix spelling mistake "mis-match" -> "mismatch"
Message-Id: <165339059358.1718562.6902647637823996518.b4-ty@ellerman.id.au>
Date:   Tue, 24 May 2022 21:09:53 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, 19 Mar 2022 23:20:25 +0000, Colin Ian King wrote:
> There are a few spelling mistakes in error messages. Fix them.
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc/pmu: fix spelling mistake "mis-match" -> "mismatch"
      https://git.kernel.org/powerpc/c/7801cb1dc60f7348687ca1c3aa03a944687563f0

cheers
