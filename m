Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983133262A
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786687854; cv=none; b=TyZ4C8tAewKkpEnVjot2ErlzbtuHhJwq8OvD/2evUr5Fm8SDbDSCpnWnqo6d46dh9J9jBKSWzOfCwKfxh36YOn3s35NUDySKG30KacoMDn/IhG6SQfaIWAVPTK9DYDy1ibiqHaHz5JrlASxeELpzi03WlMvBOnaXwepu9h/4eF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786687854; c=relaxed/simple;
	bh=4cqJjYjvBphX6c40JdsvZzI7t2cRT6i5TYxY1xnsRAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qc0Qjox3pJCBylZ3r51ctbyxb7ZUXs7LzaRgccXeI6kKwRbtv2VPqSn4d63sYHj14SsFbGcUrhQw3C2Y/Tkk3ihaeIk4JH8MlBIFc0A0jW0M1co/LW1yw4Ybr9TuTlaTq+X65IRwjsC+iUicsDXG4NTNZdJaftuBAWmnFAI5z4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YIx5bum9; arc=none smtp.client-ip=91.218.175.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YIx5bum9"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4cqJjYjvBphX6c40JdsvZzI7t2cRT6i5TYxY1xnsRAg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786687850; v=1; x=1787292650;
 b=YIx5bum9Ea6bqEkLqEflz6oQiyxpi6KFwy6XTdnzTkaIr5K+5XM9XA/XTKZaAZnxsFk69Tvp
 gNjTjFrecuEJdSks2lzs70KqdgON7gMM5DlghlMPZugv/YFTEhOBFNVoGCYR+GhFnwljXtK/0oH
 s3ToXMtKlXwzP2DaWDOuL1Fo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [10.22.64.46] (122.11.166.8)
	by smtp.migadu.com with ESMTPS id d5b946c38f5a84da;
	Fri, 14 Aug 2026 06:10:50 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <791f27d3-8411-483a-82d9-a5a6a64ce792@linux.dev>
Date: Fri, 14 Aug 2026 14:10:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v12 02/10] bpf: Factor out check_map_mem_read
 helper in verifier
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, john.fastabend@gmail.com,
 qmo@kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260813152324.97937-3-leon.hwang@linux.dev>
 <c235a89df142e86e70f38a91acc5c3ec9e64cba2ae7539df9696150bf8ea3d66@mail.kernel.org>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <c235a89df142e86e70f38a91acc5c3ec9e64cba2ae7539df9696150bf8ea3d66@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/8/26 00:26, bot+bpf-ci@kernel.org wrote:
>> In the next commit, percpu_array map will add map_direct_value_addr
>> support.
>> IOW, it will add a map_type check in the iff condition of the
>> bpf_map_direct_read() code block, which will reduce the code block
>> readability.
>> Hence, factor out check_map_mem_read helper to improve the readability,
>> and the maintainability for the percpu_array map case.
> 
> This isn't a bug, but did 'the iff condition' mean 'the if condition'
> guarding the bpf_map_direct_read() call? And since this looks like a pure
> code motion, would it be worth adding a 'No functional change intended.'
> line so reviewers know what to expect?

'No functional change intended.' is worth in the commit msg.

Thanks,
Leon

