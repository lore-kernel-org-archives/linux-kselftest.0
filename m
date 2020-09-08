Return-Path: <SRS0=4V0G=CR=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17897C43461
	for <linux-kselftest@archiver.kernel.org>; Tue,  8 Sep 2020 19:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7AD521741
	for <linux-kselftest@archiver.kernel.org>; Tue,  8 Sep 2020 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599593896;
	bh=wrSeQG2QUa4FJxkUHtWNF5PiaB0PDg6BZtZjWx6kua0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=NS127Q9uHH8us3cFbTvjBq4sNMbOEA6HsMAeHFTMF4jEpLpH9fgKsqt3PUGKhdQjD
	 W8mgEfSr13C5y9ejP5omQGLs2cwjkC2Pg1Alzcahan5U/UXAYbHY9LHhwo6HOd5tE4
	 HvAgUb46FQsNHtk8MrAvgGMjj2EslIVgLSHMLj58=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731535AbgIHTiP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 8 Sep 2020 15:38:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:42114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730481AbgIHTiM (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 8 Sep 2020 15:38:12 -0400
Subject: Re: [GIT PULL] Kselftest update for Linux 5.9-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599593891;
        bh=wrSeQG2QUa4FJxkUHtWNF5PiaB0PDg6BZtZjWx6kua0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ykOHEKSEOBi0ZzMQNhw0h3jxxlPM1NprgF2PZz9PaM6QCwi7BcL8/VwwQspIAE+Ff
         Dw9QDhhNZRS8LFHAg/3aqYexwXEmyr68Jvn2aM8mgvCmoKRl1ZYFOxMZ2qlbh69Bqj
         TEDeNe7hGFOrV9t1CIbSEoPU9IRV6LIgUcVTOCLw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <12c8266f-de6e-176a-f45b-06b3887f5008@linuxfoundation.org>
References: <12c8266f-de6e-176a-f45b-06b3887f5008@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <12c8266f-de6e-176a-f45b-06b3887f5008@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-5.9-rc5
X-PR-Tracked-Commit-Id: 5c1e4f7e9e49b6925b1fb5c507d2c614f3edb292
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
Message-Id: <159959389186.25076.9145785507978724479.pr-tracker-bot@kernel.org>
Date:   Tue, 08 Sep 2020 19:38:11 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Tue, 8 Sep 2020 11:00:05 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-5.9-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
