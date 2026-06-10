Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132BB274652
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055473; cv=none; b=QVoPxIwZ7Mk5VaSKXfCHyoeI/xo5KKJHrk1M2lcXeJHDIUkLN3uV+3bVV5AojVa2Aj/q7mPQ3INTZbrKEa1VFtoNa0nFgHmb1Ej6w7vvmUm27ehDeRBq0UEQ5zFd5r+0+wfy5FH5H8uRGOFwiSM6kZeJf0tYETsdR1Td2e+J0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055473; c=relaxed/simple;
	bh=ipRH2nMK3lHpLv5WJfej2MXixMzET4R0uqTE01p2WX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrW1J2DhKd+dRVj9L0D2xfvUl6XWyRa7wln5bkyiE0BJNOtDSwwk0w8+kkgGaSPZ2BUw4f/Sl2q1e8f2dguFJ9OaaYpMfCFVD3WY/00jiaS35elEnqTHa7BLaTclTqO+gtSODgW6kmqcAY1yVcfiv0dRc8lpKoDMtPCMVKxY468=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rA4wFQDx; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rA4wFQDx"
Message-ID: <82860b36-4a8a-43df-a737-1bed1d42d2c4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781055455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipRH2nMK3lHpLv5WJfej2MXixMzET4R0uqTE01p2WX8=;
	b=rA4wFQDxOiT7IAWnm3j/pFSxnJ/94leDcDG8OOWKmPebyFMqx9FuEpg/ImFTH7o1ugFusY
	qIOZZcYkW9xgkS3VGI/vJ1m3AJ0NAV1eteqQWic7uLi3UcXL26qjZ3lJNJ9gS2nNmOvtLK
	IcjmBhlJ8vgqCs+u0gfiGkINKQXOjP0=
Date: Wed, 10 Jun 2026 09:37:16 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Joe Stringer <joe@wand.net.nz>, Network Development
 <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev>
 <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com>
 <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
 <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
 <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com>
 <DJ40JYME18U1.3RA3TUXB3MH3M@gmail.com>
 <CAAVpQUC1Ot9vr09gNoe+vxgLoqU8Wwn2DV+CQZYYpAJUATJiWg@mail.gmail.com>
 <f0468cb2-1b52-4216-9592-ceb204f6ea41@linux.dev>
 <CAAVpQUC=AJvJS1yppw+aAVpmRhB6GganrUKMsKSo7WUKNkZHfA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAAVpQUC=AJvJS1yppw+aAVpmRhB6GganrUKMsKSo7WUKNkZHfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/10/26 1:14 AM, Kuniyuki Iwashima wrote:
>> Hi Kuniyuki and Alexei,
>>
>>
>> Thanks both for the discussion, it makes sense to me.
>>
>> I'll go back to fixing this in the helper itself, like the previous
>> version did.
> I think even the previous version is the same type of change
> for intentional misuse.
>
> Both bpf_sk_assign() and bpf_sk_assign_tcp_reqsk() assumes
> sk_lookup() in advance, meaning the bpf must have dissected
> skb, and bpf_sk_assign() relies on it and has no protocol check.


Hi Kuniyuki,

Fair point. The "immutable skb" idea is more more worthy.

