Return-Path: <SRS0=Ftq8=XS=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8FFC432C1
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Sep 2019 23:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD1C521D6C
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Sep 2019 23:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569280801;
	bh=TYN86YGqXrsNBL03jzhfsZPF5Z0IhGEVZrOQsXcIRxE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=YF9maevzvvWwah7GTSXDyor/w/r4dMAyBESjWYz/kCzD+Ep+z8Buwk1JKTJ8lj+fL
	 uIBTe7hgr9AuSwkGSgth7mQxPNVmDdRW7f/yfYSdyz9wbZSVurO347YI2G1VR+SAs9
	 mcrwzg3Xh7QfzojhpvQhQWZbf/4vnRx66TCnwUyE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404961AbfIWXUB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Sep 2019 19:20:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404574AbfIWXUB (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Sep 2019 19:20:01 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87DC2207FD;
        Mon, 23 Sep 2019 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569280800;
        bh=TYN86YGqXrsNBL03jzhfsZPF5Z0IhGEVZrOQsXcIRxE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cJTZZ86R1cHXbjLg4vi8B0sHXXBy4k2H84qg0dtY3VbXbv2ywgMx52p+wy9o7WIhB
         jHVdvVYvxR4hDlHDqkiChGdbeIli92UKMjw4l7Ed+g5UkNy8OB94MhB9b8MY+xmxRq
         lMQepytSLlA15jkrhC6Ags0hjr5rAAvcyWKraxIY=
Subject: Re: kunit: what do we do with the 'kunit/alpha/master' branch?
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        David Chiang <davidchiang@google.com>,
        David Siebert <David.Siebert@l3harris.com>,
        Kees Cook <keescook@chromium.org>,
        Mike Salvatore <mike.salvatore@canonical.com>,
        Pei Huang <peihuang@google.com>,
        Sagi Shahar <sagis@google.com>,
        Sangsu Ha <sangsu.ha@samsung.com>, kunit-dev@googlegroups.com,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, shuah <shuah@kernel.org>
References: <CABVgOSk79D0pmcWn-ynwGMfSxiD5AGrYWHmcQ5awre7QnQoKPg@mail.gmail.com>
 <CAFd5g4659KMmAtJshzs0n=rPZX5EGFBgYfNkH5RznZH=JnxeHQ@mail.gmail.com>
 <2e2441c8-eba7-e5c5-ae18-8d9141c0de98@kernel.org>
 <CABVgOS=tgjQ5J6kaQRHHi=Fxr_cWRJ+-3BgEqx2QkyTFfoYArw@mail.gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <5785a414-b726-a2d6-b8a0-d5f4efaed22e@kernel.org>
Date:   Mon, 23 Sep 2019 17:19:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABVgOS=tgjQ5J6kaQRHHi=Fxr_cWRJ+-3BgEqx2QkyTFfoYArw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 9/23/19 5:00 PM, David Gow wrote:
> On Mon, Sep 23, 2019 at 2:52 PM shuah <shuah@kernel.org> wrote:
>>
>> My concern with this approach is either one could outdated. is there a
>> reason continue in parallel mode. I would rathet see development happen
>> upstream so we don't have lot of code to be upstreamed sitting in an
>> experimental branch while upstream keeps moving. It is given that they
>> will diverge.
> 
> I definitely appreciate that, and the aim certainly is to have most
> changes go straight upstream without passing through the
> 'experimental' branch first.
> 
> The real purpose of the 'experimental' branch is to have somewhere to
> keep the mocking functionality before we're ready to upstream it.
> Given that there are already people using the current version of the
> mocking framework, we want to provide a smooth-ish path to upstream by
> providing this branch which is at least closer to upstream than when
> we are now (and that'll stay as close to upstream as possible through
> regular rebasing, rather than staying 'stuck' on the older versions).
> 

What I would like to see is a freeze on the experimental branch as soon
as KUnit goes into mainline (which is really at the end of this week)

Start draining the experimental branch with a goal to get all everything 
currently staged there mainlined.

Please define clear sunset date for the experimental branch. Without
that we are looking at a lot of pain in the future.

thanks,
-- Shuah


