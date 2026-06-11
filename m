Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128283672A1
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 05:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154385; cv=none; b=G8ZhQqn/441NeHQHAEc7ibPqok7e/eLsPPf5RgLWODi1QKp2VwIAB3T4HVtE2akEv8CwyQlJGPAc61iQYSU9dDttK84UEgRIJiZRhNPz51SI/u9XQoxkWm1HZG2/8SCq63UHGFpUHvBr1/0cmkucsFrz/uaKHJlYB8gYCWVx5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154385; c=relaxed/simple;
	bh=eNHbcpkxfgmM0m+iFdobcSxG8nlUTyTEkeMTMUPpa/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEf+GtoaD7Gzyd5Nx276uAra/ua0s/4JPUx6ZYA32+oJbZLd8Bo7+Msnu2ezoePBzIw/IEXpaxNGwiig4LaYpWvZv2gaHv8aivxlmEJFUHyqwXD71CAF1BYNY8cOeUiLyMrSqu+D2+Dec72CCuKU1NQt0SMVtoDdyvIJ5adpz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W3S3o01H; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W3S3o01H"
Message-ID: <4d806644-5805-4b51-a96c-bd56e68c82ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781154367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w53mR/1eisUsL3snEaZF54XtsQgbkbA/+1BA6AvsUH4=;
	b=W3S3o01HXOp2ZhlTe6Vlc/H/QBu4b98HZSCtvoww6KYhYSLOJ/YGb/wO0QxDk8q9oVZeNm
	mnFzA4aek4rPsfo6fJc7Coviv8DXFHSRLWrMSTGZdgd+Opk599WrdVzzPc/I9rIrUQmgW9
	Cf65iKEQnk37r1yh2p5AtReS5XjKAJw=
Date: Thu, 11 Jun 2026 13:05:42 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v5 2/9] bpf: Introduce global percpu data
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, john.fastabend@gmail.com,
 qmo@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260608145113.65857-3-leon.hwang@linux.dev>
 <d2a502a8663b9f28e4a55e948cbf70fdec01e3d71417816b534c002b467d718c@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <d2a502a8663b9f28e4a55e948cbf70fdec01e3d71417816b534c002b467d718c@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/6/26 23:56, bot+bpf-ci@kernel.org wrote:
[...]
> 
> Should this branch also exclude BPF_MAP_TYPE_PERCPU_ARRAY, so the load falls
> through to mark_reg_unknown() instead of failing?
> 
> 
Will exclude BPF_MAP_TYPE_PERCPU_ARRAY here.

Thanks,
Leon

