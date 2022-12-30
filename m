Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C7C10F1B
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Dec 2022 07:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbiL3Hlc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Dec 2022 02:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiL3HkW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Dec 2022 02:40:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A29E64CE;
        Thu, 29 Dec 2022 23:40:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EB024B818ED;
        Fri, 30 Dec 2022 07:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DE89C433F1;
        Fri, 30 Dec 2022 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672386018;
        bh=qbIRS1t7qbPmay/00gYg3v6cvnMqr6be+ff+5DoVvDM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EtG3vzu8tx2m14S0zCbE6hIIfDGGWjBVqEq+ZfRy/4LH3QZLl9TEJTrKlUC0bkOye
         LbJwLIQVnYxPFP7bHV1DhCxWHqSUNlQGXtuXzwQQ7rTsiXW3QV1r8MvswtjNcbx0eL
         vsYnXWZyhjmPcsCxQFuLZqbNO9k0y0ieBB4sPkoSFJjuyS99ALvscOSTDXVXSwpy/x
         m19w+HsYKSoJhhvLj7UECSMVTCR9wtQbwVgVmpA1tSxkSL0bB/HrXEyagb3n68IpAO
         pOdwYGVeP+b8F9pjoPlE2pj7ZyKB0XufjDRMCg3daK/bLl8X0G8h+TDHhZdFfjH0W3
         ckhq5dRwwKKkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E1FFE50D71;
        Fri, 30 Dec 2022 07:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests: net: fix cmsg_so_mark.sh test hang
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167238601844.1408.7811509081427626262.git-patchwork-notify@kernel.org>
Date:   Fri, 30 Dec 2022 07:40:18 +0000
References: <20221229054106.96682-1-po-hsu.lin@canonical.com>
In-Reply-To: <20221229054106.96682-1-po-hsu.lin@canonical.com>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        shuah@kernel.org, naresh.kamboju@linaro.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 29 Dec 2022 13:41:06 +0800 you wrote:
> This cmsg_so_mark.sh test will hang on non-amd64 systems because of the
> infinity loop for argument parsing in cmsg_sender.
> 
> Variable "o" in cs_parse_args() for taking getopt() should be an int,
> otherwise it will be 255 when getopt() returns -1 on non-amd64 system
> and thus causing infinity loop.
> 
> [...]

Here is the summary with links:
  - selftests: net: fix cmsg_so_mark.sh test hang
    https://git.kernel.org/netdev/net/c/1573c6882018

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


