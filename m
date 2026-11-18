Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008421;
	b=qz/Za5m1qp31E024KT1ll3tKgfwg/wwJeWSrORH15P37DQc4/oLq56/sbMjEeCHAgJgJ
	 KUvGDrth5480poBQI0XLsaj5NP1OY0aW+sSgkLWJjGXPEde5cwedpx8i4dh4dFw7FKbFq
	 XpIq/5htBKMYbcqAJqc1Bo/NPR8VkYpNj1IZq4CYBmsHdqLvRlVPoTtrAjwbYC0YrlZ7B
	 4rq4MzyKCid8b+x+4hDuiY7S08lyWrm+UncI63cTDahjAYK/e8Bax7+VapzfW42bhvcf2
	 dux6329x0tIHrToEbtK5PwUt+B+W3Qtx9iKzYsTM36qbIMgcVNqzFoHnz+iEW3wZL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008421;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2VBlVvZ8PJS2AcIDnu15PCGckXM5TWMvp453XtyGgig=;
	b=3v5alRUNH2YrM1TVOW08Ug/QEG//G94dUMzBPyehC1DmUGgwOslnM3YurinAyG+KkecR
	 Jj7T0pesyjtLHJT+wjfIfNqdEzmvsyAg8WA4b1y+Vukj6eWC33z8ArdeE1L1iEQQumhuR
	 LotS5RmxsN96lkueDExdVAO2BCxb7wT9y0D3mPCEDQ8Otbk725kqdEQ9xdIw6qTXKDL5m
	 fvqFg52ncmOpUKFz5MswbrvMIQa+4pSJfT4AuguEMroXjIw5hRtSdN14ja/KiE9lTIfkQ
	 pFdptNu2tRo0WW7c4T9orzOKL656bbVs8xWtvkLHxIn5u6lMbl2UXfBgSeUPyqmSXXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jW/exEZ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D85606A31C;
	Wed, 18 Nov 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jW/exEZ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FCC1F000C4;
	Wed, 18 Nov 2026 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008421;
	bh=2VBlVvZ8PJS2AcIDnu15PCGckXM5TWMvp453XtyGgig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jW/exEZ/yJJPzaPAQboCh/XCwWhnURdmFDJ6l8n2wt3JJy5PiE+3vivSHVoGyLJgf
	 r21WwgtcrMFqcTc8LFT2vRITCYUN44Y0RpcUuRUbu/GwnwvVH+kYH0L5OFxQqaxb2h
	 Z5gyIKbU89/GxloQlNDnERqMTKcsnh9w/CvngFbDmGgxabX8jqE/3LQD4FYj++DFll
	 nA8802q9IRV7JTehTlFbnjPcXAt6iMI0v3couV1qwwS3U7BYQgZvytMd3AWaqJ/gcc
	 vekuSmpMHQlEAimxwDsCFmY7Z9NgzyG3ENIVCs74RV0augeX2nIhz+h6KMswf5MAt6
	 S4RHS8Cpp6aeg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski
 <kuba@kernel.org>, kernel-team@meta.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Mohsin Bashir
 <hmohsin@meta.com>, "Mike Marciniszyn (Meta)"
 <mike.marciniszyn@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Bobby
 Eshleman <bobbyeshleman@meta.com>, Breno Leitao <leitao@debian.org>, Simon
 Horman <horms@kernel.org>, Mina Almasry <almasrymina@google.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Dimitri Daskalakis
 <daskald@meta.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Dimitri Daskalakis
 <dimitri.daskalakis1@gmail.com>
Subject: Re: [PATCH net v2 3/5] eth: fbnic: skip freed Tx rings in
 fbnic_get_ts_stats()
In-Reply-To: <20261117215416.1901246-4-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
 <20261117215416.1901246-4-dimitri.daskalakis1@gmail.com>
Date: Wed, 18 Nov 2026 14:26:58 +0100
Message-ID: <87v75u6zj1.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dimitri Daskalakis <dimitri.daskalakis1@gmail.com> writes:

> From: Dimitri Daskalakis <daskald@meta.com>
>
> fbnic_stop() frees the NAPI vectors, which clears fbn->tx[] while
> num_tx_queues is left unchanged. fbnic_get_ts_stats() walks fbn->tx[]
> without checking for NULL, so asking for timestamping statistics while
> the interface is down dereferences a NULL ring.
>
> This was found by AI and reproduced on HW.
>
>   # ip link set dev eth0 down; ethtool -I -T eth0
>   BUG: kernel NULL pointer dereference, address: 0000000000000050
>   RIP: 0010:fbnic_get_ts_stats+0x38/0x60
>   Call Trace:
>    tsinfo_prepare_data+0x82/0xb0
>    ethnl_default_doit+0x213/0x470
>    genl_family_rcv_msg_doit+0xdd/0x110
>    ...
>
> Fixes: 96f358f75d1a ("eth: fbnic: add ethtool timestamping statistics")
> Signed-off-by: Dimitri Daskalakis <daskald@meta.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
