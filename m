Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8085C4338F
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Aug 2021 16:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DF20610CC
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Aug 2021 16:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhHTQ6f (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 20 Aug 2021 12:58:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230048AbhHTQ6e (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 20 Aug 2021 12:58:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5579E6103A;
        Fri, 20 Aug 2021 16:57:55 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Amit Daniel Kachhap <amit.kachhap@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Boyan Karatotev <boyan.karatotev@arm.com>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: pac: Fix skipping of tests on systems without PAC
Date:   Fri, 20 Aug 2021 17:57:52 +0100
Message-Id: <162947866187.7115.13576102067532420865.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819165723.43903-1-broonie@kernel.org>
References: <20210819165723.43903-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 19 Aug 2021 17:57:23 +0100, Mark Brown wrote:
> The PAC tests check to see if the system supports the relevant PAC features
> but instead of skipping the tests if they can't be executed they fail the
> tests which makes things look like they're not working when they are.

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: pac: Fix skipping of tests on systems without PAC
      https://git.kernel.org/arm64/c/0c69bd2ca6ee

-- 
Catalin

