Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E86EC4332F
	for <linux-kselftest@archiver.kernel.org>; Thu,  2 Nov 2023 03:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348277AbjKBDPq (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348348AbjKBDPp (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 1 Nov 2023 23:15:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9D4113;
        Wed,  1 Nov 2023 20:15:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6599AC433C9;
        Thu,  2 Nov 2023 03:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698894940;
        bh=G/8OZTsqMdk4ngW/2bG5UWESpVej7icMY2P3qH/NSuQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=a1J1AaeAvfgKpb5SehQOOg0VZZBt0AxoEGkzqgSzz+vvXmNTssYv07g2Uw8ZaiXpN
         s5CQ4x7AkkpgtpDl1eTsLvhfaWYoxdgYaRNmsQw6WzBgOM9aNAjiVuud2KdQ8C7snl
         hm53+N+ORLhY2ageMTKAHw4o0NNA8itO8qN1XU/NAUBypuSEZoAfLcEx73IGKGT5yo
         l2Fop9u+Ajpsa2EhI/0UlNqjjRd4xVwwk/ARlG9bvq1cmN6hcCc9NlRZxI71ww/dGB
         QrGptnyps2QOiRWVVTAc7rYoqC3vSettaD5OfSxDsfLwbXzARXYIiO4pBUUlKpmJPr
         2mTNkqu0JJ+HA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 533F5C4316B;
        Thu,  2 Nov 2023 03:15:40 +0000 (UTC)
Subject: Re: [GIT PULL] KUnit next update for Linux 6.7-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <d3ee9531-5592-4599-ad2f-1f674c99599f@linuxfoundation.org>
References: <d3ee9531-5592-4599-ad2f-1f674c99599f@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d3ee9531-5592-4599-ad2f-1f674c99599f@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-6.7-rc1
X-PR-Tracked-Commit-Id: 8040345fdae4cb256c5d981f91ae0f22bea8adcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5eda8f25377f3d6de697eaa1d9801b9781d09dbc
Message-Id: <169889494033.1076.12864057140065094328.pr-tracker-bot@kernel.org>
Date:   Thu, 02 Nov 2023 03:15:40 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        David Gow <davidgow@google.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Wed, 1 Nov 2023 12:37:36 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5eda8f25377f3d6de697eaa1d9801b9781d09dbc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
