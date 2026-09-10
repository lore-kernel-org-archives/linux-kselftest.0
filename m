Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D079378D94;
	Thu, 10 Sep 2026 23:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084330; cv=none; b=k5sWmZMFbPUT2+piH1K43D2gsxiqukDPPFTx3XwKsg1pJmKNSnth9dl28A4J/hSeFh9+QwJyD3x3KGNXK/dQUi6/1wi4h7M7+jlHcIGrYMEOP/TKD1XEzjtMVOj/ScgfzphzfAzavUspjlM48tey79vEy941gz59ycojBwN1Pf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084330; c=relaxed/simple;
	bh=NSaG+5A4UOj2mhH12SOti3eFNpqzLR0xFYXq5Yybn7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AptiL4SMwi7PQI0Rz5O7JO/YqMHV99xMMke2CY5qfs4P+cFTJFLMwSEu8IK5WWT50VqdEpU21QPJqw4wnm/GTilq8cqwhOn/PFU9hkasRwcXZCnLVH1ZyWdSy8mfFSqXgPV10FcypswNFCW5pycKW5qvwlropHD+WdJUMqF7qDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXqOE8Nu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXqOE8Nu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4C31F000FF;
	Thu, 10 Sep 2026 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084328;
	bh=dC6/PV84yJCDbibwSryMMEIqIXR32jy1oOQ/uNb5TRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VXqOE8NuDfDqdpnWa2e6EIkbuR690saZMaKMQ2JBcc7Bv3jAMN2xeyjuqNniOhXCn
	 cqloFC2TN4wbgRmsAupgsig0jlsCh0BJUsQXSk/qIXJBBTxcC88yKHuEBgMC2TK8e9
	 co0QoCtDgmQHXQUF56is68/L1MASiaCKe1/icgXfunYff4Iw0+zNwT1BosFsIf7iIq
	 q3B3+JTfGPLskrneZmqBhjAQEr5pNR5XDFJLiy9qUBd+/Vayd3IKXsoxz43YBoUFGE
	 oHroEB7hwjPr7ER7zVVaOMImnmLit/pWU3H8Mjt8qJVI55nf4RXOBUBAXBpXn31mag
	 rsE2zae1qnv8g==
Date: Thu, 10 Sep 2026 16:52:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: ovidiu.panait.rb@renesas.com, maxime.chevallier@bootlin.com,
 recv.jo@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shuah@kernel.org, joabreu@synopsys.com,
 yi.fang.gan@intel.com, jun.ann.lai@intel.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 7/7] selftests: drv-net: Add VLAN test
Message-ID: <20260910165207.3aec9178@kernel.org>
In-Reply-To: <178908396551.219967.6360903882566438769@kernel.org>
References: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
	<178908396551.219967.6360903882566438769@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 23:46:05 +0000 netdev-bot+sashiko@kernel.org wrote:
> > +@ksft_variants(_vlan_variants())
> > +def test(cfg, outer_proto, inner_proto, hw_strip):
> > +    """Run a single VLAN test"""
> > +
> > +    cfg.require_ipver("4")  
> 
> [Severity: Low]
> 
> Is this requirement needed? The test never uses the environment's IPv4
> endpoint addresses: _vlan_setup() installs its own 198.51.100.1/24 and
> 198.51.100.2/24 on the newly created VLAN devices and the ping goes between
> those.

AI seems to be right, what we'd actually need here is 
"require l2 connectivity" Let's leave it be for now,
just drop the require_ipver("4") and maybe we'll revisit
this when we also have the PHY related tests.

Could you break out the selftests to a separate series
for net-next? This posting seems to have conflicted with
other stmmac patches on the list and it'd be great to
run them a few times on our CI NICs before merging.
