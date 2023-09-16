Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8B3CD37B1
	for <linux-kselftest@archiver.kernel.org>; Sat, 16 Sep 2023 02:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238431AbjIPC0q (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 15 Sep 2023 22:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238551AbjIPC0P (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 15 Sep 2023 22:26:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670DE195;
        Fri, 15 Sep 2023 19:26:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11994C433C7;
        Sat, 16 Sep 2023 02:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694831170;
        bh=sJzZeBQQH+9c13mQAMW2013+6AUbvTRRMEez+d4CAbY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=JYoxJVj/6RScY2ul8Pt763aIayDeiFamfknxp4BEKy+oEVhiex7YtO32PDFaiYLUK
         ApYIzbR5H7o6QSUF7ZPlEFyIgUlIdaXWHGxCd/LM6vajOWTqAlsliTxyrSnDVqs8u+
         9RFP4i9u+w6KiGpN2PyxcvSBMk+2IlNblyMguMy3pLaREsnEyarSdGHMGyJDmekwn3
         2TA9/1LnfC2cQUQdRjdS9EhBygUeLBARs3qFNYAswah9u3Y+h5z8dIDEQO/IplqUHS
         m+1oawg9s5GDmH9TUHjxlSbXAaRBK9u+YoMkiFH+0RWCPKL+kEpmQoEqIvStYUrDoU
         09ZedBkovhCHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9864E26880;
        Sat, 16 Sep 2023 02:26:09 +0000 (UTC)
Subject: Re: [GIT PULL] Kselftest second fixes update for Linux 6.6-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <9e0ad8c3-4441-d054-208f-657fe4faff5e@linuxfoundation.org>
References: <9e0ad8c3-4441-d054-208f-657fe4faff5e@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <9e0ad8c3-4441-d054-208f-657fe4faff5e@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-6.6-rc2
X-PR-Tracked-Commit-Id: 7e021da80f48582171029714f8a487347f29dddb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57d88e8a5974644039fbc47806bac7bb12025636
Message-Id: <169483116994.10033.2548666273472168813.pr-tracker-bot@kernel.org>
Date:   Sat, 16 Sep 2023 02:26:09 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Fri, 15 Sep 2023 12:37:09 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-6.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57d88e8a5974644039fbc47806bac7bb12025636

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
