Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609705;
	b=WiHwqHFfOeM3sFC4+gCecvWFJzXoO4bUaYpAgqSncjj95eZHGRkMpodzhwb50JnpzzNJ
	 zn6szarnS9haHgCA5SLHFk0DhWDJbkN7HXLn7h/rjnBI7EkPUWmwJ2MlhOO23rkYaznKh
	 eeN/iMt1FRcWlB+/PFhP+6ucLlc0OxgvK8KB/FetaRdwYJGYF6c7rablXthm9fbShbo9v
	 /hfzMsxtmCq57Bx2r+UrZHnb2Aw72ys1Ej3WYlShEPp5gpPwo4KNb5q3sdNNPA+kGzftf
	 DADsv0irPJDhLxZhbql0Fl4wK5XVE5cC8WmRZlHoy/KcJGO/H0TU6C3K+n1uUDA03tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mle+NIlXkrafF5xGCK7Z3UNOEf1ykyCcklkT9REqyzw=;
	b=nPjyxq034x+0bOoadlG4tYZDlJ9bv69lYp9Pmi4lwoDE+x9YmRr8XmhqLW79d6xrTqr1
	 X3wQ7Cpw7VrJ0V5OBx0WsGnxttbOUp5vZYBU7DhxbuX/q6gc/8K5C+8w61xt4ojgcldO/
	 Z0i6KTCh8hMlnCKlz75n2/v7GjLWQp8HD3NmLrs7jB+YUEpcASsG+zgXi1NYBh/zTBdWP
	 LQT1mfmXUeX0snLt5nNA6j61MfWZm0TPu1R+kBbytXDhSWP+7sSZKTowqcKjRKQURae9I
	 dD3Mx4LxlEpNeKS5TB9koyRgMzUB6tiUWI30YWR/BZlUKgafJy3JKPfDtNIwKPwu6ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=URR8JRFC;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0829606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0829606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=URR8JRFC
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xNnoY-00923i-Fk; Mon, 02 Nov 2026 09:54:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=mle+NIlXkrafF5xGCK7Z3UNOEf1ykyCcklkT9REqyzw=; b=URR8JRFCVx/BTa6tC0SC34HbSi
	FamZlQHtkoCy1nCYcKoVNV+U8CUckkPCfMsIkG4H6/tYWRZ/i/Vt+gD4JdNLXuVN1q7KTptrBttV8
	XPT1WR0OUivtmZpFLmAmRNGOFLTDKz90/qZNhBF0T7lZgvCjbbrmuvP60Q8+1thu+gCBcAhBfeJyY
	XADeYpwL+/Le8X5JGCPFc40Mh3iypww9yLXtGaSkxajQ/CDfCZgkH1+KfI8kkSSl4JHEietPkd/9m
	bMIOQWO2aMDNOAShv+siilVLLUc1sbT/bAkoHazmVwq7dCPUnz8puMATGN5Q27XWX7ajBrZ0V+1qx
	p5DLXuZg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xNnoM-0000bz-Do; Mon, 02 Nov 2026 09:54:38 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNno3-00B7Ye-Lf;
	Mon, 02 Nov 2026 09:54:19 +0100
Message-ID: <7c609c7f-1dc3-438a-b6b0-7e59ed62d1f6@rbox.co>
Date: Mon, 2 Nov 2026 09:54:18 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH RFC v2 0/4] bpf, sockmap: Restrict iter-context sockmap
 updates to sockmap iterators
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Lorenz Bauer
 <lmb@cloudflare.com>, Eric Dumazet <edumazet@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Jakub Sitnicki
 <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261102-sockmap-update-limit-iter-v2-0-e96a63c43b39@rbox.co>
Content-Language: pl-PL, en-GB
In-Reply-To: <20261102-sockmap-update-limit-iter-v2-0-e96a63c43b39@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 02:15, Michal Luczaj wrote:
> Follow-up to Sashiko's report [1] and the decision to restrict which
> iterator may perform sockmap updates [2].
> 
> Short series: remove about-to-be-stale test, restrict updates, add a
> negative test. Related bonus: mark bpf_iter__sockmap::sk as PTR_TRUSTED.
> 
> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com

Apologies, I forgot to strip the RFC prefix (which I set thinking bpf-next
is closed).

Sashikos reviews just as pointed out by Alexei: bpf_sock_destroy(). I left
out the tracing_iter_filter() change since I was not confident I understood
the reasoning behind it.

thanks,
Michal

