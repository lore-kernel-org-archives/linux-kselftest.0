Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A72C001B3
	for <linux-kselftest@archiver.kernel.org>; Fri, 23 Jun 2023 17:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjFWRiE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 23 Jun 2023 13:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjFWRiD (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 23 Jun 2023 13:38:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A5111C;
        Fri, 23 Jun 2023 10:38:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F3BCC61AE0;
        Fri, 23 Jun 2023 17:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07496C433C8;
        Fri, 23 Jun 2023 17:37:59 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64/signal: Fix handling of TPIDR2
Date:   Fri, 23 Jun 2023 18:37:57 +0100
Message-Id: <168754187083.1360699.7483241058537441721.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621-arm64-fix-tpidr2-signal-restore-v2-0-c8e8fcc10302@kernel.org>
References: <20230621-arm64-fix-tpidr2-signal-restore-v2-0-c8e8fcc10302@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 22 Jun 2023 14:39:44 +0100, Mark Brown wrote:
> The restoring of TPIDR2 signal context has been broken since it was
> merged, fix this and add a test case covering it.  This is a result of
> TPIDR2 context management following a different flow to any of the other
> state that we provide and the fact that we don't expose TPIDR (which
> follows the same pattern) to signals.
> 
> 
> [...]

Applied to arm64 (for-next/tpidr2-fix), thanks!

[1/2] arm64/signal: Restore TPIDR2 register rather than memory state
      https://git.kernel.org/arm64/c/616cb2f4b141
[2/2] kselftest/arm64: Add a test case for TPIDR2 restore
      https://git.kernel.org/arm64/c/f7a5d72edc52

-- 
Catalin

