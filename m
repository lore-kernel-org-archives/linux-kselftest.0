Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB5397321
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429990; cv=none; b=mAkmPelJqtCPYExd3EheVJQj2jiVbBoMbsSD7ADF5ovpu/cWqThnreXgb0W8j/8PtG/kqHPHPr8WKItzYdFBTb2tYz+z0eh1Oh/oC4KyVaDCdvZucf7+mcQSOTVlC3gRsb3JroxGmMwE1ToNpyc+3t79oYb9Z+0wnJwBgMZDNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429990; c=relaxed/simple;
	bh=BAXdmGMgsI8WSzefMNGXUq4jYvxq7gLeF6GtVDWlcu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsVmJXbX4IhoCoKm3fx2MydzDZBoZ4eHLnii6gLuWaJaqxUJnrC+ZYnWji5ekzcSSsSnG1Ud0rlc6HNIp0/GtjCvLSfvuiaYddTa59pVsVrTWRvfnl9ZDUqSLr0cjF7SqHQ2pXpQiEmmHVXlgJ2pDaBZ4sLdRXB7/4Dj8XunNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngyDxh05; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngyDxh05"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so94133a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429988; x=1786034788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8bI1Lg5owKwKHmnXpdk6gdmBX5YDmvVulHi1yxH4UA=;
        b=ngyDxh05Ov+xTRIY8k9EyfHFjS55c2ZGS4PHQ2w0Wy3Ci4nMlTAPG9Fys1gmIolA4P
         ZTWVGeCucI+nQGhB/8sIJ2bvhMVyI8m7+dcXx0jPc22CABlhVeutgfyQIBBg+t+ynr+H
         6A1bpWy1LpCPvloop7NEAD5pnzon06jMdKVHomNk7G6JoSH4gZGv7zJM4+iQwShkLs76
         uCweSOJlLIulD99kpkYO6DXkG4aa4OU6MtjgK41HdYoXZodaCuHnNDuUjpqPeQ1brd4z
         UTnqE6aza2CEbXfB/gkmKn5NwyLN8h55yytXob3U/sKfdxenj4xYhRYNxjbbOrQcVWpN
         Cp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429988; x=1786034788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8bI1Lg5owKwKHmnXpdk6gdmBX5YDmvVulHi1yxH4UA=;
        b=IilCauh/g6MUBQaiNrrwxsDUbzPVCnHcXNfEVbqfsSmmAAQa9M2Ld0qKO6rKqxcMoW
         gGzpT87fSFc9mUYCMPMqyGTHUKEJmxFBV3S9aXgYVLxIKR7VKasSSnYe/bQBxW9PJgCr
         kp5XKh5nsqJ4R4cGeTcvaH2ppbF37zlCSMCzfJGJAvb+kHernu4FSdhkfEHQKuzZhDzL
         y2LLPNUoxvLydl2GGdJz4hCyqSnzVAG4pLZS78/Yt6UTw+96j7YW0uzIoeKpIThMdDOM
         feiISCsf0I7lcTvc52C7Ey4QslR31lc3kLQ2RdaFDHgc0r37Dc8OiawEmTJGsrzub/KA
         tpjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7uzxAJ15XIWeAtnfq3usTt1/KQ8H4rnkKuw0XJ9XHzbafyVoh+WPCHCmVw1z10hjwR4ryIRprikjwgGh0EcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+LgKSIKUlJKwGgq/skHmXRKnoniC0ZswJho9Ir+vWHDQeuZi
	bJhiK4RU9BWDapjHERpECxMeWRXk5l6hxTIN3DCgIiGBlZaLFRNirtXh
X-Gm-Gg: AR+sD1254zemxXSKpJpNZKoUpuaQr9WQytlup47RfFNeJdwY3R9/WH1Xf9nYxJAVCR4
	zawget1Lw8XwhC211gZJiV4Av+Ryb3fryLbbR73EuoCaw0q840o3DW3lExNYVEbOvMtiStW+28f
	CORl5XOmIAnzCjCy77Tl4N8ew0Kbt9cuh/cHehUxuEnGndia7JVgNLbhTP2ZsJUXt8mHrcSYvFK
	sQsZDMM+MpxdbM6xZKzd2BhD4gGcLTG86gqxea9dHOt0U+JM3pDfzVfsRJ3IIDYJjgsk3hk6EHU
	21q3ZLyFETHDVdValm//Y7axGVPGArTidKK0rlM2cIpdWxQtbE+Y5T92stvY6buXgWnSrP5UXeC
	JFvawRTDCKztrDEw04NfS7vpwhF7YPuM692jdCyGmG5x7A/fA/u6u5qvlKTQIrGydXuaAkVuv1N
	FmisrNCLkEF7RgUq3yOIiQlbtrg///lm/7Cr5cPIuh285J2oU+3c1+VceiW7MuyxK18YKkkuyIe
	ER3KYSJ1sBZkDJbrBYdCHTkSpm01+kblODj4zRQtm0JRCKCVDEGbdm4Ass=
X-Received: by 2002:a17:90b:582c:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-38f9bdac904mr2965133a91.15.1785429987976;
        Thu, 30 Jul 2026 09:46:27 -0700 (PDT)
Received: from ?IPV6:2601:646:8f02:5350:ce4:701d:f6e3:3a6b? ([2601:646:8f02:5350:ce4:701d:f6e3:3a6b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm20107506c88.15.2026.07.30.09.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:46:27 -0700 (PDT)
Message-ID: <81e5156d-1619-4892-ac29-e8bb11acd494@gmail.com>
Date: Thu, 30 Jul 2026 09:46:26 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V4] selftests: drv-net: Test queue stall upon
 reconfig
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, dw@davidwei.uk
References: <20260725002156.3027762-1-mohsin.bashr@gmail.com>
 <20260729191014.2634ab1e@kernel.org>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20260729191014.2634ab1e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/29/26 7:10 PM, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 17:21:55 -0700 Mohsin Bashir wrote:
>> +# TX ring size the test shrinks to so the ring fills quickly.
>> +MIN_TX_RING = 64
> 
> Testing against bnxt is failing in NIPA, could you check why?
> I suspect the rings size may be too small (hence the quote).
> There was a recent patch to Intel drivers to require min ring of 128
> so we may need to try a few values ([32, 64, 128, 256]?) before
> giving up?

Thanks for the pointer. Your suspicion is correct. Broadcom does not 
allow tx ring size to be < 420 when we have software based udp 
segmentation. I'll harden the test accordingly.
