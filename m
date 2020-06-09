Return-Path: <SRS0=E1M1=7W=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D33C433E0
	for <linux-kselftest@archiver.kernel.org>; Tue,  9 Jun 2020 20:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E7EA20737
	for <linux-kselftest@archiver.kernel.org>; Tue,  9 Jun 2020 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591733999;
	bh=65JcJKhbjV4tbjmJzeO86yumaW6h+255azn5CWWN3HU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=U00kACUYrsXaK2KskMlq4BC/4cuKdrcrNAo7gGZgPaqKUbmco2Z+6pYutnsCJjZdQ
	 zE42OP+rPuL7VSNX4CuTbOXVxUfOFyPimUhPEQVCfvXfHSiihBQDPe+AjiOlD3SBRT
	 /EXOheDJvXCCOsKq3U8+A9Epc67FTJDODD9r/eUE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732969AbgFIUT6 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 9 Jun 2020 16:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729875AbgFIUT6 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 9 Jun 2020 16:19:58 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A22C03E97C
        for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2020 13:19:58 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id a3so8026370oid.4
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2020 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cl0NnKl1Uu8CMgdsMDawpvRIt5rueRAfYk/i656FKFw=;
        b=JO2PjvGy+YBy9tQEFnNzo2FxTRkuDoEHmZxIBOFP3mGgQ3ChWX4Lt50Y/KGWF3I8U8
         aAFBwzaFoAy2FYXaj6z87QRyFx+gkG4JUnEgDhJ3xXlxNGf6kkDIQnw4+00ewJbvWlCr
         JluzzTJRkngp5vNoIFSwar2TtGeJQH7dhXzKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cl0NnKl1Uu8CMgdsMDawpvRIt5rueRAfYk/i656FKFw=;
        b=QUYys391kEp8MThLUNbJ5RemX5/FLyQhWflpLYy8S+nYCvEwEGr+i2Qg1NSIZa6YDy
         OLPHpHd1Vy2XAX6RVqzg79kYR39BkieLZYxSxC48hHcR2DExYt7YVRykSr+z8UgJxfG+
         KZi1s9m7ymKshdc7U4d77JPPJ1baUU7Oz4E0wzXxrninOwoyEmp8P5sJ8IWTiupI0rbz
         YOgyLg6glCDjdBhh0HiHYp5wQn47+UY2LDhxEMsCaQuE73VuZ0eLBkzZ4mSIiPS4JvN0
         65SN6FFFqlguv8RVOdd9bZgdB2oqMTK5sVC5SJ28zhScEZrRetWuJocfUZLGvXeZyefK
         kAXw==
X-Gm-Message-State: AOAM533jDCfMN+WmJv6920/mL5O+Lsx9vlvo8atRJP2y6TmechnKpsB4
        WSezSdzdkFWpRR+NaPZA2lXD4Q==
X-Google-Smtp-Source: ABdhPJwhddyCgs9ccZnm4capkBQtpxKyclfrvX0Man0cg/kL58CfpwgV9+UV3sZ8jLTQuwguVRSm/g==
X-Received: by 2002:aca:54d8:: with SMTP id i207mr10057oib.127.1591733997212;
        Tue, 09 Jun 2020 13:19:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f109sm2406819otf.39.2020.06.09.13.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 13:19:56 -0700 (PDT)
Subject: Re: [PATCH v8 1/5] Add KUnit Struct to Current Task
To:     David Gow <davidgow@google.com>, trishalfonso@google.com,
        brendanhiggins@google.com, aryabinin@virtuozzo.com,
        dvyukov@google.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        andreyknvl@google.com, shuah@kernel.org
Cc:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200606040349.246780-1-davidgow@google.com>
 <20200606040349.246780-2-davidgow@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9a0cc68d-a7e5-a72c-7e47-3357a64f5aca@linuxfoundation.org>
Date:   Tue, 9 Jun 2020 14:19:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200606040349.246780-2-davidgow@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 6/5/20 10:03 PM, David Gow wrote:
> From: Patricia Alfonso <trishalfonso@google.com>
> 
> In order to integrate debugging tools like KASAN into the KUnit
> framework, add KUnit struct to the current task to keep track of the
> current KUnit test.
> 
> Signed-off-by: Patricia Alfonso <trishalfonso@google.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>   include/linux/sched.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 4418f5cb8324..e50c568a8dc7 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1188,6 +1188,10 @@ struct task_struct {
>   	unsigned int			kasan_depth;
>   #endif
>   
> +#if IS_ENABLED(CONFIG_KUNIT)
> +	struct kunit			*kunit_test;
> +#endif
> +
>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>   	/* Index of current stored address in ret_stack: */
>   	int				curr_ret_stack;
> 

Peter, Ingo, Juri,

Okay for this patch to go through Kselftest tree?


thanks,
-- Shuah
