Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E84C433E9
	for <linux-kselftest@archiver.kernel.org>; Wed, 20 Jan 2021 14:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D17323340
	for <linux-kselftest@archiver.kernel.org>; Wed, 20 Jan 2021 14:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731820AbhATOIF (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:08:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:51044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389210AbhATNBy (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 20 Jan 2021 08:01:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 346032333C;
        Wed, 20 Jan 2021 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611147674;
        bh=iPzJas6CEHVTW89tvQgwFKIevysDk5CYhLYzAK8K2RQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N9GUizuIdf5qJDe7PgWcQIsg40C6BYgw6bx5X1earyrgVZHY1dYkonz0BvlybdKDX
         zAmN0uWnFvKYncN3mq4tWj6LE5ULSTDAt0aRDcWdYwUpNjpWQGHHELupfuiV6CmfE5
         PkUnM3CLuILKoLF4yFtM2rrgLtgFoQZnoHL0mOwwmtOJMCgphtFcFNTEA3YS0TRQe/
         R5QAm2sJMFNq3z40c2zOP77JbewA3rdC2fco9KyXIIpJg3s54dRn9KiOFuDpTCLE0r
         u0g/NdBOtuZ5VN63n8/HI6tb28m1lU3b3AIbOzQd1vbwl2J3lvV5y1AEOe6R0kUwdW
         BqcnUDQ5gFttg==
From:   Will Deacon <will@kernel.org>
To:     YANG LI <abaci-bugfix@linux.alibaba.com>, catalin.marinas@arm.com
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        amit.kachhap@arm.com, vincenzo.frascino@arm.com,
        gabor.kertesz@arm.com, linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mte: style: Simplify bool comparison
Date:   Wed, 20 Jan 2021 13:01:01 +0000
Message-Id: <161114666644.220494.13652314287492461044.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1610357737-68678-1-git-send-email-abaci-bugfix@linux.alibaba.com>
References: <1610357737-68678-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 11 Jan 2021 17:35:37 +0800, YANG LI wrote:
> Fix the following coccicheck warning:
> ./tools/testing/selftests/arm64/mte/check_buffer_fill.c:84:12-35:
> WARNING: Comparison to bool

Applied to arm64 (for-next/selftests), thanks!

[1/1] arm64: mte: style: Simplify bool comparison
      https://git.kernel.org/arm64/c/dd313a2653d4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
