Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200130;
	b=KlZs7+DxOuXluS2k4skV5ngO/K69FvPYnBgx0ZWEr/ZZORdKN3WZME/ELwnTVNMgqceI
	 e+x+Yw9M0he+f/3xE2SbXkyRaH9WQUsc7eUoJgEdPumtF8wjqJ/FwWA6rFI0EGSXMZIE9
	 XluUsHH/cXCuxHGs3Kt2glqp8eQ3bzIDRgVx+3xguTd8cu9XgnSObZqW8+XYU5gmfjKez
	 3HoTGUmRMGHIPTN0JkjdsCO3fqrVCc8if7aEOSbAcqm9tePeG0tvPvojiCYC6d4QCta/a
	 UxJz29+iGhGDPm3k+Tvi6gU0TYGY2w3RLVpv9AReisZRAq640eC4qBO12TIri+dnSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200130;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=DcTduXKK52AcR0HG0TX3d6mvNF8Uf7jMIHlvX3aCiN0=;
	b=VJ6zKNRtPjN5ZffjdRbR/hQuR6pxZ8F1E9PtZ4xNe66epd36g9c72NrKS+KMo70HvBVz
	 K+D44ZpUgAW85OiGJs6Lock1dgMP6/KrUqgrtUswspYMwxnO23Ym7k+Gs3zAk41EOtqry
	 9BwMUZeUcbwYGhcKuSpixu6H12uhSH2uWZP2yMprV24eZ22sg+aTZOY6PxBQbI/0Audlc
	 4qP2ddJzvmTiOyVur6SYCObLS6NHFVvO1povOhmbEIP7Mq+1l9aS3Peh6LCOKh5/oZV0e
	 EeB9njMx5Rh8RYn4dl6M+szNH5qQdaT9ArCWTorcleSU19MkMGiVGT9nJClPhNAkbPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=pAcb1WkG;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85660A262B;
	Fri, 20 Nov 2026 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B85660A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=pAcb1WkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DcTduXKK52AcR0HG0TX3d6mvNF8Uf7jMIHlvX3aCiN0=; b=pAcb1WkGrZnYCnYg0tnUSvuhw5
	UothwJ5mK/IWs55a+TX47F6Vwo4Gt8r8jbtDnljgMNOlchbwvmjLGkZhwk+KtFK6mvMBFtNioV1k3
	cuzmNs3BPraUjaOUwNyAVMGH0Zj5gduWC0F9sWT9Yp2f+Re37rWbI7pYNGWjZ3tJghOV1jXKiXe5t
	Te0L59GwwROn3fPTuc/YWLsGqBKrCLfXlSDOjkhWfkNe25K0Obc+Oytp6s0Ojs7ltHea1pweTbYHB
	tAmaOQZ1yzqmikSVrnqWIRCp+xFZnjAu2Fb1VsGXSOwJ/sRvHj8Hqx3dZGK45K/TN+V+HSMBQ5eAh
	znVZXK8w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xUTYa-0034QR-1S;
	Fri, 20 Nov 2026 18:41:56 +0000
Date: Fri, 20 Nov 2026 10:41:27 -0800
From: Breno Leitao <leitao@debian.org>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: netpoll_basic: xfail if no
 hits
Message-ID: <awCURF9dLskoZLD2@gmail.com>
References: <20261119-net-next-netpoll-basic-xfail-v1-1-206bf59911ea@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-net-next-netpoll-basic-xfail-v1-1-206bf59911ea@kernel.org>
X-Debian-User: leitao

On Thu, Nov 19, 2026 at 11:52:01AM +0100, Matthieu Baerts (NGI0) wrote:
> When netpoll_poll_dev() is not called during the test, bpftrace doesn't
> print the '@hits' map, because it is empty. The test then fails instead
> of reporting the expected XFAIL:
> 
>   net.lib.py.ksft.KsftFailEx: bpftrace failed to run!?: {}
> 
> This has been observed regularly in the netdev CI with netdevsim, since
> a recent switch to Fedora 45: hitting this function depends on timings.
> 
> Fixes: b3019343e4bd ("selftests: net: add netpoll basic functionality test")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
