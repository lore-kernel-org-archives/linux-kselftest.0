Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACECC83F17
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Aug 2023 02:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbjH2CKg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 28 Aug 2023 22:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbjH2CKd (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 28 Aug 2023 22:10:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1AF1B3;
        Mon, 28 Aug 2023 19:10:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBE7963E04;
        Tue, 29 Aug 2023 02:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A89AAC43391;
        Tue, 29 Aug 2023 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693275027;
        bh=8eHsSDXVOlWU033VDB1Rr57oQ9L6Y5iZ7bVOAgG0Ml4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=H5vbvgMS/N7vvgoFFDSzTuaxIqlDJV9MKo7zooqzhNL9f0hTSJ9dGlQpFji+EmPWu
         huIQ+Sa9M3Z/eKyoJaaEj+crC77hdoIl7jMaF61mRq/MchTJvkdesM/0OZmeupg0dQ
         yoKuw5L3LTxqXevc2dWkl0eDnghIMIryRD9m2Q+xCuBmvz1cI54OFei4sTnDiNZu+c
         r+ue8vg08oOSlboaHKEIK1PJjGOWiu7H8K9oq63rUckrG+4NsMKXnDdeCkzqnWviP1
         qtfX4HxWJbTlaA7m1iPvRxFuxXfaOiU/KKA7pV+OMFVVG7+eXcg0KZ0yfvQ/kcrZyJ
         5DlFt/26JIm5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94F65E301F2;
        Tue, 29 Aug 2023 02:10:27 +0000 (UTC)
Subject: Re: [GIT PULL] nolibc changes for Linux 6.6-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <e648436f-f95c-f0e5-f341-3e640bfe1495@linuxfoundation.org>
References: <e648436f-f95c-f0e5-f341-3e640bfe1495@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <e648436f-f95c-f0e5-f341-3e640bfe1495@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-nolibc-6.6-rc1
X-PR-Tracked-Commit-Id: 556fb7131e03b0283672fb40f6dc2d151752aaa7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c59d383390f970b891b503b7f79b63a02db2ec5
Message-Id: <169327502760.1632.15557786194297609384.pr-tracker-bot@kernel.org>
Date:   Tue, 29 Aug 2023 02:10:27 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Willy Tarreau <w@1wt.eu>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
        "Paul E. McKenney" <paulmck@kernel.org>, shuah <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Christian Brauner <brauner@kernel.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Mon, 28 Aug 2023 12:32:58 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-nolibc-6.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c59d383390f970b891b503b7f79b63a02db2ec5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
