Return-Path: <SRS0=UMjK=DK=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF916C4363D
	for <linux-kselftest@archiver.kernel.org>; Sat,  3 Oct 2020 05:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 592B62072E
	for <linux-kselftest@archiver.kernel.org>; Sat,  3 Oct 2020 05:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="HgaGZVEP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbgJCFum (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 3 Oct 2020 01:50:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15671 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCFum (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 3 Oct 2020 01:50:42 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7810c90002>; Fri, 02 Oct 2020 22:48:57 -0700
Received: from [10.2.58.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Oct
 2020 05:50:36 +0000
Subject: Re: [PATCH] selftests/vm: 10x speedup for hmm-tests
To:     SeongJae Park <sj38.park@gmail.com>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kselftest@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>
References: <20201003052309.30013-1-sj38.park@gmail.com>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <d602102b-5e3b-2b93-43ed-c96cd14d2531@nvidia.com>
Date:   Fri, 2 Oct 2020 22:50:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201003052309.30013-1-sj38.park@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601704138; bh=SOLzP3xg8YsiH3PxRq3X4CuKhUkGJdTjj6mdMlAmI9U=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=HgaGZVEPOK+hHIKL4sU6bUI33DyJEObEq6gCCb4NspdqTuPSnwAJkabez6OtP+5qr
         t9qAOTwGtrhhm4B6RQ9SerUtuIzc4uCQVpUbVESoASExcZ0n/zK25u9D435UhlW2Il
         H8kuLwurjhGqOQYwf8L9KAMP7nutwEQ8/C33hkZSh7fYBP/09DvYkQzyO8DmgMsARx
         CGVDHFSydj0rbhT3T8GOWg0QyClju/mkfSxS5t/Zvxym4+uL6WvaP1jgAzneRogE/P
         /oqhZtdenvS6kHVLXAxLOvtBLYrQTSpgEkfcB29r4KmGhT75uPcmO42w2QyA3fTy42
         YLcDlpv8MwkHg==
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 10/2/20 10:23 PM, SeongJae Park wrote:
> On Fri, 2 Oct 2020 18:17:21 -0700 John Hubbard <jhubbard@nvidia.com> wrote:
> 
>> This patch reduces the running time for hmm-tests from about 10+
>> seconds, to just under 1.0 second, for an approximately 10x speedup.
>> That brings it in line with most of the other tests in selftests/vm,
>> which mostly run in < 1 sec.
>>
>> This is done with a one-line change that simply reduces the number of
>> iterations of several tests, from 256, to 10.
> 
> Could this result in reduced test capacity?  If so, how about making the number
> easily tweakable?
> 

The choice of iterations was somewhat arbitrary. Unless and until we
have specific bugs that show up at a given number of iterations, we
should avoid running large iteration counts that blow the testing time
budget. Here, I'm not aware of any bugs that show up between 11 and 256
iterations, which is why I think 10 is an acceptable iteration count.

But, you are right: it's a nice thought to make the iteration count
adjustable via the command line. That would allow hmm-tests to act as a
quick selftest item, and also to provide a little bit more of a stress
test, when manually invoked with a higher iteration count.

That's a separate patch, though. Because TEST_F() and related unit test
macros used in this area, expect to run the same way every time, and
they don't really want to be fed iteration arguments. Or maybe they do,
and I've missed it on my first quick pass through.

And in fact, maybe it's not a good fit, if TEST_F() and kselftest are
pushing for more of a CUnit/gtest style of coding.

There are some design and policy questions there. It reminds me that
some programs here don't use TEST_F() at all, actually. But anyway, I'd
definitely like to sidestep all of that for now, and start with just
"get the test run time down under 1 second".

thanks,
--
John Hubbard
NVIDIA
