Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF953C1B08C
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Jul 2021 22:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCDE7613C9
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Jul 2021 22:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbhGNWyH (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 14 Jul 2021 18:54:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230495AbhGNWyF (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 14 Jul 2021 18:54:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5B73613C9;
        Wed, 14 Jul 2021 22:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1626303073;
        bh=xWDg8B305uVBjzOHgwnuqFiBf1NA/Vfbcq/Ijt0uu/0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=wg8Db4yOUBQ4ryGHB8E76Z1SCeA/e8Ueiydo+Ew+I7I4Q23UodHNgL/fjOp5MOL2q
         NDsigFzG6pOYw344JSnqqrTm/+lPKWr4J8zLmRKE3Ti+vwIOiIz4xroeoSgDk/nHwV
         842YkBAGsDGMEo7x8D/pcZHov65WyuAAu8Kouiks=
Date:   Wed, 14 Jul 2021 15:51:12 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc:     shuah@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        tyhicks@linux.microsoft.com, pasha.tatashin@soleen.com
Subject: Re: [PATCH v2 0/4] add KSM selftests
Message-Id: <20210714155112.b9688ba741a0e87245e6335c@linux-foundation.org>
In-Reply-To: <cover.1626252248.git.zhansayabagdaulet@gmail.com>
References: <cover.1626252248.git.zhansayabagdaulet@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 14 Jul 2021 14:56:01 +0600 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com> wrote:

> Introduce selftests to validate the functionality of KSM.

ooh, nice, thanks!  Now I'm wondering why I didn't ask for this when
KSM was initially merged...

