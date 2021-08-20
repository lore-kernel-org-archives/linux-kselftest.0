Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F6CC4320E
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Aug 2021 14:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F18E76113D
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Aug 2021 14:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240788AbhHTOAp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 20 Aug 2021 10:00:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240739AbhHTOAp (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 20 Aug 2021 10:00:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A10B061159;
        Fri, 20 Aug 2021 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629468007;
        bh=Dq87oFajLM6+NboP7w3uY9KbvujcE/JOecidW6OFOY0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rZiRXErw/gmBM42MpNa9NlCjjIZH/z0ULA/8SZoZtdu6Rnaq8v0+wWL3bpVoK/jsv
         ZfAna7UAr/IEOBqeYr9/WHv28Lk1PxElgLIFPFsAmhHLLvBDjBftULlwjaCQyVjqhk
         vHEZeMPkgiTXCebAgZIrnIwAlkEZkJqvaWQrCT6Yremo7/I0jOHNSTo15Y+zMULi0g
         rrCMo2vymhq4S8E2eMBPJ5teByOVJo4/G4ubZf0kUoYXmcv1bedWmCEoOdeZex6Ksq
         XqjPX+LvwUCeAqPS/bzKmCRZBG2YorJEhGCXjVMlERkzn+jNsDV1n2Yow0n2Ybhgo1
         tOjKfIAN8ahFQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH linux-next] tools/net: Use bitwise instead of arithmetic
 operator for flags
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162946800761.1573.17184223059527143220.git-patchwork-notify@kernel.org>
Date:   Fri, 20 Aug 2021 14:00:07 +0000
References: <20210820033527.13210-1-jing.yangyang@zte.com.cn>
In-Reply-To: <20210820033527.13210-1-jing.yangyang@zte.com.cn>
To:     jing yangyang <cgel.zte@gmail.com>
Cc:     davem@davemloft.net, kuba@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, jing.yangyang@zte.com.cn,
        zealci@zte.com.cn
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 19 Aug 2021 20:35:27 -0700 you wrote:
> From: jing yangyang <jing.yangyang@zte.com.cn>
> 
> This silences the following coccinelle warning:
> 
> "WARNING: sum of probable bitmasks, consider |"
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - [linux-next] tools/net: Use bitwise instead of arithmetic operator for flags
    https://git.kernel.org/netdev/net-next/c/fa16ee77364f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


