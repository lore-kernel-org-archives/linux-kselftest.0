Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF526982C
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776869497; cv=none; b=BuPFWCTWCbcV6yqIs9GeKPBBP72vqAaG5eoKZVvqRxIKr48d4BWXPYif2ZBIM0tbA7LV8fK/9810xyzq0kyi4wn41/VRvIAcg8eP41Jk+UXIQ/iu57CFnc87mFC4XnTHL/JNGuoH6wq0nTAB+WWfewbthEixIO18hcL0koASSEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776869497; c=relaxed/simple;
	bh=+LVXyKE69oIbtlJfKGv2kRb15cV1n7Spv9A2aCjVHyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aH0ahN7KnKEd6WFpfNB8KGjOB8XGVtAh8zj70bGV+sxvFTq03ykM/NUjt+TKjG7EFT89A7EAkkinOyN4+KIhM5mx7PbZ0LeWVIg/N+GtSdbH8tI5DZyStUXyY6DuX212izCjzRDj+6m0ZV2TvHATQooZnbP3mFbVrFN/rHSQG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bI/I3Yyg; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bI/I3Yyg"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbcf927395so3185464a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776869494; x=1777474294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2jvAvtZDpm4Iy7l9gNgov7ZiaduiFtwdyuSw5zTo7w=;
        b=bI/I3YygFEVKJGWwnfibx6H6ybBCnitGAT11SMRx3r3dwZhut0LwGzi67iBcgePMrW
         eP3bPnDneAqThsfNvtWPvVnIDIdmPavPzngXPlQh0luCWiPMDrdsKX4qWTeIrt288kpV
         mbTLd3H5qVmeCUrnRkdg7d6aYW2rKggA2lTss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869494; x=1777474294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2jvAvtZDpm4Iy7l9gNgov7ZiaduiFtwdyuSw5zTo7w=;
        b=Yfuz2rsRcyz8Z8mO99CVftmetFrMNgNnEzvJTGll8ExM6rCAl+HYCjDPSMdPsk6uUA
         vUXwuhmkwQ3sdPLCcweCpYnTkM5mbcyNHqFAPgMAX1Whdr47csYH47GGq9+V6hgJY/QC
         AtQd5SSMMGFz8Q02C0+p0w1TsoB/eOoXPKdnpxi8W0Ek9/00E21o60ToproVf4/oGK8m
         uc0BtQXiKTDSdRW4jQuWkIep4e1QvPH97rm1dGMEmjIVUm/51luqxmT7s+dW8zlprL8V
         RhNAr+OQV/vodkliXszuYM/lI4lqubLr/oPPBIKHSo38EZJ3Gt7sq/rSUl2SocIFML/9
         bjrA==
X-Forwarded-Encrypted: i=1; AFNElJ/Hs1RPRN419ju2SfXw26tF+MCP8gg8pb6wnr1ym+20z/f2oHAJ/kjpV4FM3kxEC2d2ee+6MNB3Cq0UnbfAGCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6KzO+l2CTUo3eufVxcO7X6Oj6ZlMZZqjCQxfzrQvGSSbBGeTI
	tGja+C0LKT6G+mIwT3TQB/MOanFkzBXHrAkwYRytFfrrxOwPh1m0EeuiNRy0H1zUmcc=
X-Gm-Gg: AeBDieunwB3LyGAjoY/PzOxswSnJeXfFK0kSIC0vYM07KqZOUa0cOPHlFbKUjZISl23
	cK/tfiDQEf6IlHoluwOtH0iC7UybRClbkWQweNjfpuqIhSWcDIywkbb986aa3V+ljyNnBwRqfrm
	VCB4s1N8SFkNP1crI0FQzKN3KSZj7ngixBhkgw/M8ZKjCHSG4Bguni1eXOVX4+WPAXmzxPhUT1H
	h4lEenZyPiDRrsZ7e43cKUbpeGbXCK5bLF/rVcLgnMPOnoW+axDVLukRTHNbGXjROyuxYO5ye90
	VewcmnYsCVMu8ncdB3nDOU/LH3Qxo1YJJp3eWJe+U/Mz+OvgJX7XzEPS9KuuQ47nAne07giQGD7
	imqk0dU6QvIZYXDZUns1qDF2wz+FMrLP/seHOYxhWnDN8AzksmlDvT/89KbLsa7H1BbqQpWqXJA
	fwnaMiATv8AhO72gHwOHfyzSsEDBYgzrZUXLbUtjoX+Q==
X-Received: by 2002:a05:6820:f00d:b0:68b:cadc:4346 with SMTP id 006d021491bc7-69462e16373mr12134290eaf.1.1776869494590;
        Wed, 22 Apr 2026 07:51:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-696148cd37dsm142307eaf.8.2026.04.22.07.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:51:33 -0700 (PDT)
Message-ID: <4915db6e-5bcf-4f70-b510-693f5d5b8678@linuxfoundation.org>
Date: Wed, 22 Apr 2026 08:51:32 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: runner: Avoid spurious warning about
 missing failures file
To: Yohei Kojima <yk@y-koj.net>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
 <ader8C3F2uOY7ro6@desktop.y-koj.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ader8C3F2uOY7ro6@desktop.y-koj.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/9/26 07:38, Yohei Kojima wrote:
> On Tue, Feb 24, 2026 at 04:37:56PM +0100, Thomas Weißschuh wrote:
>> When runner.sh is *not* executed via run_kselftest.sh, the variable
>> $kselftest_failures_file does not exist. This triggers a harmless but
>> annyoing warning from runner.sh if a test fails:
>>
>> tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
>>
>> Silence the spurious warning.
>>
>> Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> Reviewed-By: Brendan Jackman <jackmanb@google.com>
> 
> Hi all,
> 
> It seems this patch hasn't been picked up yet, although it already got
> reviewed by Brendan. This bug is also mentioned by a netdev maintainer
> and several developers [1], so I think it would be nice to have this
> patch merged.
> 
> [1]: https://lore.kernel.org/lkml/20260112135326.7ce71119@kernel.org/
> 
> I confirmed that it still applies to 7.0-rc7. I also tested it by adding
> a failing test to net and namespaces selftests, and confirmed that the
> error disappeared.
> 
> Tested-by: Yohei Kojima <yk@y-koj.net>
> 

Sorry for the delay.

It disappeared in my Inbox - I will pick this up for Linux 7.1-rc2

thanks,
-- Shuah

