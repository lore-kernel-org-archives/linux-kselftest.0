Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2833C4167D
	for <linux-kselftest@archiver.kernel.org>; Thu,  2 Nov 2023 03:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348279AbjKBDPr (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348349AbjKBDPp (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 1 Nov 2023 23:15:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F393F126;
        Wed,  1 Nov 2023 20:15:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CDE3C433CA;
        Thu,  2 Nov 2023 03:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698894940;
        bh=tyE14xWjehkxFNf8Dn4clN7vfVVG+F6E1qfmZs5Dd1k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=fscqGoEJF+bxD66a3SrmmI6nc37HgsHV3z0DblvGG6ItPI6n2n/UH19LIrgDM/kEq
         dun/PEUn/o4IxhlTUmrO7X2u6PO8bmaYltdt9axrE2HAWxoUcLIefIMMmcXh0r7Iay
         6C8gi9S+HLhdel83hoKBBCAGKLR5iJE788uN/AJFPtRlEIqoV9b/s60vychfKuZrUK
         fb8lcj0ohMDzm7cqWMgE+hpSyRpsRzWstTdDenHv4F0Ec5eH2uFRGALLjjN7mPLGDR
         P5CXtlniwJO/HAxMU3v+bD5xp7AlgF9s6ThhU6ESisxOoTN3RxXZy7jAtqWCDXcqDd
         4bxsY02rBGBkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8390AC395F3;
        Thu,  2 Nov 2023 03:15:40 +0000 (UTC)
Subject: Re: [GIT PULL] Kselftest next update for Linux 6.7-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <a5251d1f-a217-48fb-808c-f5ad6edb6c17@linuxfoundation.org>
References: <a5251d1f-a217-48fb-808c-f5ad6edb6c17@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a5251d1f-a217-48fb-808c-f5ad6edb6c17@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-6.7-rc1
X-PR-Tracked-Commit-Id: 5247e6dbed0041147a83137f89cd45043301de5c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7dc0e9c7dda66bd91eeada00d90033e3eb647fc3
Message-Id: <169889494053.1076.5964085636388169130.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Nov 2023 03:15:40 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Wed, 1 Nov 2023 13:11:31 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7dc0e9c7dda66bd91eeada00d90033e3eb647fc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
