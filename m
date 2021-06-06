Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDE6C47096
	for <linux-kselftest@archiver.kernel.org>; Sun,  6 Jun 2021 12:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B073613F3
	for <linux-kselftest@archiver.kernel.org>; Sun,  6 Jun 2021 12:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhFFMOE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 6 Jun 2021 08:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhFFMOE (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 6 Jun 2021 08:14:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91101C061766;
        Sun,  6 Jun 2021 05:12:14 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4Fyb3J41gsz9sRN; Sun,  6 Jun 2021 22:12:12 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     mpe@ellerman.id.au, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     shuah@kernel.org, benh@kernel.crashing.org, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <1620903820-68213-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1620903820-68213-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] selftests/powerpc: Fix duplicate included pthread.h
Message-Id: <162298131858.2353459.10654405461714592334.b4-ty@ellerman.id.au>
Date:   Sun, 06 Jun 2021 22:08:38 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 13 May 2021 19:03:40 +0800, Jiapeng Chong wrote:
> Clean up the following includecheck warning:
> 
> ./tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c: pthread.h is
> included more than once.
> 
> No functional change.

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix duplicate included pthread.h
      https://git.kernel.org/powerpc/c/c67454615cf95160cb806f7a471158a901eb261d

cheers
