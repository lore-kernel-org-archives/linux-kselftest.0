Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B1C48BE6
	for <linux-kselftest@archiver.kernel.org>; Wed, 16 Jun 2021 20:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D714613B9
	for <linux-kselftest@archiver.kernel.org>; Wed, 16 Jun 2021 20:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhFPUCK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 16 Jun 2021 16:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230146AbhFPUCK (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 16 Jun 2021 16:02:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C758361375;
        Wed, 16 Jun 2021 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623873603;
        bh=lm0WYNCndKvOklR07/CaUQFMLUeOI6X+WniQwv9dQyA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aA4ahwgraVlwr4qLT7bBUvMnuT46fFgsRVYaScSxEO62cqcnpTIW4VOOtbKZF9NMi
         l+Cw0Vh/DtOWUtcBr6KItzPDb6akSFV5LSAIiMepznzNvqdvMdFSHhFM6tObGiU5+C
         SUvlqPABLk7pnUrGZ2HxVCdjSEXgLS9LvNaBf+qHmFiv+FyJN9ZePu+Bywe6CeN6B1
         vX+Z0dLEDLPLf9bH4LOZUxxueamvsJ5btIpveaaOf5JK29ESCygznUwWFOG1d+uiOV
         MxfjvcwCSTFG8FAm1Studf+WYsf2GXROJNQQp/rJ6hc1XIOKhWVAKbuSFcdB6PEncf
         1odnuZfFklQAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests: net: veth: make test compatible with dash
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162387360376.18083.3181295447841103753.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 20:00:03 +0000
References: <YMoEqdpCIQN209ty@xps-13-7390>
In-Reply-To: <YMoEqdpCIQN209ty@xps-13-7390>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     shuah@kernel.org, davem@davemloft.net, kuba@kernel.org,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 16 Jun 2021 16:03:21 +0200 you wrote:
> veth.sh is a shell script that uses /bin/sh; some distro (Ubuntu for
> example) use dash as /bin/sh and in this case the test reports the
> following error:
> 
>  # ./veth.sh: 21: local: -r: bad variable name
>  # ./veth.sh: 21: local: -r: bad variable name
> 
> [...]

Here is the summary with links:
  - selftests: net: veth: make test compatible with dash
    https://git.kernel.org/netdev/net/c/0fd158b89b50

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


