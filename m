Return-Path: <SRS0=wMNL=DF=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B988C4727F
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Sep 2020 23:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C244423A58
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Sep 2020 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601335129;
	bh=4Lhf3UiK9thHYcrI98/C5vdTOKhRBHAL3Cg4tddnLhA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=IfbuTumQquqDVUL+mrlEu2ae1Q2HdKBBI6UOVsnjg1/9NfvuhS5fDYLk+ywOOGjuI
	 GDpM6GE4BW7ziZuExu9dVWCjKuAc6h2ohwgeJs/JstrawXBGTE0mVIqtB4gGlevdKy
	 eYQYSJ3sc4yzVqgJibHhbQiLBXf4oHQb8tcwaxY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgI1XSn (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 28 Sep 2020 19:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgI1XSm (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 28 Sep 2020 19:18:42 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C689C0613AE
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2020 15:41:50 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id z5so2960604ilq.5
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2020 15:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gaA/nbho2rHBM2XGAt+fqZDqrrCyGQoKDIGncDoowiY=;
        b=WpOlbRfAI9e8II+dnFUMmLCr028LWtZq3VDo3e7fgu588x0zs7KTTS1rPIT60wbAGy
         cFwY0h5dO4zkUJdnxSGUKs+097/h1H6C3mMVF+vw66IPMyv0pyTPefuI3b/L1Te3OJTD
         5HSxT4otUXABTWMa/ya8prB3WhIkjEBLxYMM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gaA/nbho2rHBM2XGAt+fqZDqrrCyGQoKDIGncDoowiY=;
        b=tBffGFLCfXyid9vT5XVsaxpgRu+5QzFmFZwV85mrTK0uHEKHpTQ1XuP9Uu0TRHbhh0
         v+wqcCQD35GKGwSH6dY2wiIKPc6cCNVJYX4D17x2FQ5IbYUIo72oYWPy+HxNiiUIUVSU
         BUgRxyp+U+6lmXmE3h9FKTczMS7/quVdcqVexnX2MWdeZykBXUvpQ09yb8OZ7TR+DYA2
         d6xIjDbcg+XAq8PEGQ9jBFpfmxPabPdLdDXF5kEnaEuhj6DSkvu5p0G13ub+zaN0sMIw
         Uc21hPQ9AnGyBaa0qjnzLKpqhiUI13DdAc+Vfmu06yUwQCSfEA3fNo4u6BdBddUFg3bt
         mY9w==
X-Gm-Message-State: AOAM533drWUn3aV7zLNx0F6rnJHlz+TVIOZoTAuhkQtWHM/3tRhtqp4/
        AT4QpYIocUWG8TyQlvsw0RkTsA==
X-Google-Smtp-Source: ABdhPJy542a1CRGETx+C2//Kh61RETA39sKIv4QHpJwtOuYxcYdasZxM/JVddvpjSYaGDww7kJ0Sww==
X-Received: by 2002:a92:8452:: with SMTP id l79mr459458ild.222.1601332909461;
        Mon, 28 Sep 2020 15:41:49 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j1sm1334685ilq.74.2020.09.28.15.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 15:41:48 -0700 (PDT)
Subject: Re: [PATCH 00/11] Introduce Simple atomic and non-atomic counters
To:     Kees Cook <keescook@chromium.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, shuah@kernel.org,
        rafael@kernel.org, johannes@sipsolutions.net, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        arve@android.com, tkjos@android.com, maco@android.com,
        joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
        surenb@google.com, minyard@acm.org, arnd@arndb.de,
        mchehab@kernel.org, rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1601073127.git.skhan@linuxfoundation.org>
 <202009260923.9A2606CFF6@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3929a023-eb7a-509c-50e1-ee72dca05191@linuxfoundation.org>
Date:   Mon, 28 Sep 2020 16:41:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009260923.9A2606CFF6@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 9/26/20 10:29 AM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 05:47:14PM -0600, Shuah Khan wrote:
>>     7. Verified that the test module compiles in kunit env. and test
>>        module can be loaded to run the test.
> 
> I meant write it using KUnit interfaces (e.g. KUNIT_EXPECT*(),
> kunit_test_suite(), etc):
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/
> 
> Though I see the docs are still not updated[1] to reflect the Kconfig
> (CONFIG_foo_KUNIT_TEST) and file naming conventions (foo_kunit.c).
> 

I would like to be able to run this test outside Kunit env., hence the
choice to go with a module and kselftest script. It makes it easier to
test as part of my workflow as opposed to doing a kunit and build and
running it that way.

I don't mind adding TEST_COUNTERS to kunit default configs though.

thanks,
-- Shuah

