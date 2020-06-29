Return-Path: <SRS0=aTDy=AK=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C5C433DF
	for <linux-kselftest@archiver.kernel.org>; Mon, 29 Jun 2020 20:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B55D20656
	for <linux-kselftest@archiver.kernel.org>; Mon, 29 Jun 2020 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593462117;
	bh=LiKVXY23oylE1D5iKy3i2vr44WMPTs52Izwdsf3Fmp8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=zrSRgSCUiskZex7l30FePtMcXtSOnJmBTGRxTicZmceag8AY+4xte404yY4t2r/La
	 R6Qnke35g26OuOUbo07jeyYSDB7H31oRdqsktLEg/g6+Gie+JG1FliVoAUN4kNLmKQ
	 fNYBJZv+4XvZ6n7HhyhAVYW+xumJldPusLgPRzos=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbgF2UVw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732590AbgF2UVu (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 29 Jun 2020 16:21:50 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6D6C061755
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2020 13:21:49 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id q8so18597573iow.7
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2020 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xe0Kngev5V0/2bx10GzAMBFnMV/HG+Kp7x1mqRPLtn8=;
        b=Qe0B4hN6JKmXDAhczq2oH+LohHCdr7IKU3Oc+5OvaVsLeMY/Gfq8E693dAwZeXvtYB
         9UxlCIgHPxx8vAzPeOflNYyNQnfyo3uUyg2WSWgfB+HBYIdbc6DtlTd1wL737VZ5e3BK
         IrlSrC/99WWot+aPQgwRMpRDEuf+8IY0FSfYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xe0Kngev5V0/2bx10GzAMBFnMV/HG+Kp7x1mqRPLtn8=;
        b=SskRUrPYd77IoFgvmxXnPChw6eo4FTBwvEIApshkk/jJQWWzjomuAqWQZAbKliR1/0
         e8pf6Zwq8ZgAKzrb28MyKBlaYBrw5YO5l3Q9cxA5IBNcFfwRXCX+iQEPgxu8ZWgN0nNJ
         DK+kBmdnkLERL1FnuQ7+z/hFyOT0OehuNJrEWdJqUq/WQ9L9uzESG1CyhDY2tmjlNY9B
         IEBnQTBcX9/lH1nVNdNfDZkDQuspGkcGPB77PvDxON+UXMoL/3mSJ4Wk8uf9Q17v/1C1
         EhnXRL1+UmjfRN/VD9JTNHFVMl7iNZ5R8UvbCkxhobjJjvAj4xFyJsfYkVbfgB7kcu8P
         EI2Q==
X-Gm-Message-State: AOAM5331OLdU1HjmSvBxpc48NHyNmjNAdn7H5FQTxDz6qshR3NLAP+wN
        15TCVw0zVdBIUBG5yCBl32/BnQ==
X-Google-Smtp-Source: ABdhPJx8iE1nRfHXfDv7Z/LjcCPE31AEKBsPiln2NpPL29NMT2q2L7llun+8++o8/dahYOJ1YsK5Mg==
X-Received: by 2002:a02:1a06:: with SMTP id 6mr20182590jai.8.1593462109366;
        Mon, 29 Jun 2020 13:21:49 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c9sm471009ilm.57.2020.06.29.13.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 13:21:48 -0700 (PDT)
Subject: Re: [PATCH 0/3] selftests: tpm: fixes
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     pengfei.xu@intel.com, Joey Pabalinas <joeypabalinas@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Nikita Sobolev <Nikita.Sobolev@synopsys.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Tadeusz Struk <tadeusz.struk@intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200622212034.20624-1-jarkko.sakkinen@linux.intel.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ddf50129-5fe0-ab84-1bae-90a06ba017a3@linuxfoundation.org>
Date:   Mon, 29 Jun 2020 14:21:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622212034.20624-1-jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 6/22/20 3:20 PM, Jarkko Sakkinen wrote:
> A few fixes for tools/testing/selftests/tpm.
> 
> Jarkko Sakkinen (3):
>    Revert "tpm: selftest: cleanup after unseal with wrong auth/policy
>      test"
>    selftests: tpm: Use 'test -e' instead of 'test -f'
>    selftests: tpm: Use /bin/sh instead of /bin/bash
> 
>   tools/testing/selftests/tpm2/test_smoke.sh | 9 ++-------
>   tools/testing/selftests/tpm2/test_space.sh | 4 ++--
>   2 files changed, 4 insertions(+), 9 deletions(-)
> 

Applied to linux-kselftest fixes for Linux 5.8-rc4

thanks,
-- Shuah
