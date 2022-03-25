Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CDAC433EF
	for <linux-kselftest@archiver.kernel.org>; Fri, 25 Mar 2022 20:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbiCYUCp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 25 Mar 2022 16:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiCYUCk (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 25 Mar 2022 16:02:40 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB862CB1A4
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Mar 2022 12:53:11 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-dd9d3e7901so9105178fac.8
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Mar 2022 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EMls9cNpqXgEKwpSxiHVQ8zeTXF5Wo9WfCJPo69Nq4Y=;
        b=hhCXH8SUuEN7wnC0a4CCFShuRcL/D/BvYHZZbyge1UwQTBf2/zDkZRrHhDSPLp46P0
         5kuErmifUC740zf922C6IljVFgPIuqr5KeEKljvYQWyL9j8cI75BNx6iKWMbJnuSRhQP
         +kpquK4cdabFk5/kHsalSY+ukTWOcG0bTpGQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EMls9cNpqXgEKwpSxiHVQ8zeTXF5Wo9WfCJPo69Nq4Y=;
        b=HEyDCD8nbPGzTH3VIUx1LIg/0miIYQgJJh8iUU/sZVxFx9fUA3V0pLkZeRQePl4rDs
         aWvQ7MkGxQRxDavCUqTFuwufMInRhWN2JE2YCQs8VtqacITXCPZxWTGxzzCbLwqiotP4
         9yi6PQu0T3P+b7IoMlDwUcGSt86Czf5QtVAjMwdg23mVij8WMvVZfV+rqix1YCPcQDqj
         IzzRs88F5VA6PmdAt3CbBIK3QDkNsVj1Wk7YKwC5cQVriwq+X7lDRzqCBMxFyUYMuR7e
         Sdq+WbRE4vBVNqPYh8IjhAtfR3mvipZRVKVqGDXaf5Z7WZQySOiihVDWgtKULRCcUykk
         Q94g==
X-Gm-Message-State: AOAM530yFplvCuAZXu7mH7BJOIlxTjWhBslf0io0gvmTZOSB79qo0Nm8
        FNeVNk6AK9DLpeRiws3zp45lCPoZ0aL1bg==
X-Google-Smtp-Source: ABdhPJzbOPPTtw3lwS47wB3QDQ3bBdm3WPjpWmxnDGBsN0wgtZqlPDxq1TpXRQ0kEYRlDDrwUpQf0Q==
X-Received: by 2002:aca:230d:0:b0:2ec:a4c1:e112 with SMTP id e13-20020aca230d000000b002eca4c1e112mr6189071oie.220.1648237514699;
        Fri, 25 Mar 2022 12:45:14 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id x22-20020a4ad056000000b003248f5630dcsm2882565oor.43.2022.03.25.12.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 12:45:14 -0700 (PDT)
Subject: Re: [PATCH] selftests: x86: add 32bit build warnings for SUSE
To:     Geliang Tang <geliang.tang@suse.com>, Shuah Khan <shuah@kernel.org>
Cc:     linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <5f22f4657cd11e541ab6cdbb7782b55891f63241.1648115583.git.geliang.tang@suse.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9a8bc94f-b087-c803-e8ac-9f2ea1ef9c5e@linuxfoundation.org>
Date:   Fri, 25 Mar 2022 13:45:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5f22f4657cd11e541ab6cdbb7782b55891f63241.1648115583.git.geliang.tang@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 3/24/22 3:55 AM, Geliang Tang wrote:
> In order to successfully build all these 32bit tests, these 32bit gcc
> and glibc packages, named gcc-32bit and glibc-devel-static-32bit on SUSE,
> need to be installed.
> 
> This patch added this information in warn_32bit_failure.
> 

Convention is to use "This patch adds" i.e  imperative, present tense
in commit logs.

I will amend the commit log when applying. Please keep that in mind for
future patches.

> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
> ---
>   tools/testing/selftests/x86/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 8a1f62ab3c8e..ffd7c1fa2c9e 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -92,6 +92,10 @@ warn_32bit_failure:
>   	echo "If you are using a Fedora-like distribution, try:";	\
>   	echo "";							\
>   	echo "  yum install glibc-devel.*i686";				\
> +	echo "";							\
> +	echo "If you are using a SUSE-like distribution, try:";		\
> +	echo "";							\
> +	echo "  zypper install gcc-32bit glibc-devel-static-32bit";	\
>   	exit 0;
>   endif
>   
> 

Thank you for the patch. Will apply for Linux 5.18-rc2

thanks,
-- Shuah
