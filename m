Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4384C4743D
	for <linux-kselftest@archiver.kernel.org>; Fri,  4 Jun 2021 21:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 924F9613EC
	for <linux-kselftest@archiver.kernel.org>; Fri,  4 Jun 2021 21:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFDViN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 4 Jun 2021 17:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhFDViN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 4 Jun 2021 17:38:13 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087C3C061766
        for <linux-kselftest@vger.kernel.org>; Fri,  4 Jun 2021 14:36:14 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w127so11100856oig.12
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Jun 2021 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w2nCVXYnFxUSSZtvYmNz/jeFtJBW7IOboxSQD0XJyek=;
        b=AmcF+YwKcngUzOJo23lM0rzG1jsG3Y+xn/3s/BPsFAptglEpHg0vCZn5oCEPOmrFMA
         wV2iBgUb363OdnFT1+Lqd9YrJ+sAI5W0Zs3Xu7zFvSn+367DR6sGu28Y7da1HshaT9lR
         zZR5NarSagtrXCVu9JTZFQ1qo6GzEKtBNlAOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w2nCVXYnFxUSSZtvYmNz/jeFtJBW7IOboxSQD0XJyek=;
        b=qNdLQ86P5cRPkOtPW//sRdYIt+EB5mkCAxCBAcqS+J7ISF8TGK2tCL5uZvysIutokl
         Yob13r7TDDdhjO3hOSt6c0ofr9YRp4dodxsPLUCN7CvDXIOijA5WOTaSLdVjGJUFtGCv
         2DBcwoAIG6QjxqWgNIM2FU6F7pgQ3HTPQfDAD3lhN7gnmA7jY8JBD5pxyeM0UGI2z2Mb
         n49KYLSSpg3aCIgyXvuiL8z9afexoCXA2m4lM/SynjO5FfEFjaXNDXaQhOAQU9+qPlnv
         u1sfkNEQsi92qfSB3mjm7l7IWiGCyQCAFgewcezw7WhuFhOknl1PdWCydZCWM82t20ta
         3fUg==
X-Gm-Message-State: AOAM530l1MQg9wfrvgWMwbEp7VydwUN6YosDA7zVmp4FY5o+mb5lzHng
        Q/vnnCj2AR46hxdWB6UxsGi7eg==
X-Google-Smtp-Source: ABdhPJzJ9d8CtmAgbEO1PH8s5yJXcPoHNZIG9n1wFsoJQ9xGqdZFMlj+hP9pcOIB3OWolDXs9cJbJw==
X-Received: by 2002:aca:230e:: with SMTP id e14mr4369635oie.58.1622842573470;
        Fri, 04 Jun 2021 14:36:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 35sm740135oth.49.2021.06.04.14.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:36:13 -0700 (PDT)
Subject: Re: [PATCH] selftests: timers: rtcpie: skip test if default RTC
 device does not exist
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc:     john.stultz@linaro.org, tglx@linutronix.de, sboyd@kernel.org,
        shuah@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210525023614.7251-1-po-hsu.lin@canonical.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d1366904-f297-e995-2a6c-42721f28bc06@linuxfoundation.org>
Date:   Fri, 4 Jun 2021 15:36:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525023614.7251-1-po-hsu.lin@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 5/24/21 8:36 PM, Po-Hsu Lin wrote:
> This test will require /dev/rtc0, the default RTC device, or one
> specified by user to run. Since this default RTC is not guaranteed to
> exist on all of the devices, so check its existence first, otherwise
> skip this test with the kselftest skip code 4.
> 
> Without this patch this test will fail like this on a s390x zVM:
> # selftests: timers: rtcpie
> # /dev/rtc0: No such file or directory
> not ok 1 selftests: timers: rtcpie # exit=22
> 
> With this patch:
> # selftests: timers: rtcpie
> # Default RTC /dev/rtc0 does not exist. Test Skipped!
> not ok 9 selftests: timers: rtcpie # SKIP
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---

Thank you for the patch. Will pick this up for 5.14

thanks,
-- Shuah
