Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87D37C11E;
	Mon, 31 Aug 2026 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219811; cv=none; b=O5QxWS/tBNtCFX/ZY3nl31u7C0o19gDfYmr/3xk6SbBx58taEX+hLJXuaAxOlSjg0kNVLYdQPAVeCBVIzikSYZLPsX40i/mNjKor8vliuHms6QwVoGkyYkx4yOTTg/jApZD91QQfyG3Qrj+nDFGsEwU8BPqGDSTz0xd94gBnM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219811; c=relaxed/simple;
	bh=Dn9AysUH1VrFe+nloOlag9vnvl6F643sqcyGhZVFbwo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdWxsXtvkN2h89aTZtTbdu4FxUg/fH1CXqkG5w7aUinDLAhumeqRnf1x9uJsPiW7OlMpQYa41eb96ZFjGmADj6I4onev2pYIjzsl/12qy/TdW+Qg2N5gjXO3E5xJqgEv8iRUfACopqJlNWYfOtWJ7VASv2JAhqfQXjyRy8EnemA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC9e6snb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC9e6snb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371071F000E9;
	Mon, 31 Aug 2026 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219810;
	bh=Dn9AysUH1VrFe+nloOlag9vnvl6F643sqcyGhZVFbwo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VC9e6snbLdIvE1BAb7foGj2WKAG/+ktLs8oA6/WNiYfE5wqU3gqj8mBo9ut2FaN5T
	 y98ySuiCp1AH4l6tZ73f4a0Rg+0wB1VsZYLmgxlC1ggDFpaSDdNFKwpNJXFd7ieKLe
	 4ZOd0g4v6hRBfrUEohie3stl+Byp/MevaNbXSlQhF4kjIF2SAXZf905mYHzBU9juEZ
	 EYC0V7Zkqq7yi/EJ2bfyWrATL1/XmbBjhZJl3l7Anqdn7d7jKUMYJhzz/HIiXTm0BC
	 ccqgwHXNl5+CalNAwjNEBx7iRwD+fsCj4RLvDkIvO8N6E2MGvkzGhTgm1i4yJLAqNN
	 Z0ldwsHihYVcQ==
Date: Mon, 31 Aug 2026 16:43:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 0/5] net: stmmac: Fix double VLAN 802.1ad tag
 handling
Message-ID: <20260831164329.138dbf3b@kernel.org>
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 16:45:17 +0000 Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.

Test LGTM, let me apply just the test since it looks like the driver
part will need a respin.
