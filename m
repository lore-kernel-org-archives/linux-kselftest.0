Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC09C4332F
	for <linux-kselftest@archiver.kernel.org>; Thu, 29 Sep 2022 17:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiI2RzE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235040AbiI2Ryw (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 29 Sep 2022 13:54:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E057345992
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Sep 2022 10:54:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C97EDB82624
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Sep 2022 17:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4428AC433C1;
        Thu, 29 Sep 2022 17:54:44 +0000 (UTC)
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>
Cc:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/3] kselftest/arm64: fp-stress updates
Date:   Thu, 29 Sep 2022 18:54:41 +0100
Message-Id: <166447406678.3004405.15674498507541422507.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220921181345.618085-1-broonie@kernel.org>
References: <20220921181345.618085-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 21 Sep 2022 19:13:42 +0100, Mark Brown wrote:
> A few small updates for fp-stress, improving the usability with
> signal handling a bit.
> 
> Mark Brown (3):
>   kselftest/arm64: Don't repeat termination handler for fp-stress
>   kselftest/arm64: Flag fp-stress as exiting when we begin finishing up
>   kselftest/arm64: Handle EINTR while reading data from children
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/3] kselftest/arm64: Don't repeat termination handler for fp-stress
      https://git.kernel.org/arm64/c/c38d381fff26
[2/3] kselftest/arm64: Flag fp-stress as exiting when we begin finishing up
      https://git.kernel.org/arm64/c/dd72dd7cd527
[3/3] kselftest/arm64: Handle EINTR while reading data from children
      https://git.kernel.org/arm64/c/a711987490a1

-- 
Catalin

