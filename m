Return-Path: <SRS0=Qi7a=6O=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85A1C47254
	for <linux-kselftest@archiver.kernel.org>; Thu, 30 Apr 2020 23:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7E522173E
	for <linux-kselftest@archiver.kernel.org>; Thu, 30 Apr 2020 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588290619;
	bh=HBYTOdfjxSXrfjQy21aZ+AYPOe0FaEiPp/HkHkNwNPc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=ussUi2yu8/cjdhYZ4VXPhm6MExkyLsrq99yDSu0wOMa+sZfeMJquUmUiavH2tG6Q6
	 S5jGWm+a1/zSMkaIDou+Khwb/jglrKXv7sklhKZv0SnBXeGiBjJqQohoS5SPgmjICV
	 feAo2N4RMI2m7Y6Sq99Tn5yRutHCRw3VLgHyeOEo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgD3XuM (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 30 Apr 2020 19:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:59882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgD3XuL (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 30 Apr 2020 19:50:11 -0400
Subject: Re: [GIT PULL] Kselftest update for Linux 5.7-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588290611;
        bh=HBYTOdfjxSXrfjQy21aZ+AYPOe0FaEiPp/HkHkNwNPc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=sSeCRcVls7bxZzOKQR4DedD0Rfl2sHHA0213LVJoDOSkS8j/U92NXm8ry4Wsu9Vj3
         CC1lQe0erzYcegokoxHjr0GP1+IbsiHCUp5y9TlRpVCq2WZDJOgq4L5Y2D2BwTyZsb
         3254MUuqZAqf5AcwrQkzLqbE4cCkoFR9ysJ18oVY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <fbc67b4b-a23e-2788-da18-7bb168ba5fd6@linuxfoundation.org>
References: <fbc67b4b-a23e-2788-da18-7bb168ba5fd6@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fbc67b4b-a23e-2788-da18-7bb168ba5fd6@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
 tags/linux-kselftest-5.7-rc4
X-PR-Tracked-Commit-Id: f0c0d0cf590f71b2213b29a7ded2cde3d0a1a0ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75ec0ba2acf45cc31b5b59e00106a55494c62209
Message-Id: <158829061145.2910.15711180473019795925.pr-tracker-bot@kernel.org>
Date:   Thu, 30 Apr 2020 23:50:11 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        skhan@linuxfoundation.org, Steven Rostedt <rostedt@goodmis.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Thu, 30 Apr 2020 11:59:00 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-5.7-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75ec0ba2acf45cc31b5b59e00106a55494c62209

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
