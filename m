Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7233D6E6
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 02:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314477; cv=none; b=rZsOXiP4LC707xhE7HPZ7eOduC7jAIDjASEdyi5rb+dPfJ+xxqzAY8B3FTcl7uE68y3wuXVzcNR9dkhTZ4qBECkrU3/rUKSRUzA7pzK6zZciPN4Bf8OnMBoOU1wlUNka4vLqZeHNAZhZ/9o8VM70Oy5Q7pcsO25kCGarr6cPUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314477; c=relaxed/simple;
	bh=PTWw+mcm+SN4HX4+km+xvQ5wRRsK+Xi3/8A0r/W/WVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrP1irUiiTpiH91D+F3WvSZSfWQLGTFI5XckLDmgiyJfyLc9qsq4LDvxAJ6sZMYpX602BsVkEu1PDqGTVwGrIq8y+kfsncoiM5B+nWbU0rhzG1i1nTcNiMpz0zONum1CStzjlJgtNQpPJ5S+DthIS/wv9K8O9EDh3GaTCyMaApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HoqGIyOh; arc=none smtp.client-ip=91.218.175.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HoqGIyOh"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PTWw+mcm+SN4HX4+km+xvQ5wRRsK+Xi3/8A0r/W/WVA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788314468; v=1; x=1788919268;
 b=HoqGIyOhg8h9JzSW+XCRMM4ljQme9s7TAYXOv/Hh2UoDM5MyW2kNC6d5WD68HxkRBnSAD9pR
 +Y3k3QqjWw5IRMRJgq3Yd8f7HtxmLZE/1sYL9+J9dxCVgmHvlacklwpEUoDl/pPjISi63HXShgY
 qYf8+4mcUVSSZ2ADsuVWLUeg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aba12668bbeab029;
	Wed, 02 Sep 2026 02:01:08 +0000
X-Mizu-Trace-ID: aba12668bbeab029
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 10:01:00 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <apeDXBASpPvAaWcG@fedora>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
 <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
 <20260831150818.660de896@kernel.org>
 <apZ3f3vm5sUrcyrZ@fedora>
 <apaLl13Saka4Sw1J@fedora>
 <4892d03c-6493-4c1c-aaab-39d71ddf527b@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4892d03c-6493-4c1c-aaab-39d71ddf527b@lunn.ch>

On Tue, Sep 01, 2026 at 04:21:04PM +0200, Andrew Lunn wrote:
> > OK, here is the reason. In taprio_set_picos_per_byte(), it init NIC speed to
> > SPEED_10. If the NIC doesn't support get_link_ksettings, the final calculated
> > picos_per_byte would be a extremely large number 800000. The later tc taprio
> > testing `tc qdisc ... sched-entry S 02 300` will always failed in
> > fill_sched_entry(), as min_duration is also a large number 48000.
> > 
> > After we supports get_link_ksettings for netdevsim, the speed is 5000 and
> > picos_per_byte will be init to 1600. The later min_duration checking in
> > fill_sched_entry() is 300 vs 96. So the tc qdisc command always return 0.
> > 
> > To fix the test, I think we should reduce the interval number. e.g.
> 
> Why not just set the initial speed to SPEED_10, so nothing changes?
> 

`nsim_leaf_tx_share_set` and `nsim_leaf_tx_max_set` compare against
`NSIM_LINK_SPEED_MAX` for TX‑rate setting. Using `SPEED_10` as the value
appears too small. I am concerned this could break other existing tests.

Hangbin
