Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0F0EB64D9
	for <linux-kselftest@archiver.kernel.org>; Thu,  6 Jul 2023 21:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjGFVKe (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 6 Jul 2023 17:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbjGFVKb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 6 Jul 2023 17:10:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D071BC9;
        Thu,  6 Jul 2023 14:10:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA3A6119F;
        Thu,  6 Jul 2023 21:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62168C433CA;
        Thu,  6 Jul 2023 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688677829;
        bh=r0kK6Q/5EIs8ECrWV3m193nP6zDw8DILs2c7Ih39kOA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lpoM5kp+XBh8FPwCD+3OLJgCWtExHyKo2Ezck5g/mkCSFGxOLt5ZjdCPrB9TL8vBG
         8lBilZvmjnpnPJoNmOaO7rmOosKvee5fAGW6GDPIQte++EB0ejwPkfXE0+jHus5peO
         5rLfa7FQJdu/BvJWtjJopfwKgkPoNX4+Esc47r/svBVAcMQmexQ8N/xPg3Swb7nMZ/
         fZEmRZcK5F5I2k+1UYe8USSzEwmPpaeNCSXCM+KqV1bwePy4eYa9ThLlxgETPGNJXT
         /lLB39c4c37h02GWle2ak3mSbFFmn/fqwYLVR0h/A/R/fq26I3jRlH2vkON2HgPBCZ
         stgnEMr+YfSww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3EBCEE5381B;
        Thu,  6 Jul 2023 21:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] selftests/bpf: Bump and validate MAX_SYMS
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168867782925.19494.7717001810373235391.git-patchwork-notify@kernel.org>
Date:   Thu, 06 Jul 2023 21:10:29 +0000
References: <20230706142228.1128452-1-bjorn@kernel.org>
In-Reply-To: <20230706142228.1128452-1-bjorn@kernel.org>
To:     =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc:     andrii@kernel.org, mykolal@fb.com, bpf@vger.kernel.org,
        netdev@vger.kernel.org, bjorn@rivosinc.com, ast@kernel.org,
        daniel@iogearbox.net, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Thu,  6 Jul 2023 16:22:28 +0200 you wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> BPF tests that load /proc/kallsyms, e.g. bpf_cookie, will perform a
> buffer overrun if the number of syms on the system is larger than
> MAX_SYMS.
> 
> Bump the MAX_SYMS to 400000, and add a runtime check that bails out if
> the maximum is reached.
> 
> [...]

Here is the summary with links:
  - [bpf-next] selftests/bpf: Bump and validate MAX_SYMS
    https://git.kernel.org/bpf/bpf-next/c/e76a014334a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


