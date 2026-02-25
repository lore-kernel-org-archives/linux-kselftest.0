Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218A3815E1;
	Wed, 25 Feb 2026 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062750; cv=none; b=lPO5bQ432L9sQwKIVXzvcePd0hFJVuxZWhC/YTS0EKE0ls/dWlUS6WvfXN0XZSeS0weuBuIW7A1APIt2bUTHMZm6nqD04hTuEcHOTI9OU6ljQPPP7uFK7/NS4hG0SZ2MsYZOM/XTgtWk07hOXNZjVlZ+vP2RRf4Xs705RL7oQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062750; c=relaxed/simple;
	bh=R2r2rAG2NFsLOQJ00G4Tv6WEYrfpMyG2rViYxfo7/Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWiESVr6n2h6/Vj5pAnJC//V8hFXIQEiJVVKGtdbePQV6+/AZMzOLdMJMkaTVVB/jo3gtxuEXsGu6wDw74W20DZIWTptw/ElCuXDv4wlw1moY9wX9+HmD2CiU3QAVjHwka0FdSR12dETgG7N8+jzU2NoapAE6vPZES4PDhtwRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2KZteOEt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2KZteOEt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rJAAmRDOhCMT4+8JsYbmFPiF8cRY9Qy18Awoig63KKE=; b=2KZteOEth5MSL55ERAyOpHSiIP
	5dsWRrhwiC1hn9e3Cf+/LkzJ7Y31PJunIOZvcdUQfS8kY9ZH/Mz3ejpdqNAzmQQiVJG6EiXupFwW7
	Rm394bYfpOGGSf4cD9A5nDW6/oZ4Og2hJiC13q/1bCb4qMYS3kexZMFmklTyz3jI7TX0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vvOT4-008oIJ-Dj; Thu, 26 Feb 2026 00:38:58 +0100
Date: Thu, 26 Feb 2026 00:38:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] selftests: drivers: hw: add tests for the
 ethtool standard counters
Message-ID: <77f3e4e8-430e-4ae1-aa1f-8f70b4d8d3da@lunn.ch>
References: <20260225150648.1542206-1-ioana.ciornei@nxp.com>
 <20260225150648.1542206-6-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225150648.1542206-6-ioana.ciornei@nxp.com>

On Wed, Feb 25, 2026 at 05:06:48PM +0200, Ioana Ciornei wrote:
> Add a new selftest - ethtool_std_stats.sh - which validates the
> eth-ctrl, eth-mac and pause standard statistics exported by an
> interface. Not all counters can be validated in software, especially
> those that are keeping track of errors. Counters such as
> SingleCollisionFrames, FrameCheckSequenceErrors etc are not tested nor
> included in this new selftest.

Hi Ioana

Thanks for the test!

Do we actually expect errors when running such a test? How many times
have you run this test and seen any of the error counters be anything
other than 0?

Which do you think is more likely:

1) A real error happens

2) Bug in the driver so that it reports a value in the wrong place?

Maybe we should check the error counters are zero? 

      Andrew
