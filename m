Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553D3ACF0B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807695; cv=none; b=oWj4KDupDk8ZvI1i+yaQmAnAdwKP/tMKzcgtffs34B6HtURcNM8jYfQRWPvBIYAn5SIU5FaKSutPcHl4yHSUBSyX9Q8wdyGDzBtfCVbZ3LXsz3osntsCkggzzSmpdXzYTKq3JOWFv/TvuxGbXOeOB9NUc84xu12PPqNjEf2EH8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807695; c=relaxed/simple;
	bh=vaEoDpy1fUGpWdko4iZwCqWJ0MXp1Q1rdotkgeUPpiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpnGdBafHM1ZG+hjJxmrnx51vEblmtpkW6eVlPWn0PgeIZeq8ERDfAVxE3R8zUhxPaG/OqlMi2XRKs4kMSew4i4jD5EOkV3E5/etzp3WKoBFgI5aZfq4C4n80o8sDvHg755154RHbpPGIBLmxo9HG5PJPSXM1406mxAfCC9+kqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hhpqnd2i; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hhpqnd2i"
Message-ID: <92677272-5719-4c91-b4d4-d3e71e50d2c6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772807681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaEoDpy1fUGpWdko4iZwCqWJ0MXp1Q1rdotkgeUPpiY=;
	b=hhpqnd2i75OSY9dCdX31aGhtVXUA0kJTD97ClADMtN1oNGF+ULiwRnO8F8I2RiQJdEKkZe
	k+bzJnx360NzWysp2c/u5FgbpbQsEzjf2/biERO4kpUWoR66BmXcibSYQ1i/legEZFQase
	nRgZuJWO3LZYTJmKL2jWCLkJFzvCrLQ=
Date: Fri, 6 Mar 2026 22:34:30 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3 4/5] selftests/bpf: Extend bpf_iter_unix to attempt
 deadlocking
To: Michal Luczaj <mhal@rbox.co>, John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Cong Wang <cong.wang@bytedance.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-4-2f0c7410c523@rbox.co>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260306-unix-proto-update-null-ptr-deref-v3-4-2f0c7410c523@rbox.co>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/6/26 7:30 AM, Michal Luczaj wrote:
> Updating a sockmap from a unix iterator prog may lead to a deadlock.
> Piggyback on the original selftest.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

