Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E497CC77B7C
	for <linux-kselftest@archiver.kernel.org>; Fri, 26 May 2023 09:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242833AbjEZJhu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 26 May 2023 05:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242746AbjEZJho (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 26 May 2023 05:37:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E7410A;
        Fri, 26 May 2023 02:37:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5621064EB9;
        Fri, 26 May 2023 09:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A581C433EF;
        Fri, 26 May 2023 09:37:40 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Add a smoke test for ptracing hardware break/watch points
Date:   Fri, 26 May 2023 10:37:38 +0100
Message-Id: <168509385498.1547913.7827809763054726991.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414-arm64-test-hw-breakpoint-v2-1-90a19e3b1059@kernel.org>
References: <20230414-arm64-test-hw-breakpoint-v2-1-90a19e3b1059@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 22 May 2023 15:28:00 +0100, Mark Brown wrote:
> There was a report that the hardware breakpoints and watch points weren't
> reporting the debug architecture version as expected, they were reporting
> a version of 0 which is not defined in the architecture.  This happens
> when running in a KVM guest if the host has a debug architecture version
> not supported by KVM, it in turn confuses GDB which rejects any debug
> architecture version it does not know about.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Add a smoke test for ptracing hardware break/watch points
      https://git.kernel.org/arm64/c/cb5aa6379438

-- 
Catalin

