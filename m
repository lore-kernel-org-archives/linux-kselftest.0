Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6F81B4F1F
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785602146; cv=none; b=pdGhJYMCDNJjx4v8U6ujHIRmdFRxG/IQRf+SXTjZ04Yt8Nij+ncmV/UQK1ICzo0ZZx2/kOCD92awY3OJphsXrvZKsulVBWbzEUQyZPRjBl3ICmmjv68zhsmHxhr8NtzQ+LfolPZLitbDTuQpuJUkZs0vfIc3xWE5XwVwR0I+lwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785602146; c=relaxed/simple;
	bh=6IuylotFFwWBAMQj2NqdFiyeiD6OdWolIXT2oYsLmN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQRUw81JctFySaTq5gsIHT4UO+UTEQCAtMDKHIfKE4p57WZZ4aJBcptAs2wYsHZ+C4HCX7HR8XB3RXlh4yvKuBWlkCbNcTCLFvgiDYHuioyfeK9DgFKp7BmY5RBqEVWgxTWSQNtHAcynNpN9OeMxLViw5q6QhiMxxNLCO37VTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=djQgz3OF; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="djQgz3OF"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb85186d43so953304a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1785602144; x=1786206944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udc5omUAynrLhsYpEj8XTZjU4w2fwTsJzsp1YQPMNQs=;
        b=djQgz3OFgVyKmNCvPI9qUU2AkCoHTaznD48D4FGxlLEhpNJXO5lsokId/Ir9MIt3rT
         ic2KQzjIXyo9fYo6SE52czST0uTkyOnjQFjMHTkNT/2PJGTjKf6vJctw2BzX3qMg0QaR
         usLJTQYT5TRYrWvZdZs0nBhVjytMu1stNezQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602144; x=1786206944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udc5omUAynrLhsYpEj8XTZjU4w2fwTsJzsp1YQPMNQs=;
        b=d9G5ZCijqF8QPjP5OnN/E1ZlQKHhEGJvthvZXIILjNevQx3M/Bs9jkjsKOzdz2UM0U
         vPdFRrhbUsxQ87kQdEbQcYQOA87ujd6aSk0qJtueQ6jVcXhHGHCarmTaPt9ynNkh5XO1
         KoQ80x6ky3UMRVBMI99xI2c5yTek3xaCF8BroJOTFt/Jz93Eqfi8uSNi5mx70+SMO70T
         sGWtVHI0nE6SHVVL4QTE8BoYHk0TtIunj4xjUPiJ+I/C+nlNDRy7799AaRuIhPISScIq
         uB4Gav5EZ4L+GT7EYqPH97db/fD97zyn6Stwy4Bb7HESx26xHuMMFfgIX2kJOl/7jtff
         F1pA==
X-Forwarded-Encrypted: i=1; AHgh+RrL2y9nkZ6h9gayg0X2fBOI7RV9K9KIiNRIgIzb0xqL9Wk5ABKq+t74LOI0u0yF8eGF+t/Y/Sk7ONqXMvbhuwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zQls8dMh4FHohunYsf96HrG1Mm5yhBnnliQbsOmNos5Y78sn
	5SRVRK+tMd5aBF6O6gKR3/6Wk3leYovfr7vuoDfRp5GvzlXgDuF9sWv3h7BKBjZhnw==
X-Gm-Gg: AR+sD12k0eVDPp9dY6CrS+kRVKAFd8gV2YeBhacmZKQyP8Z992Sz1Nn99KHTn7uOEL9
	a8G9MeWtk1sZYmt7dp+tslz8125kzkwpd8dm2LB1GGDyVzXp+jBTCCSmzTXwNBkiRvM52IbB1Rw
	1+zxitVppKfV1XPv0brvIM0dPdYP08hS0rlxHYFq1OB2PLiltvWqJcwOTFTyaEL43XPFSXn4w/a
	SoMY2F0YcvYbQYr4H+ir4BGTpFiZIfkqt2ui+xTMPLkavYxzkjKG+pg38XgYbhAxPH8iXInDHJA
	PUTvhSDb1u8NWsf826eGjXhr+O2zZU4ehfnuSkVrsIBEdINfTg5nWG+wKA3oC3jiZV0shzeJP9E
	OHLwEXogbU1xAzHXqg6P35tAd4kHv0tJegzoojIFGWvNtWWyNdXheCNSfuF9znfOKbD04BXwJQX
	khfP9WpxB3nRFPM1STgK5DdyZBX65nmzU9ASaKDVWn9hiYqtxPIdyJ+wkv7OITtz9BJMq6vg==
X-Received: by 2002:a05:6a20:734c:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c92a5a8071mr4103827637.12.1785602143791;
        Sat, 01 Aug 2026 09:35:43 -0700 (PDT)
Received: from ?IPV6:2804:14d:5c54:4d67::2000? ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab143a7csm13089048c88.4.2026.08.01.09.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 09:35:43 -0700 (PDT)
Message-ID: <8afa5643-12bd-4261-a148-7032d2ac87b5@mojatatu.com>
Date: Sat, 1 Aug 2026 13:35:39 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] selftests/tc-testing: add qdisc hierarchy
 depth tests
To: Ren Wei <enjou1224z@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 vega@nebusec.ai, milkory@outlook.com
References: <cover.1785434373.git.milkory@outlook.com>
 <5cc2d26a7c8e553759cdd29a3116f843fabc25ba.1785434373.git.milkory@outlook.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <5cc2d26a7c8e553759cdd29a3116f843fabc25ba.1785434373.git.milkory@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2026 10:42, Ren Wei wrote:
> From: Zijie Huang <milkory@outlook.com>
> 
> Add tdc coverage for the qdisc hierarchy depth limit.
> 
> The tests verify that the deepest allowed hierarchy can still be created
> and that adding another child qdisc below it is rejected.
> 
> Signed-off-by: Zijie Huang <milkory@outlook.com>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Ren Wei <enjou1224z@gmail.com>

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
