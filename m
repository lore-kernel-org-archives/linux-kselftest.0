Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE1C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 18 May 2022 19:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241783AbiERTLF (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 18 May 2022 15:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241816AbiERTLA (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 18 May 2022 15:11:00 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30FB3CA5B;
        Wed, 18 May 2022 12:10:57 -0700 (PDT)
Date:   Wed, 18 May 2022 12:10:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1652901055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s+1S5oiqjwIZadYELmF2S/BTaDdI1LCNsMORIY21/xg=;
        b=r9WbttEwBv0H0Qu6kTFvKCuCzlTF2MayFPQ9OU3u+xq+tDhrrx0fqd5OCFasXFBZr0cVGG
        qaiN44KqD2ppXQVz4W15Y41FAlxyhv1zK0WR6L8x0EIHsTTmNQuAEUwAdPo8K4QYJ9+x9+
        QT8ltuHoGR95v/HO9gC4YFFD91XV+Ws=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Roman Gushchin <roman.gushchin@linux.dev>
To:     Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc:     cgroups@vger.kernel.org, linux-mm@kvack.org,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Richard Palethorpe <rpalethorpe@suse.de>
Subject: Re: [PATCH v2 4/5] selftests: memcg: Remove protection from top
 level memcg
Message-ID: <YoVEuWwZACdfkEvF@carbon>
References: <20220518161859.21565-1-mkoutny@suse.com>
 <20220518161859.21565-5-mkoutny@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518161859.21565-5-mkoutny@suse.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, May 18, 2022 at 06:18:58PM +0200, Michal Koutny wrote:
> The reclaim is triggered by memory limit in a subtree, therefore the
> testcase does not need configured protection against external reclaim.
> 
> Also, correct respective comments
> 
> Signed-off-by: Michal Koutný <mkoutny@suse.com>

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
