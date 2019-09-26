Return-Path: <SRS0=kbk0=XV=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4003AC4360C
	for <linux-kselftest@archiver.kernel.org>; Thu, 26 Sep 2019 20:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BA5022466
	for <linux-kselftest@archiver.kernel.org>; Thu, 26 Sep 2019 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569528627;
	bh=iSojXQKpnvd/5Lcou9mG4PGqSh4IsNSxoQH2spGYr1s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=RBQOW/1UHb+dvsto7mIqXFBjjcuam1+GjenFOw0kgS9U6TXwGWMVQZO3you3A4Tj6
	 rtiZPg9lUhTRQqAaJtRM8W11UjS4ZWHN/0gDSCBtbAn6gV1JeI7Oqhvl8CXy3UDO98
	 9EjDaHQsFfWwxWx8jiu+VwdQFhF1HefqBawl9bk0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfIZUK0 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 26 Sep 2019 16:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728793AbfIZUK0 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 26 Sep 2019 16:10:26 -0400
Subject: Re: [GIT PULL] Kselftest update for Linux 5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569528626;
        bh=iSojXQKpnvd/5Lcou9mG4PGqSh4IsNSxoQH2spGYr1s=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=qdfg7sDmH9wzKhWvklGVBWGjF2SdgRWfHT5crmXm3V9uL4d7UNVO1EjSWeRxzn91N
         9eau7kDfzUA1e+YGbCRQF+jjDx4diFHFfUa54wVGP135ms5fNqkGL9fm+51gGcUMja
         Z+oHc6NiLr6i7hDh/qSVwkMXq4H1vOALx5YRJVsw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <47009c0c-9b64-5824-0c1c-8cdc1a2265de@linuxfoundation.org>
References: <47009c0c-9b64-5824-0c1c-8cdc1a2265de@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <47009c0c-9b64-5824-0c1c-8cdc1a2265de@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
 tags/linux-kselftest-5.4-rc1.1
X-PR-Tracked-Commit-Id: 721cb3c8bc8890e824b7be53bf951960ff7811f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 797a3242755da1b7c1ada6fb153cb2700ef30a80
Message-Id: <156952862613.24871.2602067850286581209.pr-tracker-bot@kernel.org>
Date:   Thu, 26 Sep 2019 20:10:26 +0000
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The pull request you sent on Mon, 23 Sep 2019 16:40:15 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-5.4-rc1.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/797a3242755da1b7c1ada6fb153cb2700ef30a80

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
