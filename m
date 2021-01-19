Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D49C43333
	for <linux-kselftest@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D8402310B
	for <linux-kselftest@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbhASSXI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392349AbhASSWm (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 19 Jan 2021 13:22:42 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEBAC0613D3
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Jan 2021 10:22:02 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id r9so14406403qtp.11
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Jan 2021 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QB+qlyJrpIAY9PAVjnSSlEibl/VpzXPECBF8avvNf9g=;
        b=ZpCwWJLwCV0bgOoVL6z7GNeJGgm4Ux+Pn0E59lHo+mYjHp2i9ibyDroLAo18CedooT
         kFWXI2RiwNofDz7OzfpMir+6mOPzVoHJJk5PdgdsJ5ei66lQrPeyFvwv+QcS3UNtCO0t
         2RFP05K/6+STlM5/b8Io3A+L3xuYA3g5q+gZAcQaSSDYMULQdlR85NzMPmd8ACUgE7RM
         qsH98a4Sx8cX+CQpht1G3I6dzGiflHirrC61n6MhKJhhRwsk7UNDQ6DHfb7k8P9K/v3+
         /KuKoV7IcO2i9d+7lQ8fiZxcxncF9vukjcoB36n4Z31WWTU9gMtM5Y295JWeXSWruOUx
         ic0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QB+qlyJrpIAY9PAVjnSSlEibl/VpzXPECBF8avvNf9g=;
        b=FYmR8ntn3GLRFVGv5J3l3Re8bZFKGEnSI/zvFkfYtWdN0sVpeiP5zOx/9Y+ze0p0P+
         gxW1sne2O2W6oV7f69hUNiCqhA0oZNvIqTYIlCsFJvOcKGEbx+Krnq29DRQ7VrqGjaM1
         wU+z9Zl5WwSQR3X0zfJzelD05nTQL6GffwfYcYHXcCLTwzYt/EwFZqJeSQ5ij6Gjrj/D
         eFjgzcRQXf+E116DdPdi+xFAwD+s2GWqkaBYsvtx2jBSNfEaRWP5nS3aNjXyTPX2yUO4
         ZmgUyVddHgl27ZUTydmzqGlbwyy9rU2fNYybn3n+uK+nGVSidW40n87uNVVOlDxr/zvT
         BQgA==
X-Gm-Message-State: AOAM533DKRTveAm90rSbh8jn8LTOBFBKvaZMN2jomOsUpM/t+35LoBrM
        0s7ifl1BfY6XiagGwRSEAojhUw==
X-Google-Smtp-Source: ABdhPJz2ZDCDvyVyZdPuux/jcDhvN+advwUUSodu2d8iZEb7w0r1BPV9yWMXcNjrYJ+DwwIBy9Vyyg==
X-Received: by 2002:ac8:7394:: with SMTP id t20mr5567220qtp.72.1611080521652;
        Tue, 19 Jan 2021 10:22:01 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id i3sm12711419qtd.95.2021.01.19.10.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:22:01 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l1vdg-003pV4-Mu; Tue, 19 Jan 2021 14:22:00 -0400
Date:   Tue, 19 Jan 2021 14:22:00 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org,
        ira.weiny@intel.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 04/14] mm/gup: check for isolation errors
Message-ID: <20210119182200.GZ4605@ziepe.ca>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
 <20210119043920.155044-5-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119043920.155044-5-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Jan 18, 2021 at 11:39:10PM -0500, Pavel Tatashin wrote:
> It is still possible that we pin movable CMA pages if there are isolation
> errors and cma_page_list stays empty when we check again.
> 
> Check for isolation errors, and return success only when there are no
> isolation errors, and cma_page_list is empty after checking.
> 
> Because isolation errors are transient, we retry indefinitely.
> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> ---
>  mm/gup.c | 60 ++++++++++++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 26 deletions(-)

This should have a fixme too, this is a bug.

The patch looks OK, but I keep feeling this logic is all really
overcomplicated...

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
