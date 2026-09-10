Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4F0449EB7;
	Thu, 10 Sep 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036683; cv=none; b=TJm3kRLinrztQ7GeyOEPVIJdLkRPJq2pYMiDyj4SyB0ETFipFzBf5kDwcXTMNsBccSDK9Gg9Ekq+pk/mcQX2PQ+kg+chiX1AeoQaWXa+QrevqgYmrEVjuSAQhiTwEMxsXL/pKKmjFlYWEAd/gCktgqGOo/pdugDAhbatZJjc7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036683; c=relaxed/simple;
	bh=HwTJ5XRi2oFFYrUdFhcBBdiIzkqoJXU+X4GMTMWUyak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8MSH5psXTVCIXjAImavR2lgFNb1ScJxFPE08RmEpyhDF/1ih0rYRDzMlO3q4MwDgmDx37Y+wptwMXx4U05jMmGk5lUtbJCYT5JEgd9cbY+OXf7edQ0ZVle7ycBZXg6CHQXTaU7ZFpKkoulU/pwrVNUu+5+RMWqbEPfv3BOdMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBT/KBAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBT/KBAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4E91F000FF;
	Thu, 10 Sep 2026 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036682;
	bh=5uGM4BuLClBRTLbuUzqGRM8QUAEWCT/UcZAz/YLURFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBT/KBAD4yybhYqkv+rDbyV/jbSb+uRPzvRQR+1GZZldnMkFuAoVnw0z0JKHdJvK5
	 qs05eSae0M/o8DCbh/jEZiMKLCoP5tWXir6XJxh7WstLkuZQ07lFtSTjP+iBqBZUVv
	 y4Hpuxw28gbvFCjQsqhQeeoQ5qDUNAaD2KGF6Eflmc82o+wN4DaQLtmXNfpQHkAMkT
	 sq+wnMARloySRyuTvA21ikQ3ckPA7SX2BDu2+hUbf9MqC5579v0RrVXKWJMKhIiEe0
	 KqioDX/hPlaodMgm8wkAHheqMIgaHk7YEnXNdM9r5om5OC7IVYTLvSCFotO+hhsFrj
	 2XC3tFU2hAQzQ==
Date: Thu, 10 Sep 2026 11:37:55 +0100
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
Subject: Re: [PATCH net-next v3 10/10] net: dec: fix typos in comments
Message-ID: <20260910103755.GB40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-11-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-11-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:56:02AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

