Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9D2D77F7;
	Fri, 18 Sep 2026 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769548; cv=none; b=nFHfMnAuip+CHKFSc2is8W5IPjjy9b7e/1mYuJOIIhUqdEljW5fr/ncVF7pU5IbOp8pM7OIxqSgEFDkZ0vgZX1CmK1isiAQOgyWVEfu/PwihX/Dl0ffOAbRZaEPWQctjS6Ym9z1F9tTzKq8kQ3VylUDAvRAWT7ePriANCpM6Y0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769548; c=relaxed/simple;
	bh=k8POCY/egDpvXClA069OBDuMGtcsu6gfkrYPDxBxw0s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDL7mBPVrd/oTwVGko4VRPP69kU2sBVG2qqZh+2KHGARZR2WUl9yWaunlzqaMbSGAOEmwIvXApahhAFgn3LhpqbKHiAyUy8nx1f8I51NyOMwzwjHNQX0rBY5j9sIoUAlMSMJYz9lf8QaUtCUh0PY4TzpiEO3V92iMDYyVB8/3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbWE2MrW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbWE2MrW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2591F000FF;
	Fri, 18 Sep 2026 22:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769546;
	bh=9wZ1rkEvo1K5BrBGTRVR5i+kLokx8g6L3zjCrGct0E0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AbWE2MrWk1QwAV72UjBj+g0QyxYJhDdqOX9sGvQBlM5mMAKVHUptErXxbqnE8Qq80
	 SGK8ndjwjywJehyX7XavP8jPPGJIy2cE6sHK8e38uSuxdvglUA3v09jiCOJQXnzM/H
	 ps3ais8afZ2P9t85jRQHzLfcXNYmYZBCZLtvZdDWcD3myMOojqhzUlVwdJnoiuL2F3
	 wKibJhWa7iIgIs/pQ5JTYXXJ4QOT3vKrq9iQ4WefySnMW43zCWJCHwrFwgT9LyBY42
	 xNkSW8YW/vHF2UciIzgaLqP8bouo7CedX+fcnCEVq9kbtO365+EPiDpbn0cFOY1gN8
	 cOwMzmIEOKPKg==
Date: Fri, 18 Sep 2026 15:12:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] selftests: drv-net: Add VLAN test
Message-ID: <20260918151225.304410cf@kernel.org>
In-Reply-To: <5be2136e4142427285566f01d95c1b7b@tipi-net.de>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
	<20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
	<5be2136e4142427285566f01d95c1b7b@tipi-net.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 14:04:13 +0200 Nicolai Buchwitz wrote:
> > +LOCAL_IP = os.environ.get("VLAN_LOCAL_V4", "198.51.100.1")
> > +REMOTE_IP = os.environ.get("VLAN_REMOTE_V4", "198.51.100.2")  
> 
>    LOCAL_IP = "198.51.100.1"
>    REMOTE_IP = "198.51.100.2"

LOCAL_IP / REMOTE_IP are in the default network segment (vlan 0)
Here we need some "unused" IP subnet that we can assign without
conflicts. Getting it from the config would indeed be good, but
since this is the first use perhaps we should defer until it actually
bothers someone?

Or am I missing something?
