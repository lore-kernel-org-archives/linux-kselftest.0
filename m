Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C85BC433F5
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 May 2022 19:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbiEDUBJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 4 May 2022 16:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235047AbiEDUBJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 4 May 2022 16:01:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C5062E8
        for <linux-kselftest@vger.kernel.org>; Wed,  4 May 2022 12:57:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0217A612C6
        for <linux-kselftest@vger.kernel.org>; Wed,  4 May 2022 19:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CD2C385A5;
        Wed,  4 May 2022 19:57:28 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] kselftest/arm64: Fix ABI header directory location
Date:   Wed,  4 May 2022 20:57:26 +0100
Message-Id: <165169424068.2575898.6831310340907214017.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503231655.211346-1-broonie@kernel.org>
References: <20220503231655.211346-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 4 May 2022 00:16:55 +0100, Mark Brown wrote:
> Currently the arm64 kselftests attempt to locate the ABI headers using
> custom logic which doesn't work correctly in the case of out of tree builds
> if KBUILD_OUTPUT is not specified. Since lib.mk defines KHDR_INCLUDES with
> the appropriate flags we can simply remove the custom logic and use that
> instead.
> 
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Fix ABI header directory location
      https://git.kernel.org/arm64/c/ae60e0763e97

-- 
Catalin

