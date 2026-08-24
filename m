Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748844102E;
	Mon, 24 Aug 2026 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593391; cv=none; b=Mh7QVZD/Gv6SQc0Hl4CLp9OdUwuHtMawjOCJxepZvygvhIl4TAdUFFPltjZ1N11+YIOf5p9lpPrSfNCwn9CCF2wtmSQllzmUNybvLnKISFDBlJn+NL+Ijw9bhUk5oFtaB18Lw1L7/0MfoZS93Y/wCPD7SnG8YWLMIN/vc2YDpVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593391; c=relaxed/simple;
	bh=ePHR80m6R78iWS3iwuomrR4ig+skKBHr+oUa7HQhsMU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tlXmOoN1Q9Yqw8bdKqyHZ0qeXKbLcedFO4Alt0xaAFyutP6UnnoRm+T7OpKgjX1e4J9wlCFQ+9yLUMvAm18dgpUJCv36mdQSbBieZz2hOk1NbcEMrlnFWx/ZTwUXmH6P9mt+y0p6a63yHcOicyOBCMJJ5Xx17kT/a+4zirFOZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4eJX8yI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4eJX8yI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657CA1F00A3A;
	Mon, 24 Aug 2026 17:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787593381;
	bh=Udh8uRDFFJUfzxnnMCbUXMeEOOBUXXwIj9CxP3a/cSA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n4eJX8yIFWAL774dvneolSQrQozT6DR+74sYyr06cxlX2Pqk6Yp6NrM8bvNSjTa7X
	 SHqPQtLYzMERMUnqr5N7Uzvxx68dd49bX8VFWN0zWcCXyBg9ho0eOxJ7UbIGpvu3RC
	 UPqiPYuov6FJMOlswd630H19m9vPGDGnseijqVIyxzkureVmGA7LTSu6LBfahX06oA
	 T5bql7TSbto2wZBTI978PP2jh3dfolH3MbgZs5IoLTmU37ulbqaV7esS/AUM5B1VQD
	 R89moxNtLys/PHRs4iLIZkkRujgLGpeKSWTF0ZXDwOso65il7aUd4XlkzVLVk3L8Ie
	 sEjdpIQyuj7kw==
Date: Mon, 24 Aug 2026 10:42:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "maxime.chevallier@bootlin.com"
 <maxime.chevallier@bootlin.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "shuah@kernel.org" <shuah@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "yi.fang.gan@intel.com"
 <yi.fang.gan@intel.com>, "jun.ann.lai@intel.com" <jun.ann.lai@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Message-ID: <20260824104259.374ae2c9@kernel.org>
In-Reply-To: <OSCPR01MB12769466CF2256ACC6FCCCDD4D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
	<20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
	<d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
	<OSCPR01MB12769466CF2256ACC6FCCCDD4D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 11:50:12 +0000 Ovidiu Panait wrote:
> > +            no_change = False
> > +            if current[name]["fixed"]:
> > +                raise KsftXfailEx(f"Device does not support {name}")
> > 
> > I'm not too familiar with the self test framework, so i could have
> > this wrong.
> > 
> > It looks to me like you fail the text if it is fixed. But does not
> > fixed just mean the hardware does not support it? So i think it should
> > actually skip the test?
> 
> I compared the XFAIL vs SKIP usage when a certain hw feature is not
> supported and it seems that most tests use SKIP (tso.py, gro_hw.py,
> hds.py, ntuple.py, etc). I will switch to SKIP in v3, which should also
> allow for some reduction in code duplication across tests.

Please double check that the test passes on netdevsim (without NETIF)
We can't have skips in SW mode, all drivers/net tests are expected to 
run against netdevsim, really. If they don't they should live under hw/
(where the SKIP vs XFAIL distinction does not matter).

BTW there are ruff check and new pylint --disable=R warnings in the
python code, pls fix
