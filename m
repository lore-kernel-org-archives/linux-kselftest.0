Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DB3A0B05
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 06:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886948; cv=none; b=jy7AwL92D4l0pKCgGzcB0HUkvMCXr66ZofKyPADpnboZWPNrTbvIrjjs2UYFjvksS8qdatcHMwy1F75d64ad4azmbb9r2NlExGN0ptnKsQqbrN4A9+LYWJJ3rUeNLkMH/Nbue/PjANb0jKG3ac+Y1elEr5pPavAKqqtAKaORM2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886948; c=relaxed/simple;
	bh=vDGAhh3K7WmphlzICZtxnZYyBZQK+/l7wgZ+PvyZHyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tT0TbRIzsdHu2MnpVfbJkWC7VeyyEnpT2k5pWJv7etVFvHMKm6XnDcFi+jFATaJLhNCj58+fjIWI3/5fXCf1o3gLGl11wNSjcr2oOhytYT0lyOO5KI8bNXvBx/IlPUNZBSF6QIe2I/ylDZUB8mG3sc+Qn8EVlma+Y3z7a94VvnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ny25sP3K; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ny25sP3K"
Message-ID: <d55e10b1-d883-4fcf-8fb3-8210db935e4a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782886935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e0T3+Xzz4JF6iqR2a0ZXe4TdO1iGWVdDl3TlKLhVxfA=;
	b=ny25sP3Kf5KHYcWTmYTSFokPp9lQ2ZQnEQxM9S+5A04IK+qmWeHROVHLlQUbvZcOFzCk6A
	wSv7p0xrg6qHWPDNd2v+88o0mavf6UCHFcJFOOiVGMFIxGmzkPGk4RfoYU/l11FoOCUjx0
	wlujGGNK0LeDF4gjLM4s5YEHk3LOyS4=
Date: Wed, 1 Jul 2026 14:21:59 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH bpf 1/6] bpf: Disallow interpreter fallback for user
 BPF_ADDR_SPACE_CAST insn
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, KaFai Wan <kafai.wan@linux.dev>,
 bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Anton Protopopov <a.s.protopopov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260626154330.33619-1-leon.hwang@linux.dev>
 <20260626154330.33619-2-leon.hwang@linux.dev>
 <e279c9a7ca6b16e52dc261560513b0eafdd70f87.camel@linux.dev>
 <a2aaa21d-4cf9-48a4-839f-dd152bda8185@linux.dev>
 <af9c0a7e-13de-c227-849f-4b35d1fb74ff@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <af9c0a7e-13de-c227-849f-4b35d1fb74ff@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/7/26 09:26, Tiezhu Yang wrote:
[...]
> 
> Hi all,
> 
> Alexei said in another thread like this:
> 
> ```
>> [3] https://lore.kernel.org/bpf/20260615025316.24429-1-
> yangtiezhu@loongson.cn/
> 
> I don't think we need such fallback in patch [3].
> ```
> https://lore.kernel.org/bpf/DJMRIZ5PDWP4.12OOZ8H881H6O@gmail.com/
> 
> Should I just drop my previous patch? To be honest, I'm not sure how to
> solve the issue mentioned in it. Is that a real problem, and does it
> need to be fixed? What is the next step?
> 

It is a real issue.

Instead of fixing up helper calls, it seems better to prevent
interpreter fallback if the prog has any JIT-inlineable helper call.

Thanks,
Leon

