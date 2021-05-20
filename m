Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE1BC43460
	for <linux-kselftest@archiver.kernel.org>; Thu, 20 May 2021 22:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFA0C61074
	for <linux-kselftest@archiver.kernel.org>; Thu, 20 May 2021 22:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhETWvg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 20 May 2021 18:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:45262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232023AbhETWvd (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 20 May 2021 18:51:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8CD32613B5;
        Thu, 20 May 2021 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621551011;
        bh=w198roiEW5t2pB+0FDnzwgIITTNkrke6dMQYWadyfQ0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pUPcUZ0VItCGzAqDIckQ5vUTJi4P9wJqkzL2OGmQBM6DZ6hUyqNCBIXn0r8Katx5L
         HUTNMJv6QV8T9OZbpvMFQbJ1VudOtQEFtGMqMX8O18vRMebfgFDJBoiu6umahfozGV
         cEFnG29JhWxykfEesk5zyLhCzLwTplli6QO33+Vb19+BDJ2VpBaAQ6j11IZBm3ZdMC
         j2vzYFYeapBPkX0OPMCN8FEU3Hds2+m7ceFZMoq31vT00FK0iKw6lsIBpToctTXK3g
         04wRXIpZMG8VeYmXD2CYdJwr5AYuIE/b/IJI5D7lbgiCcVkjU/mGLh4v2d3vZPBHQv
         saN3se1fAAWrw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests: net: devlink_port_split.py: skip the test if no
 devlink device
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162155101151.27401.15951252835468300378.git-patchwork-notify@kernel.org>
Date:   Thu, 20 May 2021 22:50:11 +0000
References: <20210520104954.25007-1-po-hsu.lin@canonical.com>
In-Reply-To: <20210520104954.25007-1-po-hsu.lin@canonical.com>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        netdev@vger.kernel.org, shuah@kernel.org, kuba@kernel.org,
        davem@davemloft.net, skhan@linuxfoundation.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 20 May 2021 18:49:54 +0800 you wrote:
> When there is no devlink device, the following command will return:
>   $ devlink -j dev show
>   {dev:{}}
> 
> This will cause IndexError when trying to access the first element
> in dev of this json dataset. Use the kselftest framework skip code
> to skip this test in this case.
> 
> [...]

Here is the summary with links:
  - selftests: net: devlink_port_split.py: skip the test if no devlink device
    https://git.kernel.org/netdev/net-next/c/25173dd4093a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


