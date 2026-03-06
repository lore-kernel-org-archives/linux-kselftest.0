Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4338E139
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799213; cv=none; b=ekNSuVvymD+tsYafQ22tlyxAEoigHDDk1HJVoZ+YEDk/dUW0pHkUUggmLh4/+MecQCRxzTiF34by916TeQYiq5Kx6emb7pQZNi8pI/qDoPyp0S4PigTxLrnPtxx5hC3vw9CyvJsDNLfI1cBrXgDPOpnt67uNmacfXLCpz4oejmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799213; c=relaxed/simple;
	bh=iL3nHsj2qbN/ptZ32yL5eiwUDcUBsCkMTT+rcB3PMxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3CfRsJ5yGBKMGto61Mz8UugTxkuXFT8w1vYMjhucaM5g8LOpwDtUQPY8/Qs0ex2orEMu5MDSnOuq3Q/3+XJfWBFDQ30fHqH1GG2Zmk+M4TwXLjYzCDtnjEF3KStQxsmNMcc46/UaCvLyLe7GmKtTGhRbYpyuLZEqyqgJYBy7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ebePal5t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ebePal5t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4837634de51so39843915e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772799210; x=1773404010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTpTiYCmYefmS8voVHhTmV6UthynmjNZaFJx1xqdpVE=;
        b=ebePal5t6HxHoJBNoARUWaa23plUvf87O/bmUdgs1xJyNY8MgzRCJ4pZYxQwDqbNqI
         CzdVMwW/wuYjxdrwhOEHph9kMh8D4v0osXRgDx11NoFqv6QSQpzM4fhWtLja24HmA7xX
         0DfZdgtURfiBXxa8luOdr4FZpOxGgaVTLFrD5VS3R9IL8rp/dRpPJSHe5730iobk+v3e
         XdzW/mYri2yNMKXJtn/A3EmBtBIt8vS/hWWYK/eqXmjtfgqJjy7bqiOeI0FQS/obIDs0
         ArZaLYnwwKZWVKTUdwudnZDxTxRmgZKJ6gWudyK+aq7SJq3u/2DyZkjttkw/n5bZLXKX
         03EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799210; x=1773404010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTpTiYCmYefmS8voVHhTmV6UthynmjNZaFJx1xqdpVE=;
        b=Dk5p0TxwZ8UGvz7uFYDnlenKWiQn4oneaKXFfrjxl8ns3jfppFFXiljrLLZ/2KaUlM
         VWvVd1Q77vi9vuKTqb50sxhnsD5pGHUdMzc2jvr1clk76aO7tRjLKEdWNoYbyMw9CFAX
         415i6G8WMEospndyrEUuYSv79nlx06qibAdj2XAAPx7pvVvWzF1XKHUE0nh49NgBtGj0
         NR5Obl5UhoCv6cadPSw+gIWOfhOmZzjnMNGdD/0Mph3ylHv9cq2De9f2q3an4PXG2P5L
         XsRvoPnbylXADLzZ9cBHWSr92d5dCffxG4Oooxp2WAcYRokLiLneMAf4kUkuBZtWrS++
         o2oA==
X-Forwarded-Encrypted: i=1; AJvYcCX4PFhVidwRA+ho6hpoHwhQRBJlrCpIti7m7eR5r28Ei9jumVMdSpJRBB06ChL/QkIaPk847/bR6tviAshakVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAGjugvazTJVRkwtIf9FZLsgtuWB+QLiarXM04uIvczAu9D7sP
	kVwt53Z0WKPvJ1c6lpS88GIMpMCf8/ToIFhvCovxCVypGF7ljhbGlXbolICmWX+eMQc=
