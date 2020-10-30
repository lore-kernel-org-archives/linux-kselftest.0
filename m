Return-Path: <SRS0=eqYf=EF=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510B5C00A89
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Oct 2020 16:02:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D773220724
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Oct 2020 16:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dqLGMyFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgJ3QCo (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Oct 2020 12:02:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:51494 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJ3QCo (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Oct 2020 12:02:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1604073763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c1vCUXQx+8ujG1SC6TG7vRFSLw+HgEPq/pfglble5SE=;
        b=dqLGMyFgMFJUqcupJ4r9KTUvdptU0xOcxXG+p9FKwbRQAhRVSkV9zEeA+RlnGZCI7FSKMp
        H/wz5CB3L7mk+IcApg3qcTT4HNyqE643kLbgRQ6mKQkrmXFd60XCHPgG64PAgBZdDbRygY
        bMRdq91KYbcTqan0mJ/Nl4crzQpZY+c=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3D367ACF5;
        Fri, 30 Oct 2020 16:02:43 +0000 (UTC)
Date:   Fri, 30 Oct 2020 17:02:42 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>,
        Willy Tarreau <w@1wt.eu>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arpitha Raghunandan <98.arpi@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH 2/4] kselftest_module.h: unconditionally expand the
 KSTM_MODULE_GLOBALS() macro
Message-ID: <20201030160242.GC20201@alley>
References: <20201025214842.5924-1-linux@rasmusvillemoes.dk>
 <20201025214842.5924-3-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201025214842.5924-3-linux@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sun 2020-10-25 22:48:40, Rasmus Villemoes wrote:
> Two out of three users of the kselftest_module.h header
> manually define the failed_tests/total_tests variables instead of
> making use of the KSTM_MODULE_GLOBALS() macro. However, instead of
> just replacing those definitions with an invocation of that macro,
> just unconditionally define them in the header file itself.
> 
> A coming change will add a few more global variables, and at least one
> of those will be referenced from kstm_report() - however, that's not
> possible currently, since when the definition is postponed until the
> test module invokes KSTM_MODULE_GLOBALS(), the variable is not defined
> by the time the compiler parses kstm_report().
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
