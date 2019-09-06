Return-Path: <SRS0=iaoj=XB=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26557C43331
	for <linux-kselftest@archiver.kernel.org>; Fri,  6 Sep 2019 13:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D86BF20842
	for <linux-kselftest@archiver.kernel.org>; Fri,  6 Sep 2019 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567777918;
	bh=as/XjEUMXPVqoYxYK9HcXrjJdB7meJhPBQv74NDA/Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1XiLDKCjdc7M+mT7/4knf7Nt+G/TVJYnugtIkk2Q5dIPEItoELARi5oiqNTQ/8mGk
	 iUCAXoeWjlWZuK/K27gcj3ClQ3147fIPGL6ki9htjS7zeO5AlF8FIlq32xGm7X08dY
	 PU0eFWf0W7J1dXTLe8oexF0auB8dCO+rC+MPNaNs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733057AbfIFNv5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 6 Sep 2019 09:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732267AbfIFNv5 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 6 Sep 2019 09:51:57 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6AE9206B8;
        Fri,  6 Sep 2019 13:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567777916;
        bh=as/XjEUMXPVqoYxYK9HcXrjJdB7meJhPBQv74NDA/Dk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iMZVKIcOsXlK0ngWB5tyhZEhgyNFdmZHPUhDUdhmVp+8oNUG/hplV1I6BSIy1yYbg
         GMoDei2fYhooB2Lhxi8Jx6If241kcTs4lAIrBhENf86AzWSP/CfqMOnzjr3i+zT9WT
         1h6XQDCU+hbkkt7A0kSKkKu5auro86K7FdeEEZgU=
Date:   Fri, 6 Sep 2019 14:51:52 +0100
From:   Will Deacon <will@kernel.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Amit Kachhap <Amit.Kachhap@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH ARM64] selftests, arm64: add kernel headers path for
 tags_test
Message-ID: <20190906135151.d74nq3qzjmhe4mb5@willie-the-truck>
References: <c28135c82eaf6d6e2c7e02c1ebc2b99a607d8116.1567615235.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28135c82eaf6d6e2c7e02c1ebc2b99a607d8116.1567615235.git.andreyknvl@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 04, 2019 at 06:41:00PM +0200, Andrey Konovalov wrote:
> tags_test.c relies on PR_SET_TAGGED_ADDR_CTRL/PR_TAGGED_ADDR_ENABLE being
> present in system headers. When this is not the case the build of this
> test fails with undeclared identifier errors.
> 
> Fix by providing the path to the KSFT installed kernel headers in CFLAGS.
> 
> Reported-by: Cristian Marussi <cristian.marussi@arm.com>
> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  tools/testing/selftests/arm64/Makefile | 1 +
>  1 file changed, 1 insertion(+)

Damn, I just tagged the arm64 queue for 5.4 and didn't spot this patch.

I'll queue it at -rc1 instead, if that's ok? It doesn't look urgent.

Thanks,

Will
