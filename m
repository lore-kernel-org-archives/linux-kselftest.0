Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6677C4332F
	for <linux-kselftest@archiver.kernel.org>; Fri,  3 Nov 2023 09:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347004AbjKCJU1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 3 Nov 2023 05:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346995AbjKCJU0 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 3 Nov 2023 05:20:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CE71BD
        for <linux-kselftest@vger.kernel.org>; Fri,  3 Nov 2023 02:20:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B07E0C433D9;
        Fri,  3 Nov 2023 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699003223;
        bh=yA1Z5LbFevrJzj3K8hlToA6slOFPkbuUQioyDJR2e9o=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SgPoyoNF/FJSYL/YHt/nj3KiDPIYTqMrO7KCj2k/Nf3wNJhQl2qobD4f1Esr2uNdR
         jU+yoYNHo2bO+4uVd+r7FpFm72eZxANwT+LgReXw2eKfCAZTF94UM/7O7p+MwMsgUu
         +gu8zz9LR6W8+74IZDz/HKEDRn+rJJzlmyb5IqZbIrGm796PN9T/fvZ+YlkogqCiLo
         FBSrsP1qoFcS3M4Ka6Bjku3VO3/+qGPZMqhPnJ8eMNxq4nl5OUUgDonZJwJyzPdxQ2
         1GpxNPegXPmPloUG4VjiQWDM7XWTiQaup5clsAb2O2eOdDd2n70iXVKBD5q57elWHu
         p760mFShxqJDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 926E4E00087;
        Fri,  3 Nov 2023 09:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2 net] selftests: pmtu.sh: fix result checking
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169900322359.11636.17151225482098820636.git-patchwork-notify@kernel.org>
Date:   Fri, 03 Nov 2023 09:20:23 +0000
References: <20231031034732.3531008-1-liuhangbin@gmail.com>
In-Reply-To: <20231031034732.3531008-1-liuhangbin@gmail.com>
To:     Hangbin Liu <liuhangbin@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
        dsahern@kernel.org, linux-kselftest@vger.kernel.org,
        po-hsu.lin@canonical.com
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 31 Oct 2023 11:47:32 +0800 you wrote:
> In the PMTU test, when all previous tests are skipped and the new test
> passes, the exit code is set to 0. However, the current check mistakenly
> treats this as an assignment, causing the check to pass every time.
> 
> Consequently, regardless of how many tests have failed, if the latest test
> passes, the PMTU test will report a pass.
> 
> [...]

Here is the summary with links:
  - [PATCHv2,net] selftests: pmtu.sh: fix result checking
    https://git.kernel.org/netdev/net/c/63e201916b27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


