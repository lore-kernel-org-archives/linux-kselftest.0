Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F4329C7B
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668263; cv=none; b=EBL/3n0bkPFjx4q+YnKbECSbHmfjHzYvNhxGbo29cbBJjq/MWJyDul+TssqQR054dfMcH6W9GnBZ0AkYpwacbkZESEQ0d6f1HLInbM1vA1H6k3seEScUN2FZNwtwPMk2w9kTbJjMcvPeXe1bnxckxHoe4EI5zAPxxm827Kgby2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668263; c=relaxed/simple;
	bh=sN387DjDydkW8e3ZVJNAw+rdZ36T7Gc4cNjAMuPYQhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhBN11tIbS+7BIcilckJVK+01555Jv5JZCYlBQY1hGrYh7QrVfcGJLHxYd8wCZJTAuDwqEHZ8W3A/2iKgzuhyByC9CO+gdms2bZcmYjBUc5Y/2BYNzd3ccj1mujNDQCk8fZ64FQ+UfcfJ0MTCvB1wRVgz5+bTL4Vt0eMEWGjBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wwG9IGm9; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wwG9IGm9"
Message-ID: <a2f2c260-38e8-4ba3-8655-cffbee046259@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770668250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qn3uTLyg1P231jn5J4zsuQTyE7C2PYgiEDRUQoUcs/Q=;
	b=wwG9IGm9HPgcsob++FIlWcbruPvY0cVvs6Vd+XJoMu+1dd5spj0KMN5ckHptkf4N5WPR+q
	Fjsaf/uMZQaaLMK8QKX9a178XSIHdO2+pu1zBneQbcyFkD5hkVc6Dnr5N/zqvbnh43YAHJ
	D3Z7Rzm4DZUzRslndtzRm2Iuj9+/WMc=
Date: Mon, 9 Feb 2026 12:17:17 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2 3/4] bpf, sockmap: Adapt for the af_unix-specific
 lock
To: Michal Luczaj <mhal@rbox.co>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Willem de Bruijn <willemb@google.com>, Cong Wang <cong.wang@bytedance.com>,
 Alexei Starovoitov <ast@kernel.org>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260207-unix-proto-update-null-ptr-deref-v2-0-9f091330e7cd@rbox.co>
 <20260207-unix-proto-update-null-ptr-deref-v2-3-9f091330e7cd@rbox.co>
 <CAAVpQUA+8GL_j63CaKb8hbxoL21izD58yr1NvhOhU=j+35+3og@mail.gmail.com>
 <c4eaead1-ad69-42f0-9699-5f2d555a7693@rbox.co>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <c4eaead1-ad69-42f0-9699-5f2d555a7693@rbox.co>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2/8/26 9:14 AM, Michal Luczaj wrote:
> On 2/7/26 23:00, Kuniyuki Iwashima wrote:
>> On Sat, Feb 7, 2026 at 6:35 AM Michal Luczaj <mhal@rbox.co> wrote:
>>> This patch also happens to fix a deadlock that may occur when
>>> bpf_iter_unix_seq_show()'s lock_sock_fast() takes the fast path and the
>>> iter prog attempts to update a sockmap. Which ends up spinning at
>>> sock_map_update_elem()'s bh_lock_sock():
>>
>> Hmm.. this seems to be a more general problem for
>> bpf iter vs sockmap.  bpf_iter_{tcp,udp}_seq_show() also
>> hold lock_sock(),  where this patch's solution does not help.
>> We need to resolve this regardless of socket family.
> 
> I don't see any deadlocks there. Note that I've mentioned lock_sock_fast()
> fast path was a problem, not lock_sock().

For the tcp/udp, I think the bpf_iter should be fine: lock_sock() in 
seq_show and bh_lock_sock() in map_update. It seems redundant though.

 From looking at may_update_sockmap(), other bpf progs (e.g., tc) can do 
map_update also. On those paths, I am not sure why 
sock_map_update_elem() does not need to check "!sock_owned_by_user(sk)". 
If it is indeed an issue, it probably needs to be addressed separately.

It should also be helpful to be consistent with tcp/udp iter and use 
lock_sock() instead of lock_sock_fast() in bpf_iter_unix_seq_show().



