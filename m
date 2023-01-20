Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DF5C38159
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Jan 2023 20:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjATUGq (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 20 Jan 2023 15:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjATUGn (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 20 Jan 2023 15:06:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4612BB2D01;
        Fri, 20 Jan 2023 12:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E131DB82A39;
        Fri, 20 Jan 2023 20:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 901CEC433EF;
        Fri, 20 Jan 2023 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674245199;
        bh=8cJVMX5dXhxkn+1qbJdPyY4RvPZCSPu05XMhlenuatI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=iyBMCbXn7jc7ea3ovMZe/T+Mu832GQJ6OXsyL9wukM+MxZV81689kSgK7hF/TYL4N
         TZpan4ZBxHtDnDwdS2kRAQM36aeIZ1CdrErGsviKWLAjo/MYL9oRWuU6p9NHXFvFjW
         dfiSbfOGFXc5Tux3PO6gUDl7Swnq5wzMS21P/vz1s4mQtOqgdse/V2c3W28huJetum
         xKh53NEip82RjBrKSs2CtPbONrBkEBt9+9b2f0rAtWFK7x9ezhV0e2eBtFVmGmnH2x
         yFSgSWLCz4veT28wiZPTDN37jR2F7fEbGen8I40FIR+LTrjDb5TlbmVUnm8m/dqy2e
         k5wKKbjCWjrYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8001AE54D2B;
        Fri, 20 Jan 2023 20:06:39 +0000 (UTC)
Subject: Re: [GIT PULL] Kselftest fixes update for Linux 6.2-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <eff9a27c-3ebb-2529-fc97-ab4e74d6e437@linuxfoundation.org>
References: <eff9a27c-3ebb-2529-fc97-ab4e74d6e437@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <eff9a27c-3ebb-2529-fc97-ab4e74d6e437@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-6.2-rc5
X-PR-Tracked-Commit-Id: 9fdaca2c1e157dc0a3c0faecf3a6a68e7d8d0c7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d9166cb31cb08f027011e8b6159966810bb514e3
Message-Id: <167424519952.30775.17674038913526870379.pr-tracker-bot@kernel.org>
Date:   Fri, 20 Jan 2023 20:06:39 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Fri, 20 Jan 2023 09:50:24 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-6.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d9166cb31cb08f027011e8b6159966810bb514e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
