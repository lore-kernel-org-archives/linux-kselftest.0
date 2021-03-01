Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D17EC433E0
	for <linux-kselftest@archiver.kernel.org>; Mon,  1 Mar 2021 21:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34E1B60235
	for <linux-kselftest@archiver.kernel.org>; Mon,  1 Mar 2021 21:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhCAV7A (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 1 Mar 2021 16:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244040AbhCAV4o (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 1 Mar 2021 16:56:44 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2933C06178C
        for <linux-kselftest@vger.kernel.org>; Mon,  1 Mar 2021 13:56:03 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id k2so14047286ioh.5
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Mar 2021 13:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m+RNcLgJhTs9T3Wtftg15wVRmRi1wCDJCjKpYbAY0/A=;
        b=MJQyacUUm3vZ2bwooIZwhAM7UiHVWUMGuNxoldnSizFWUkJFSUuiAxQumxjELNlgrb
         /eLcQ4Tg0Zhnf92Wx4Os7GEI0/YHaMh0qk35c7gl1Y2664dhnD6PDMN78CIpXohakeCE
         PCnXCEKP7IK02BuK2uLUqdBuRZkKEYnCTV67M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m+RNcLgJhTs9T3Wtftg15wVRmRi1wCDJCjKpYbAY0/A=;
        b=D9sOOGdfnSU+GWUV0h2oKbm6u+MqjNeLYhxRuCReYi1OT5AOeazA0qpouVfYb41JGS
         OkNlEVke0a8/0VWCB0Ow6SHM2wW2HiYl+RHmGq90awVlLpNIzswdpQ+8xDgTOg3v/N49
         b42t1LySX5W5KkqOKjbUlu87ShLER7F7w1RsR1+SWsHwkIydAAHjWkRf7JAhk1MyBo6O
         B55mR/+7sHnkvGXh4B+JN03A9vH8AkG7OZ985dgptpgHGgoDeXuqMNheaYtAq82ek5Dq
         nV4LXr/6aOiBIdaD2ud/MYKyVi233/Q/dzCGi29cMPiNXrgAxlAa/2yWJ4Raq7CjrMzG
         1sMA==
X-Gm-Message-State: AOAM532mECi/uZSvEHU1OPpaRGeXOAKZZKOcOGfnIzHm6/a32PjoZOGX
        3S6OBO4j/pQ1QCwbMhcmbwDqaQ==
X-Google-Smtp-Source: ABdhPJxrp3JBhAwUOXubk6UYexoVXauvHts6BTPI4kdtwm1ee8jHrgNFGx0c9fELGfpFRK3RMIH/pw==
X-Received: by 2002:a05:6602:15cc:: with SMTP id f12mr15114491iow.32.1614635763161;
        Mon, 01 Mar 2021 13:56:03 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v3sm4688857ioh.25.2021.03.01.13.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 13:56:02 -0800 (PST)
Subject: Re: [PATCH] kunit: fix checkpatch warning
To:     Brendan Higgins <brendanhiggins@google.com>,
        Lucas Pires Stankus <lucas.p.stankus@gmail.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210226205410.nnwstno5xrsb5ci3@smtp.gmail.com>
 <CAFd5g47ebZFOA6myhJHykt=nG5SwgJmuVAjr=CSkeO06iNg5AA@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3196393d-0e6a-d948-c695-3911daaeea4a@linuxfoundation.org>
Date:   Mon, 1 Mar 2021 14:56:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47ebZFOA6myhJHykt=nG5SwgJmuVAjr=CSkeO06iNg5AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2/26/21 2:05 PM, Brendan Higgins wrote:
> On Fri, Feb 26, 2021 at 12:54 PM Lucas Pires Stankus
> <lucas.p.stankus@gmail.com> wrote:
>>
>> Tidy up code by fixing the following checkpatch warnings:
>> CHECK: Alignment should match open parenthesis
>> CHECK: Lines should not end with a '('
>>
>> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 
> Thanks!
> 

Hi Lucas,

Please fix your Signed-off-by and resend this patch:

WARNING: From:/Signed-off-by: email name mismatch: 'From: Lucas Pires 
Stankus <lucas.p.stankus@gmail.com>' != 'Signed-off-by: Lucas Stankus 
<lucas.p.stankus@gmail.com>'

thanks,
-- Shuah
