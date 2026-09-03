Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4A4F30D0;
	Thu,  3 Sep 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454331; cv=none; b=qq+7cEgCD1ViIZgcSTVngt8fV1raB6Bd0GD34QuavyIqQVC3+gb138S27bf62fv1JzDrUa98iBA7Wp20KEptz0rn7MQW1gMr9NCZrR3rM/l6Tpdlu+SbZ4OcnxX5SOKFAjC52A4UanugVKR5iH+Zcd318KP+0lAg+POrQvTvo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454331; c=relaxed/simple;
	bh=d/OdNA9yDbHUU/IIud4NyA+t6qNKIq1S2Hk+dNC1dHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGG24aGh17dRdv49YfxhNpr7Pihrhi4Y+EiZhsfNbjcYcGsnppGbpZmF6F3GHjzfUGv+EOpat3ft3YzLI5epqAbfQddD7m5OuIcHya0i2E6JKFDdsgBmVY1Vq5oskgSa18br+0IDIU/74Q4Une7JicAmlTtqxlN5zVW4RSZoNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dwgb1VH/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dwgb1VH/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SXFKe4evya0DZyG4b99oQ8sosTasD5iYeO7P5IvsJpo=; b=dwgb1VH/IuRahWIfElN37ERPO5
	hLkP2oCNJNho7smcn0Y8DC50oJWcMnsNGl7A6gTOvgFDQZgPhkqEPUp7m2baUI1iWeY4Q1B4jIm0d
	HIIINqaMLvyrATGn3uonBxRxEreoJyazg/yEdD/RvS7+l+4mBBN0p0syhKOtN0aCzqz8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2AfP-002lHe-U4; Thu, 03 Sep 2026 18:51:59 +0200
Date: Thu, 3 Sep 2026 18:51:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow
 cross-compiling the hardware tests
Message-ID: <2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>

On Thu, Sep 03, 2026 at 05:55:21PM +0200, Maxime Chevallier (Netdev Foundation) wrote:
> Hi everyone, here's V2 for cross-compilation improvements for the
> drivers/net/hw selftests.
> 
> Patch 1 fixes YNL cross compilation, while patch 2 deals with the
> iou_zcrx check.
> 
> Jakub asked :
> 
>   I assume you don't actually have luring for your cross- env? Could we
>   keep it simple and just declare luring as unavailable when cross
>   compiling? Because the probing compilation rule is probably missing 
>   more flags to make cross compilation work.
> 
>   Ignore if selftests using luring do actually work for you after this
>   patch..
> 
> Turns out I did have liburing in the CC env (generated from Buildroot,
> which supports liburing), and the cross-compiled liburing check worked
> as expected :)

Nice. Did you give the liburing tests a quick smoke test?

I get the feeling not many Embedded people run the self tests, if
basic things like cross compilation does not work, and native 32bit
builds spits out 1000s of warnings.

       Andrew
