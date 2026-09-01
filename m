Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7744A3E6;
	Tue,  1 Sep 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302557; cv=none; b=AZosm3rN+l2K7hnYQ0iN1+uHYhBH0EKVLAhIu9VZVr98vcycUUFeT927jbTcA4O2ZMvmHsCBVqrh/CXF/EesDZcsX5OAnb0RppICGxSDdKBftg8p3tMfU6tupd7a2OFEyJQZAJI11awL8TO5vynOdw7GNHtH6oIT82oYPHxIfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302557; c=relaxed/simple;
	bh=PxW3qNGPagqYOQDwNSFzqop/kkvVtBNyvPFgYEA3CGc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbNDn1X6Iudr8bAc7jdrO7AVMR4jM4Irv2hRtK6ucL7tZVsEnwhg/DJdMIme223V9iViQQDjidu+/z2e/hoq7v/r1EiX1WlRuM0ERsafTMLajOSHpvskz4GOvDB8dxbAMaTk/XSeVudN6VoB+lR/Q9GwcBGX7D31VoeMDpBiXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+xmECHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+xmECHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341D01F00A3A;
	Tue,  1 Sep 2026 22:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302556;
	bh=8gbx3cCe6Zw4u7kO/EAXMcd+oY1P6w2NCsI2DGNgCc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=e+xmECHpStqxReSf1NjqxxcyqeNHJBfSNAgY6N1pMsIWNL8bk2UqCY9sO8kYbBXU0
	 uvIanbtTN4gveTdNYV3xeMOS6xgxocPq5g+xCkKOBBrq+xVX/0u/e/vo/YfBw6Bk1o
	 5CqXEP/xT/g+P1LTOGDjaqgaQ4kG0SvNZWrszb0zlXPSvrYl/WEy7kjWa/4h50V2B1
	 wVI5N+JPJnohJWXIO1BcJpi5c3jhyZwKRf/vOqB5cybQitknnBAV9Bg+QrC0ElJNxu
	 JPoywZDWdKSxX8+dNvel1NTLk0P/5uXj9v15cF72aTn7EdMwkUzwUEnIvBCtfwFXJz
	 dBnJtyPBH54yw==
Date: Tue, 1 Sep 2026 15:42:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald Hunter
 <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, matttbe@kernel.org, Stanislav Fomichev
 <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: ynl: Allow
 cross-compiling ynl and associated tools
Message-ID: <20260901154235.68389f06@kernel.org>
In-Reply-To: <20260901164200.1124343-2-maxime.chevallier@bootlin.com>
References: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
	<20260901164200.1124343-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  1 Sep 2026 18:41:58 +0200 Maxime Chevallier (Netdev
Foundation) wrote:
> Subject: [PATCH net-next 1/2] selftests: drv-net: ynl: Allow cross-compiling ynl and associated tools

>  tools/net/ynl/Makefile           | 1 +
>  tools/net/ynl/generated/Makefile | 3 ++-
>  tools/net/ynl/lib/Makefile       | 3 ++-
>  tools/net/ynl/tests/Makefile     | 2 +-
>  tools/net/ynl/ynltool/Makefile   | 4 ++--

nit: wrong subject prefix, this is touching real ynl
