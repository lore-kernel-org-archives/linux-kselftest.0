Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785200;
	b=tCJTQpNzYhyRlCKPk6flQB15mIkdMOTP7G2op0/XbTZo4LPGZUUCa3gxL4Wemgv7MecE
	 xPLs6xp+7KdCxyxbekN4hc795AT1XgLTwf2iW9Xi2PLrNq886Pu2kTx+KFv+m7vk0/9+E
	 QkvgjcI6B3a7nhmBqlTuFiwBftj/HIxu/rM9M6wfVx1g8z+GkcGbKTLv87opXcRqkqMzu
	 Rln4okaYo2ZCVkj5aLqNseZ5Z1AUaZCgfuAgDYE8Ahvh8QsnOvyFwAmG81OIOWxFPma6u
	 ZPCDIxmaf0y5hs1ftboqGGbfBDYBkCRAbrSXm85NJt6NgoFNPAtYMKQZPxGTxg5TPlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
	b=h8xV67SkJjCRTqrWTwZfT68OddqiCOt3q/m/0ex+JD+obVUaAc67IJ2jKemAOkJFJOGz
	 WwCTwFUdflrKvFPHngX14Zsn9ZfEzBccwCxpb/YClAsxLXcoiKfbG1YG2k6pA0Syp9wts
	 V8bDXNwailUL+nszz5uwQdINucra/7d2soLddTAw+ZndVTP0PVu6o2vxI/3w7XGe2+z+/
	 kFJ7xY0F+NqTM08+WkKmvmcrYKhuIHeJdB9M62itdH9TWH+nZhpxUoPKJBIIgewoWWQB+
	 yNF1O2UWMmmHYxIYh7Tpd/8ucoQBBEUWMIAlXc9ft3T/Vb+rzNkPNP/Kq44YWzN9jXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B9606A32F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 23:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433B9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gj10Swzo
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1898874a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 15:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785199; x=1795389999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=gj10SwzoKMqoqx9yr7X2Fju4cNBju2Oqd5X0Ay4Y61hHfD7PCDp9yiFRZZggUUCphi
         EgquiXzLIx6aY4R2RTd5ZLyzF7a+dFyArlFGpwOF8hzIuQxpoF1rvqBPTA90bbQtiSc3
         ZX0RVckXRZHz0dFR0n/+vn5BPOC/cB4YcRGnL/oyILEIke66Jod48SG+Qv5PIZtk+cJ3
         a4jGk58g4rcuy6H/nHZi7pTcKmRSJIlcgRxeZ8a/8BRn14ucVJyS4iEkzUGGbVSfsTxE
         PA1L6L9cE4UDQma31GznSkYOnY4WfVQEo52nxdxOSnQrrOnmbWew4sNB0BE/xLjNWEuG
         NuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785200; x=1795390000;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20xh83TZY5Uy9+3Rpue534EqUQXyz0SBbzg5tu3uVBA=;
        b=Cn2oWa9DbHWMeKDjd0uwnjUq67xHPng1J+EQdPrDSIP04l0AEhyJMVy1V0EErpZsu7
         TSBDApZkS2f9OL2hxFcg49GKSSEw/L8F3J2vyDgVNaYqQsjI5zaXzymc0NAS+N+uQFBU
         W+4ABwdMbvxEglZvnex9vkI27//+FPlJfCq1c8wmzQnTVPzrfmxT/rdq1GGrZYCtZ/qM
         CuaVLEUk3d5E/4lu0fA0Z6hj6RvrjwjUFHBy48q4uQ9gWMsfzZwhRAJzr4h9FgidjLDu
         /yAK/8EuPisaaZPwdu5BVn3iGwnNZ0lHO5nyKl7mY9uQTPZdC6mh3JH9lpiuXZGAeePh
         ppkA==
