Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4FDC77B73
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Jun 2023 19:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbjFETc3 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 5 Jun 2023 15:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235732AbjFETc3 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 5 Jun 2023 15:32:29 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3188102
        for <linux-kselftest@vger.kernel.org>; Mon,  5 Jun 2023 12:32:27 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-33bcc8f0d21so2424485ab.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Jun 2023 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685993547; x=1688585547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhr2lAV911N9w6qOC4Bl8VDt3wGt4nmSLltxDhRWdPM=;
        b=ZV+nugYv6uGpnZqVmkYA7FKCRurQ5jAol+M6MWCUFCjQGidv5JPTur0hGB2/7mZ9lP
         2UoLnsvHenY916/PTUJ6qlEyMzoA1RbXPx5DHixWJr13J/0nD2JdkP4J/bgWM/dTdk3U
         uriedVLS9HD28WubInvxOdLH+bKP4L93iWe5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685993547; x=1688585547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhr2lAV911N9w6qOC4Bl8VDt3wGt4nmSLltxDhRWdPM=;
        b=UiIE9JNKhwZ8EdNqXR7r6QXgnCLmDRiva/2mmB53aQv0/XTmQaBQRXWAAitcDNzbyA
         WgmBfhX5h7Gmu1dkGhQIMiVqt+zZ6w5GoElqmhqO0+xzFJv1NGlw1sjpnn0ld3YG2ogK
         KcwOiM2KiFE49fGje/PETO0kSNbMpWNWcUtfBc6APIlK3igafq0Qm8/rXFPrSffjkA17
         YHP75G/W2teEdOGcmU/DvS/m3q8eBToGutiYL289nbqIuxbFhn/kHAk4jKHUi/mqytQD
         LmUmG0lt2831UhhqeFE1XgVeiqbLqpBd6SRSfgL7qYMbYm/R5BhaeWbenffH5o2+PVDM
         TJUw==
X-Gm-Message-State: AC+VfDw7jREopBoYC5kgYxbc43rC+OTJkd9X3tQ/lJOaAhJzRn+2KcDC
        4Ssq1fFFU6Okb8UckWilJYySKg==
X-Google-Smtp-Source: ACHHUZ6KHh1oVsrNW2D/ZW3X6D326obvjwPX9XVKIX4IeLt0y2mOCL7Bvt0P2Wf6po1/yAhWO20VFQ==
X-Received: by 2002:a05:6602:3999:b0:777:b6a9:64ba with SMTP id bw25-20020a056602399900b00777b6a964bamr118881iob.2.1685993547357;
        Mon, 05 Jun 2023 12:32:27 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id z18-20020a029f12000000b0041a9c4e0f1csm2330096jal.109.2023.06.05.12.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:32:26 -0700 (PDT)
Message-ID: <9f726045-e9fa-5c8c-fd1c-ace5cf967617@linuxfoundation.org>
Date:   Mon, 5 Jun 2023 13:32:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tracing/selftests: Update synthetic event selftest to use
 common_stacktrace
Content-Language: en-US
To:     "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230523225402.55951f2f@rorschach.local.home>
 <20230525102408.4b2750621cb1deeb05e58980@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230525102408.4b2750621cb1deeb05e58980@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 5/24/23 20:24, Masami Hiramatsu (Google) wrote:
> On Tue, 23 May 2023 22:54:29 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>>
>> With the rename of the stacktrace field to common_stacktrace, update the
>> selftests to reflect this change. Copy the current selftest to test the
>> backward compatibility "stacktrace" keyword. Also the "requires" of that
>> test was incorrect, so it would never actually ran before. That is fixed
>> now.
>>
>> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 

Applied to linux-kselftest next for Linux 6.5-rc1

thanks,
-- Shuah

