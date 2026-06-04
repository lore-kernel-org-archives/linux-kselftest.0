Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BA2EB859
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780596533; cv=none; b=cR7qbfC5p0h1lgwVhSpG4WpNtM/L9251cMegrVpeVb2E/M6lN3SLCb8d5AReE6HgDAstQ/VPgiiO3pcm53+l0XShE3xj7VKJGPvzfFxlx0riKG4XlMyMXCTomwysEiGVZSyigrQ+hVFi7yIqUdRTEK0pLOJ5iKvcg6IMNR9qXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780596533; c=relaxed/simple;
	bh=0L4majP9Vr1+qdLOXfv3ksKhym0OZaSWkjKXfl19yBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/FK+4+atFlH5BiR6tUa6Wy/Y1+oaCLepaMi4L3oAHfN8g1o+VDBvPxW2mV3ljO0KRRRHqof7yAybEKr/b87BPpHNBb/zLPBV4O29j+8EqUauq7gBS/2J5TxyRAyT5T+bCDCWswOevlex0eWBrSoFnRfMqqs8Agz8BujYn/pBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U2OpcsmW; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U2OpcsmW"
Message-ID: <ccd440c0-a507-404d-8f7b-01bb9ad73d94@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780596528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0L4majP9Vr1+qdLOXfv3ksKhym0OZaSWkjKXfl19yBM=;
	b=U2OpcsmW0JmxuI/tJxIbVd41KzUU4BlCgdFSN0cIFdCTynoyMwcpd5f9d1PZcNqeId7yRs
	hllgsINv/5pqdt7WVpbrEtXEu0f7Zz26hfzsbbMSK8HXCi/VtiMASfKMJ2BOwt9Mbujsvi
	TW9smBxy/ejRDujCj1DR8PFP6ud0Shk=
Date: Thu, 4 Jun 2026 11:08:38 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] selftests/bpf: Cover tail-call cgroup storage
 prog-array checks
Content-Language: en-GB
To: Lin Ma <malin89@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 YiFei Zhu <zhuyifei@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amery Hung <ameryhung@gmail.com>, Rongzhen Cui <cuirongzhen@huawei.com>,
 Jingguo Tan <tanjingguo@huawei.com>, cenxianlong@huawei.com,
 chenzhe@huawei.com
References: <20260604070318.2869813-1-malin89@huawei.com>
 <20260604070318.2869813-2-malin89@huawei.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260604070318.2869813-2-malin89@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/4/26 12:03 AM, Lin Ma wrote:
> Add tail-call selftests for prog-array ownership when cgroup storage is
> in use. Verify that loading succeeds when callers and callees reuse the
> owner's cgroup storage map, and that loading fails for a different
> storage map and for the A(storage) -> B(no storage) -> C(storage)
> bridge case from patch 1.
>
> Suggested-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Lin Ma <malin89@huawei.com>
> Signed-off-by: Rongzhen Cui <cuirongzhen@huawei.com>
> Signed-off-by: Jingguo Tan <tanjingguo@huawei.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