X-Forwarded-Encrypted: i=1; AL+hErFj3qDXb8eFwYUqbVm/pl3DIw+bxgUmPMMHx9pMtMvoeUjt2gzxCn6b0KiUbnm1PqhcST0lrUc32NZ/5d3/b94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nHvf3WASIIXy4P65xlhg58YCM2O3MHnYQvhVIDTHJ+r63LdE+
	KDfay6Vi1y5UoS4gLKNMROVbYrLt9DTuFRfbHsC2llmHv/Ih1lpDiiFL
X-Gm-Gg: AYBFou1y+yYcjvkNjENQ+8HQPhSWb5TKD9+bQ+n9pxfRZvx/5nZWG+z2Gb1PXGTu7rm
	iblJG+aIrsQKRTkiU9mk4Mpw1eZn5RuyHeTL1Dylz082yOqAhu8ZxQS1n0rgG7rraZkCw9qEv7n
	tB58YrA1NY5Cn2bOIOyxGOABnNaXS0c62c5PHsm18SMRuX/udKPXsoJ8uLlVRcfvRfqcP1Fad30
	3V+J/VVypRRTO2GjViTn/6l6gDCO00g+YiuH3av/HB0fZc0nbOMyKWR/3fy6z/OMdkOUZDMLxjo
	zJr+6XjxOlHDt0A9UDqYRr8KbGY9E2qbhVlxwaCxVkSDowlTx+lhGX2a48GKFvmnNlBOZGJFcWO
	WE9zJbLHANSinr4y2eXiQzJy6zYUIU20mvD2yHcAfr+l9OzyuG7kVQ12Z0FX467M09EH9bsAaup
	fH3LMGi45dpLFugOWrZNPCH6V63woXcefaKVzerKsjl2MpKNwR22gSm5W33yOvVqEBphQy1lDxC
	zwvvPRO3Sa2PStkrO135QvbIdmEW4Lo3vjX8SoxM7AyvWUkOJnPSjh6jw0qDiAmSM/iRDfakhNv
	sVYNAs7uKrtC73XZ0iHdvRjAMry8Lg4BfEgZv3G7BQYHUiHF+nB8A/TsmMMMDR9LnZoJBnxFKKn
	g6Vpzz+tfHjxoouuQFrBj0CbrsJ6YxCw5zQ==
X-Received: by 2002:a17:90b:2e06:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b1b07e1cd4mr8163612a91.6.1794785199420;
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm6832094a91.4.2026.11.15.15.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:26:39 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:26:38 +0000
Message-Id: <DMW695ICRVGM.2YJJUJQ12T0V6@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
 <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>
In-Reply-To: <e8f1736e-3f13-4f92-ad69-8b166c41e68a@rbox.co>

On Sun Nov 15, 2026 at 11:10 PM UTC, Michal Luczaj wrote:
> On 11/14/26 19:45, Alexei Starovoitov wrote:
>> On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
>>> Follow-up to Sashiko's report [1] and the decision to restrict which
>>> iterator may perform sockmap updates [2]. Series started short: remove
>>> about-to-be-stale test, restrict updates, add a negative test. Then it
>>> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
>>> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>>>
>>> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
>>> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>>>
>>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>>> ---
>>> Changes in v3:
>>> - Drop RFC prefix
>>> - Update bpf_iter_reg::feature docs
>>> - Fix tcp_request_sock BTF build error
>>> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Ale=
xei)
>>> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-it=
er-v2-0-e96a63c43b39@rbox.co
>>=20
>> Sorry for the delay. Applied.
>
> No problem, thanks.
>
> To follow up on bpf_iter__unix::unix_sk, looks like there's a single help=
er
> that will become unusable from iter/unix (once plain-PTR_TO_BTF_ID is
> gone): bpf_get_socket_cookie(). PTR_TRUSTED then?

I have a patch that 'forks' bpf_get_socket_cookie() into two helpers.
One for trusted and one for untrusted.

Also have a patch set that removes legacy ptr_to_btf_id for good.
Hopefully will send today or tomorrow.

