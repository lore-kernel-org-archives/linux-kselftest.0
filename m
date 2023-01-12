Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEDAC61DB3
	for <linux-kselftest@archiver.kernel.org>; Thu, 12 Jan 2023 18:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbjALSSX (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbjALSSB (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 12 Jan 2023 13:18:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A4718D;
        Thu, 12 Jan 2023 09:48:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A00D9620DE;
        Thu, 12 Jan 2023 17:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66DDC433EF;
        Thu, 12 Jan 2023 17:48:42 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kselftest/arm64: Improvements to BTI tests on non-BTI systems
Date:   Thu, 12 Jan 2023 17:48:40 +0000
Message-Id: <167354570430.3643775.1400892033904303107.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110-arm64-bti-selftest-skip-v1-0-143ecdc84567@kernel.org>
References: <20230110-arm64-bti-selftest-skip-v1-0-143ecdc84567@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 10 Jan 2023 20:49:58 +0000, Mark Brown wrote:
> While looking at the BTI selftest results on a non-BTI system I noticed
> that not only are we printing invalid test numbers in that case, we're
> skipping running the tests entirely even though there's a well defined
> ABI we could be verifying and the code already knows what the results
> should be.
> 
> The first patch here is a fix to the reporting of test numbers when
> skipping, the second one just removes the skipping entirely in favour of
> a runtime check for what the result of a BTI binary should be.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64: Fix test numbering when skipping tests
      https://git.kernel.org/arm64/c/30792e7c18b6
[2/2] kselftest/arm64: Run BTI selftests on systems without BTI
      https://git.kernel.org/arm64/c/1c3b614548b5

-- 
Catalin

