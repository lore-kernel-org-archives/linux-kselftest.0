Return-Path: <SRS0=fZm5=5W=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168AFC2BA19
	for <linux-kselftest@archiver.kernel.org>; Mon,  6 Apr 2020 14:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D04A82395A
	for <linux-kselftest@archiver.kernel.org>; Mon,  6 Apr 2020 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586184777;
	bh=sH8XjmEdZnrM9/Yw6r123fRqpvPyLbds+PvYVayepWg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=UtY/tkhOUQ5NoJBVARHOe0pENTmmyGDDyRcGj6UkvQDDJlKTNQl57lIZAXs9j3STh
	 zK2G2VEwBq5fjqUkDjh+7Lj43l6lqPKnrAII8/H62y0Bez+xBB7cKFh14Jr1Skyp02
	 NSzKtQcJBhniN5xzdIZtO/o9Uo7PD8+YIgOAdHK8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgDFOw5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 6 Apr 2020 10:52:57 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:34506 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbgDFOw5 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 6 Apr 2020 10:52:57 -0400
Received: by mail-il1-f196.google.com with SMTP id t11so14958910ils.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2020 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TlN9etTNVIhXi5SlS4+HHwFZuLMHnlIsjsCovdVEV3U=;
        b=DQz5U3pN9dItbmoWCKdaJeRK20P+IjR//qIa/fm9aVBZ41G65k2bhXWj/q8GqmdRBp
         9HbjFugjW6ITdxrW7duPe04ajLKdos/0jRYUZN7puTbZyqLGbqsUjzcTo8Qf6UZIPh/R
         ruOFmaPliJM6c/KFtmxyhznqaguXRZ5kyqi0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TlN9etTNVIhXi5SlS4+HHwFZuLMHnlIsjsCovdVEV3U=;
        b=WA+17eFmpNSoWv/wNBZ7xaoRsOK/bAKTgaNFWpNblk6b5xxQ6U39Pd6l8uI3SNuMOK
         C0RwT988ecfvgNtnBiTNFoXaSBgjYoJPAYzaeMIV+m4sthtx/cNr459yL2nfjfpkGlBA
         h3L2BhnqsmuTKSNhkbMYmehNLnwfMhWXKEVIDCmZUZMpB8ooVWcjRf1+ddpAadtfDxVs
         72C1nECRlk9wT2PhS95AdPQNJ6vL9uSl9PwmavB1S/MnNjVbshS6s0ROYVUu3XmfPlNv
         3dcOAI0sSlzWQoDnf2MOQ2yA4Pbmn8RiNAd+niVFRHG6EFdgTBbhUShuTNNV42aaCH5w
         OVwg==
X-Gm-Message-State: AGi0PuY0Sp4RnWYx3oaUrvrKV8tFxiHTOoxof+7wU8ToOIvSDvE7NuAQ
        9VdGz0+lWRzkPpaN5reBaRD/Aw==
X-Google-Smtp-Source: APiQypIGhcr+ga7iW2HZD/56kO+5Q8Nn854Qu3wKVIrqtR1x2z8WlChskH67S2GmtHuS+rsKKnemQw==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr20047376ilf.127.1586184776402;
        Mon, 06 Apr 2020 07:52:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y6sm5979413ilc.41.2020.04.06.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 07:52:55 -0700 (PDT)
Subject: Re: [PATCH] selftests/ftrace: Add CONFIG_SAMPLE_FTRACE_DIRECT=m
 kconfig
To:     Steven Rostedt <rostedt@goodmis.org>, shuah@kernel.org
Cc:     Xiao Yang <yangx.jy@cn.fujitsu.com>, mingo@redhat.com,
        ice_yangxiao@163.com, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200405014457.8854-1-yangx.jy@cn.fujitsu.com>
 <20200406092306.7ea72524@gandalf.local.home>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <34600011-aca9-76ec-fb04-1ddd55d1da91@linuxfoundation.org>
Date:   Mon, 6 Apr 2020 08:52:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200406092306.7ea72524@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 4/6/20 7:23 AM, Steven Rostedt wrote:
> On Sun, 5 Apr 2020 09:44:57 +0800
> Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:
> 
>> ftrace-direct.tc and kprobe-direct.tc require CONFIG_SAMPLE_FTRACE_DIRECT=m
>> so add it to config file which is used by merge_config.sh.
> 
> 
> Shuah,
> 
> Care to take this in your tree?
> 
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> 

Yes. I will apply this for next rc.

thanks,
-- Shuah
