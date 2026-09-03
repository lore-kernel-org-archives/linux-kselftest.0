Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8715748CD70;
	Thu,  3 Sep 2026 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472779; cv=none; b=AZN3oudsDK7O9Xmg6ceadCP/nlQOwxFFsJt51GrkumBqVSCpt6ALpAl6BCIsAqvlI40Z3bGi5ZMcNG6hos+lftNvtfe9N75gXc7VcGrL96p9xeFMCGPUSskWCzujOgHsplSaNvLdtUbkVrvn+uBHiozwk44JCJfb/S8sRi0lpRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472779; c=relaxed/simple;
	bh=3LdsSNJa7U9YPL7Hic9gCuEzZBNy2mko3N22Cn0x984=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTVUl3AZIOx9TskFkNSiqOdnjZ7YH+dh08Ka1/wYLHgQQPhRC0VyvU4cm3J+UfNE3a0FIGjOynJ4Sv2UKVtWBp7Mqu5vg6aeg51lfzfyNio/+RbJtEIhZF+eiRUOmRAiinyjIfSKXXopCP0kJ0fDHwI7YDJCR6Y9gNh4RU9WMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5PJls+Hc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5PJls+Hc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mYpe3ojc8LPvfgQKtk1TjSS1scoQKnlt4c4PVyGSgfY=; b=5PJls+HcMnKPRBqL2E/lg2IgOT
	B7+vXCpE6W0eQ2p1nSsugqOgxJrG152nOyE9w4wJiEMdXtcAxJxMwZAD7KPfDeGFz43Z29/Dx/m0Q
	+9aCc761nKUaR1foUyS1F0xE6ALIR+vbWFIa27kgsHz2hczb0vXB+aQBaLkkrWJbk0i4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2FSt-002oHD-GA; Thu, 03 Sep 2026 23:59:23 +0200
Date: Thu, 3 Sep 2026 23:59:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
Message-ID: <a0ced283-7eac-451c-b22b-cb88a302995f@lunn.ch>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
 <2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
 <b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>

> But then there's the kselftests that require a peer, and here it's another story.
> Some tests, when using the SSH remote type, will scp a small binary on the peer
> and use that binary for testing (sending specially crafted frames, etc.)
> 
> Just in the drivers/net/hw tests, we have :
> 
> drivers/net/hw/csum.py
> drivers/net/hw/devmem_lib.py
> drivers/net/hw/gro_hw.py
> drivers/net/hw/iou-zcrx.py
> drivers/net/hw/nk_qlease.py

But none of these are binary, so long as you run the .py file, not a
pyc file.

iou-zcrx.c ncdevmem.c nk_forward.bpf.c nk_primary_rx_redirect.bpf.c
toeplitz.c would be a problem.

> We could expand the remote_ssh logic to probe the peer, and raise a skip if it's
> a different arch than the dut. Or better, have the DUT check if the peer doesn't
> already have the tool in question, i.e. the kselftest "package" is also installed
> there.

https://github.com/torvalds/linux/blob/master/Documentation/dev-tools/kselftest.rst#install-selftests

does talk about installing the self tests. Maybe somewhere in
/usr/local/libexec or /usr/local/bin. 

	Andrew
