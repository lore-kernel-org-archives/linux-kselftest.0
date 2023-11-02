Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BC3C4332F
	for <linux-kselftest@archiver.kernel.org>; Thu,  2 Nov 2023 15:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjKBPA1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 2 Nov 2023 11:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjKBPA0 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 2 Nov 2023 11:00:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C03B13A;
        Thu,  2 Nov 2023 08:00:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E5A0C433CA;
        Thu,  2 Nov 2023 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698937224;
        bh=/pwXL3xPFaDrTXVpsvGKDsQbN572XgEVZY6X5R/2wv8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q3WQnener8mT20A0H8cb6McxoU2dvu1vrkXKZSFMhnYLH8XHSHzLrPB7dKGWPOSq+
         Ck0+6Nw1+9v3RRv/+JJQw8Jyv31S98tgeDM/XR45xeDMCFYMEEmsTryDrQwoJi19mQ
         ogtUzTX3ubjslziGZ3wnu77O1xFLyv77cpXzwEJi4AbVXyvv9XE0mT3flc9zJQ+f4Z
         MT9IivVaWiVULj6OP5vW+bnjoG1vikPy8yRoaL3H5WvUjozXyujHzdne7wL0HJjBta
         NxFn+kqeO14RGTedQOHwUsdDPmfMY0VmSCG1N4PIhPD4jlP8N4B+yA5iczAILyhW67
         hXMBWmo42pBuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03A44C395FC;
        Thu,  2 Nov 2023 15:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf] selftests/bpf: Fix broken build where char is unsigned
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169893722400.13991.10009432921960035904.git-patchwork-notify@kernel.org>
Date:   Thu, 02 Nov 2023 15:00:24 +0000
References: <20231102103537.247336-1-bjorn@kernel.org>
In-Reply-To: <20231102103537.247336-1-bjorn@kernel.org>
To:     =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc:     andrii@kernel.org, mykolal@fb.com, bpf@vger.kernel.org,
        daniel@iogearbox.net, netdev@vger.kernel.org, bjorn@rivosinc.com,
        ast@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, larysa.zaremba@intel.com
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu,  2 Nov 2023 11:35:37 +0100 you wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> There are architectures where char is not signed. If so, the following
> error is triggered:
> 
>   | xdp_hw_metadata.c:435:42: error: result of comparison of constant -1 \
>   |   with expression of type 'char' is always true \
>   |   [-Werror,-Wtautological-constant-out-of-range-compare]
>   |   435 |         while ((opt = getopt(argc, argv, "mh")) != -1) {
>   |       |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
>   | 1 error generated.
> 
> [...]

Here is the summary with links:
  - [bpf] selftests/bpf: Fix broken build where char is unsigned
    https://git.kernel.org/bpf/bpf/c/d84b139f53e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


