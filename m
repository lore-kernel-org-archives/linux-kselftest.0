Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFCFC43460
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Apr 2021 09:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAA3C6120E
	for <linux-kselftest@archiver.kernel.org>; Wed, 14 Apr 2021 09:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhDNJR4 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 14 Apr 2021 05:17:56 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:34318 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232715AbhDNJR4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 14 Apr 2021 05:17:56 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UVXq4Eo_1618391853;
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0UVXq4Eo_1618391853)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 14 Apr 2021 17:17:34 +0800
Subject: Re: [PATCH v3] selftests/mincore: get readahead size for
 check_file_mmap()
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org,
        James Wang <jnwang@linux.alibaba.com>
References: <20210403063800.56278-1-jefflexu@linux.alibaba.com>
 <20210412034622.59737-1-jefflexu@linux.alibaba.com>
 <a582e59cdca782125929a88318eeebd24c7fda8f.camel@collabora.com>
From:   JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <bb013423-f9b7-6fcb-944b-fb7a9b27dc4b@linux.alibaba.com>
Date:   Wed, 14 Apr 2021 17:17:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a582e59cdca782125929a88318eeebd24c7fda8f.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org



On 4/12/21 3:15 PM, Ricardo Cañuelo wrote:
> Hi Jeffle,
> 
> Thanks for the patch.
> 
> On Mon, 2021-04-12 at 11:46 +0800, Jeffle Xu wrote:
>> -	i = FILE_SIZE / 2 / page_size + 1;
>> +	i = file_size / 2 / page_size + 1;
>>  	while (i < vec_size && vec[i]) {
>>  		ra_pages++;
>>  		i++;
> 
> One minor nit: now that you know the readahead size exactly, this could check
> that only the readahead window has been loaded and that anything beyond that is
> still not populated.

Thanks for reviewing. Yes it is. I can add this if the readahead
algorithm on this issue (touching the first page) is relatively stable,
since the readahead algorithm is not a ABI. Though selftest itself is
closely coupled with kernel.

> 
> Acked-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> 

-- 
Thanks,
Jeffle
