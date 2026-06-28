Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC853BED31;
	Sun, 28 Jun 2026 22:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684006; cv=none; b=etSKrKDOG+N99cz1bAAqZpEOZ1TxD+5kvaP8JscUsLGJBxd6lWBxUQ3w3a6c9pzZFkeXETF/9dnAhXrraz/PN493dl7io/fbUSwupVqSd6XP/ZWiSH974fr+4E9Xll5t3GUX7QjmjxkbIgmzaTfkBibn8UTdFWO3vzwJrdKqGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684006; c=relaxed/simple;
	bh=Jo0XcOlZi0WxtmDMP0w4xh35b8lphoShPRqDWBSKrgs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G93u9bKFnMRMksGKioDtq+bhvoPDKhB/xK2WQYh27Brjl9gOZ9EnbUuM7FTNFJTCBKLLvKGJra8gGq6bToIazeBEYzh+GANUEFJdr9oCZ8olk783lktVnZKpQBZtv3jnIbhXrC5J/9nxq6zglIbAoHEQWzyawmNmzQDGKLlBZIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=jUeyx9BU; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="jUeyx9BU"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1wdxXc-001ZMo-QO; Sun, 28 Jun 2026 23:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=iFfN33bXCoFIYJH0PyNERYalk6o6fo/Q09tESzrMJ8Y=; b=jUeyx9BU9C8cxydkEfZ06ftnW5
	Oc2aaCx+Jl8DE7/dSZoFKdRzVZEe5/ij0peydwKHsuGYmIRwmH8oF2Tto1HBoqKZrJgerj4QTwRAm
	Ix2+ppm/d1shknjKRgH9BCTZEJ5ikLcCeU12tOOlbiatmpzKMUtdTmAIhDWz31ZhKyHXtn8D0rzO6
	O46tWVimS5LlihaRciqC6V6LPVJ15JMzlkEhhTdqrGoElf7p0Ord48+cvPkxWwdzzvJcdGCtI/F1y
	axvqTLqF30et/lrfHVIbh4+hICZ1X75j734rBbX7/K1N/eUNvePkEwdCJAXX4EimK+nYcAp+JyoT5
	STtp5nuQ==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1wdxXc-00060k-H5; Sun, 28 Jun 2026 23:59:52 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wdxXY-00Bg9h-58;
	Sun, 28 Jun 2026 23:59:48 +0200
Message-ID: <06bb709d-54e2-4515-8ea6-33163ba8d510@rbox.co>
Date: Sun, 28 Jun 2026 23:59:46 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH bpf v2 3/4] selftests/bpf: Adapt sockmap update error
 handling
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
 <20260626-sockmap-lookup-udp-leak-v2-3-7e7e201c951a@rbox.co>
 <CAAVpQUDULzZh58oKkRaYqgM9bRToGb7wHrzT+cZNpRmAtM12Ow@mail.gmail.com>
Content-Language: pl-PL, en-GB
In-Reply-To: <CAAVpQUDULzZh58oKkRaYqgM9bRToGb7wHrzT+cZNpRmAtM12Ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/26/26 22:58, Kuniyuki Iwashima wrote:
> On Fri, Jun 26, 2026 at 1:37 PM Michal Luczaj <mhal@rbox.co> wrote:
>>
>> Update sockmap_listen to accommodate the recent change in sockmap that
>> rejects unbound UDP sockets.
>>
>> TCP: Reject unbound and bound (unless established or listening).
>> UDP: Accept only bound sockets.
>>
>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>> ---
>>  tools/testing/selftests/bpf/prog_tests/sockmap_listen.c | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c b/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> index cc0c68bab907..6ee1bc6b3b23 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_listen.c
>> @@ -63,11 +63,8 @@ static void test_insert_opened(struct test_sockmap_listen *skel __always_unused,
>>         errno = 0;
>>         value = s;
>>         err = bpf_map_update_elem(mapfd, &key, &value, BPF_NOEXIST);
>> -       if (sotype == SOCK_STREAM) {
>> -               if (!err || errno != EOPNOTSUPP)
>> -                       FAIL_ERRNO("map_update: expected EOPNOTSUPP");
>> -       } else if (err)
>> -               FAIL_ERRNO("map_update: expected success");
> 
> Initially I thought AF_UNIX still exercised this path but it was removed
> in f3de1cf621f7.  The leftover in family_str() was a bit confusing, so please
> follow up on bpf-next.

Sure, will do.

thanks,
Michal

