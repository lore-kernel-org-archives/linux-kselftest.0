Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ACB4BCABB;
	Mon,  7 Sep 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785224; cv=none; b=FNJsApL5fOd6aiGCbEIcd6d9g1VhJWTjiUEXxz3VrPssazCRn/4jfiwq2QtCccr2hsBuBaDke/7wpy3wTo94plAI04RhTFcnIv9a1c8tgQM2Bse1UWezmWic+rLVMDciSlCEBxMy329vMVfecGJET6gCTTtk2vf7UKYwnMagw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785224; c=relaxed/simple;
	bh=VHfKQNYAf4ZzUmWvx7l8ef3sklnkp2cPIn3pUJfjCd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkiS4N0LPdlfx0oQXt3X5y6pt21dB/12X7eaDNDD7NW7BPvrdY917uXIP6aNUwz8u1pMmq9+gGtU0WeHRvCwcZ+5weav0TQfyYCrIuhPap3kS+jDO+f5TpjWegi/9t2soey8UiDbOIEBc40EgQmimv48/8n/ghBGx5LfuMSIPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ypAp6lnu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ypAp6lnu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+2wJAoQcwsW0ENhFRYbq4ijGn6QKSp9hp73OrYtvNZU=; b=ypAp6lnuJkglBRLFOPMy8ywZ8J
	zQCkrgwLme6oOPsMjh3VHz1BHcSMyLygozP0LBfqOcd0Uc1Ffiv1GAxK93UqyKa0x9NbB34e7d7/z
	n8awdJ9ZmiuiVFZXoKtHpmPe661aGHadDbpK4bLJiv6bmm+LF/BbmNIpkop6d/iG0mKw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3YkN-003W9V-Cp; Mon, 07 Sep 2026 14:46:51 +0200
Date: Mon, 7 Sep 2026 14:46:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 4/6] net: sfc: fix repeated word 'the' in comment
Message-ID: <7f60cd1d-f644-489c-9909-d8985e0b27a9@lunn.ch>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-5-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907044635.7141-5-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 10:16:33AM +0530, Hemanth Selam wrote:
> Drop the repeated "the", reported by scripts/checkpatch.pl.  Only touches
> a comment, no code changes.
> 
> The bitfield.h hunks from v1 are gone: "the relevant bits filled in in
> the range" is correct as it stands, since "filled in" ends the clause and
> "in the range" begins the next.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
