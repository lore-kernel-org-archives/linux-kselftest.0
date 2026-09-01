Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C383309EE2
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244946; cv=none; b=Vbc/MJRohjr+ZUx+Rb2sgdBQL+8ExepmnALwyfD3GsSbkNotGKzJA1Li6LQWfPAr+OXeT5UuBW45ZfQjvrnNPkFJ7O4Ki5p/E2Q8A8XPGmkr6c16oMjR2ICRzjd1sR4Ag+ghJq0yMjybtHzC5Ve9LX4OlItWDLwvR0Lze2Eg4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244946; c=relaxed/simple;
	bh=v441UDLRDknYueI9bc52JOdbrDaZw0e7JTJX1VSTE2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erk5EpRRSv8SYvnb9CYIyHASK7gDhUuD/jqZo8AWV1Z/X1mkqsG/IS62VX6xOgquDADiOfXSLS+U2nI068I94ufc56a58tVmc8IhB2m1TFlaajWTCHhTRlAR0hEzjsYSqf58l0c88wuPtTwTR/vbpbesXOc2ylB8ABewk92aiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LCI+HFHE; arc=none smtp.client-ip=91.218.175.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LCI+HFHE"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v441UDLRDknYueI9bc52JOdbrDaZw0e7JTJX1VSTE2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788244943; v=1; x=1788849743;
 b=LCI+HFHE+/khhik4FHUqkVjOpj7LEcSNWgR7lnXRZZ394g2ghyOKzq13nv/G8O5GzlnzT1sE
 0CwCTOxvJ68WgVwbDozJJnf1McZqEU4XahnuDNS81PoMyMHQaNXlIy4OhVxbHyiNMfVQW1ibIE4
 lSIzygvZA/Ifi1s6XSVOpkMc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26a8b4de9676588e;
	Tue, 01 Sep 2026 06:42:13 +0000
X-Mizu-Trace-ID: 26a8b4de9676588e
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 14:42:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 2/2] selftests: netdevsim: add speed testing
Message-ID: <apZzvvEQPNHTT26c@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
 <20260831150642.68f28691@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831150642.68f28691@kernel.org>

On Mon, Aug 31, 2026 at 03:06:42PM -0700, Jakub Kicinski wrote:
> On Mon, 31 Aug 2026 11:28:11 +0800 Hangbin Liu wrote:
> > Add a script for netdevsim speed test. Make sure the speed and duplex
> > could be changed. And the speed can't be larger than the max speed.
> 
> nak, this is not a meaningful test

OK, I thought we should add selftests for new features. And there are
netdevsim ethtool tests like ethtool-pause.sh. Since you think this test
is meaningless. I will drop it in next version.

Hangbin
