Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98CEC4361B
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Dec 2020 09:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFFBC23A80
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Dec 2020 09:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbgLRJoN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 18 Dec 2020 04:44:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:56658 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgLRJoN (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 18 Dec 2020 04:44:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1608284606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Kns51nghtkz6ndAww0GyVqmKXCNEXcevy0MsQVndr/Q=;
        b=BeXlxK9M4wgEVguLtRScCNhQjzll21viDpb7mjSOySSiwfuIAFOm6LrI5elHH55KfG81Qf
        t2uxwmdt6qwwCserYXTFBNQKHazYMkB5euGcVgHvByC/5JFQlY3mt5eyvJl7ihJWVtnK4X
        63LP2G/AU+lJ0CBSxgu5n2vySg4Nto0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 29927ACC4;
        Fri, 18 Dec 2020 09:43:26 +0000 (UTC)
Date:   Fri, 18 Dec 2020 10:43:24 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, david@redhat.com,
        osalvador@suse.de, dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/10] mm/gup: migrate pinned pages out of movable zone
Message-ID: <20201218094324.GT32193@dhcp22.suse.cz>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-6-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217185243.3288048-6-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu 17-12-20 13:52:38, Pavel Tatashin wrote:
> +	 * 1. Pinned pages: (long-term) pinning of movable pages is avoided
> +	 *    when pages are pinned and faulted, but it is still possible that
> +	 *    address space already has pages in ZONE_MOVABLE at the time when
> +	 *    pages are pinned (i.e. user has touches that memory before
> +	 *    pinning). In such case we try to migrate them to a different zone,
> +	 *    but if migration fails the pages can still end-up pinned in
> +	 *    ZONE_MOVABLE. In such case, memory offlining might retry a long
> +	 *    time and will only succeed once user application unpins pages.

I still dislike this. Pinning can fail so there shouldn't be any reasons
to break MOVABLE constrain for something that can be handled. If
anything there should be a very good reasoning behind this decision
documented.
-- 
Michal Hocko
SUSE Labs
