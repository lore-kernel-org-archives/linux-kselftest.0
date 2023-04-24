Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E8BC77B7F
	for <linux-kselftest@archiver.kernel.org>; Mon, 24 Apr 2023 19:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjDXTtu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 24 Apr 2023 15:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjDXTtj (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 24 Apr 2023 15:49:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448AD6198;
        Mon, 24 Apr 2023 12:49:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C57B2628C7;
        Mon, 24 Apr 2023 19:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DFE6C433D2;
        Mon, 24 Apr 2023 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682365742;
        bh=Yqq9MgdKtSPO1lrsEqOXiYWx3QEIAGZBp+WSsJMD1a8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=J5NvV8ewZ6t6PFc2ztQfEfOzgvw0pOK/NVrQi4oD1Imm8ACSdpKYEG1MDaV85DVuk
         YQhItWkEjzQNoTnmbs+oDc6SPMzl8Aeir1OjkMkO6EvMGeGdxwTKhRkLEdhIHrvsx8
         wx6Fw6mFczRpIc+Mwhr98FkoCP09HEAwpyZinW/I9XR6+IEi+G4GpfvRVjQQhqTKOY
         vZCShQI/C3740zogqBVe+SBUy7sIBG/OTKzi2CMbx28NU8UnaFb8Z+bxnCIvlQ13uI
         tVqiac1soFuJHdmvkEK2kLPfJP2mL95dJMZ8Yzu/8tyBPiSnDORIopmCO6H3g4Up1d
         5f/oC2xOLF6+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 194F5E21ED9;
        Mon, 24 Apr 2023 19:49:02 +0000 (UTC)
Subject: Re: [GIT PULL] KUnit next update for Linux 6.4-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <c0903897-d542-eaaa-11ba-d7e19d282fce@linuxfoundation.org>
References: <c0903897-d542-eaaa-11ba-d7e19d282fce@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <c0903897-d542-eaaa-11ba-d7e19d282fce@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-kunit-6.4-rc1
X-PR-Tracked-Commit-Id: a42077b787680cbc365a96446b30f32399fa3f6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1be89faab3cf1f3dd6eb4924b60d2b9094e7206b
Message-Id: <168236574209.6990.14006822455715573431.pr-tracker-bot@kernel.org>
Date:   Mon, 24 Apr 2023 19:49:02 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        skhan@linuxfoundation.org, shuah@kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Sun, 23 Apr 2023 10:56:38 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-kunit-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1be89faab3cf1f3dd6eb4924b60d2b9094e7206b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
