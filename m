Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433A0C433ED
	for <linux-kselftest@archiver.kernel.org>; Fri,  2 Apr 2021 14:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F199F6100C
	for <linux-kselftest@archiver.kernel.org>; Fri,  2 Apr 2021 14:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbhDBOmD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 2 Apr 2021 10:42:03 -0400
Received: from verein.lst.de ([213.95.11.211]:43803 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235829AbhDBOmD (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 2 Apr 2021 10:42:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 63D5768BEB; Fri,  2 Apr 2021 16:42:00 +0200 (CEST)
Date:   Fri, 2 Apr 2021 16:42:00 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Hao Fang <fanghao11@huawei.com>
Cc:     hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        song.bao.hua@hisilicon.com, iommu@lists.linux-foundation.org,
        linuxarm@openeuler.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: benchmark: use the correct HiSilicon
 copyright
Message-ID: <20210402144200.GC19219@lst.de>
References: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617086028-18986-1-git-send-email-fanghao11@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Thanks, applied.
