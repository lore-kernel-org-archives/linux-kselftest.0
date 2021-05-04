Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ACCC433ED
	for <linux-kselftest@archiver.kernel.org>; Tue,  4 May 2021 07:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A19BC611AD
	for <linux-kselftest@archiver.kernel.org>; Tue,  4 May 2021 07:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhEDHYG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 4 May 2021 03:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229839AbhEDHYF (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 4 May 2021 03:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620112990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDZzFVHUz6nuJ5xJd1dslJwLGgGS3xgzc5l8z25vt0g=;
        b=Ov5nArOJbJw6g/lF0VWx7VXtdEuR136/KOdFDWlCe+hHgXsh33gJM23PO20h/EjWYTHLxc
        P1XNaUODbiLhf00kMDpXsGrnP1tSJkagL7ZHw4K6LhAQjcgxNhuHJwTpaWicsd0fD7ixZc
        lSv01EXj2Niz9GmTONFQMaMuK3ip924=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-dPULEtIBOkeDdhEbH_Uspw-1; Tue, 04 May 2021 03:23:09 -0400
X-MC-Unique: dPULEtIBOkeDdhEbH_Uspw-1
Received: by mail-ej1-f69.google.com with SMTP id nd10-20020a170907628ab02903a324b229bfso2793182ejc.7
        for <linux-kselftest@vger.kernel.org>; Tue, 04 May 2021 00:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vDZzFVHUz6nuJ5xJd1dslJwLGgGS3xgzc5l8z25vt0g=;
        b=bsT+Clkid+TTJbrntyNV+TEgf7pqaNlimcFZBINvzLXpqA4m/K/NE4iAolsLVfPTat
         7AA4pYIBHibJroNP7/cVxDGfzmKEkPIIvtdmc20YrQV4omsRoCPaeBk2+iqXrzrLHZ3+
         YdJmJ8YuiNz4OXrEbVgzn6q3QoOAxra7D008rUY2/x+f1xXyfVBBt2q29QnXNolbNR+8
         Tcz1LZGS+8oRySzdI6uDKBTIPZRLhtiN41QWAQsShQ0jn0D0xaS+iqrmxcoZn/QvK6Rr
         2gp2s6MbG91V1juyZyoeVBAFaquonwzI0x2VPSTJBKKMjNatnVU4n2LuyDucen4n8qdL
         +Jmw==
X-Gm-Message-State: AOAM531kuNWsaG3dvh/z7aufqjXA0z81ukkgQFGW0Uh3P0qQWApx6WGv
        82GqSyVFzZfifNuVzTzz/bPtxTRRFHzN2IZYP48bc91/2ytscl8Uzq3hYUwWebd3Uh5p/NifTsU
        gdCTUE3kTx7Sm7lfn3WJmIrW1/1UzN3OAqBVDc/axfMMLzu+ElTHfavUZy5qxfxx/U4wVAYZjyz
        K+bE4w
X-Received: by 2002:a17:906:1284:: with SMTP id k4mr19971132ejb.409.1620112987750;
        Tue, 04 May 2021 00:23:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH+i8bygB46cYQo1fTbkLpUNZoJa+LXWC2Ieg7+dXmg88oJQA7q0vx3511SV/4Uuatr98sDg==
X-Received: by 2002:a17:906:1284:: with SMTP id k4mr19971092ejb.409.1620112987470;
        Tue, 04 May 2021 00:23:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id h15sm915197ejs.72.2021.05.04.00.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 00:23:06 -0700 (PDT)
Subject: Re: [PATCH v4] KVM: x86: Fix KVM_GET_CPUID2 ioctl to return cpuid
 entries count
To:     "Denis V. Lunev" <den@openvz.org>,
        Sean Christopherson <seanjc@google.com>,
        Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Shuah Khan <shuah@kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        Like Xu <like.xu@linux.intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20210428172729.3551-1-valeriy.vdovin@virtuozzo.com>
 <YIoFFl72VSeuhCRt@google.com>
 <0d68dbc3-8462-7763-fbad-f3b895fcf6e6@redhat.com>
 <be7eedf7-03a2-f998-079d-b18101b8b187@openvz.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63e54361-0018-ad3b-fb2b-e5dba6a0f221@redhat.com>
Date:   Tue, 4 May 2021 09:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <be7eedf7-03a2-f998-079d-b18101b8b187@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 03/05/21 21:18, Denis V. Lunev wrote:
> On 5/3/21 5:54 PM, Paolo Bonzini wrote:
>> On 29/04/21 03:00, Sean Christopherson wrote:
>>> On Wed, Apr 28, 2021, Valeriy Vdovin wrote:
>>>> It's very explicit by the code that it was designed to receive some
>>>> small number of entries to return E2BIG along with the corrected
>>>> number.
>>>
>>> LOL, saying KVM_GET_CPUID2 was "designed" is definitely giving the KVM
>>> forefathers the benefit of the doubt.
>>
>> I was going to make a different joke, i.e. that KVM_GET_CPUID2 was
>> indeed designed the way Valeriy described, but that design was
>> forgotten soon after.
>>
>> Really, this ioctl has been such a trainwreck that I think the only
>> good solution here is to drop it.
>>
>> Paolo
>>
> 
> should we discuss KVM_GET_CPUID3 which will work "normally"?

Is anybody using KVM_GET_CPUID2 at all?

Paolo