X-Gm-Gg: ATEYQzwTjotHvg8seag6Hb/6cCRu2TsTdJfq2YioEC7b2f0KR12E4ra57p3WRTjW4A5
	+C/04hP4Wlb1OhfO6nEY8q4tGGNyZ4FJqbfKQfO3HySonjzuDuyODw+SvvDuAqFLFiyTrLp7vAX
	WEsfr8v85utQ+qZHi3F0SRhVt2hzNJynwDFjvk3IynHd4+gKIFXEy1q/VilplpEzcZAcrzOxRPp
	Wdw6PBPjsXEt/tuFGm/nXzmiSjhlonx7j9uuN6NWUI5ix/B8oQDpvEIINsv6FkvnmcVhwTJUshS
	mJw0Jz5lJeP91+mtVfRXhqNO46E7Pb/mKwRXfY6URok7CrjgTeOwIMj3JpHZudQtooC9TWWkRtT
	UP+ZZE5g4lu9ql6iwAZxNhyP/F7MhaP36zpuV3yo8g4vOWLdDuLpDC+1AU8M0RJ6ti5RL3FU36w
	QFKQPi16xlKvzz4imeRfWO3q+y++3C06n3Jcf73eqdxQ==
X-Received: by 2002:a05:600c:4fc2:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4852692bfa5mr30418785e9.13.1772799209987;
        Fri, 06 Mar 2026 04:13:29 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485256b1eacsm30285005e9.0.2026.03.06.04.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:13:29 -0800 (PST)
Date: Fri, 6 Mar 2026 13:13:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Shay Drory <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next V3 00/10] devlink: add per-port resource support
Message-ID: <ni23r4jiwgc6zjjsubtl4ujjgxzwpxrylumofdwxgozfnieynm@zirlbneaz6p2>
References: <20260226221916.1800227-1-tariqt@nvidia.com>
 <20260302192640.49af074f@kernel.org>
 <pmxkihhtsskkwsvdia4z2ss4wxpfc4a4kqxkjv5wk3mwdmpzii@6go7pizk2nst>
 <jssifysprwuafkinc3dguspngxmplrngqxvotp76vhvu4e5lp6@e7mdrjqc5rme>
 <20260304101522.09da1f58@kernel.org>
 <np44uzfn6jea56uht4yq4te5clapgj7pk6ygyvkl22wxumwnvt@nrpvzjqzxenq>
 <20260305063729.7e40775d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305063729.7e40775d@kernel.org>

Thu, Mar 05, 2026 at 03:37:29PM +0100, kuba@kernel.org wrote:
>On Thu, 5 Mar 2026 08:56:42 +0100 Jiri Pirko wrote:
>> Wed, Mar 04, 2026 at 07:15:22PM +0100, kuba@kernel.org wrote:
>> >On Wed, 4 Mar 2026 11:34:13 +0100 Jiri Pirko wrote:  
>> >> On a second thought, if we merge multiple objects into one dump, how
>> >> does this extend? I mean, the userspace has to check there are no extra
>> >> attributes, as they may be used as a handle to another new object
>> >> introduced in the future... Idk, it's a bit odd.  
>> >
>> >That's true, the user space must be able to interpret the object
>> >identifier. So if we extend the command to add more identifiers
>> >we will have to add the bitmask to the dump request, and have
>> >the user space tell the kernel which objects it can recognize.
>> >I was just saying that we don't have to add such attribute now,
>> >maybe leave a comment in a strategic place for our future selves?  
>> 
>> Or, alternatively, we can have per-object dumps as we have for all
>> objects and command right now and leave things simple and
>> straightforward? I mean, I don't really see a benefit of a single dump
>> for more objects :/
>
>What do you mean by straightforward, exactly?
>
>User will most likely want to see all resources of a device in a single
>dump / command.

Hmm. We actually already have this for region and health reporter dumps.
Only for params we have that separate.
So let's do it for resource too.

Thanks!

>
>The objects themselves are identical, they only differ by the handle,
>and yet we'd have two separate commands to access them.
>
>It's as if we had separate GETLINK commands in rtnetlink for devices on
>the PCIe bus vs connected via USB.
