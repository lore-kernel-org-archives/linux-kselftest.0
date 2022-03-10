Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B25C433EF
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Mar 2022 06:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbiCJGnE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Mar 2022 01:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239882AbiCJGmr (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Mar 2022 01:42:47 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641C412E9F7
        for <linux-kselftest@vger.kernel.org>; Wed,  9 Mar 2022 22:41:47 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6452B68AFE; Thu, 10 Mar 2022 07:41:43 +0100 (CET)
Date:   Thu, 10 Mar 2022 07:41:43 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     hch@lst.de, shuah@kernel.org, chenxiang66@hisilicon.com,
        skhan@linuxfoundation.org, iommu@lists.linux-foundation.org,
        linux-kselftest@vger.kernel.org, linuxarm@openeuler.org
Subject: Re: [PATCH v2] dma-mapping: benchmark: Extract a common header
 file for map_benchmark definition
Message-ID: <20220310064143.GB24359@lst.de>
References: <20220308085910.37358-1-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308085910.37358-1-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Thanks,

applied to the dma-mapping tree for Linux 5.18.
