Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C6390227
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499189; cv=none; b=XYL8vZUpvIkcs0lHzXD+fZGR8Rpq7XN70Y8kk7TcdwpE9KgIF5kXFcRO+bU3j5wbxIIwXT5CUCyJEbPNWaRG0a6d/nefeHgVvw4DD5ezAoVANt8gogxnd4cZkKouWPzImFv1oCRjAfCkDyKj9ZqyjE8FspS02b6I4guN0UW6yBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499189; c=relaxed/simple;
	bh=mh0P+CfIYcSWxvr+OZtwfPYCJZ8um2WFI0KNtWOXvuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jekxMAO4UpwwPsoThhT1zQxP5jHmRRUBRXkLKT+f6lvlHH3QUotBcGkWb7toNmpHF+ZU7h+AfzuQ6rKv3Ud9KCWYPomeRnVBZ0x990AbIDtreRY7hlc8i4QAR9DAwRSz+49OkdHpTbharuZoy1rCSUY5SF+aXj/aPbWP8G1/dZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=CMEK/drn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="CMEK/drn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b256a4c6b5so24938025ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775499188; x=1776103988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8ZAtLts4Kkdxrcnk7BLwL8oQAvPTMmoXke4bourEg4=;
        b=CMEK/drnYR1d11IAIF/yHrUt6cUbMGRmdufgSWaApHOxOskdIftUFMzmVaOJVYbhhh
         7j8YzL/+pcqTauvsR7bxJQpluMxoiIJZIzcTQZpkdLew6AuHZ4QjQXnph2BtQF1z89sO
         cTjYa/RomdQFnZzV85jeNmkxnPeYRUGl6NlMHBVF75HqBWdkrRR4D5vCKYNNCBWacm0u
         2MyntP0ft7GIuuvBrNA3KnP8HnTKGUR74UtTb5JBXx+i/aW8ll18H552onb8UNzE7GAH
         5v7o03H/Sdba2v+kzhWL4GyjLoPnn0V2hJx9iQL3aQSC4fxXKpI+466z7M+lJCX6tQQj
         gj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499188; x=1776103988;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8ZAtLts4Kkdxrcnk7BLwL8oQAvPTMmoXke4bourEg4=;
        b=X9PDZOyb59JC9G4a6sjW2PbmnHzg6fChL3RUatBjQ5AwJcqxvKyJDjOWQsJ3WpNr0T
         W0JIeY/pXqdoUWed0UJXPFKHXDnjGFYmCpUTXXIKqilPUABizqLwWZ3CagA4epWjUVWT
         K9eVUuWUluLzCCKh0Xf27Qi+QuNJx5yHYdNrtW0H5+FeRRYbcX5moUbJ23fHKqWdDsH3
         GQ3E/gGR+jMU4OdIbianqFlDmnjCIbcAcqmtJw58VzQ7yNz446ZfBxSUDzy1ep9LlFQg
         E6oSZ/opzCurcgvSALEyGFHrn9+SDuMucqM7C4vZS/kgLdGN5mgkdHQq/hcnIAffLWvW
         E2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVsP/9l/yICCIO63Kfm5uTALKUmhx49WJ4516nmb9Xtzq9gmbqI8A0yl93SmqzSYHqwZMZy8Ct3RoCodWH10OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGkAHoHvZXemOB2zQUqnsV5YQtY5rIdtsChWuJfr7BTePA5+wv
	GxyjLgIpYt/az0w0kLmBY84RgUHGlhsdTmrumBuZzbA3rCufhhUryVZ6aLjXN+VLpWg=
X-Gm-Gg: AeBDiesD2zHwx/jWt47mtu0OqCBTNqouGNYOCdUEfRYyxHMR1CIe3rtraOE4KNCMWXW
	oImBwaeKEtShEWtk26tiIxAUu93EXjmxGqJhtKIxqFOq7qH7C2y2C+Lx8rYg9x8Y3UQioW4oR+6
	yR+LrrzYP+1naCBqymOCRgBjvbQLJYMT6DJT5R7fhcbGtwZTfbLIG1g0WGp1C5ZSu2Qjg9kgPKi
	N0wUBRqd4JbogNBQFbPBaUw38xXfQON5FZvXYI66gaOh0cL27SNo7bflYenlcHVd6ppzXMf14nq
	o+UhjHqLSSQkCtlr+n2DU6rE9xfspV8gTG+3Nu/lvjrmRPes93cPaV3grrdpTMJz3XE/0te/Izn
	CV1V92RgXHV5/ynlMVZIa2ZEbNhBeS0JoVLX19X8GpbAc+3yGL1yhZwqoSb58/1Qcx1InqMpbGu
	O7PjFgHp/MUGmuSfQ=
X-Received: by 2002:a17:902:ef08:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b28163b7d3mr154337925ad.6.1775499188033;
        Mon, 06 Apr 2026 11:13:08 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27479d0fbsm191060195ad.35.2026.04.06.11.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:13:07 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:13:06 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	leitao@debian.org, shuah@kernel.org, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: adjust to socat changes
Message-ID: <adP3sstIvDb1CKKN@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, leitao@debian.org,
	shuah@kernel.org, hawk@kernel.org, john.fastabend@gmail.com,
	sdf@fomichev.me, linux-kselftest@vger.kernel.org
References: <20260404230103.2719103-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404230103.2719103-1-kuba@kernel.org>

On Sat, Apr 04, 2026 at 04:01:03PM -0700, Jakub Kicinski wrote:
> socat v1.8.1.0 now defaults to shut-null, it sends an extra
> 0-length UDP packet when sender disconnects. This breaks
> our tests which expect the exact packet sequence.
> 
> Add shut-none which was the old default where necessary.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: leitao@debian.org
> CC: shuah@kernel.org
> CC: hawk@kernel.org
> CC: john.fastabend@gmail.com
> CC: sdf@fomichev.me
> CC: linux-kselftest@vger.kernel.org
> ---
>  tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh | 6 +++---
>  tools/testing/selftests/drivers/net/xdp.py                | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
