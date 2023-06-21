Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BE2EB64D7
	for <linux-kselftest@archiver.kernel.org>; Wed, 21 Jun 2023 15:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjFUPt7 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 21 Jun 2023 11:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbjFUPtq (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 21 Jun 2023 11:49:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA30C2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jun 2023 08:49:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C96846159A
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jun 2023 15:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19166C433C0;
        Wed, 21 Jun 2023 15:49:42 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Log signal code and address for unexpected signals
Date:   Wed, 21 Jun 2023 16:49:40 +0100
Message-Id: <168736257270.605349.12234296795942715476.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620-arm64-selftest-log-wrong-signal-v1-1-3fe29bdaaf38@kernel.org>
References: <20230620-arm64-selftest-log-wrong-signal-v1-1-3fe29bdaaf38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 21 Jun 2023 02:36:06 +0100, Mark Brown wrote:
> If we get an unexpected signal during a signal test log a bit more data to
> aid diagnostics.
> 
> 

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Log signal code and address for unexpected signals
      https://git.kernel.org/arm64/c/833b0f07b915

-- 
Catalin

