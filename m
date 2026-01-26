Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5FD33123C
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425191; cv=none; b=ei8Bi+HS71I9mS2uOdBHaPUaAWT3txjPclr2PEk883BKrxm/uxn4nfoILVW0f5GINdpPWoU/TBdmuSFki9nvIS/+fOj86M7tY0FSyKdR2pjJOJrhDIAV71XHVryOd8Mr2FdBkFycg1iL1VchZG/qsVv5iJY00CQHtVOghCMSN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425191; c=relaxed/simple;
	bh=OafcGQ6mxAgBJ88vByZ9JIl3q/zabfaREQeoOaB55Ms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fnZ2fxYW+0u+A4VcoxFuzozdNDHfDMBGcMV0ztNEIfXbVXVZNDZf+FKxbJeCDZUAsVo5zoCqh8jFN61mZWLyicm7ueuUMrJpnTduaM64mapLII6FBqikSrr9z2bASbqZcWu+GjEuiXliWqe8ilH+cqJOVJN3bh27iAxdJ82udiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=fB5oNzGe; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="fB5oNzGe"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b884ad1026cso679895466b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Jan 2026 02:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1769425187; x=1770029987; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNxfvlw1oB2el4crQ4TvEj6ef2WAE6hpmRaDCbae0ok=;
        b=fB5oNzGeLLdemGhohHO/362WVc0wb3W5YnpSUiy3dJfxJ8SuveE3wdmSfBswxmBPnj
         9FkTK1Xr8bWsFzVSIL2l8a9fLQ1J6Rokjcejs5JpqPXmqBm6G89PeHz8TRYGBm4Ea534
         UW9qymyLQJow8JGU4ajrQ60T2GaCHoIU4o/0jjjCTjx7t750Ljh/CXXeBSRHODJp3k/F
         SVs7pHScgZRgkEZaf1JJrMWSDF5fkdg3aY4uKjeUGBa449e3hX+yCoHhATKmCg4XfkCa
         66M87u3ueqovu2eS2A5TusW7vF7coMcBn8ZgpjyTi9PJKXitqNa1s81ShjPhnsONrK+o
         k/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425187; x=1770029987;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNxfvlw1oB2el4crQ4TvEj6ef2WAE6hpmRaDCbae0ok=;
        b=g527vVruhuVTxT0cCSmHz4903cJrkDM/67MrFRYWwgcTTFTeGTWvvh0NeGcxt9XHPU
         DHdmHxG/Ek7/W7+1AB19Sn/UjMwXKNtSPwzpOdAu8WvlOET9gOxUnrgS0JbXEt1Kswz8
         lCnYCx+72ZRNfWxFLT95Z2MHnA3JbTamdud2etdNaq90fIVYoT86ZvZUw5O44Y642VgQ
         HkWG8KBOfLWDdY6sIr9ra2xtdrc3wuJ0Ts/lblQG8wsoleL+kyQztaokKp9ATpjRVoJv
         2RhYvwBL3j5eFWK317z8LuTFw9tgP3f8AtiB/50vPQMBjOZNSU/1xMFKLIt/4iyEjLA4
         fuYA==
X-Forwarded-Encrypted: i=1; AJvYcCVTGE0tN4mpN1gDvaoGggKECUDNj3LMFSLQjpjLVixoujQ1QLRqrIKO9PTRyPioDeeia8TUypAMuiCPUeuVeJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZtzJKP8xnMxRYEzwzoz0OTAL8zQInGmWshV0buSjDmA2jXM5
	iWPYYZBg/yW6h11SR6disdhKuDuLp5Sq0HraaiszzGp10gmt+et6385zFZsh1aKSziU=
X-Gm-Gg: AZuq6aJQc6SvpG8HQ5K0dtnxeT6U5VVV2okmc++Rc+ZNN26iw4sFirUR6/iMKMmfxIe
	9PGfGtzRsngRBOaHOlGG0yulK/CK84JO79xgDm+S30i5qEvAFrJoVGiQPg8D8crxytMOrbFGQhG
	pBVYe7XyVqUM8BggLM+gk0t122RFNt0LI4zTq511RDjJiC/ahp5s/0Uu83wYpjPdt5e8h+wwsDK
	R3UfbXH4Iy78z7mjezvX+QLGsPMqm/seNLV0lnW2dmnWhR271V03NcI0XPJei0SdO2ZwI0guLHp
	4XVE0O6QrKQE9oWlRj/pbugUtnA8KIgW//02aVsKCXpq9m5CRQT3Mtw4Fs1Pwi+P+jZFv1FStT7
	46dP5CjXIVK7fzx7SAm1jN1a98SoihPr+QCtNajarmCByrwRL82slBi38SkzAYQSqXOr9D/IXRv
	+X7vw=
X-Received: by 2002:a17:907:1c2a:b0:b87:7e8:e287 with SMTP id a640c23a62f3a-b8d20e293b1mr307215366b.30.1769425186687;
        Mon, 26 Jan 2026 02:59:46 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:5063:2432::39b:b1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b076254sm5237402a12.0.2026.01.26.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:59:46 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org,  John Fastabend <john.fastabend@gmail.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  Simon Horman <horms@kernel.org>,  Neal Cardwell <ncardwell@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  David Ahern <dsahern@kernel.org>,
  Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Michal Luczaj <mhal@rbox.co>,  Cong Wang
 <cong.wang@bytedance.com>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v9 3/3] bpf, selftest: Add tests for FIONREAD
 and copied_seq
In-Reply-To: <20260124113314.113584-4-jiayuan.chen@linux.dev> (Jiayuan Chen's
	message of "Sat, 24 Jan 2026 19:32:45 +0800")
References: <20260124113314.113584-1-jiayuan.chen@linux.dev>
	<20260124113314.113584-4-jiayuan.chen@linux.dev>
Date: Mon, 26 Jan 2026 11:59:44 +0100
Message-ID: <87v7goskpr.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jan 24, 2026 at 07:32 PM +08, Jiayuan Chen wrote:
> This commit adds two new test functions: one to reproduce the bug reported
> by syzkaller [1], and another to cover the calculation of copied_seq.
>
> The tests primarily involve installing  and uninstalling sockmap on
> sockets, then reading data to verify proper functionality.
>
> Additionally, extend the do_test_sockmap_skb_verdict_fionread() function
> to support UDP FIONREAD testing.
>
> [1] https://syzkaller.appspot.com/bug?extid=06dbd397158ec0ea4983
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
