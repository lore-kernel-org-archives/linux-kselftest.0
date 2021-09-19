Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E1DC433FE
	for <linux-kselftest@archiver.kernel.org>; Sun, 19 Sep 2021 12:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A3FB6126A
	for <linux-kselftest@archiver.kernel.org>; Sun, 19 Sep 2021 12:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhISMVd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 19 Sep 2021 08:21:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhISMVc (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 19 Sep 2021 08:21:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BD9CA61074;
        Sun, 19 Sep 2021 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632054007;
        bh=juJaSv0GiyOfkymwzpKe+oRrnnW9W6D26nuvMHCibgU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CyLJQ59Z27l7gSQGmek1ivVkfZKgwcjvqjLjBMHsBwmJyjGyMSzMGzZtVkpwrFTUI
         H/EICPqni/qN2QiGIiC4iCejXq7VZhFyU5p74HtojlxGGd4VJwyRC2zxD3lkPZNiLE
         xIM85SH47zvsaDPws1Sxn6aZAcvZSd/7I11APH8Tttc6sR5vJ3HI+zA+HkwdqWHoz2
         QOk14y/8dz6RTC57SnKSRU0PtUPiT7oG5gSjJhb7y8dkZR/mhOwWFQXdGAcU/nxy9m
         YkwmLzKFtPzMndJIZZP1i8zqKmgIsn9HaYstwmrTbqoHfmemkhK2/Kc3Lap/gKihXV
         /qOGUdCNTQiHg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests: net: af_unix: Fix incorrect args in test result
 msg
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163205400769.8407.15151406750714105944.git-patchwork-notify@kernel.org>
Date:   Sun, 19 Sep 2021 12:20:07 +0000
References: <20210917192614.24862-1-skhan@linuxfoundation.org>
In-Reply-To: <20210917192614.24862-1-skhan@linuxfoundation.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     davem@davemloft.net, kuba@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 17 Sep 2021 13:26:14 -0600 you wrote:
> Fix the args to fprintf(). Splitting the message ends up passing
> incorrect arg for "sigurg %d" and an extra arg overall. The test
> result message ends up incorrect.
> 
> test_unix_oob.c: In function ‘main’:
> test_unix_oob.c:274:43: warning: format ‘%d’ expects argument of type ‘int’, but argument 3 has type ‘char *’ [-Wformat=]
>   274 |   fprintf(stderr, "Test 3 failed, sigurg %d len %d OOB %c ",
>       |                                          ~^
>       |                                           |
>       |                                           int
>       |                                          %s
>   275 |   "atmark %d\n", signal_recvd, len, oob, atmark);
>       |   ~~~~~~~~~~~~~
>       |   |
>       |   char *
> test_unix_oob.c:274:19: warning: too many arguments for format [-Wformat-extra-args]
>   274 |   fprintf(stderr, "Test 3 failed, sigurg %d len %d OOB %c ",
> 
> [...]

Here is the summary with links:
  - selftests: net: af_unix: Fix incorrect args in test result msg
    https://git.kernel.org/netdev/net/c/48514a223330

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


