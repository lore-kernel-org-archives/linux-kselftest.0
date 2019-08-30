Return-Path: <SRS0=ZP9S=W2=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DF9C3A59F
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Aug 2019 00:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE25221726
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Aug 2019 00:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567125961;
	bh=c0Z7vK3gtHxVtiNB6cGmSFVoyYyfkh3Fb9aD2+lkTDM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=C4reORzmuKziU1tZr/YH5Kz1jIVNVWatDCceRxsEp2DLI3GeUjUmCZp1W5+0SMJ9m
	 cj8zXDTHtTE4cOzYvb02TWLw82ywjAXgLc0u7i0mP+Dh0rXiqHYPf1xh9uQqf7C2Hr
	 0cTnfJVCRRxXtdjOitcmfOARGtoc5JCBzz6z7J0Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfH3AqB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 29 Aug 2019 20:46:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbfH3AqB (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 29 Aug 2019 20:46:01 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87B3A21726;
        Fri, 30 Aug 2019 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567125960;
        bh=c0Z7vK3gtHxVtiNB6cGmSFVoyYyfkh3Fb9aD2+lkTDM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SVwyjjgQjmBexDCnZ3AHRrP9daZi+VvYsUZBp8tg7of0Pw7UdGx/vlARw8e5M4C1n
         EiizSA+NwAvtg38MGFMJf3Aj5UskdmE4M/Eq64yMNm+PB+FkrVD4B4fmQ/F7S+sgsw
         5iV1fZ+kXi98wRSbIQ0Yh+5+EpNIj/hlSxWwe8t0=
Subject: Re: [PATCH] selftests/seccomp: fix build on older kernels
To:     Kees Cook <keescook@chromium.org>
Cc:     Tycho Andersen <tycho@tycho.ws>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alakesh Haloi <alakesh.haloi@gmail.com>,
        shuah <shuah@kernel.org>
References: <20190826144302.7745-1-tycho@tycho.ws>
 <201908291003.005EB96606@keescook>
From:   shuah <shuah@kernel.org>
Message-ID: <f01c3383-0184-9770-c72e-7fe08b552112@kernel.org>
Date:   Thu, 29 Aug 2019 18:45:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201908291003.005EB96606@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 8/29/19 11:06 AM, Kees Cook wrote:
> On Mon, Aug 26, 2019 at 08:43:02AM -0600, Tycho Andersen wrote:
>> The seccomp selftest goes to some length to build against older kernel
>> headers, viz. all the #ifdefs at the beginning of the file. 201766a20e30
>> ("ptrace: add PTRACE_GET_SYSCALL_INFO request") introduces some additional
>> macros, but doesn't do the #ifdef dance. Let's add that dance here to
>> avoid:
>>
>> gcc -Wl,-no-as-needed -Wall  seccomp_bpf.c -lpthread -o seccomp_bpf
>> In file included from seccomp_bpf.c:51:
>> seccomp_bpf.c: In function ‘tracer_ptrace’:
>> seccomp_bpf.c:1787:20: error: ‘PTRACE_EVENTMSG_SYSCALL_ENTRY’ undeclared (first use in this function); did you mean ‘PTRACE_EVENT_CLONE’?
>>    EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../kselftest_harness.h:608:13: note: in definition of macro ‘__EXPECT’
>>    __typeof__(_expected) __exp = (_expected); \
>>               ^~~~~~~~~
>> seccomp_bpf.c:1787:2: note: in expansion of macro ‘EXPECT_EQ’
>>    EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>    ^~~~~~~~~
>> seccomp_bpf.c:1787:20: note: each undeclared identifier is reported only once for each function it appears in
>>    EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../kselftest_harness.h:608:13: note: in definition of macro ‘__EXPECT’
>>    __typeof__(_expected) __exp = (_expected); \
>>               ^~~~~~~~~
>> seccomp_bpf.c:1787:2: note: in expansion of macro ‘EXPECT_EQ’
>>    EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>    ^~~~~~~~~
>> seccomp_bpf.c:1788:6: error: ‘PTRACE_EVENTMSG_SYSCALL_EXIT’ undeclared (first use in this function); did you mean ‘PTRACE_EVENT_EXIT’?
>>      : PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../kselftest_harness.h:608:13: note: in definition of macro ‘__EXPECT’
>>    __typeof__(_expected) __exp = (_expected); \
>>               ^~~~~~~~~
>> seccomp_bpf.c:1787:2: note: in expansion of macro ‘EXPECT_EQ’
>>    EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>    ^~~~~~~~~
>> make: *** [Makefile:12: seccomp_bpf] Error 1
>>
>> Signed-off-by: Tycho Andersen <tycho@tycho.ws>
>> Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> Alakesh Haloi also sent a fix[1] for this. I prefer Tycho's solution
> (one #ifndef and a Fixes line). Shuah, can you please apply this?
> 

Kees,

Yes I will pick this up.

thanks,
-- Shuah
