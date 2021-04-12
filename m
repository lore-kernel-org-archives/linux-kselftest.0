Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C8C433ED
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Apr 2021 07:15:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3091C61206
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Apr 2021 07:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbhDLHQI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 12 Apr 2021 03:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhDLHQI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 12 Apr 2021 03:16:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79E3C061574
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Apr 2021 00:15:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 6E3C31F44F7F
Message-ID: <a582e59cdca782125929a88318eeebd24c7fda8f.camel@collabora.com>
Subject: Re: [PATCH v3] selftests/mincore: get readahead size for
 check_file_mmap()
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Jeffle Xu <jefflexu@linux.alibaba.com>, shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org,
        James Wang <jnwang@linux.alibaba.com>
Date:   Mon, 12 Apr 2021 09:15:41 +0200
In-Reply-To: <20210412034622.59737-1-jefflexu@linux.alibaba.com>
References: <20210403063800.56278-1-jefflexu@linux.alibaba.com>
         <20210412034622.59737-1-jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Jeffle,

Thanks for the patch.

On Mon, 2021-04-12 at 11:46 +0800, Jeffle Xu wrote:
> -	i = FILE_SIZE / 2 / page_size + 1;
> +	i = file_size / 2 / page_size + 1;
>  	while (i < vec_size && vec[i]) {
>  		ra_pages++;
>  		i++;

One minor nit: now that you know the readahead size exactly, this could check
that only the readahead window has been loaded and that anything beyond that is
still not populated.

Acked-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

