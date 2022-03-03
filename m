Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D59EC433F5
	for <linux-kselftest@archiver.kernel.org>; Thu,  3 Mar 2022 22:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbiCCWWo (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 3 Mar 2022 17:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbiCCWWo (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 3 Mar 2022 17:22:44 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D8965DE
        for <linux-kselftest@vger.kernel.org>; Thu,  3 Mar 2022 14:21:58 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id q8so7558758iod.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Mar 2022 14:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h75dXlU2U9GD438gggrDtSACtFpdKAcs8BfCPVpoYlg=;
        b=X/w+yubbX1fu5lb9hw99ZBR4IirBiXxQndYogS29ZqMd5m54+U46IL7l9stzEtXTxV
         /DBdCEsln+KRQKFgSkNlZxORisGui3zNrfpLFrZKoCx/eKKaDxcymCKG4kCBShwYmJ2R
         k182URkX8zha6jYXhn+F7JTzLfh/KUWtjJUdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h75dXlU2U9GD438gggrDtSACtFpdKAcs8BfCPVpoYlg=;
        b=o/DltDcZhmEZSZgVqR29NRjH9uXzRkSlCW7Zv78GBt+vEe0yciKVE3Rnu6XCxVMYkB
         Qhq1LX5OTqFR2PJHEjW+34D0D2mdKV9MTu25Q/9ph8pfV3NutrudwbhBaH9gsn0GX9Je
         3fGLEtNaaHqkEj04f4BqSwb8roN6cKYiOXMEx54kmtSHJEGVVWQ6/+zBS60zVQZfu1O0
         GM8ZY2GnJR8omebOOEztlpyt5TzuxFe4XFSS2sNsbS2w4Pt3T6esJ3jA4gpS67Pbt62J
         e4zxgbCnR4BBCkhCRLxpHaatTSfNyOX1XhDomRrEWjtiplsfnHNSrWp/TqJezkOEGRVv
         7jsA==
X-Gm-Message-State: AOAM530aT799N1513+vXFIgtAYLjVYPtib/CrhuOhmsSUR49IxprMjCJ
        ph3sPpB3U7GZa/melqSHE32gmGpVg2Ucsg==
X-Google-Smtp-Source: ABdhPJwVTB9bEOHKqgR8hY17iqs1ZieWMpIrz8IALt8YiS/sjqMZCM5Q+ziGAieK911yV9EOFheaqw==
X-Received: by 2002:a05:6638:381a:b0:314:e62:27dc with SMTP id i26-20020a056638381a00b003140e6227dcmr30831638jav.59.1646346117518;
        Thu, 03 Mar 2022 14:21:57 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id q190-20020a6b8ec7000000b00638d75f5cd0sm3076799iod.47.2022.03.03.14.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 14:21:57 -0800 (PST)
Subject: Re: [PATCH V2 1/3] selftests: add kselftest_install to .gitignore
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     kernel@collabora.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220302180121.1717581-1-usama.anjum@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fca1c16c-1515-aabf-6377-ce952ee28492@linuxfoundation.org>
Date:   Thu, 3 Mar 2022 15:21:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220302180121.1717581-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 3/2/22 11:01 AM, Muhammad Usama Anjum wrote:
> Add kselftest_install directory to the .gitignore which is created while
> creation of tar ball of objects:
> make -C tools/testing/selftests gen_tar
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes in V2:
> Break up the patch in individual test patches
> Remove changes related to net selftest
> ---
>   tools/testing/selftests/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/.gitignore b/tools/testing/selftests/.gitignore
> index 055a5019b13c..cb24124ac5b9 100644
> --- a/tools/testing/selftests/.gitignore
> +++ b/tools/testing/selftests/.gitignore
> @@ -3,6 +3,7 @@ gpiogpio-event-mon
>   gpiogpio-hammer
>   gpioinclude/
>   gpiolsgpio
> +kselftest_install/
>   tpm2/SpaceTest.log
>   
>   # Python bytecode and cache
> 

Applied to linux-kselftest next for Linux 5.18-rc1

thanks,
-- Shuah
