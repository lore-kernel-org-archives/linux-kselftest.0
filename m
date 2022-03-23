Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B74C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 23 Mar 2022 20:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344493AbiCWUBh (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 23 Mar 2022 16:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344528AbiCWUBg (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 23 Mar 2022 16:01:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AEE673F3;
        Wed, 23 Mar 2022 13:00:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 065F1B8207A;
        Wed, 23 Mar 2022 20:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6B81C340ED;
        Wed, 23 Mar 2022 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648065603;
        bh=gDYLmJHTHA1I5fCV9vNQdTGcUZDrmr6ZaaX1mXQFTDg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=FS1ulpP8qRof5etfUSzY40ANSpoLoy8GDtoIzrDVkxssPeHDbof8TbFNxvy6f/MR9
         AY53L1yOxHUlDgzq7Z/WPoGjYl/HrYrdSg6tThricqy17fr9u556BHv2cMauaJtJJk
         V9kq2WWpV/pnPyyyaD0emxC52hAH1sMp/Hq71dLUfwLX6kaPw5x/SF09Ji9MdP1Nvp
         wCKWTr9PSdxt5P62KY4m++DpVjAHtD4RzCr7WbPndjzxa/2kYokCu8iyfEmYjV/mlz
         HQ+Ij6Zdt7iYBnY/AezUFLekRpuGy49zaoZDE9hezT58lhu+lHl3FEeRkuYGz6XkEH
         h4b6omSozrEGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F251E6D402;
        Wed, 23 Mar 2022 20:00:03 +0000 (UTC)
Subject: Re: [GIT PULL] KUnit update for Linux 5.18-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <d138a93a-997f-bfb6-6119-83aa2c00a49d@linuxfoundation.org>
References: <d138a93a-997f-bfb6-6119-83aa2c00a49d@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <d138a93a-997f-bfb6-6119-83aa2c00a49d@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-kunit-5.18-rc1
X-PR-Tracked-Commit-Id: 5debe5bfa02c4c8922bd2d0f82c9c3a70bec8944
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d51b1b33c51d147b757f042b4d336603b699f362
Message-Id: <164806560358.26344.11058438695228933587.pr-tracker-bot@kernel.org>
Date:   Wed, 23 Mar 2022 20:00:03 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Mon, 21 Mar 2022 19:51:52 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-kunit-5.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d51b1b33c51d147b757f042b4d336603b699f362

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
