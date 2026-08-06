Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E9D364024
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041838; cv=none; b=b++KD1YF7/WIhO31x+mRPPq2QBfXxJkeRnlevs17+Gg1wJ4VFFAwnm3aF/szgrb71b7NvHrSTsrA+5Bsr6UHM5/jkWxqNgXWyTLJZWuTMDnPbDaRfI5sO8r8c2H3blHdKpTd9Uu8lv6QgkhWzttP2hcjPY0wg9dsBIH0fqjO18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041838; c=relaxed/simple;
	bh=1rNQuFiOhOt37dJ+cNPkGEJONxyExx/izUhY78wCnPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxfxnZqIaj6aEoL0BUkB8MXcG9U9KLw/w4boPxfEuxuYE917lfD6iA6kR81liuNB+fhEt8BnK1CHLqH+El7cF6afGhqcvojxmS0RRdy3DydodpH69WcW9AhfYUyM24z7/n307pzkdTSrtOx4EMOdeoWWJ+jabv4cAuqkGUtiA08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=LRi2ZfiC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="LRi2ZfiC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caf228a910so21366195ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1786041837; x=1786646637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fn7BhnQqlmz5vpie7E8GOeB3W2csN7XIMYWDpfqkT7g=;
        b=LRi2ZfiCEQ7+sp1iZRW1nfzOLSGMHP3L9rmqMcd0ztHW4xSa46TlxuMTCLPOFzB2u8
         Rm+Ph3KsRbWUhgT9wP8UIq/Jgp/rF4T7Uhx7JLnmkgTvvsOvy0duE8gzfmUyTrweJ4jL
         YCr5azyKU5VtAxnbfmgMP8ttRDqKUxPBRc/1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041837; x=1786646637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fn7BhnQqlmz5vpie7E8GOeB3W2csN7XIMYWDpfqkT7g=;
        b=lq5ssagDymfkNNpOM5bHQ4aQimfy3x9q/9K28x/abigNCzNzYxJg7LAJ5q9xy6zHpk
         +P5c0xXr54hHoxKYiE3K5NKcOqy/4jc0Cj94JQqxABkc7/YpIZc9UQw0ZkAdYw8NLQ4/
         iwGMi0Ca5F50GHePGx83xXSwcSFrIFVs1I9RoDjdfuH/kOiED/V+zPHUMERRAdm521yN
         uTDd8nfkW9isSNgKnFgwj90bXMpMui1AftTuMjYIbb6XOq0TLzdqXEH+q9nrWN6JH4XB
         LEgHObvA1FhydGsn8RZpM6M4oCnR9juATvJEa5bu8D7Hj7c0JbvVzSvTuD1vTU5KwTHB
         P5DQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4bmjRYudwL3XaysFfecNHUJBD+ve+lUhpDxxohXtm/LL3OaxhKWH300Ij+/MnHsoTUIBywWutExWu0mmXJi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5G+V5yP0O31Z3tQyJeUoLe0iLMmbTbWlvacMVdUUEivUi9VzD
	eCZaaVWH2b/774LPYepfOpsQ3B4Zh1hRR8gsHT6jLTWqMYzDLn4aVJgoUjfYnieH2w==
X-Gm-Gg: AR+sD13vWNYlDWE7F+fDBVpmFWdvDDOp0AmrKeFquRKsAK3jf9Hdn3wzJkhN1Ry+HuX
	V/kYObg9Yw5cawiPjxZDJqmD9hpXmyrM0EosN8jASjDilHxnc6/4POV3JLItJR+2d8YnsufGWR6
	Y1EBH89rMlJqVYXN46SYWBGMzoOk30qvvOuac4dzlSu4479u6Ql+JhssP4ni14++FVbOv4qjr4R
	GY4VkSSSK+tVSRmSRd8yvoyRS87iqleIJ1Or+DxuariYsmnYIXObptKF1qk/4Gx5PBqSxf5tCfm
	RrRBUj/UHWVQz86J05IYaycnxevhI9IDNOAK0EQwma2L1d97Nom5f8PwqGF89AWj8NIVLH0/u9s
	MJtmYVnvrj7PAAYNen2uj6r43tn3dkB1/ZTSeH/L6NyQLniSLFYqgBPLcWOBkfVHxQMLMwQMrDW
	mn9SM2KN0rMQy2kV0hXxKQXAiF6yaA5fhBjIWkf95Cs84oEkNfOS/L6Xy/yMdZKH9Z9ssooG4R1
	0bsDBOO
X-Received: by 2002:a17:903:2b0d:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d0ca7afcc1mr206063715ad.4.1786041836673;
        Thu, 06 Aug 2026 11:43:56 -0700 (PDT)
Received: from ?IPV6:2804:14d:5c54:4d67::2000? ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d120c12f10sm648545ad.62.2026.08.06.11.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:43:56 -0700 (PDT)
Message-ID: <86bdf738-6b23-4a13-870d-8f3403d806f7@mojatatu.com>
Date: Thu, 6 Aug 2026 15:43:51 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] selftests: tc-testing: add act_ct test for
 malformed header handling
To: Hyunjung Ko <hj351016@gmail.com>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Tao Liu <taoliu828@163.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260806101235.809370-1-hj351016@gmail.com>
 <20260806101235.809370-2-hj351016@gmail.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <20260806101235.809370-2-hj351016@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2026 07:12, Hyunjung Ko wrote:
> Add a tdc case covering the leak fixed by the previous patch.
> 
> The test attaches "action ct" to a clsact ingress chain and injects ten
> IPv6 frames whose nexthdr says hop-by-hop but which carry nothing after
> the 40-byte header, so ipv6_find_hdr() fails and
> tcf_ct_ipv6_is_fragment() returns -EPROTO.
> 
> Before the fix act_ct returned TC_ACT_CONSUMED for these packets, so
> tc_run() never reached its TC_ACT_SHOT arm and the clsact drop counter
> stayed at zero while the skbs leaked. After the fix the packets are
> dropped properly and the counter reflects them, which is what the test
> matches on:
> 
>    before:  Sent 476 bytes 11 pkt (dropped 0, overlimits 0 requeues 0)
>    after:   Sent 400 bytes 10 pkt (dropped 10, overlimits 0 requeues 0)
> 
> Assisted-by: Anthropic-Claude-Code:Claude-Opus-5
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
