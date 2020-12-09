Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0570BC433FE
	for <linux-kselftest@archiver.kernel.org>; Wed,  9 Dec 2020 14:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9A5A23B51
	for <linux-kselftest@archiver.kernel.org>; Wed,  9 Dec 2020 14:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732740AbgLIOVQ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 9 Dec 2020 09:21:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:54236 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbgLIOVQ (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 9 Dec 2020 09:21:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607523629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=POkLNELGduE5m66OBXMomuOICP3I/fyaQ7AbYKysiS8=;
        b=IzVHwKU1TE7fPiWDwxlyN78he1vizaScDInACxXd41AAKsdU2Wh35yG/NTLCT05EaxaqkV
        ikGLtFOFIglZZf3aPJzHqpoQtmme35nRGFyyjHZpdt0ZAXvpFr51BucG69V2+R4ysDZ3R8
        7f68AMedLbWzJOJoAo0rOcXP2wblyHU=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 82C30ACEB;
        Wed,  9 Dec 2020 14:20:29 +0000 (UTC)
Date:   Wed, 9 Dec 2020 15:20:29 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        shuah@kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] selftests: lib: Add wrapper script for test_scanf
Message-ID: <X9DdLWvl5oThQO59@alley>
References: <20201130145800.19960-1-rf@opensource.cirrus.com>
 <20201130145800.19960-3-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130145800.19960-3-rf@opensource.cirrus.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon 2020-11-30 14:57:59, Richard Fitzgerald wrote:
> Adds a wrapper shell script for the test_scanf module.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
