Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54C3612D8
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785601678; cv=none; b=PuzXPSmPViya/gNma1ALNgvI/lPi97xh0EFm/Z6QG+q1MxcBAC6xI+7HeKIdQItAwH+RFNnJg8NhE7mXsLwGcSG6JoMFNLCYERV8uprhkaG7V3oHIxh8YMhNj1UsrAWpC9svC7UgN12OACm0hrgjSo+XdcLsM3Lgyk4ozc6O5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785601678; c=relaxed/simple;
	bh=N4jwfZtGyKvIYXLG6f2s6xYg8+MeESB7wKlX2azzSno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kb7Fg6xowPPsjnBvh2TFgwVLkccBoCw3Uu/iqZXPonJTH0Y3RawtMSxS49jBKwslgymD5shsoLp/2cu8nVSSEsjqa3Z/HDkmwvXhq5jUreadApFBLqxPFGrjsbQltb0ZHYHO4ZnXRs5ZbannArh8soj8WDz4HSJmLVGYRLuNQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=BULtA/nj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="BULtA/nj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1565743a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1785601675; x=1786206475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZYiUKxvF9GtOjEd/h2m4MxUMezPtkYsLarGGm+pGsA=;
        b=BULtA/nj+l2BFZTAqutuDaSL/rd4a1mDX2jdKApM+JfQVGEjuBV6Ng1nAFQxWeNLq6
         Zdc0OsGFn0MfaOCwhjv8gmftsi6CXhmXKAG9HP3GKWGgRfbF8MO1me24oSXEWkVFYwbj
         eRkKrH//3oPtjq698BZ2ykBQDN5bbEp+NLRbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785601675; x=1786206475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZYiUKxvF9GtOjEd/h2m4MxUMezPtkYsLarGGm+pGsA=;
        b=oQhk2vUUUzwWSSQh8H73yPKyQ4UKoDqFzKMgKabsKQHSwHHATL9Nfd2i3LmAneRwGo
         Febgn8Lhv5Tfwg7KyRccffnakG8DX4I29BrBrnYD5Q01h+o0WqDGJLeaoHnlFlk3bg1E
         KITYfGClv//gXAbASat1rYyjYwER23c5kLKbuIJ9uvVizII6gTFaKYMdtHPXtPEO7Tii
         HoHCPL3SGD2olVq9tYWD3x5eHZWVLWYjnGF6JW9IXiEmjR/df49e9zsImFJSD+Hnbzpb
         YKDp0g4MFgPTz5BxCCQ+4CR0n8tmLQaIq3cblodCZu/dX9KjXX1kVIYmuNwu75W/R/TE
         RTuw==
X-Forwarded-Encrypted: i=1; AHgh+Rop5hhSNqJwlcjT6uhska6zTUBz5ctIVfFme0Jp90xmIi8MwomVXf9lTfd0Zm6lYe3obZsRRZLNH5NiBgH5qis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzimPqlXV2Kim4Te9fPAUuOpxXHREKyYsz0XcJ+YzGkn2lb23cZ
	ykhno6Ta1ZfKqXvtyW9xFKgre1O3yhUBufe74QLij4OPRmQGjRRvslwS/ETywhHcIQ==
X-Gm-Gg: AR+sD10BnQ1mfGQoIqhsZD7wEPR1QmpFMTYSBYmSCHXgOQ90U53lPRk2gjWAiCVoPFf
	V0NaJNCz/QXEQHvcaUAaL3HkUhO8m/dN0KvkicgZfH6UAZLC+S+H3VluTuLBo3IQl9jA88DuEB9
	7RlmOz6BC06XRBv8jl8q5b+uj+fpra6FODQ1Tj7O3CYl4OSVwkw7l349i2xglJDoZc4x+3KaHJ4
	Cpa6j00/TBLlVQplzfcnzX0oywQB/hZxOQBOgw+lKlUtCW5RgA5AcUrwdv7UelUiTnuHys9tGgA
	8Dkn7gwn9e8+65Rb409KMN//bSjuBkvtUr8b4vzvpqkKP+VghOra08Lz1gDt8zAxsyBjlkkGguK
	XduT7G3GKs1D+Tk6NVXXBZi3RSdF7PvzYDAoPSbWxwSb2ZiYD8MrBYHclnZo1jU1cMGoaZqE1w+
	1xpXz7x2JDeejDm6WaeVBbHkzwRqbzNqf0XhOgLNXpyJidPZ6Zo4WEfMmmjyY+yeHzf956dA==
X-Received: by 2002:a05:6a21:4e02:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3c92a53edccmr4024344637.22.1785601675338;
        Sat, 01 Aug 2026 09:27:55 -0700 (PDT)
Received: from ?IPV6:2804:14d:5c54:4d67::2000? ([2804:14d:5c54:4d67::2000])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm21682784eec.5.2026.08.01.09.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 09:27:54 -0700 (PDT)
Message-ID: <7a0d6b21-a10d-4310-9202-4262bb50c354@mojatatu.com>
Date: Sat, 1 Aug 2026 13:27:50 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net/sched: reject overly deep qdisc
 hierarchies
To: Ren Wei <enjou1224z@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 vega@nebusec.ai, milkory@outlook.com
References: <cover.1785434373.git.milkory@outlook.com>
 <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2026 10:42, Ren Wei wrote:
> From: Zijie Huang <milkory@outlook.com>
> 
> Deep qdisc hierarchies can lead to excessive recursion in qdisc tree
> walkers and exhaust the kernel stack. The existing loop check does not
> cover the create-and-graft path, so a hierarchy can still be extended by
> creating a new child qdisc below an already deep parent.
> 
> Store the hierarchy depth in struct Qdisc and update it when qdiscs are
> grafted. Reject new child qdiscs once the parent is already at the maximum
> allowed depth.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Zijie Huang <milkory@outlook.com>
> Signed-off-by: Ren Wei <enjou1224z@gmail.com>

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
