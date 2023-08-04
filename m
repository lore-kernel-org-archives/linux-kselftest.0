Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8FAC001DB
	for <linux-kselftest@archiver.kernel.org>; Fri,  4 Aug 2023 06:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbjHDGsP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 4 Aug 2023 02:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbjHDGrw (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 4 Aug 2023 02:47:52 -0400
X-Greylist: delayed 608 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Aug 2023 23:47:32 PDT
Received: from out-74.mta1.migadu.com (out-74.mta1.migadu.com [IPv6:2001:41d0:203:375::4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7494C38
        for <linux-kselftest@vger.kernel.org>; Thu,  3 Aug 2023 23:47:31 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1691131041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MNm9pORzTgeogyqyW+mD8AlYYC8dXpJMUZdeirF8KCc=;
        b=lGU4btESR6WhEkMDXa2K6SgziaZU8b0hBHTqqAyF7szoZin5ZQ2hAjVHd1brkR/ab5Pt1E
        EBkiru/eTktl0j/74+CcJPbEcas/cdaQVsMEanF1vKFOevsW382PoWFv7lWAEZUBjxY5nV
        ozwpR2K+WN/7PlcwbrKAt776kTFudsg=
MIME-Version: 1.0
Subject: Re: [PATCH v3] selftests: cgroup: fix test_kmem_basic slab1 check
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Muchun Song <muchun.song@linux.dev>
In-Reply-To: <zff2gqiy4cggy4px2hbcyna6eipy56qc4itx5cx5agtxlzdxt7@dvfdarqkucac>
Date:   Fri, 4 Aug 2023 14:36:36 +0800
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <22339C68-8BCA-4CB4-895B-9FE679D4D34B@linux.dev>
References: <zff2gqiy4cggy4px2hbcyna6eipy56qc4itx5cx5agtxlzdxt7@dvfdarqkucac>
To:     Lucas Karpinski <lkarpins@redhat.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org



> On Aug 4, 2023, at 02:25, Lucas Karpinski <lkarpins@redhat.com> wrote:
> 
> test_kmem_basic creates 100,000 negative dentries, with each one mapping
> to a slab object. After memory.high is set, these are reclaimed through
> the shrink_slab function call which reclaims all 100,000 entries. The
> test passes the majority of the time because when slab1 is calculated,
> it is often above 0, however, 0 is also an acceptable value.
> 
> Signed-off-by: Lucas Karpinski <lkarpins@redhat.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks

