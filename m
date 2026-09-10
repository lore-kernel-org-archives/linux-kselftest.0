Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9D44E66B;
	Thu, 10 Sep 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036629; cv=none; b=knlvK3v1hBPAhjusWlxRxD40I9DN1dslLHcG62gZOIr4eh2rQMtRT/JKH7an4ATHr3Pb84dLeizWYp9Wjrz9fb/Vhjs8Z9TEdNwpdBgjvZPzVwHZcAghApLz1bpvM0eiAIAng/GWCJYszJ2UB5GmrMl6LOeHXotpG6Xp/ZfJ2bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036629; c=relaxed/simple;
	bh=r2R0FQ6XjDzstbgL1FCYgajMJYBiiMNw+YmEz1Zk83M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLJmffayqS06T+bWRJY2Oy24F6Cc3Eb4WWgzzZHWjRuO+qLXE/yChy32doMrGC6Iayln1rLF+EJjX0blUsWEn14KJwTrY//MVSAYrHoxRO74oYyLckzaQj8eg9IFIkdpqXPCOHML0v8u23L42J4JT+K2TldF+DIkLLaptao/pyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4iqmfLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4iqmfLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DBC1F000FF;
	Thu, 10 Sep 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036628;
	bh=Dj7ImCNOGYFsdY/Zf5dsBKuP9RTLXw8w8T95YWvfhUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4iqmfLVzbN2wGZgD+sOnb7QA+EU333VqRWrkxIcMi/A6M4FLQRbUCX8cpLq8isfN
	 SbhG72mbVfewcUYN+nf7dD2KW9Ax4T+0DUAswNCsG8DV3v33JdHCnq13DVQ1bbaQ48
	 JZLMnEiULSA+xo1dspSu1YIOkzBXQeSAQcqxs2zGBMb3UX3Y6AdkOaWfGl9H7tfGfv
	 w52q4NWOlU03Vd0X5Ne+dh3G8eZ0wiF7BAeno3rmbKvzKkAcYb63IkqscPm/vu33x8
	 Vm4dmxiOcRwA9X6a4fLe3Y/F3zGU3wefi6CKnqs/MTg0n7R6nC8jS46InhVgdnoJOn
	 hwIFE3CRWrWzQ==
Date: Thu, 10 Sep 2026 11:37:01 +0100
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
Subject: Re: [PATCH net-next v3 09/10] net: atheros: fix typos in comments
Message-ID: <20260910103701.GA40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-10-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-10-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:56:01AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

