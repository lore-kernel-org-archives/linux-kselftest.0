Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1338C4361B
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Dec 2020 10:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84FD823A5B
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Dec 2020 10:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389112AbgLRKrp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 18 Dec 2020 05:47:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:37526 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389108AbgLRKro (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 18 Dec 2020 05:47:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1608288418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3swyT71jdbCCI5HZXDPvWCHg/P1y67H2zIpHLs3RIh4=;
        b=SV1UffwU9XB43+pLJFmwrqvNHdW93HO+IKZcHSRIDRHPmIuFj3PIr/zSUQU2nUkxTjkpJR
        xlWtBd3EMc17CFEk6RjXmwkuhfkql4ZnNn7tIlb2gDIHdQOV7b6g6Uu3PvBRSqFl4vrvux
        atuGslIivJVgEGK9baTbWT3CH3YieV0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 36198ACF9;
        Fri, 18 Dec 2020 10:46:58 +0000 (UTC)
Date:   Fri, 18 Dec 2020 11:46:55 +0100
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
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
Message-ID: <20201218104655.GW32193@dhcp22.suse.cz>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217185243.3288048-9-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu 17-12-20 13:52:41, Pavel Tatashin wrote:
[...]
> +#define PINNABLE_MIGRATE_MAX	10
> +#define PINNABLE_ISOLATE_MAX	100

Why would we need to limit the isolation retries. Those should always be
temporary failure unless I am missing something. I am not sure about the
PINNABLE_MIGRATE_MAX either. Why do we want to limit that? migrate_pages
already implements its retry logic why do you want to count retries on
top of that? I do agree that the existing logic is suboptimal because
the migration failure might be ephemeral or permanent but that should be
IMHO addressed at migrate_pages (resp. unmap_and_move) and simply report
failures that are permanent - e.g. any potential pre-existing long term
pin - if that is possible at all. If not what would cause permanent
migration failure? OOM?
-- 
Michal Hocko
SUSE Labs
