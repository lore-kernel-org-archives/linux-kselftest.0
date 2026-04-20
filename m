Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AC37F8BC
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776704972; cv=none; b=ZWdgIquGiJn1LVIQQSvd1Bwl3IioYfHKg+Fuk0Y0rqHjzy6oKVTWUwKTDfF6aVL2VypEM9A3TxG4vNE8Sx33+L1bSVHal2qr+uY826/T/w3b0v4xUXx8Cb1gNLYFIGwhptwErw7eRihXMH8mphoaCgRDByh2QiwTRvZdgtZFSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776704972; c=relaxed/simple;
	bh=LUFhttCt6qq2eWwycDWvN0ipZrq6FSIlPoPYrMs4hRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzDM4XVO0dqzgqv0ujiwa3Qp3mkE9fX0xEpgmcKKIl2BxHFznvTVXq/RDCRr9Nrt9WgyZYFxOERJdSXkfsf9NkCxinflQwOPmqp1Rq808rRAtddtbNAyCMU5oEZKSdF+XJrltFF+wSRciIgjMQVQE5hZ/uE+6hiVM0VnnBRlt2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jtrtsOvW; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jtrtsOvW"
Date: Mon, 20 Apr 2026 10:09:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776704967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWgmLMt7/TMrBm86Ew6P18FFPWPU3UwIA+bIKdihQo0=;
	b=jtrtsOvWrdt0C55JuXEg9NM9xf0uMiN1Wlr83eo+8gIcDs5bL7Y7Oq0S/8ilLMbKr0o1qv
	Rd1qVh0bMPrIxIPBnvZMJ7pIKCdD/+sw/xcElt2O105f3AnthA1tK5yF92+Ov/plG01zqj
	SwavRzIw/SRsBPYVtlNcPUOqr6aTrFI=
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
Message-ID: <202642017513.aNTV.martin.lau@linux.dev>
References: <20260417092035.2299913-1-kafai.wan@linux.dev>
 <20260417092035.2299913-3-kafai.wan@linux.dev>
 <2026417162132.9MRI.martin.lau@linux.dev>
 <9b3e7c118f5b9105b92f53b66034c1b7884c1372.camel@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b3e7c118f5b9105b92f53b66034c1b7884c1372.camel@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Sat, Apr 18, 2026 at 10:19:47AM +0800, KaFai Wan wrote:
> > > +	ret = setsockopt(sk_fds.active_fd, SOL_TCP, TCP_NODELAY, &true_val, sizeof(true_val));
> > 
> > Same comment as in v2. Why this setsockopt is needed?
> 
> Sorry I miss this. It's from the review of v1, my first version would break the syscall setsockopt
> and other CB besides HDR_OPT_LEN/WRITE_HDR_OPT. So in the test I check setsockopt() and
> bpf_setsockopt() in PASSIVE_ESTABLISHED_CB to make sure patch#1 would not break user space and other
> CB.

ic. Yep, remove it since v3 is not changing the syscall setsockopt.

> 
> > The setsockopt in userspace is unnecessary. 
> 
> Is bpf_setsockopt() in PASSIVE_ESTABLISHED_CB also unnecessary? I'll respin if they are unnecessary.

This one is fine. It checks if the bpf_setsockopt is not affectred in other CB.
