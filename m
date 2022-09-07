Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B074C54EE9
	for <linux-kselftest@archiver.kernel.org>; Wed,  7 Sep 2022 17:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIGR5M (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 7 Sep 2022 13:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiIGR5L (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 7 Sep 2022 13:57:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CCD82876
        for <linux-kselftest@vger.kernel.org>; Wed,  7 Sep 2022 10:57:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E04561A00
        for <linux-kselftest@vger.kernel.org>; Wed,  7 Sep 2022 17:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD47C433C1;
        Wed,  7 Sep 2022 17:57:08 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Install signal handlers before output in FP stress tests
Date:   Wed,  7 Sep 2022 18:57:06 +0100
Message-Id: <166257342260.3993131.13953055856084545276.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906220056.820295-1-broonie@kernel.org>
References: <20220906220056.820295-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 6 Sep 2022 23:00:56 +0100, Mark Brown wrote:
> To interface more robustly with other processes install the signal handers
> in the floating point stress tests before we produce any output, this
> means that a parent process can know that if it has seen any output from
> the test then the test is ready to handle incoming signals.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Install signal handlers before output in FP stress tests
      https://git.kernel.org/arm64/c/d47d8a5e21fc

-- 
Catalin

