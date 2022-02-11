Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B048C433F5
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Feb 2022 00:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346122AbiBKAHP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Feb 2022 19:07:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346079AbiBKAHO (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Feb 2022 19:07:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAA3270A;
        Thu, 10 Feb 2022 16:07:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B4C861E05;
        Fri, 11 Feb 2022 00:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D227FC36AE2;
        Fri, 11 Feb 2022 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644538033;
        bh=eKeB13pEAHinbp3QQ5ICgOQPnbUHF5blvJ1jG/ljeYE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MutYD8N5dFq4iA4VftcZxDu6uQ159e/jqBR+w6I9BR6lNNjwp95I1VfOGU0SWiTkI
         kJVJ7J9s8dK7Ar4jtzEWFTlCz9rUYxQwhziyUzv+3pCrr/GpNEWTo2fsw3HuZT9Xqc
         dWlVdFX5dFgVBf9FIUZ2ddzfLT4fzRgFn7pyW+7UY1h8sQeVHs+ennf7VU41/Q+2nT
         72lt3SVjPtHI8ApmJYbiHSLamf+hp/u+m4LkImi9PcMn9EZxEMLX+hsxmv43WZNJOV
         mkWvZmk4HrF6npNgBPHP9KP8UHch6+7f0mi4aYo2RadkTTA/eqCaZsq1odi50UOtOP
         2KClcZlP8DMag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC85CE5D084;
        Fri, 11 Feb 2022 00:07:13 +0000 (UTC)
Subject: Re: [GIT PULL] Kselftest fixes update for Linux 5.17-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <30ab6598-a653-7c63-c8ee-728c780f47d3@linuxfoundation.org>
References: <30ab6598-a653-7c63-c8ee-728c780f47d3@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <30ab6598-a653-7c63-c8ee-728c780f47d3@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-5.17-rc4
X-PR-Tracked-Commit-Id: 183f80fd72db42c9cc483aa7a5e8e881355d0b03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16f7432c884bb7882f0534cb8b9c38cdbccc37bc
Message-Id: <164453803376.1838.5140652693812951062.pr-tracker-bot@kernel.org>
Date:   Fri, 11 Feb 2022 00:07:13 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Thu, 10 Feb 2022 13:27:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-5.17-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16f7432c884bb7882f0534cb8b9c38cdbccc37bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
