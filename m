Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55A40B36D;
	Thu, 10 Sep 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036333; cv=none; b=lVIRHjsyUql1LIAvarG62gJaKCALWI4Xi+PrDvq+mpcojFqgSUesEL8wpB1WgkiFFsyliJs0uNc3kgpOeSKi++rD0xGwAPei0ummq8lUdyHh0hNYE+c3likNnUpRKaCCouINBBQ/asf2S5sQZ0r0cynEo45x/3Pg2QjsOufqaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036333; c=relaxed/simple;
	bh=V2vhy65ipyK1teB6lk2kYBwi2igXEQekTpVnNrvEA1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG6WAEzlKfOAi2CrMmF5y1z/020JzagMoEtKuMp/8rhy17KXRIYP3fecAgk7wnxmqTXXN9uEduZ7uqog/+1pW3OEIeCkQfBHm2VhzNjFHQLpulsdkZ1oiMl1O0X9oYWMb4Ki9S/TgbgZvhFJyeWNL7RTpZ2hzRV8Ynip6LCQxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZreZ4/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZreZ4/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF591F000FF;
	Thu, 10 Sep 2026 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036324;
	bh=C7HvCb71weYQ/NOoQNM3djQKtH6Nl3mKnKGj1C/6bO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZreZ4/NiTWZmQu+4xgSv3RsAlU2d+Iitt9d2uhSa1/bVELbT1LAxNMGoopKV7RdJ
	 GaT2JuTQXhxZgfhOU+qL5sTDVZDavLErtClLapXZytUiZdypqr4/r9Ru/s/CWdH8DH
	 QH9BWCrGZ2eZAXxMsGvNuRKRy+UE5ZFXOi1IgH+Ksqnhd3qWnn07Q5gs7h9zGS6ErC
	 4J2oCAhA8sy8M8s2zB0KZWwMnIp/y9LM3hxZNm+O+ZKdd8gWvuQwynoH7f7Bji5BTA
	 0c9VWIJ3JGCScEwzL7zyTJtyfmVdwAAXBTIQLN+7enBAFvzF0Tn3F8OU8QvhVhl+61
	 XytdHaYnGptzA==
Date: Thu, 10 Sep 2026 11:31:57 +0100
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
Subject: Re: [PATCH net-next v3 05/10] net: qlogic: fix typos in comments
Message-ID: <20260910103157.GX40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-6-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-6-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:55:57AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

