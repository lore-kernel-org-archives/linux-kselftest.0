Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92A26738D
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768758; cv=none; b=dqL1QFcNMlW4q3T5dvwC/t+qLQBnANrnXv9PWNedv7T3GGJN0cnFS2jc3kR3DH3xW8B+kCFMOZ55teNKg5lR0mSyeduUubYvXczJB2h2UXw3e2qLVhcVKZoFhCGTF44fxqwbFGWJgjKcHuz2V1kTZY8gbK6kFaeHloBmjvsM9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768758; c=relaxed/simple;
	bh=3ig1oj0ucAknrG7KmJfScqO7st+Sj4aA3FThIeKv09g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3qbZcg5xirSmw1d2pLhGRefA7RYnb68DcYQSVkj0JQdH/HNYwODOg05TpdiFxH6Szgj2i5lBRyBQDbAN2Y+9wP73yJK283SVspMUTaBCBYoSsEjVfPb4yzzk3HxLikNSRKDTkesuDyvHRMOiDRqwG9jYuh15InhNvbYsb1zZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLHbH4qu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLHbH4qu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so170576f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789768755; x=1790373555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zobxd8dDfc3X9MOmFn6Ig1Mve7PgRgvEMzrNYO/gZLw=;
        b=DLHbH4qu14uW0p97sznhdxRVrgG2b/EbOAKviRNT0jLlrPfYd1NBJyq+hsU2rX9AVU
         W/t5rB79tda/MhA3quV3PX4Ro/edJ5KpueX9jtSukeuhWrXyQprWGc15rnjcHL3oyOtF
         qRm39cFHKsoIlCvyxYYvsUVMk/zY5Sy+Si3h5bTepuGOYKH48oLBCjdeZ3554ZsiXXMm
         zmicYcpMDe3Pt/Fj0pPc3IhPWGY65GYxoulXXQVCBmv5jzVQoOgjZ6tgSMLjuyMkBAQ4
         el6BVZYXQwLyw9k1FDf/U8PICKq+z01OmOpqzfao4fRePSbJWCgPqtA3v72Pwd5X3l6x
         0h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768755; x=1790373555;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zobxd8dDfc3X9MOmFn6Ig1Mve7PgRgvEMzrNYO/gZLw=;
        b=m+Iv9ur+QE3Fg2JZYAo1MxnEzTJ09oNdQvGnZh0WldxFrmjBUMmHYH434US3L0odVT
         4xa2XMswxn7AewDxF3ZasHZlhme35Gc0797F5fJKufojYT0icE/zCLKBklP7+KRMZgjq
         q7w5SZ9U0AA+SMFHi97ZAPa7idfQGBvx263vsu1XZ8WfPN8BZYEPEccm9uSUZp+I3b/6
         bKTsZRg/RvJKK07+qq+uXCo0SziRMlhA4hFnfb73JDh+aTFgkEYPpFWrSvbT0vrQPJ+b
         OV0CH4WfXUP1Oowjdgkw84v+0vCiY8Ibz0Ffl/0PC/oLLItAaOAjSpb71vNPtqixAuZg
         Enjg==
X-Forwarded-Encrypted: i=1; AKwUvBxXvsxdt8DBD+EHoQW7piN5OXMeYLaBhx19HzqQpEAPIWhDM4kqbp/MzMy2puNMpCRHVZZybT/HnbzujUD1yRE=@vger.kernel.org
X-Gm-Message-State: AFuF++me8sftuiXoKZe75vWmQN4wckNl6MfnCBi/5mea+id0IaGajAOX
	pWtamLTWzoy4FQvoypmnVckzh/O/lraWoEtMjVORdQlDJ7/ErnEV8+AM
X-Gm-Gg: AYBFou3+hcxcuDAb3NmP6KDp9PX2rn3VPhHMvd3Zqi+GyHzyHG1603Uzgwjcr7endwW
	SpRH/NmWdvFFX9LOPqlCXxVzMjQS4QaXblv10yOBqKldlMOQoEYMjUFvPIrPzi01CyRXIh1Vktq
	kA8tz7Suwg8fyFfNAGnVOnXrD9tu2iVkCp6GcOpINiBPMHQtJ81nWyxZ85cE8T/xZBEtHPnMWKj
	mJxyOLO+okTY1YGbKixIxpvkXZJNXmQJeQX2Ki3iSAi+Y2L1Y23M3F5D5V0FmLrLMVUh6smq/o/
	v+La2e4NA7q7EOdNAOBUsOeY/8z/mztCtESG/xQzvQFQeKukyLSVSyz6PS1x9vOu1xa2dCwAJVX
	PSDxdWaQJS+w+8FqPxZDauQMipbdO6O0qi0Ci/zAKluLNLWcNJ6UhBZMG4jUHeFh2QYu1ZT5Xcg
	MmNxw4iTjTzxuZ+cDfGJTLegPfpISmvxFdKCr7wLyI+LGBdkIrYw62JRmMP+0LzBDbspaxkG53W
	pt4HNp8pJz8ij9swB950SeHDO6SOsb2zWiSqTMe8LF1VBA2REmKV4J4IN84P6pNj5JksXo6AfqX
	C25hZgs0gncYEZ3VH1LcBCk182f+baiNHNBR5V0QcTVT/fLDic5PPxl7vR+B9+c852FgfCqt1W4
	GMEJ/6YptFS61hARFhQ==
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr55491205e9.2.1789768755473;
        Fri, 18 Sep 2026 14:59:15 -0700 (PDT)
Received: from ?IPV6:2a02:3100:59ae:19fc:400:b6b0:efdd:810c? (dynamic-2a02-3100-59ae-19fc-0400-b6b0-efdd-810c.310.pool.telefonica.de. [2a02:3100:59ae:19fc:400:b6b0:efdd:810c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm26575855e9.6.2026.09.18.14.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 14:59:14 -0700 (PDT)
Message-ID: <c6bcd422-ae6c-40d4-a8ed-3261ccc3dd7b@gmail.com>
Date: Fri, 18 Sep 2026 23:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] selftests: net: hsr: add shared-mutation
 regression test
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, shuah@kernel.org, lukma@denx.de, m-karicheri2@ti.com,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 ali@iusegentoo.com, qingfang.deng@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260808004525.1551-1-xiexinet@gmail.com>
 <20260808004525.1551-4-xiexinet@gmail.com>
 <20260813183008.31e14297@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260813183008.31e14297@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:30, Jakub Kicinski wrote:
> It's a "no" on embedded Python in bash scripts.
> Where do people get that from? Did AI generate it or are there projects
> in which this is common practice?
> 
> Please write the whole test in Python (see .../net/lib/py/ helpers),
> or move the python code out to its own scrip under TEST_FILES
Yes, that snippet was AI-generated, I should have properly separated it. My bad! 

I will extract the Python logic into its own helper script, put it under TEST_FILES, and clean this up for v4. 

-- 
Xin
