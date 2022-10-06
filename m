Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDFCC4332F
	for <linux-kselftest@archiver.kernel.org>; Thu,  6 Oct 2022 20:03:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbiJFUDt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 6 Oct 2022 16:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbiJFUDr (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 6 Oct 2022 16:03:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A62B1B88;
        Thu,  6 Oct 2022 13:03:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9A7E61AA9;
        Thu,  6 Oct 2022 20:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 113D0C433D6;
        Thu,  6 Oct 2022 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665086626;
        bh=L2m6Zkl49Bn7mYin8THUDHOlVfEwqK6X8jln8pDyE1Q=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mCX8YiSNyDrJDLOIWTTxcCzzksVJAYsbfViwEim1bgBqzK+shgL1zYqubZLoVv5Lz
         G54PAsaTdDbkaBgE6RiVv9EIN50zcq7uexizM4CAguwPtIHuJ8//MiqOJaM9WDFcjQ
         GjTo3bdJ3b855PHM1O/0gluFr0ls0kfwrUCGuh3ZeXN24GkRRzxT8QzlhIzPBUEZyt
         vJugfaoj1qOsfBTL6620VPHR6zyNlvWTyOHNfpOBrYFrvbveOenDryV5+UCEDH5AAb
         JJsARIF5nSIuiUtxAtaZ/27Cyq9JJjMIGTEaJqw4pwyCk62XSeUl+eEVevqTpDBrS9
         DTL/LG3HEDKDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2CF1E2A05E;
        Thu,  6 Oct 2022 20:03:45 +0000 (UTC)
Subject: Re: [GIT PULL] Kselftest update for Linux 6.1-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <e1d53622-389c-955c-4ac8-801241b77d0b@linuxfoundation.org>
References: <e1d53622-389c-955c-4ac8-801241b77d0b@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <e1d53622-389c-955c-4ac8-801241b77d0b@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-next-6.1-rc1
X-PR-Tracked-Commit-Id: 83e14a57d59f22a89ad7d59752f5b69189299531
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd42d9c3f461a7dc896076691ba42cf97225973e
Message-Id: <166508662598.28289.1922857696532151974.pr-tracker-bot@kernel.org>
Date:   Thu, 06 Oct 2022 20:03:45 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Wed, 5 Oct 2022 13:32:06 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-next-6.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd42d9c3f461a7dc896076691ba42cf97225973e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
