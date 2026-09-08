Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3245335A7;
	Tue,  8 Sep 2026 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869130; cv=none; b=VAd6w7nCAkzKeFgci0YrkrKgZJzAZZSoskI+qSI0ind/LHJ5OrZss/IqfkkrUMWgu4g/69yTkTwTmNlJDzwrb7GIbzGNlP3FKPDQp9qLVHcnP+XK0pRLU6aNw6VaBAu58mH26Xd7Em1tE1+WIDq10nSZ+7M7T1cjewD4pfHa0AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869130; c=relaxed/simple;
	bh=DUBZyFChKXUcT9DUKLwE2m1oiUU1CB9FzxjTJVf1Mds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IER/h1Oj14ALTNaCpnTje1aYByDJ7qsSPncTCzc6zTApNw+IfLbX7GHC5jxQoKmlVCUKO2NNzw7faxau2qUzLzp/SCIPh10t6PbuPJY/EtE/wpveqzLgKAie5rTs+N+PVt8SW+q08UqUKYdVLpgSUqJZ5sN5ISw6DVEQtnVBFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kcyfGyd4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kcyfGyd4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+jN0CNGpu++wz2OfmG24unVE3E/eSCf8Ige67pFhPRQ=; b=kcyfGyd4ICgVZ6ZnWgMnZy1xZy
	bAeUh6YAcYwtOhIFyrnHUaUCx/GfbEeLINs4dYI1r3PV4T3pGz5j+NXTJzYSwbFN0SM5umxz0Vz8S
	nxYlgvQwf6NeEfleHhjjmomgAWWltSsAznr3shmYd8/HLDm/L1/N1o69aYuFM3SYZxg8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3uZ7-003sY9-UJ; Tue, 08 Sep 2026 14:04:41 +0200
Date: Tue, 8 Sep 2026 14:04:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 07/10] net: marvell: fix typos in comments
Message-ID: <326477d4-a04e-4797-93f1-831bfb91ccb4@lunn.ch>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-8-hemanth.selam@gmail.com>
 <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>

On Tue, Sep 08, 2026 at 11:05:19AM +0530, Ratheesh Kannoth wrote:
> On 2026-09-08 at 10:55:59, Hemanth Selam (hemanth.selam@gmail.com) wrote:
> > Fix misspellings in comments, found with scripts/checkpatch.pl using
> > the misspelling list in scripts/spelling.txt.  Comments only, no code
> > changes.
> >
> 
> For below files
> 
> >  drivers/net/ethernet/marvell/octeontx2/af/npc.h         | 4 ++--
> >  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c     | 2 +-
> >  drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c      | 2 +-
> >  drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c | 2 +-
> 
> Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>

For the rest of them:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
