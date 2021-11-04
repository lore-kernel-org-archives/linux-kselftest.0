Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A99BC433EF
	for <linux-kselftest@archiver.kernel.org>; Thu,  4 Nov 2021 11:30:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2F7D611C9
	for <linux-kselftest@archiver.kernel.org>; Thu,  4 Nov 2021 11:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhKDLcq (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 4 Nov 2021 07:32:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229843AbhKDLcp (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 4 Nov 2021 07:32:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EC591611F2;
        Thu,  4 Nov 2021 11:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636025408;
        bh=qNfXuu7/9CV4qCMoZEQWMVcby6LsxtebbXx/21zZX40=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VxP0pdt8LcMVvdAwCbLqvUgM1yDD7Beb0riFOQjSYGnxX5E2+wL32HOCiJh8AOT66
         Vq+V1/Q7WmWEJ5K8Qo5qbDcDUc1NI71syDy4YGDEgJVHYoiRDPpcnN5Qx3Croe+Iz9
         oUGJFrRZnvdyxQZKzxae6TL2uY4Ho3x+BPEuJMmUxoxwtF/ESj/JwkA/t8GHPgOX8n
         ywkP6PThnuDgU1jEOBKXd0A1MNfL+855ij9lL5wqMKEQ7ZFxMH4/K3p7gmVvpzqC7e
         UAuuLRixYPIGdpN/AeNnTKTjSKbs4XFIZ3VEhqYwOh1+R4NfxkLCWlZHymod42YPUG
         XdfnnjeQebL2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests: net: properly support IPv6 in GSO GRE test
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163602540789.19516.14115873582365922647.git-patchwork-notify@kernel.org>
Date:   Thu, 04 Nov 2021 11:30:07 +0000
References: <20211104104613.17204-1-andrea.righi@canonical.com>
In-Reply-To: <20211104104613.17204-1-andrea.righi@canonical.com>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     shuah@kernel.org, davem@davemloft.net, kuba@kernel.org,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu,  4 Nov 2021 11:46:13 +0100 you wrote:
> Explicitly pass -6 to netcat when the test is using IPv6 to prevent
> failures.
> 
> Also make sure to pass "-N" to netcat to close the socket after EOF on
> the client side, otherwise we would always hit the timeout and the test
> would fail.
> 
> [...]

Here is the summary with links:
  - selftests: net: properly support IPv6 in GSO GRE test
    https://git.kernel.org/netdev/net/c/a985442fdecb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


