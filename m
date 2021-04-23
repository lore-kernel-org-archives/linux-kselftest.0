Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC398C43461
	for <linux-kselftest@archiver.kernel.org>; Fri, 23 Apr 2021 21:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDFCB613CB
	for <linux-kselftest@archiver.kernel.org>; Fri, 23 Apr 2021 21:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244115AbhDWVLD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 23 Apr 2021 17:11:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:58958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244029AbhDWVKx (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 23 Apr 2021 17:10:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F07B61458;
        Fri, 23 Apr 2021 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619212216;
        bh=bwTl0NlQviroOMPbuJ/rHft8U6MOssDL+7X6EahTb8c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=i6nBKkCdq59G4pZqPw0DpHULSeT2ju/X0niUiHIMNg9HlfnDzasgX4lLUI6W5dJm7
         9PpHVeFoXcdHrEkZq7jggJ7fKv1EuCaUvst+R1+4JEpe28WMxbJlUDeKByx9VcmQ/I
         LA/AOHVriSt4wQkrEsYdTrsOHiokCycbet/cVUOrFpY3Pb5uCTxPoP7q3BTK1q7MqB
         S2/dQBCLiuRHU+EQEWq1QEQvn+Uj89FdepjkEZdaHdRddWmnNfC8q/dSOux394W8Qh
         e/w2h+6pbbZh9cOQLX208ms07lNjF5atAlqv74rBmPhSwJIM8NYhJsMRMcmS/U1pIq
         HlGKw1SdnDQZA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/net: bump timeout to 5 minutes
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161921221614.24005.15722074906496073270.git-patchwork-notify@kernel.org>
Date:   Fri, 23 Apr 2021 21:10:16 +0000
References: <20210423111538.83084-1-po-hsu.lin@canonical.com>
In-Reply-To: <20210423111538.83084-1-po-hsu.lin@canonical.com>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, davem@davemloft.net,
        kuba@kernel.org, shuah@kernel.org, skhan@linuxfoundation.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 23 Apr 2021 19:15:38 +0800 you wrote:
> We found that with the latest mainline kernel (5.12.0-051200rc8) on
> some KVM instances / bare-metal systems, the following tests will take
> longer than the kselftest framework default timeout (45 seconds) to
> run and thus got terminated with TIMEOUT error:
> * xfrm_policy.sh - took about 2m20s
> * pmtu.sh - took about 3m5s
> * udpgso_bench.sh - took about 60s
> 
> [...]

Here is the summary with links:
  - selftests/net: bump timeout to 5 minutes
    https://git.kernel.org/netdev/net-next/c/b881d089c7c9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


