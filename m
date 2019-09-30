Return-Path: <SRS0=bENQ=XZ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74CC32792
	for <linux-kselftest@archiver.kernel.org>; Mon, 30 Sep 2019 14:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7378420679
	for <linux-kselftest@archiver.kernel.org>; Mon, 30 Sep 2019 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569853023;
	bh=nGmiiEoUz5HKJWxHsVgQNmjDcNgJGAUYg6iCoS9sPTU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=2V7ZTewMNDO3X0TLVRh6KdVCZ5IKwB+GowVm4oOqbAnlrgty1w/FYoEi/734St+My
	 btvg6I47EG6eFCV1KlVkDgB1/8Uw1va+YWy2FSyvgh7vvHlJ5ZQqhpKanydtCe+Dw7
	 sltuX5t2++sSFonIZSCTyo5Qr7OgHc2gp32KZP3c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731190AbfI3OQ6 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 30 Sep 2019 10:16:58 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36989 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730902AbfI3OQ6 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 30 Sep 2019 10:16:58 -0400
Received: by mail-io1-f67.google.com with SMTP id b19so10630007iob.4
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Sep 2019 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qSyzuXDiOCBGYUe5x3wq3t+cEuvzBt8YWh4PsSfAxng=;
        b=UN3DqBAKeUwm8D0QEQjS3xJkE3+G7UwQhw6O0nfYZs1PZxchfelnwuw6XbPAxU+6iT
         z7SVP3YgvJDIJkPDy8Bfe1iwyqHZfIHIy7DYtqo1N8vSDthWvJQNB9ATkSpZlZ3XCuki
         qXAC8XV3pv/MJIMPSXlVWaEDCm27ZkGzg0pXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSyzuXDiOCBGYUe5x3wq3t+cEuvzBt8YWh4PsSfAxng=;
        b=a95sewTcDv95Dv4et7pFWWFEFuAXppJJgf7cirMxmxho4tOwHczQspnWJVjXrgi0L+
         uQSIRryEBvM2EKXNpqCbhyBFvdsahagqaKQ7ohLb1P9ogyZcdRVMF5cLbTMjRDejs/sY
         wjHS4q/9l9ov3Z07SxKsxrugQ7jSjjvdxyEsY1AtbPQMVH3DB7qXkkyxkB7JQPMd54z8
         MBEUVFNgJMbEkrD9X2v+4zeC+zysH62tN99rbZZtkUbvZzfnZbrGUYu9zVJUsepdtTF+
         FuEeh5CrWH9kRaLPhaf5BleHm2hPDKQTYlI8DnSQb2l782+KDdJ/sTBSvjucjfoPhMjs
         tJ7Q==
X-Gm-Message-State: APjAAAUpR4xjdIjqXXYAlBPXRdZlUDZb+k9kOUkz7ztTxWya5pJVQqIv
        ma+6at4zDAEeNWECcytHyXThVw==
X-Google-Smtp-Source: APXvYqxn8RJVirvm2HAhcEVkXxh7lQAUGhEQpdT+JkKACOG3a8byP3d+14FHtvWo1veaYWwLKjPYgA==
X-Received: by 2002:a92:6c10:: with SMTP id h16mr6350326ilc.299.1569853017550;
        Mon, 30 Sep 2019 07:16:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r2sm5475403ila.52.2019.09.30.07.16.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 07:16:56 -0700 (PDT)
Subject: Re: [PATCH] tools: bpf: Use !building_out_of_srctree to determine
 srctree
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     ast@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190927011344.4695-1-skhan@linuxfoundation.org>
 <20190930085815.GA7249@pc-66.home>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ea108769-1b3e-42f8-de9c-50b4a563be57@linuxfoundation.org>
Date:   Mon, 30 Sep 2019 08:16:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930085815.GA7249@pc-66.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 9/30/19 2:58 AM, Daniel Borkmann wrote:
> On Thu, Sep 26, 2019 at 07:13:44PM -0600, Shuah Khan wrote:
>> make TARGETS=bpf kselftest fails with:
>>
>> Makefile:127: tools/build/Makefile.include: No such file or directory
>>
>> When the bpf tool make is invoked from tools Makefile, srctree is
>> cleared and the current logic check for srctree equals to empty
>> string to determine srctree location from CURDIR.
>>
>> When the build in invoked from selftests/bpf Makefile, the srctree
>> is set to "." and the same logic used for srctree equals to empty is
>> needed to determine srctree.
>>
>> Check building_out_of_srctree undefined as the condition for both
>> cases to fix "make TARGETS=bpf kselftest" build failure.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Applied, thanks!
> 

Hi Daniel!

Is the tree the patch went into included in the linux-next?

thanks,
-- Shuah
