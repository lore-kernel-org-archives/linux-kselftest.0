Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772358;
	b=2Gzi2XmbaefCWTlF4J2KqA79u3LjNsullHu2flYgTvvZYtIEOro50EQ68qEBnoqt7eSo
	 Z/T7P/m6986G7w+8XCH7yPN7QSGjDcbbmyOeZaLehZRZZRpPYzXn+SdY9vOo8SNXvU5mf
	 YhVfO8+L4NuXiizq/jO5r3OYewMdfbq50fJD1CXeBEZEfnl6JJPeQZiTH4pHB4oIb79eN
	 0MsruUHONnMe+Ir7HqiLAjMVkA2JD6L0dNQCoIVzZDgnBwfevEFGJNCPjPRKVZmRC3BIn
	 yIxwEerxH+Voez37zTcwK3KND9Js7D7kYXf19E/VUH84D9xIU8JwyB1k3mcmVBGsQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772358;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AYliQvvoP9t2xBU+MfGX2zhe1ZgquUqopej93F/CQ4Q=;
	b=f4HfXbagpVu+vyL4Uak3x+qt/WuGG5PnClUnbRP0OeSEnBAfshq8+Sgv4tH+UJMGt7ia
	 +EH5ePZmdu6DZvn9XGEwEobjbvyez8Trkhg1pDhNcPBe4XF9NDuKeBCcR08eRImLQPenx
	 29HyQ44GyQV+shsUH9b4+ilIe0RxOgnwb894Krf4Htx3aH1B1y1ucsAMpugcIrz06QIAi
	 2LBwXqb32UAgZcS2qhXdTzcjPdyp7ryru8RCazGM/NMSX1pd1kn1F4lKh8VFJaK5Lx3Br
	 c3gKAmMQPWuguB3ydWSqjdOBMV7G4L/LIuvYd7Mlj62rPZY7nPUKZUQw9fvcakQX9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tG0OTtk0;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34A606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA34A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tG0OTtk0
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AYliQvvoP9t2xBU+MfGX2zhe1ZgquUqopej93F/CQ4Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793772354; v=1; x=1794377154;
 b=tG0OTtk0f8ZcYcb+ozibhuTIE8MGWeWV43lqRPVcurrDR1RPMyw+7dPAjB2cpk+w+/sPh3WS
 H+cFhr11CppQ5DHLndMniEipQaOax5wvG23fFvUUerj5ERLXqGc+CrFbyriCPuNDOwogw40Z5mT
 Yx1TxtPR9oycfNTCLEH74xAA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba0b2edfcf9ab841;
	Wed, 04 Nov 2026 06:05:54 +0000
X-Mizu-Trace-ID: ba0b2edfcf9ab841
X-Migadu-Flow: FLOW_OUT
Message-ID: <b0e5f200-1860-4222-afc3-8d67161ea1c1@linux.dev>
Date: Wed, 4 Nov 2026 14:05:38 +0800
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
Subject: Re: [PATCH net-next v4 5/7] ipv4: convert do_ip_getsockopt() to
 sockopt_t
To: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david.laight.linux@gmail.com, kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/3/26 7:01 PM, Breno Leitao wrote:
> Convert the SOL_IP switch and ip_mroute_getsockopt() to sockopt_t, its
> last leaf on a sockptr_t pair. The IP_MSFILTER and MCAST_MSFILTER
> bridges go away.
>
> ip_getsockopt() builds the sockopt_t with sockopt_init_user() and
> writes optlen back unconditionally, because IP_OPTIONS and others
> report a length and can then fail. ip_mc_msfget() therefore stores its
> length only after its last copy, so a copy failure can't report a
> changed one.
>
> The write-back also happens before the netfilter fallback, so an
> unwritable optlen turns any error into -EFAULT and skips the fallback.
> Likewise optlen is now read before the level check and the MRT_*
> dispatch, so an unreadable or negative one wins over -EOPNOTSUPP.
>
> IP_OPTIONS with no options set and IP_PKTOPTIONS used to return the
> result of copy_to_sockptr(), the number of bytes not copied, so an
> unwritable optlen made getsockopt() return 4. They now return -EFAULT.
>
> sol_ip_sockopt() builds the sockopt_t with sockptr_to_sockopt() and
> stores optlen back as well. This extra code will go away when we
> convert sol_ip_sockopt() to talk sockopt as well, but for now we are
> converting the leaves.
>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

