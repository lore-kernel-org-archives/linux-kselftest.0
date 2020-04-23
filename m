Return-Path: <SRS0=xvxT=6H=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912B7C54FD0
	for <linux-kselftest@archiver.kernel.org>; Thu, 23 Apr 2020 22:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60A1320728
	for <linux-kselftest@archiver.kernel.org>; Thu, 23 Apr 2020 22:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587679656;
	bh=4vjmcAoEw04l2V8m6FsN1oyvQD+Z6v+Kw6HAImQoYE0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=tk8EVfmm+01P7a51/H9IBXjuD/h93lGphLQxq6Z+2jgHygK8lb6oM1wtDLUWhhCDo
	 Bxzue2dLXp17xClcmZ4SfTuZe7o4hbKYfHwMdk7MbcJsAokBskvzi9vFu7rWTIlB7Q
	 +yChhyaC3t6mzIWDyMMXPmqf+pLhsWGgMAIoUORQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDWWHg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 23 Apr 2020 18:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDWWHf (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 23 Apr 2020 18:07:35 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B510AC09B043
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2020 15:07:35 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id o127so8295976iof.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2020 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NAMx4wud/Mi7YohlwtY2GeSPAKTse+6Zaacz6L0GB4k=;
        b=Lo+wxziG4e9zqEKOLc1QBrh8YdwMKE9QbsdG7j/we8WguL6xCqPu3+WLl0j2Sj191J
         pj7F5wcaFn2UX+t2KRFHgPnKC0lwLQT/dO6ZnEDG+kBZ4lI7YvzZRYyTF2Pri1mLJGLm
         do7qYwzCv/UxZKqvve0/yumPGAbraqJwsctWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NAMx4wud/Mi7YohlwtY2GeSPAKTse+6Zaacz6L0GB4k=;
        b=To6gjTFgZDWSKQom7pHcVZyqcbrcuEHMZdAn1lqPi3ELSGLDJbINDCSlK7E8zcU3zz
         9QxRrp1gCaXYhKMlsIzov2SoiwCdS6WXlmm4gmAuxSvTCjSiwWEzjYRlZaS5mM7B4v6e
         kpzP5OcgF3SIwZYMGZH4VckDWj78gdScaj5pCLAolB7SvXbpYDvp9ATTv3Kh81Norvad
         +6YQUstIBdo9Go5Tw4N1YjZFd5AQprAJYmyLeXcZzs7di8K9hDKqfOeSqZ2WirWaIJev
         HCHiFrHdBUhWPC6SGZqhTtWirZ0J1tnJ53SL3EPJSJs42I3tME48ZK6UAybNnF2zaHix
         RYow==
X-Gm-Message-State: AGi0PuagLwiLVNV4gF/L58kRy60dYTnZ2fRwoM405iEFHY7q7Q1p/OHR
        lAMC+lypDzJzIQKX8qklW2LK7A==
X-Google-Smtp-Source: APiQypIf1AGfqowv5bNcmPIYb8uM6nxk+6mxvj/psnlguiKv+yM9vdBjwInxyKgJm5rujF1qs4t61A==
X-Received: by 2002:a05:6638:f0f:: with SMTP id h15mr5542081jas.142.1587679654921;
        Thu, 23 Apr 2020 15:07:34 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e27sm1328363ild.78.2020.04.23.15.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 15:07:33 -0700 (PDT)
Subject: Re: [PATCH] kunit: Add missing newline in summary message
To:     Brendan Higgins <brendanhiggins@google.com>,
        Marco Elver <elver@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Frank Rowand <frank.rowand@sony.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200416114256.226329-1-elver@google.com>
 <CAFd5g46tezcWT7z6DFWBW=7604=_hNopuvkazE80sLOmJvcQbg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dd192a69-8b51-7ea9-4327-a48fc96eb68f@linuxfoundation.org>
Date:   Thu, 23 Apr 2020 16:07:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46tezcWT7z6DFWBW=7604=_hNopuvkazE80sLOmJvcQbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 4/22/20 1:35 PM, Brendan Higgins wrote:
> On Thu, Apr 16, 2020 at 4:43 AM Marco Elver <elver@google.com> wrote:
>>
>> Add missing newline, as otherwise flushing of the final summary message
>> to the console log can be delayed.
>>
>> Fixes: e2219db280e3 ("kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display")
>> Signed-off-by: Marco Elver <elver@google.com>
> 
> Acked-by: Brendan Higgins <brendanhiggins@google.com>
> 
> Thanks!
> 

Applied. Now in

git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest kunit
branch.

thanks,
-- Shuah
