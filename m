Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECAC29D26B
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701758; cv=none; b=b1kXdjsA++qQQj5LG+Dsd7cA0MWTCN38J+eVD/f9+JGU5jrveM0mUjJHqPe5yLD88lqDmsqUKOjLEGMnQiZ8xG/WKmAJ5ncwvGdd+FjXbcVFFMcRH/lJyRgAyYS5uVra0gfCX61KFI0K6F6Y56Cq0qbBmE8Bga+DV8qzjB5uU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701758; c=relaxed/simple;
	bh=zuZtarl0HDSmqW/AZV+7RjZzgS4L7RDu6mlYvcegPuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8GN71ZDjBFkXbLbkJvvvqJ2fhJgqaMi8cRUAkTloMDRDtTdhT1xsjaGHnkyosWryCJyHYbs8DOYzIWiL/cpJQMK4IDxRD+i+lbRrGlC9ZCbdCf70QKSB8CVZExHeaYoA2+lFgAyjmwL+dvkF3mAnXbsgc3apVVlBi+nytn7Rd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=R45Of2hP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="R45Of2hP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso19688765e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 23:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777701755; x=1778306555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMTwyw43NAPsBdN0lEvEHduQcIRfAv5+dGrM1lniOAQ=;
        b=R45Of2hPC0UElpUVYuhMuiYB4F08dAHHNGnWQ+u45o8KHJzcvTSE1a/R5wtVKrIH3h
         6BdnldcY7PDQF0juLRdJ3fUepUmIMHRMjQbTn7Uk4DGhkrV/HjVcRXOTeZ1/pvRE/CTU
         W43IntF62RFcgZv0uRp5MSEj9rs0vr9ajSg2aI0qP+PsEJ7x0Wm0KGd1KhEicGtxcXnJ
         NlaBGInrmjPywgyUh43imJ5juJcJO9ZMnrHgBl31aGH8s0L9VhPfbQ12TLUgNDI+irTG
         fYeVvrBBYE2SmZR/8hjlZftxHJ/9bp7KvkIoKLSJMOGricYt8YuQs80QeH5jLz3KGp0a
         9LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777701755; x=1778306555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMTwyw43NAPsBdN0lEvEHduQcIRfAv5+dGrM1lniOAQ=;
        b=H+Chta5Kn8Gh9Wq9Jrq/PedU1NFKmgpGeK8CDEF1BZjyw2DgRQDEEV023chhaynCNR
         A0jHuwZPwG0wtLR31HTIcPG+TSd3qN20QJvs7HH9P8FveO8MY3t3M3TgDec+QC62FiLd
         RSHn0ATWJqF6JOoa2U02rUw45yhbT2bLYjRfIk/qj+4a7CzTFzalkRr9G7qE4sWl7Rj+
         JIzM4V8Mv8DvKZZLl/+erqkusoR7pqLD5rjQgp+PXPcL+xQCF8J+H2nT+w2MpG+9GSPv
         wVVmZtnJi53J44J3qJuH1uiiC6DH4Hf3NM7kv0Kh6hUaXspi2bGeSZg1LZPb75Bz1btE
         gmaA==
X-Forwarded-Encrypted: i=1; AFNElJ+esxGm8sjop0zumYOGWnHCJkGSOw9/uqC7DrSMuCazrbrHLvKnaLS5BAouvspDKy21rsPN3R+d3EwluoYmyVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHlmrX2WjbPwquUMokLl5k9AlcwCw7fWmy+m3T0y678eh6MNJ
	CebADrPlKoiXxFRqAjywqlC6THuAILnIOO7AZ5TP0Cz2UPXAVjvot6+jfe0LtCJLsAM=
X-Gm-Gg: AeBDiestexyaoq7UaWDzWxdYGkFOC7AMB+EbKD3f6gKlNwUI+so8AdIMOmYUSHF4W39
	xpfwtJ8AqH/oczNosLBJRMCNhaiGvPPyNJ6MR+r9RhdeQAPWHsJ+TbuPJgG+ngkcQW5L/zSQhqB
	LmjBqzo9/NjXEdoQ5RIfOC9+RBD2ca3GA4eFQAiX1SFmxoocrLeKGiB4yGMquT5zC6Jyuqcv8mP
	SgNh6X+M00aIaiFHI1kpcBc7Rnfoaz8RO6FGT/T7dwYK+OulyIBkeN8QVoXs0/3JlAMWMifsrpH
	I9Cwta/SWWYYCksI9RQsMj3bSB4+unqWRvNknkQ7NVD0xhLMtClfVeNMps6YrlUit6GBVFrzX1d
	BNQFFRsTbyOCQ7wrQelgyClSZnlqmVgPo5QEsl2TB2gF5gLchJWL20tfZsYNFtZZvm7YHK4uLuo
	Uxv9Tpo6mvuKKvEKa7FEWrj/SU1vT8FwLwaGNukLHV6e44bmv7z2d3iWDOR8OzK8Uu
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48a9866a998mr20975615e9.21.1777701754546;
        Fri, 01 May 2026 23:02:34 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm9113763f8f.31.2026.05.01.23.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 23:02:34 -0700 (PDT)
Message-ID: <dc11bf91-dace-4235-9055-223042067a23@blackwall.org>
Date: Sat, 2 May 2026 09:02:32 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/5] ipv4: igmp: get rid of IGMPV3_{QQIC,MRC}
 and simplify calculation
Content-Language: en-US, bg
To: Ujjal Roy <royujjal@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>,
 Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260501173130.3486-1-royujjal@gmail.com>
 <20260501173130.3486-2-royujjal@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260501173130.3486-2-royujjal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2026 20:31, Ujjal Roy wrote:
> Get rid of the IGMPV3_MRC macro and use the igmpv3_mrt() API to
> calculate the Max Resp Time from the Maximum Response Code.
> 
> Similarly, for IGMPV3_QQIC, use the igmpv3_qqi() API to calculate
> the Querier's Query Interval from the QQIC field.
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Ujjal Roy <royujjal@gmail.com>
> ---
>   include/linux/igmp.h      | 80 +++++++++++++++++++++++++++++++++++----
>   net/bridge/br_multicast.c |  2 +-
>   net/ipv4/igmp.c           |  6 +--
>   3 files changed, 76 insertions(+), 12 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

