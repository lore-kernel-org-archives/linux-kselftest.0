Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500D9C433EF
	for <linux-kselftest@archiver.kernel.org>; Sun, 24 Jul 2022 15:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiGXPwv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 24 Jul 2022 11:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiGXPwu (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 24 Jul 2022 11:52:50 -0400
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51819DEE4;
        Sun, 24 Jul 2022 08:52:49 -0700 (PDT)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay03.hostedemail.com (Postfix) with ESMTP id E3711A018E;
        Sun, 24 Jul 2022 15:52:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 8784C20019;
        Sun, 24 Jul 2022 15:52:46 +0000 (UTC)
Message-ID: <63f42f9440b9d6d2f3e70902764e7a0c36e2f822.camel@perches.com>
Subject: Re: [PATCH] selftests/cgroup: fix repeated words in comments
From:   Joe Perches <joe@perches.com>
To:     wangjianli <wangjianli@cdjrlc.com>, tj@kernel.org,
        lizefan.x@bytedance.com, hannes@cmpxchg.org, shuah@kernel.org
Cc:     cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 24 Jul 2022 08:52:45 -0700
In-Reply-To: <20220724070435.7999-1-wangjianli@cdjrlc.com>
References: <20220724070435.7999-1-wangjianli@cdjrlc.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Stat-Signature: k76ay91j9jqsdqw3pftws5snd9oxise5
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 8784C20019
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18/wXezpvMNvbRSUduNys8ACV7DDKLW0Gs=
X-HE-Tag: 1658677966-267910
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sun, 2022-07-24 at 15:04 +0800, wangjianli wrote:
> Delete the redundant word 'in'.
[]
> diff --git a/tools/testing/selftests/cgroup/test_freezer.c b/tools/testing/selftests/cgroup/test_freezer.c
[]
> @@ -740,7 +740,7 @@ static int test_cgfreezer_ptraced(const char *root)
>  
>  	/*
>  	 * cg_check_frozen(cgroup, true) will fail here,
> -	 * because the task in in the TRACEd state.
> +	 * because the task in the TRACEd state.

presumably "is in"

>  	 */
>  	if (cg_freeze_wait(cgroup, false))
>  		goto cleanup;

