Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF1D41D639;
	Thu, 10 Sep 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036417; cv=none; b=pClliWpStrWKNrp6i48t33/6DfMphFB6m0BpZkVTAgIjAy94g1Qu7ywJOZYpfVXxidW+8kU80IENsBXvMRVCX3p9gGkUx8dxb+vtL6c51l576pfHTssgt0es0w7ySpAsI8AbEZjvJ88gtaQTDtjUvQcZntP5bx2mbfFWZXOUUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036417; c=relaxed/simple;
	bh=mtUuCnoTKoDnMY3w7GWcCKYI4I2Mq8WezqLK8oGGIPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fs5dv0pBZ8AZpXuv1qFTQkjtRsbG8WsZtzZDBFtUgj+aMF1aeOECJqW3we0Y2R2dEPFuYWxh9+hGy0j1Wz1THeQ4ISePk7Y1s4xFYdPXrd0kE1fLP9bfUVP9VhpCgJuHRHvENF71TLDA14EngLeba6AgzT+FZHe7RjT6tx+/jIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Swo3Ty6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Swo3Ty6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A51F000FF;
	Thu, 10 Sep 2026 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036412;
	bh=Qtd5XclNles4vGCETAsVKWoTXXeqn/t7wuBwecKgM5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Swo3Ty6MgIO56Mj42fDZBBdAuN2xIy2Hv0Z4uLWKYoMsA2NKyxDMeA0LQdTiU4UC2
	 AT5xQS+1baPV36U7PuSVWnVRJypR+OBJ4J/HK8cv3lPE0t4Iuo9oiD2+Eqy8Qwyi3W
	 3PBY+aN788jQE4qE7XUsbYB5lD7hUJopUADY+WFkSMESCjQrzoQRtkJbR+da8VRdfL
	 yqWW4KtqegN6DbUR0mgG9wuMv70ilSU51DQJoTbwns6+4dj8XxZiQxJ9XTFcfeTEXM
	 Cf/aXFebhNiVLGcwMD0H6XwMW6EWgouzRvNHPr8mf6BRfsqHkUtQ+2KQmTjpytks4+
	 tyyCd5aH4FsJA==
Date: Thu, 10 Sep 2026 11:33:25 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
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
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 06/10] net: fddi: fix typos in comments
Message-ID: <20260910103325.GY40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-7-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-7-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:55:58AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

