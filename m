Return-Path: <SRS0=Q6l9=DV=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A70C433DF
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Oct 2020 21:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE93B22251
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Oct 2020 21:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602711909;
	bh=l4y6kwexTQFPTMb10JAgiGeecC2eLWrufXIZID15zpk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=E2WS/VOCZI+icwxtCV1r+tjIM4NYMMOoI2tivCxn3+qcK12djDl+QKADPLEu8xGQR
	 ws+zG3zmPXJpW4SKyxwdsWrzsBwtHawELLIQ+FTI8CkueCK96xJG72t9UA0ChddFY4
	 edjL09JY/aVE4H3F4ozcKyGRBS+EQDqt6fRltUiU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgJNVpJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 14 Oct 2020 17:45:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbgJNVpJ (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 14 Oct 2020 17:45:09 -0400
Subject: Re: [GIT PULL] Kselftest fixes update for Linux 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602711908;
        bh=l4y6kwexTQFPTMb10JAgiGeecC2eLWrufXIZID15zpk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=UD2III9ZgEG4WQlI+j1d4fN8QejuJN43GevWYRQyjlB6GR7SWAmfDr9m/l7oCBUrr
         QNhQdRv5FpQ3B054xaWaiEhn9xCHOT4pZ75B0iIeY+3yjWNnnazYCHaEMsAZ2kNiBA
         Jffr3BONETphwIgiiD9XoSuMfKsXxS/fiaKKxrDM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <5d868b5d-f3b9-7419-7049-bb2a620493fe@linuxfoundation.org>
References: <5d868b5d-f3b9-7419-7049-bb2a620493fe@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <5d868b5d-f3b9-7419-7049-bb2a620493fe@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-5.10-rc1
X-PR-Tracked-Commit-Id: aa803771a80aa2aa2d5cdd38434b369066fbb8fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e51183e9462852ad8d1f3b6c687500b770605f4
Message-Id: <160271190837.18491.1977807483968993644.pr-tracker-bot@kernel.org>
Date:   Wed, 14 Oct 2020 21:45:08 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Joe Perches <joe@perches.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Tue, 13 Oct 2020 14:09:37 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-fixes-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e51183e9462852ad8d1f3b6c687500b770605f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
