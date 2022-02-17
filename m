Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207B7C433F5
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Feb 2022 14:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241877AbiBQOag (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 17 Feb 2022 09:30:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbiBQOa3 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 17 Feb 2022 09:30:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0302B167F;
        Thu, 17 Feb 2022 06:30:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4910B82214;
        Thu, 17 Feb 2022 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63BE1C340EF;
        Thu, 17 Feb 2022 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645108211;
        bh=ssXrVw6dDjvmRLeS1JeJDiL3+6R+i9r2+H+nYvca3j0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XtgSME9+YWqBwb2nn5kDB7Y3cLRcrw8Mip8pEjbDCynUtIImNf3oZ6LiiAz2tkD/C
         ick6T7Vqla217N0P4R/DzgeLt5LzcIiNzXoYgPpOFUYkIA42/OxuJd/KtcXufUIUXc
         wmt5rYMBJhICttnwVQr8rK0V8lGKCHvwi8eKMdduDGN4REXSbs1hUwNr74X7lSRuG3
         PWwtcCQ4VI9p3nbpZ0LAGeJuz+NP1RdcKWPxjaAMMv+Nl87mkSQ4MiipJXJzZkAHXT
         vct/bwRTjBpyqmAw4Iho7Ha/P+t7h/WENvGTkKsYYsSB5FHbG6BIsuJqaSKObk3qGr
         tZKCYId8NWvtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 486B5E6D447;
        Thu, 17 Feb 2022 14:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] net: ping6: support setting basic SOL_IPV6
 options via cmsg
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164510821129.30096.13710727115578860343.git-patchwork-notify@kernel.org>
Date:   Thu, 17 Feb 2022 14:30:11 +0000
References: <20220217012120.61250-1-kuba@kernel.org>
In-Reply-To: <20220217012120.61250-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, willemb@google.com,
        lorenzo@google.com, maze@google.com, dsahern@kernel.org,
        yoshfuji@linux-ipv6.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 16 Feb 2022 17:21:15 -0800 you wrote:
> Support for IPV6_HOPLIMIT, IPV6_TCLASS, IPV6_DONTFRAG on ICMPv6
> sockets and associated tests. I have no immediate plans to
> implement IPV6_FLOWINFO and all the extension header stuff.
> 
> Jakub Kicinski (5):
>   net: ping6: support setting basic SOL_IPV6 options via cmsg
>   selftests: net: test IPV6_DONTFRAG
>   selftests: net: test IPV6_TCLASS
>   selftests: net: test IPV6_HOPLIMIT
>   selftests: net: basic test for IPV6_2292*
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: ping6: support setting basic SOL_IPV6 options via cmsg
    https://git.kernel.org/netdev/net-next/c/13651224c00b
  - [net-next,2/5] selftests: net: test IPV6_DONTFRAG
    https://git.kernel.org/netdev/net-next/c/6f97c7c605d6
  - [net-next,3/5] selftests: net: test IPV6_TCLASS
    https://git.kernel.org/netdev/net-next/c/9657ad09e1fa
  - [net-next,4/5] selftests: net: test IPV6_HOPLIMIT
    https://git.kernel.org/netdev/net-next/c/05ae83d5a4a2
  - [net-next,5/5] selftests: net: basic test for IPV6_2292*
    https://git.kernel.org/netdev/net-next/c/a22982c39eb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


