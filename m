Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007704;
	b=FofREn2FNLV/dHB+pwBcjFDZhSCecS3B6x/6yaHjSAQv63S210teo0pvoQHFls7osIC5
	 NJ77tqIRJuBYKfOSFZeiBij9opPLP97UZ8jeeoEP+qIUN8Ca2xfWnnX7fVAbdmPYugFIK
	 M6mJF39IrSlXcwIyErkmpfFJLnv/rvvaJ8L9QKnjiSq4EU0dOQRg4D0XApyYOv7US30A5
	 qZwvHxETkDNy3ekC3eHQifhYXcjm4pTjq6tzbNlX8HN3o9j58yb3hBvZf5YlVPb6Wtl4L
	 L3+a6yccraWI9UCLwetFIH4OV0vs1ZBOwYqSMiQ+Venj3BdFuwyUcY6qpO2PUAO9D+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007704;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1rdoibtMJEgmFhGA3O158ZSka1CROmoLMcft8dX5w58=;
	b=dh4v9VGWe1pmFIStyN1f4MjXFRBd46uc+uYkar/lHRujJwpNP/YUiGiAI/vLyiA3rgmP
	 ROyjlkcLbayApF9esZeQW65a4s1PMcU4uJ49fsUo1l9LXPCMPgdib9RVFZugDE45yCpoW
	 xQG7pbmdqGCh1/2nygc6hXjC67f+RRBBZryR7uENJ6TMKEj2LNHfq+3dKQf3VldmILeLG
	 SGyB1XN3wIUyxhxz/iVfxvAcgIqG+yG69B8zHr8ESIfZHBXHYw7ZSpzxK7x/CBhDwie5/
	 KxODRmna1wDl46x6hBrqx6lshl0Za6eUX8QLSXCPApYxrIl31eFkMKP6i18pDsYUWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQxzCYqo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132A606A320;
	Wed, 18 Nov 2026 13:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQxzCYqo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34231F000C4;
	Wed, 18 Nov 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007704;
	bh=1rdoibtMJEgmFhGA3O158ZSka1CROmoLMcft8dX5w58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XQxzCYqoLZmz7UXi74ewPHfV2bgb5VPRf/nhLGpC0Ijunmk4UVROORsI6jgNmCp4a
	 /JR9d9ZnmsH0ELzUFo32fujVnlFZpTHYO2qcgbRn+LUwoGjRSoQ5GPN8G0R3WeYkJJ
	 a0bQ3AMTlD/f+Mf4fhVaYj4O0npNUPj4RvcsI/LT2+xoOr2fCgaWFOr93KO/Locd1o
	 CUnfiSeZsWCB9KSw+G0dmwFBZ60T2qEvkNFrnVkaa+fwOEQjd0bh0CmFyJFE8nGw9k
	 IM1nYkAf0vzz/2qYGU08yyidhi/FG8m4C0ChRWPDI6Xk2ALLDVSR/+EY2RrCN7NV2X
	 23gEqTNmZhqZQ==
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
Subject: Re: [PATCH net v2 2/5] eth: fbnic: skip disabled Tx rings when
 setting the queue NAPI
In-Reply-To: <20261117215416.1901246-3-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
 <20261117215416.1901246-3-dimitri.daskalakis1@gmail.com>
Date: Wed, 18 Nov 2026 14:15:01 +0100
Message-ID: <87zev6702y.fsf@all.your.base.are.belong.to.us>
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
> When Rx and Tx channels are not combined, each Rx vector gets a Tx
> triad whose sub0 is disabled with a q_idx of 0. fbnic_set_netif_napi()
> and fbnic_reset_netif_napi() don't skip it, so every Rx vector
> associates Tx queue 0 with its own NAPI, and the netlink queue info
> reports the wrong NAPI for Tx queue 0.
>
> This bug was found by AI and verified on HW.
>
> Reproduced with "ethtool -L eth0 combined 0 rx 34 tx 34", and reading
> the NAPI IDs with "ynl --family netdev --dump queue-get":
>
>   before: tx 0 napi-id 580, tx 1 napi-id 514, rx 33 napi-id 580
>                        ^^^ rx 33's NAPI, not vector 0's
>   after:  tx 0 napi-id 513, tx 1 napi-id 514, rx 33 napi-id 580
>
> Fixes: cf4facfb132a ("eth: fbnic: Add support for XDP queues")
> Signed-off-by: Dimitri Daskalakis <daskald@meta.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
