Return-Path: <SRS0=vu71=VT=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5244CC76190
	for <linux-kselftest@archiver.kernel.org>; Mon, 22 Jul 2019 17:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F5D421BE6
	for <linux-kselftest@archiver.kernel.org>; Mon, 22 Jul 2019 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563816218;
	bh=DG8/mnHNcWrpFXMDImss8/oxlsx5NyUxT4yhwUSFIu4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=FahuCTijXCCyIVqZBk6HSvJKvQOTIvJeMAkkRWbhh8T7aVcbVsE+TAXcIlc+rsmTH
	 3XH47kq52bSIvTM61Bgei+0acjku9vRit79ka2JsKa3/JnmcAJctu5JvEb70/p3h9P
	 ds1fHsyZui1+N4k3bzIOwULSas9v2ZSSftW07MhQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731278AbfGVRXh (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 22 Jul 2019 13:23:37 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:40611 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731265AbfGVRXh (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 22 Jul 2019 13:23:37 -0400
Received: by mail-io1-f41.google.com with SMTP id h6so75637642iom.7
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jul 2019 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x//6BQ4avsjREZ/AzGXRUKqAv41TpzFagUomz50MESY=;
        b=EqIgtaLSk6lRi50Wci7mkFvk56wbWbJRjk41BFBoq1TQg87bX+YaoD9lVj6+chMc3Z
         hJjFaMUONyWr1y03ymKg6FeaUxKvYMjfaZ8RGY2xwn1W0fW/MVbItsOyRz12c8B67mHm
         uskfcVL5QXuNR33P3fj5sU84BFHoVb2hHXzek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x//6BQ4avsjREZ/AzGXRUKqAv41TpzFagUomz50MESY=;
        b=cFPae7YUXvlA9VEX5aEiVf2aDP8JYRYY+/YF1zIq3XcblkE02IsoFy4ip26S3tuP6H
         e3JSKjwtIIZD9p/sbUo7qRq7bs0VTdrcX1IvlJQld958eO7UoOQ+xITuwXXmbUSFEqh6
         jk6kjESYFNytezXxvkUthyPLw2FEAd5Z7LEKlcL1+FjOZ9jBMBzcOKMhfrpaEkJvnnF8
         UEhAaZn9WJo6EMKRu38uKJDdJbDIC915BlPZmplzqZJnROCP5V+cz+OXf9bDGNhUEzoO
         lsiUIDh3YGjhxaL1NAyuTVjnVWWVw4UEulIoQC7z9zocNQX58e6Rls03ASjGbwGYbCyg
         xJoQ==
X-Gm-Message-State: APjAAAUGrqw/mN6PNCmZ4bnWpIRszP77zV1m7VOxz3pB9poW81ggUT4a
        jxt5Wd73vEMVjFCVQAGhjkjwrw==
X-Google-Smtp-Source: APXvYqxFdH5mZ13lwGwwkSXstB8RJuZv29yMjtZnGUs8mFCP5OLQ5psZily1iK9mosrntiI67XBPzw==
X-Received: by 2002:a5d:9690:: with SMTP id m16mr64315244ion.180.1563816216358;
        Mon, 22 Jul 2019 10:23:36 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j5sm30633099iom.69.2019.07.22.10.23.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 10:23:35 -0700 (PDT)
Subject: Re: "make" vs "$(MAKE)" in tools/testing/selftests/Makefile
To:     Kees Cook <keescook@chromium.org>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Cc:     linux-kselftest@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "sk >> Shuah Khan" <skhan@linuxfoundation.org>
References: <AE9B539F-DEBE-4CE2-91DB-9EA2DA2A9DEA@linux.ibm.com>
 <201907221019.DC708E775@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e3a68fbe-e7a2-965f-0d6b-daa784b8f4cd@linuxfoundation.org>
Date:   Mon, 22 Jul 2019 11:23:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201907221019.DC708E775@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 7/22/19 11:19 AM, Kees Cook wrote:
> On Thu, Jul 18, 2019 at 05:48:30PM +0200, Ilya Leoshkevich wrote:
>> Hello,
>>
>> Is there a reason why kselftest Makefile uses plain "make" instead of
>> "$(MAKE)"?
>>
>> Because of this, "make kselftest TARGETS=bpf -j12" ends up building all
>> bpf tests sequentially, since the top make's jobserver is not shared
>> with its children. Replacing "make" with "$(MAKE)" helps, but since
>> other Makefiles use "$(MAKE)", it looks as if this has been done
>> intentionally.
> 
> I suspect it's just an oversight. Can you send a patch to fix this?
> 

Sorry for late reply. I have been traveling.

Please make the change and send the patch. Also make sure all the
use-cases work?

i.e make kselftest
make -c <individual tests build>
make -C <selftest build - all tests invoking selftest Makefile)

I recall there are some issues using $(MAKE) when I added the
support a while back. I don't recall what it was.

thanks,
-- Shuah
