Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3691CC433F5
	for <linux-kselftest@archiver.kernel.org>; Sat, 26 Mar 2022 21:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbiCZVVw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 26 Mar 2022 17:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbiCZVVu (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 26 Mar 2022 17:21:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1748D5642D;
        Sat, 26 Mar 2022 14:20:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1877FB80B8F;
        Sat, 26 Mar 2022 21:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3BD3C34100;
        Sat, 26 Mar 2022 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648329610;
        bh=e34Tko6v1US3AKbwVWmjYhohHNP+ax3odMR17k6TqZ0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OUQjshDSJDpaKDhvF0rpRIH/1Ldkdr7dRCQz9uJzJy0N/zDQ6C1aJGpCwflTtEKmS
         9zJlK3l6dCAA52FDvdQ4NUFdBQSQIx1IAP34pikAA9m+L4gf4LCLdbXCqQB2aqu6sm
         Vy8PWMXQ4dnOz4BVcoMdgja+ZKz/5oriRdGucSH9r5SM6Ld0Hli7rhJjlAuL9Ze1/f
         r0Hl43cqdYFgHzNBJlhgBHlULSKdLkerY/flstMagkCXmjcFVLfyykza+aKqsAej7r
         Nww/8rmYLDFs7fJeBdX8mj3jmknTQt1mCRCmnDHt98XsEVoYiIO673b+hhi1/+QxmH
         WojBKPrd/E/1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81D1BE6D44B;
        Sat, 26 Mar 2022 21:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: tls: skip cmsg_to_pipe tests with TLS=n
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164832961052.3419.14326571585409140344.git-patchwork-notify@kernel.org>
Date:   Sat, 26 Mar 2022 21:20:10 +0000
References: <20220325232709.2358965-1-kuba@kernel.org>
In-Reply-To: <20220325232709.2358965-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org,
        shuah@kernel.org, linux-kselftest@vger.kernel.org, lkft@linaro.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 25 Mar 2022 16:27:09 -0700 you wrote:
> These are negative tests, testing TLS code rejects certain
> operations. They won't pass without TLS enabled, pure TCP
> accepts those operations.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Fixes: d87d67fd61ef ("selftests: tls: test splicing cmsgs")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] selftests: tls: skip cmsg_to_pipe tests with TLS=n
    https://git.kernel.org/netdev/net/c/5c7e49be96ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


