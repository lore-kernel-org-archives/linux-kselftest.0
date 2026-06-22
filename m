Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CC33CAE75;
	Mon, 22 Jun 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143951; cv=none; b=J7aLrkjx3q0hiBAVbMxOaLzoL6UphbS2Et8qUixLpZOT+l6NWIAsMkh/Vdr4Rc8B1bKvHHY/N3GYjKSwCHrhDlnPBS1FFalBErbopF26x5UfaLImP81h/1TOIuXTFoDyy+v52uKYDqADO00ot5quwWuQsGKGh6UTtnjLfxBMttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143951; c=relaxed/simple;
	bh=HAUwhMKcvyznOOUxqrAAF14Sjv37HTQUD6EDZZ9Eyn4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6r1ck366spxX6a0ad76UGki6tVkNmNWw1xNg8VeK60zIFzrbmjZoct+Eq+FYSueadbPTTerJH7+ELrFrIOOvF0e5fvrhtfZ7Xa9YQ5xsf1xEdwGOoN/sAxglDV1TZiC7fooPJZDE8uN3hEgis1EU60W6EsLVTDoH2iBc47B3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezWYxNvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezWYxNvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429971F000E9;
	Mon, 22 Jun 2026 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782143949;
	bh=/c4Vt3lQ7zIHj8U81NDWo3t+icAmbCZVhtG649JkEO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ezWYxNvIWNPICRHZb3YDWfsljJr+6Iq38cQH8uqHpjYGMlYBigQrrCTISr4EI/GFw
	 mwqLGWYIc5gkf+OVVMrqH1stTJozliyswMb3KksMBTQ9L/8YeivJOPfeV17flC4z+J
	 OBeCrB7rXQXpWH3FIFrylO2cn+DxRM5CwErs9SMiPtCTz6GOc+K9OEAGN5PZL8ul62
	 BDsrpK6O+AUafR9iIBG+Ymy/rgUsBrInWGSsap4a20YdyGSeDbPTfr9LB5Z1ur0Dfr
	 y2RjPWfOVo4oKeH9JKSHeeEdaKbXknxdmo3+8yrU+pdBvdobVnJMVDMy4wKR/p4+bg
	 x2O7JcHvYe7dQ==
Date: Mon, 22 Jun 2026 08:59:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, jhs@mojatatu.com, jiri@resnulli.us, horms@kernel.org,
 shuah@kernel.org, vladimir.oltean@nxp.com, vinicius.gomes@intel.com,
 fejes@inf.elte.hu
Subject: Re: [PATCH net-next 0/6] tc: introduce FRER action (IEEE 802.1CB)
Message-ID: <20260622085908.4ceeb156@kernel.org>
In-Reply-To: <20260622092118.6846-1-xiaoliang.yang_1@nxp.com>
References: <20260622092118.6846-1-xiaoliang.yang_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Jun 2026 17:21:12 +0800 Xiaoliang Yang wrote:
> This series introduces a new TC action implementing
> Frame Replication and Elimination for Reliability (FRER)
> as defined in IEEE 802.1CB.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.2,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after June 29th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed
