Return-Path: <SRS0=IN6Y=36=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D5FC352A4
	for <linux-kselftest@archiver.kernel.org>; Mon, 10 Feb 2020 20:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72ADB20715
	for <linux-kselftest@archiver.kernel.org>; Mon, 10 Feb 2020 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581368209;
	bh=3KVU7cQUqPeKaVpfbjSoKLa3wCccOFGrcMLPeNyHmUM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=0D/HFOmMG3R4xRhVl3s6hkxFOSHj9d30ka2CpNkSM8uTKewUzmkklppDs9Fquo0dD
	 31kJOUQnj+H2iMEWilXf8CPMQmO1J6mK2oPvt0rdvLkSLZaMVWBZM3dZv1Mf9mNaAI
	 xq0fr71RmrZ86wiO1kjt3vOU9lKz2MUBigVhDDbA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgBJU4t (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 10 Feb 2020 15:56:49 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:35688 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbgBJU4s (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 10 Feb 2020 15:56:48 -0500
Received: by mail-io1-f68.google.com with SMTP id h8so9227391iob.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Feb 2020 12:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RV8aFTX1g/jxbjaKrgcu8cu/ZmWqBaM66+9fNWhSQ9c=;
        b=L16aTfMPajyUm0Q1yz5yEyF3tw5mAvEsNHoQzp7Bl+Smz0rzm6YayDaPUTcJJGU16+
         IexNHyUYJMIbtZKMONrNGq9ZWe0d5asBiuP4S6V1sZz1/cz0sIC6iZl3rL6BUJmEztw8
         pesSp1KoTqLzVVgjN5xqMFSa7yDYzAElrYOz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RV8aFTX1g/jxbjaKrgcu8cu/ZmWqBaM66+9fNWhSQ9c=;
        b=YDmCOpzHsTgL8bYlfxdF164MrDGUA990PHpFBdWpOlYWxx14CsIKqy1A55o1/aO+Jm
         0RtZ7ek2uXdCUyL81Y2lusVMwhCRzilQpWiyjACE3klFrEkW0xr4d0beTv2a7zWYzt3B
         TLgwpqF/LLsvbH8QQ4wkuyiz3jFhpPAiivLf7rdthK2g6CjzMKcBRGrA8Al8sATWcPz7
         /6hOPG0kFeNEBy8euUljR4J+zn2FoSa9HsR8zL5fJHu1VDr4MnfMa4CRJ23oVUPKy2iM
         cOXa9j1qExbtkXGevCfXIuVrnuTkDVEeo1l06iFBT+uGAcBM+xilw6HBu4KMVieWiHLn
         2I5A==
X-Gm-Message-State: APjAAAUScBJ2uTblRb3QzdSzt8oKIOifTguZQlVNPxLCZ0cB2Z3QzGiL
        0NIIaIF2vhhYtfxB4ch9sEJ3KA==
X-Google-Smtp-Source: APXvYqwcr1TYoHZwc3nl9Qv+G2Ou0EIM0OA3ZGd47FXSbg/DYKD4mm9h/XeLCX7oGnZ8o/ejygy5Aw==
X-Received: by 2002:a5d:8782:: with SMTP id f2mr10616150ion.53.1581368208184;
        Mon, 10 Feb 2020 12:56:48 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x5sm429810ilq.75.2020.02.10.12.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 12:56:47 -0800 (PST)
Subject: Re: [PATCH] Documentation: kunit: fix Sphinx directive warning
To:     Brendan Higgins <brendanhiggins@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Knut Omang <knut.omang@oracle.com>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <9e787393-703b-ce56-8258-8dcf0cd5ff11@infradead.org>
 <CAFd5g46b7KS34c3jzJp9wxpneuEOT8BSh+jaPfnYA8DAQpH8CQ@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <131908c4-6c7f-7bd9-af44-132f5802747c@linuxfoundation.org>
Date:   Mon, 10 Feb 2020 13:56:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g46b7KS34c3jzJp9wxpneuEOT8BSh+jaPfnYA8DAQpH8CQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 2/10/20 10:45 AM, Brendan Higgins wrote:
> On Sun, Feb 9, 2020 at 7:31 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix Documentation warning due to missing a blank line after a directive:
>>
>> linux/Documentation/dev-tools/kunit/usage.rst:553: WARNING: Error in "code-block" directive:
>> maximum 1 argument(s) allowed, 3 supplied.
>> .. code-block:: bash
>>          modprobe example-test
> 
> Uh oh, sorry for wasting your time, but it looks like I already sent
> the exact same patch out already:
> 
> https://patchwork.kernel.org/patch/11360711/
> 
> Shuah, can you pick one of these up and send it out in the next rc?
> 

Thanks for the patches. I will take the first one in the queue which
is yours Brendan!

thanks,
-- Shuah
