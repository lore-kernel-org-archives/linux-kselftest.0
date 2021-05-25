Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09372C47084
	for <linux-kselftest@archiver.kernel.org>; Tue, 25 May 2021 18:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E23656142E
	for <linux-kselftest@archiver.kernel.org>; Tue, 25 May 2021 18:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhEYTAe (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 25 May 2021 15:00:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:44758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232514AbhEYTAd (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 25 May 2021 15:00:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FB9A6141C;
        Tue, 25 May 2021 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621969143;
        bh=FZNptaY7xiEZKO49WEV99lceRuOLCdvZZa9t+rkIons=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B6uy8cxfUAW37hJZzQ+kYd6hLTACxxJVQArk3lU/AXpFUaNZZA3A3Kf7x0g5u6JdU
         4cONhb0bOuqUFy7QdHPUxRqQaY2Zl5sKx7B3tGxZhbIYQ87L3EvBu3Ww54y10thfBh
         ZpFIrBriNOPFDFVomYv2SeVf5YRTej1BhjAuByd4/DhYkmGtXz1ctDn7ktWDw2t3/H
         WNopvPeq3TxlDX1RW2yQM1KrAYvBIQB9VQBChZB+uQR2kiXyxfGqwTjTX1DIN+lBi5
         Sea41IJW6BTLgZsnMsaa1omiUbY+4glSOgcJFhWxj19KtQwOrJmaMtUAhQJdn3wu4G
         KeunLDggPgdrw==
From:   Will Deacon <will@kernel.org>
To:     Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] kselftest/arm64: Add missing newline to SVE test skipping output
Date:   Tue, 25 May 2021 19:58:45 +0100
Message-Id: <162196676956.2317463.5967816438955234712.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518163331.38268-1-broonie@kernel.org>
References: <20210518163331.38268-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 18 May 2021 17:33:31 +0100, Mark Brown wrote:
> The newline is expected to come from the caller but got missed for this
> test.

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Add missing newline to SVE test skipping output
      https://git.kernel.org/arm64/c/63ebdb77afa9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
