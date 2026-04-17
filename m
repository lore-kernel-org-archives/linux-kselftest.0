Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD21ADC7E
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443135; cv=none; b=WxwWUTea7fWAvDBxFT7tExgbpy7W3qS7IrPYZxPuBstUMILwBgusmtZaD5Ophco45xZk/azn0q7qlRvbQeEtnWui/AbKSKBix8cZae71Pg4PeE6nO3OchP5XZnJNv4OIFY7F5EO+/74eVjt4NAzkDcPnviO0lCH+ubOIPov3DtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443135; c=relaxed/simple;
	bh=94BI5TrieslVOrJhUQ5ubUHE2QyaLFDLVCjOfZ4bfEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3ASz0ACC8eN4vyhRNCOqLML+d71bWemsdmhD+E/di+s7ShOqyYG5n6pEQPZVwcvyqbtmtWwA1V4Ybl7IYCcwPqocIByiYPxhsrSlt+iKqnEb2U+non3PNW+7/NGR9blCFvdsn2Jq28d4MMgP8G3NNc0BasBp0AtFeVcWtuMf+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FJoxFBpH; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FJoxFBpH"
Date: Fri, 17 Apr 2026 09:25:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776443131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ta1OKOTzp2fmeWL9SMKYpLf/VmLUkvE6ptMi0yslJGA=;
	b=FJoxFBpHTnbZ/jhmHKqENyZa6zw03gTPCjNI4e+Rljbm6UZ0V0WcbJzWcGncFD+L6ALbLV
	8nX5koaFkHCXNKpvSsmQ+C2zD5M3LbsJZPe1iEDYdUoXVIph+0qtiW8TdIlEbci7I+jVwa
	L0+jnn+4w+7ft7HmwLNsXA8VV+7/ddA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: KaFai Wan <kafai.wan@linux.dev>
Cc: daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me, 
	ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, jiayuan.chen@linux.dev, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Test TCP_NODELAY in TCP hdr
 opt callbacks
Message-ID: <2026417162132.9MRI.martin.lau@linux.dev>
References: <20260417092035.2299913-1-kafai.wan@linux.dev>
 <20260417092035.2299913-3-kafai.wan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417092035.2299913-3-kafai.wan@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 17, 2026 at 05:20:35PM +0800, KaFai Wan wrote:
> diff --git a/tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c b/tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c
> index 56685fc03c7e..7b9dbbb84316 100644
> --- a/tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c
> +++ b/tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c
> @@ -461,7 +461,7 @@ static void misc(void)
>  	const unsigned int nr_data = 2;
>  	struct bpf_link *link;
>  	struct sk_fds sk_fds;
> -	int i, ret;
> +	int i, ret, true_val = 1;
>  
>  	lport_linum_map_fd = bpf_map__fd(misc_skel->maps.lport_linum_map);
>  
> @@ -477,6 +477,10 @@ static void misc(void)
>  		return;
>  	}
>  
> +	ret = setsockopt(sk_fds.active_fd, SOL_TCP, TCP_NODELAY, &true_val, sizeof(true_val));

Same comment as in v2. Why this setsockopt is needed?
The setsockopt in userspace is unnecessary. In the future,
we may need to understand why it is needed here in the first place.
