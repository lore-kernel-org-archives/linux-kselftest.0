Return-Path: <SRS0=wMNL=DF=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EFCC2D0A8
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Sep 2020 19:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E26208D5
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Sep 2020 19:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MwztjGxe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgI1T7A (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 28 Sep 2020 15:59:00 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1318 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI1T7A (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 28 Sep 2020 15:59:00 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f72401f0000>; Mon, 28 Sep 2020 12:57:19 -0700
Received: from [10.2.53.30] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Sep
 2020 19:58:55 +0000
Subject: Re: [PATCH 7/8] selftests/vm: run_vmtest.sh: update and clean up
 gup_test invocation
To:     Ira Weiny <ira.weiny@intel.com>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-s390@vger.kernel.org>
References: <20200928062159.923212-1-jhubbard@nvidia.com>
 <20200928062159.923212-8-jhubbard@nvidia.com>
 <20200928192619.GF458519@iweiny-DESK2.sc.intel.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <176baf45-d2c7-0c74-f552-22361866d365@nvidia.com>
Date:   Mon, 28 Sep 2020 12:58:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928192619.GF458519@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601323039; bh=InzEzYCH/2Dx5AYCDHf17XufKcWKsou9uJe1itYgGDo=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=MwztjGxexeXt76/WGabmo/tm6bXP/E5fHgXFNxlAWXnNkr6cDLt0YSrsAxPj9+1fb
         LuKYjcjeNGBeoUdzDHjAY3fsZCDQG33Xw46fh3wI1Z2HqqVrJXTFzCLU0Fvmaal/sT
         ZZ5CvRUPJQMtmVxU6TpLWv5V60f+EAC16uw9BCNfF6XRYNe/OSyndnOAUyqGy70BIH
         +rSiRP8DV9RjJVKGw2+4+uGAZ+adLxCuR4kC+CDC/yiRa0gqg6EfkYYIwrerLol6db
         P7Wcu9JlMlJH8Grv81AjnvkQsd7OFDBDKkxwLcdIYeue3DH2eo6hqTgrKTdoI5ruY8
         +ayOHRmkJsAUg==
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 9/28/20 12:26 PM, Ira Weiny wrote:
> On Sun, Sep 27, 2020 at 11:21:58PM -0700, John Hubbard wrote:
...
>> +echo "--------------------------------------------------------------"
>> +echo "running gup_test -ct -F 0x1 0 19 0x1000"
>> +echo "   Dumps pages 0, 19, and 4096, using pin_user_pages (-F 0x1)"
>> +echo "--------------------------------------------------------------"
>> +./gup_test -ct -F 0x1 0 19 0x1000
> 
> Ah here it is...  Maybe just remove that from the previous commit message.
> 
> Ira

Yes, will do, thanks for spotting that.

thanks,
-- 
John Hubbard
NVIDIA
