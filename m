Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F2DC4167B
	for <linux-kselftest@archiver.kernel.org>; Sat, 17 Dec 2022 00:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiLQAAT (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiLPX7x (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 16 Dec 2022 18:59:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2908973B34;
        Fri, 16 Dec 2022 15:59:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2F41B81E4C;
        Fri, 16 Dec 2022 23:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21543C433EF;
        Fri, 16 Dec 2022 23:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1671235189;
        bh=ZpoFq55Y77qd6uUfcxBgUK1ahaF0X0CW4r+vmI/epIU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PXLQLKOleQNajfC41/4kxoBQYi2lNdL4QOwCY2P0hsWiwMWTu2PJtuVvGj6hRWI2b
         Coyjuev7HUBKyL3kYNG/NBdSHrxdzZvicb7Yd+n4B5gnAAJvVAgUfcWAGVCh3KUL/R
         3rLKqUxW8QEEyHqQeyfc9KiHM8nnfH4EM8cLh0Gw=
Date:   Fri, 16 Dec 2022 15:59:48 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] implement DAMOS filtering for anon pages and
Message-Id: <20221216155948.54023e407679736afcf00d9f@linux-foundation.org>
In-Reply-To: <20221205230830.144349-1-sj@kernel.org>
References: <20221205230830.144349-1-sj@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon,  5 Dec 2022 23:08:19 +0000 SeongJae Park <sj@kernel.org> wrote:

> Subject: [PATCH 00/11] implement DAMOS filtering for anon pages and

I rewrote this to

implement DAMOS filtering for anon pages and/or specific memory cgroups
