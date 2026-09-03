Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776774A2061;
	Thu,  3 Sep 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455478; cv=none; b=kOrOh2oEIf+H2GHP6Mk6/VIBEpH/eKHad3Ho7stwcqlcyqRBIeJ5lz7tikL67WeWbK1w9zzri4hjxEU8oRIb707qVQ3cYSdp+la51HYCQmp9k5VgaR9gZ7lQwRhwSqht529j2PZEhVu/ND9FgQ+FZZemuA7kokIuCMZZAy67Orc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455478; c=relaxed/simple;
	bh=ogzWy7EWCD75TNoqifNVGlozDnJBrFW7ZBndkoEm5YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHRDtw0EDznOko2cqNBoSCQTrjJyOb3woiNLUtMQ8Am+lzKy78tHrUrWrs6EtYzm4iIdqnXvGPiHebWPXKBCghjLtu7rDyJLC4lwaz4/WPNU7QNTJF0jYIKHmTGH/KJw1nXgmEbhunsvtRWzJ+HABUGyFitvV1O5Zvn6KBprkno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=F6L+1UB5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="F6L+1UB5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xIoSYNxD64iNAu+5aFubNHywfArpP6dsmDEkdSUVDow=; b=F6L+1UB5zwopoRmLN8NQz6bgm3
	hYAYOTFyiyRVFPWHmvDHaHjYhI9qhiE3H+e4mexMOSjSQOzjmbNGYjx2Itfg/5Cxc30wZ8LLjGFCo
	aIb7spf/v0Q/wtKTvm7/yy9p4KllwL6qEYqxcr85YrypBaeR+WH89mlf7CYxOIxOzcF4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2Axt-002lUK-Mv; Thu, 03 Sep 2026 19:11:05 +0200
Date: Thu, 3 Sep 2026 19:11:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow
 cross-compiling the hardware tests
Message-ID: <c45453d8-72ae-450b-be9a-565df1cf0287@lunn.ch>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>

> Tested on an aarch64 target, built on x86_64.

Probably a question for Jakub or Matthieu.

As part of the CI system which is feeding into patchworks, I don't
think we build the selftests? Do we have the CPU resources to build
them?

We currently do x86 64 and 32 bit builds. Do we have the CPU resources
to do an arm64 cross build?

I assume a cross build the self tests needs something like buildroot
to be sensible? Or Debians multi-arch stuff where you can install .deb
packages for libraries for other architectures? So maybe that is going
too far?

   Andrew
