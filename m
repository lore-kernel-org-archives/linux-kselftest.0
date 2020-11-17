Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535E9C2D0E4
	for <linux-kselftest@archiver.kernel.org>; Tue, 17 Nov 2020 21:10:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA31924181
	for <linux-kselftest@archiver.kernel.org>; Tue, 17 Nov 2020 21:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fYMULdu+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKQVKN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 17 Nov 2020 16:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgKQVKN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 17 Nov 2020 16:10:13 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F9EC0613CF;
        Tue, 17 Nov 2020 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ri91W8ocs5j1kEkJ2qPP/wzX2scE1yNyfb4YmTpxrH4=; b=fYMULdu+st/sND/Y5nBpk1vwEM
        ZQqyFcbp0+JR5ZHTbEAnEyhsAspAv47XXzbUVytwqPrGuBFzZ8bwuWkg1WO89PU4uFmLgdz4XwFga
        AOJbkcINoGPsc9xC6lZpMV2dUVuivhAnGHstzSLmu8zPC0tp4fiNgagOr+eKyGKxM1FUZx3PaG5Sv
        p9TkaJpnsVGA2nyBr10k911eb9a9OoieU95yaxy7ZO6tgiTsP9g8uOMJnXDnkQrWEHqs3wZsiihkf
        E2RvJ200E479oTK+PrsvX407onFO8I0qmu4VInGHtJyt1cmi2Se0JPJ469qJTwHyTbCc6TC2pJBhG
        SSixLeNw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kf8Ej-0003Zr-8e; Tue, 17 Nov 2020 21:10:01 +0000
Date:   Tue, 17 Nov 2020 21:10:01 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Zi Yan <ziy@nvidia.com>
Cc:     linux-mm@kvack.org,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Yang Shi <shy828301@gmail.com>,
        Michal Hocko <mhocko@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        David Nellans <dnellans@nvidia.com>
Subject: Re: [RFC PATCH 3/6] mm: page_owner: add support for splitting to any
 order in split page_owner.
Message-ID: <20201117211001.GY29991@casper.infradead.org>
References: <20201111204008.21332-1-zi.yan@sent.com>
 <20201111204008.21332-4-zi.yan@sent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111204008.21332-4-zi.yan@sent.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Nov 11, 2020 at 03:40:05PM -0500, Zi Yan wrote:
> -	for (i = 0; i < nr; i++) {
> +	for (i = 0; i < nr; i += (1 << new_order)) {
>  		page_owner = get_page_owner(page_ext);
> -		page_owner->order = 0;
> +		page_owner->order = new_order;
>  		page_ext = page_ext_next(page_ext);
>  	}

This doesn't do what you're hoping it will.  It's going to set ->order to
new_order for the first N pages instead of every 1/N pages.

You'll need to do something like

		page_ext = lookup_page_ext(page + i);

or add a new page_ext_add(page_ext, 1 << new_order);
