Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A033C183
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772573; cv=none; b=o0wwrT67VdTqhZnPrwxS0dC1AJB8JBhuK9lKAODwK337qJItd1GncRxRv+V8DLFz/rrgZEe0ZzA3EptUgMZTOVqjEf6FH/W0Io5Q0FkgwreLWfOKEQ1RugYn9Y7cmttPZisQ8cZ4UTyMFlIi0iULlGkD4l/iTLirth9euscwZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772573; c=relaxed/simple;
	bh=GWcILHSPgl33zJRFqewc4R17VJZqifG3UyuvPdkNFBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuGTpt+GFNhf0rI0sThirArXSrj/vUXcugic5izrpkr46Z02DTFQqICCoZ4FEaP3xB4mJqyhThXmnEeNP9EHiQsvswFfSfn5wzwwzBl2vMznptrAggs34PtE2kPd7HsVy6NwZAZCOxKSsOWaRN1x56BBJMxRUUJFA+Gg+p6LTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RPAp+1Ra; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RPAp+1Ra"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a451915d8aso2012963b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785772570; x=1786377370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwHf3j2tYQaR0XA7BZUjP/88HA14cOPU3+rnZKOaXIc=;
        b=RPAp+1RaRJLThboFzwPBLJ2WgLbBsjNyaJtXQ0sAJN5PF5tZSrooOqstqRwgDCa0KS
         o8us6GcFQysiLp+rJV44SfL0FxWgDZq7es1VXpl504fMLqO6TdtDh/VzpMwd9cZ4GYlL
         FXDBGOrE2pYWe3WdKFT5D8Btjso9HJ2TDtdPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772570; x=1786377370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwHf3j2tYQaR0XA7BZUjP/88HA14cOPU3+rnZKOaXIc=;
        b=AN/UgaQhzGPTz+N3qLYrdjY3MIjvfo+ujmitYSLTPIBS9FJFz99km4TtnYHcIB1L2+
         yDVW30aDM13F8o+OD/LJjN5fMv7y3N3ZR+Shb3F9+FMveXqzRSh0YmW9dlT+xdEbFxKR
         Vlu8SYUxV0S7wtKI0iEQ+Le2Ik9DtmA6hJSvSDD1yhYw8TvEoC+vX6qSS9TTh7aU2Dqq
         plQk7alqVudVW8DKWtm1oTHZTGzuYSf2pziIfr2ydkTG3LALwRl9poc5jcsxoIQr/Nlm
         OYFaqsqyqzXaP4A/E/KAhKmdd/ROO9fFrNqdLFALbmeYoELvbw3ucnvRahxnxkOeI6b5
         DIjQ==
X-Forwarded-Encrypted: i=1; AHgh+RojaSpPD2LqDvcjRj9AFHU5XfS6AjPvLGgQEsvKhZN/5PKrea2MvV2CrfxE7eQesPESPXucJ24Pvw2qvueel2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuF1BxSIM9RTM9hWfWA1XEXvy3CihmTELMX0eIm45J8RVqiPzE
	LW+uW8EVUWhOqNyOE5XWOmozqqcfMJ94pzjnc/hHoThZ2tcnyjQrilEWfstaqI3yS/M=
X-Gm-Gg: AR+sD13sCaY8bgq77wp4xVm28FnRgz3UrzfNwgnb9AKpdkYvfWi2+gvsF6YmjQEjHGf
	m15EFdc86ymzkXqZIuZKT5vo1n3U5gsford0PL9FuJvgH4wDk6cc/ZA6wSWK/7jvPJyY+LizBao
	9xBxpAVU6Luh84VxkTnYGfyB18ZR8HRPf9GDRuz6nWGRpbWe8FVdDA1SGbvEVudl5V6g5pjpRat
	sSMq5p8UYLP+giNdvIZZzE6YX1jxZMbj95EqRaFSGaFp3ZrR4M1h2HMsGdzEaPvSyaeQgbOVgtK
	1kkotT5Tl55uIKXLCQhdApHSkRJIAE2KB3rSPk8y7r5SB2J3y8saFBBUPuNylyDSlxUI7fK3W7H
	k22R91Kyc1/+fNfcrsIspWdtUE58T0/an/e0Taw8ggZbEmgVLUgTeJ9eZOo+rXZD/cI1SuGlxB2
	dMCiGxwROrpcDg0btZBZsAbInLZtYYcXdlfJRLEYvwL0Cq7Ei3ATNSSF6FrdbOz84n9+978g==
X-Received: by 2002:a05:6808:67c3:b0:495:eb9f:53c4 with SMTP id 5614622812f47-4af5e1f32aamr16411131b6e.9.1785772570647;
        Mon, 03 Aug 2026 08:56:10 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58d1112csm6979286b6e.5.2026.08.03.08.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:56:09 -0700 (PDT)
Message-ID: <b8f72a24-c280-4a67-90c0-4194a81a724b@linuxfoundation.org>
Date: Mon, 3 Aug 2026 09:56:06 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: tool: fix _list_tests filtering wrong variable
 when list has TAP prefix
To: David Gow <david@davidgow.net>, mohammad.abukhader@hotmail.com,
 brendan.higgins@linux.dev
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <DB7PR10MB2249CF29AB83F5BFBEC0801988CA2@DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM>
 <e1229319-0e28-4955-9adc-41a56f29c895@davidgow.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e1229319-0e28-4955-9adc-41a56f29c895@davidgow.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/30/26 06:12, David Gow wrote:
> Le 30/07/2026 à 12:19 AM, mohammad.abukhader@hotmail.com a écrit :
>> From: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>
>>
>> `_list_tests()` runs the kernel to list tests, strips printk timestamp
>> lines via `extract_tap_lines()`, then drops the dummy TAP header from
>> the cleaned `lines`.  However the subsequent regex filter mistakenly
>> operates on the original `output` instead of the cleaned `lines`.  When
>> the kernel output includes timestamp prefixes (common with UML or slower
>> setups), e.g.:
>>
>>    [    0.100000] suite.test1
>>    [    0.100000] suite.test2
>>
>> the anchored regex `^[^\s.]+\.[^\s.]+$` rejects them and `--list_tests`
>> returns an empty list.
>>
>> Filter `lines` instead of `output`, matching the behavior of the
>> adjacent `_list_tests_attr()` which already returns the cleaned list.
>>
>> Add a regression test with timestamp-prefixed input to verify the fix.
>>
>> Fixes: 723c8258c8fe ("kunit: tool: Add command line interface to filter and report attributes")

Missing Signed-off-by

Unfortunately I can't apply this patch. Please fix it and resend.
I will try my best to get this into Linux 7.2

thanks,
-- Shuah
