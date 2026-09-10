Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F963F6C3E;
	Thu, 10 Sep 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036266; cv=none; b=hvtaEPCZ5RMg1zpBWIl2kCLOQTQroHK/Q/Q/8Z0+HlLuBD+2z5Izd1TqTZztRH+NkqnmSKfJ3/qo0gfce9kV6WYFCL93U/SUsC4jiF38t3PWkpFZTDZczPGrDMaCtR4x63F1Y8NRkclTYthfPVMlx/Uz/zUkEjJlpjrOmtmPD7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036266; c=relaxed/simple;
	bh=wuBYGHfLvBeHgbg5Ca7CP251ZhffCW2qaaO6tZUHoVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBNCjNJE/40ZcGFACxH9rsR3hu+un5jtk0Bbx7Q/YwNO7iPDqZHhFQyKUHMHcVUuD+b0n+UwHv2sOnTv1FbWwuaNAxWHrNLG4yjxgNe0QfWSz8VbrA/4unHXVHw0WJ1v3DE4DpZX+unWIR1HhjcXumDN5z+Gmw/Zwyk2GGPgMBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpoFtE5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpoFtE5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875C11F000FF;
	Thu, 10 Sep 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036256;
	bh=z5tt/vZICXYotB8Ov4sxRHc76HIObnUdWrqEICEmI+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mpoFtE5bJ1xDM3TQ3yyWIgKLdNeODO0ftV5eZAFo/Tams4jQnJJ0EWELrYwtiqI9U
	 4o0lNTHcri4/WN+GzA6ZKbWJL8UbvAz+KgCNYw9vSFMH/arhR71+6t3+HOekJEd4w5
	 EerrtgsFnyGebjCwOVHrBSjq08KbyYRHkwO2fazhSh2vi2/mGozXFZ/9CIBUDiBIR5
	 g52FeLV63HRSjRb902gKfcVR1K1CSxqkZSqHndTKlvpiJ8LaLru8ZXCbjwIdLHGonD
	 +wVNCSY6aTFyG22pkvcTIrz4ITwQw+UgvdO3OlTaIiB3ZYLCSCdMqoXT6nBUT69vyT
	 xqUI2FH0RzvLg==
Date: Thu, 10 Sep 2026 11:30:49 +0100
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
Subject: Re: [PATCH net-next v3 04/10] net: cavium: fix typos in comments
Message-ID: <20260910103049.GW40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-5-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-5-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:55:56AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>

