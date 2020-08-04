Return-Path: <SRS0=dmke=BO=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1492CC433E0
	for <linux-kselftest@archiver.kernel.org>; Tue,  4 Aug 2020 21:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2CCE22B42
	for <linux-kselftest@archiver.kernel.org>; Tue,  4 Aug 2020 21:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596576110;
	bh=4R5Sd3HIF4qoYkoB6KuHcc7FaDf1cRMOEoKZ1jkn6wo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=kGkmzHDGqjHfGpAQjXrTAFYNBe/zKX7gOjWmABB9kmxAybvOAi3xtUJECwdZREQxw
	 5zZyS7ijrmrCHlMbRfrRDv4XhF6PJZ1YNy70r4zOXUxVmwCMNLWynA8nxu8IHjn4HY
	 JlgFAnBTirkKh5ZBRnFfWzr2aosstr2h293OMErE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgHDVVt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 4 Aug 2020 17:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbgHDVVt (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 4 Aug 2020 17:21:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCF2C061756
        for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2020 14:21:49 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id e11so7492317otk.4
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2020 14:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O4M2hw9rW/9hpO9QOqBXY3WQaDo2SJeJsBzFNR5ZUh8=;
        b=fSo4CKHmbZ0Uf258Pnm9fO7Z4oxT58PDd5fN96+4FvzdegY7XPpBNyrTILYWeRthrD
         vcv3e9eRPV0Z/0gej0gr5Kp5+3nJy1kRY8KvxNiQ9QHj5Hj2mjgJW0z1MqWBm8BC9fYk
         5sOlWZy63bI89hbqlAfjoNQ8cMXWMy6mv+o/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O4M2hw9rW/9hpO9QOqBXY3WQaDo2SJeJsBzFNR5ZUh8=;
        b=uJg0g9vv+sC99vEZF9dMGdrypXCWFUHkwUKisKrBzonHorXvKVEY3kMO9VOBU+m52z
         zeC9bsVS4IMNFUguK7znnAJv+dzOhdebTpmByDmv4LqUosc1MZ5zmZjWvJriuIap1fYl
         P8gpvCIvbryyRbZi37Ksqo/ZVgr5ehIUBNtlisGBk3JtfOEK9i0FyfteEOIdtMLpZ10R
         VABhhoVBACYHkBZMepZcGga2za49X9mDNVlJnGG/+QIPdoe7yh/XTw5drBYsnRj3f4Y6
         Y0TxI3Qvl9p7mzaKZ9gVsekXc88AhHhI+gKZ+sjH4u/iaU3aeFPuCgpPyB5SGMkbHw/a
         sMlw==
X-Gm-Message-State: AOAM5305dYLWG+RuBGalOVK9fuw0ERBLb9hRuQOoBRFVu1zsFE4CqrYT
        sWic/Qz+EtjofqVIJ17IWAnBng==
X-Google-Smtp-Source: ABdhPJyNDZblvigSgCyDfSxEYihQqaT1ilcpihTTWEKhHE2yeJKHy5OeY+Qp1rQYnV9plfSPqZ6v2g==
X-Received: by 2002:a9d:774d:: with SMTP id t13mr75726otl.22.1596576107841;
        Tue, 04 Aug 2020 14:21:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e184sm8989oif.13.2020.08.04.14.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 14:21:47 -0700 (PDT)
Subject: Re: [PATCHv3] selftests/timers: Turn off timeout setting
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>,
        linux-kselftest@vger.kernel.org
Cc:     shuah <shuah@kernel.org>, sboyd@kernel.org, tglx@linutronix.de,
        John Stultz <john.stultz@linaro.org>, joe.lawrence@redhat.com,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200318024215.5270-1-po-hsu.lin@canonical.com>
 <CAMy_GT9g48Xf=U==FeFd-8CaFM97u4WMkDBT013uzfjeqKMcfw@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cf6c08ff-5d59-47ad-77e9-1f614cd7b3e9@linuxfoundation.org>
Date:   Tue, 4 Aug 2020 15:21:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMy_GT9g48Xf=U==FeFd-8CaFM97u4WMkDBT013uzfjeqKMcfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 7/23/20 3:01 AM, Po-Hsu Lin wrote:
> (Adding Shuah's linuxfoundation mail)
> Hello,
> do you need more changes / tests for this test?
> 
> Thanks!
> Po-Hsu
> 

I was hoping to get Ack from timers test maintainers.

Will pull this in for my fixes update.

thanks,
-- Shuah
