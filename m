Return-Path: <SRS0=AyEC=EM=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15897C5517A
	for <linux-kselftest@archiver.kernel.org>; Fri,  6 Nov 2020 07:57:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B415D206D4
	for <linux-kselftest@archiver.kernel.org>; Fri,  6 Nov 2020 07:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFH5H (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 6 Nov 2020 02:57:07 -0500
Received: from verein.lst.de ([213.95.11.211]:50458 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgKFH5H (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 6 Nov 2020 02:57:07 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id B130A68B05; Fri,  6 Nov 2020 08:57:05 +0100 (CET)
Date:   Fri, 6 Nov 2020 08:57:05 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ralph Campbell <rcampbell@nvidia.com>
Cc:     linux-mm@kvack.org, nouveau@lists.freedesktop.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jerome Glisse <jglisse@redhat.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Bharata B Rao <bharata@linux.ibm.com>,
        Zi Yan <ziy@nvidia.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 2/6] mm/migrate: move migrate_vma_collect_skip()
Message-ID: <20201106075705.GC31341@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com> <20201106005147.20113-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
