Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB1392802
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618714; cv=none; b=QKE7+KDgNbAfyzSRn/4A9bXf4L13GpShGHBEjC07a8S2q8K+DS9mKgdDDPRs5BWE4uEEVqpBtYFUfNRw652YWyV1DYWlSMcwKfCf7qW0zBkWDauTsXhMqZxrAV5rrvXY4RAxUDrgSTGeBf1Yk+bS2xjQDHDz+z4EsG9Wx7U57to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618714; c=relaxed/simple;
	bh=dgVJAhqnOIPqC5PZq8vBwCOU9OzRV/WoR8Mk8PnVt3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7916RBaXY4TVhNM9e/nfBa4OdZeoTmWn9MsbGMv1vJINCf+AFBXTH2gDQECtyEZmfHOgsvOswQP0JV9AS5ZaboBZihm9TH7StXUBAUBMu/jzK8WpYY2/pI4QocFxa3andg+YQuqxc3eex4WOa2YOhMPY+RW96rRipG39x4dY4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=XsN3t+Kv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="XsN3t+Kv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483bd7354efso89219235e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772618710; x=1773223510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gDnR/GlX5r3MxOQp0wc5+efc8WjR6tGLkWS8cjDDi4=;
        b=XsN3t+KvRjLmQXyGUq5jGUsYLtOoKckGDvdjFPqdf+t/WgrKa6MuFAOCdwrn/g8WIe
         nDCe6oN/KroI47pNwQbREv9OVhK/qaQtApRuGJrJPNsVOd/l6yRRCX25RS1NyYTdwb3p
         jOG3z+IQbhDsiwrq5LBFyGR9t0hpChPYPjUB7HZE31HaMGx9jYjv/som+VbRtbWiDsY1
         WnXhEoQrS3MNUnX5RjG4CuflIR9eyXQ5OGt7Z5i7gICKuHo1uKY6gLIYSD8Vr5dgq/aP
         oqes1OLZxrrSZCaWBGcGsDHBlKbuu7j+k5pSqOARsJTikBcEQBvsCtEnGKZ9qpCSbuwS
         NNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618710; x=1773223510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gDnR/GlX5r3MxOQp0wc5+efc8WjR6tGLkWS8cjDDi4=;
        b=Gu6MT6OP1c3xiFQMQv378eDHSSMNFCaYTac9ubrUSdITQ9b7Ijv869tvITtMnSLrpc
         Q15EaCeRfcoBwVqvi/r2ZTPW9LvJXV63qWVK41a6SKhfBS/hx4A8xeSyN7lM6G8kPDTy
         GXXJIX1chYzZjb6zeqYvUZgN1dVncKQK8leO5WBx3Rk8G/yCuZGuZ2nMGb1zlO8/qKjz
         OpjqwPU7H3VXdJBAHtQkHyHLnpft9rsG9FZyFkZQXp5yVFGexfFPWGX/HycC6xV/g6w1
         jwuGZDzUQPYZeG56FUr3vJYZBomOhInNH69IjL+3gJJhIkqE9vG/bal5KmNUQm0BXVH1
         +WAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjt1ooh5+Q8k7DL3NIUTBZ9r4VDsOzQSU3EKq43if3hZX2mhU0OJ1uIO7kPiJDovmvBLjzgR7Y3rW1h1HDOns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFIvNHdbW8oQldQk8KqMp65ywn70Ro9JwC4DspZXddNa8LFVp6
	FOcC8uPTwgiAFYe31cB8pSmhideYpHoIttpHNhMxtbxI6GEkMJux8gA/ur2YSAPu344=
X-Gm-Gg: ATEYQzzgFdmFKtan4cieaf2GKa2LUpJmnzOvSIR0sp8GvPZkf2L6Ey3HUtU2h1DqyA1
	OGuSgnZRPEMbmf+PcUHxuBzL1TMfuFCjiFyhzZlAKs+FraPthlVddDLLujLIVJH92Ecb2oNpZWi
	3tOtoMZOxUKU766jT2mrXXfOuSV8MfRG0h+cULUaspL2ehKzlAEt6ZjKUoD1Dd+aiDIbMva8pgJ
	q7V0OLEczdCgFxxQkbXQW1QNhg27rovR/6M1NLKUWKTihfoTBdpHr2abH22zcVgwhKI3pcsjAnN
	0q5exBaZmomWr/YuG9vgIDa1DCTrJPIXwqZe/mJle/ouIT7tcsEH4r6UzKvm7CsgPcfqdwKsizy
	aB3xDtt6/p4iUklUHRFuXTG+Wc6n+679kdDdkQz8hIYrdH9/AYC/fdlssqgSAMyIlziibaLUA0l
	GKQ20wOTdH735mP7vH78a8ZMdfpCZYescIvVQ=
X-Received: by 2002:a05:600c:1c06:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48519851b59mr26465905e9.12.1772618710225;
        Wed, 04 Mar 2026 02:05:10 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187b7851sm70235585e9.3.2026.03.04.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:05:09 -0800 (PST)
Date: Wed, 4 Mar 2026 11:05:06 +0100
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
Message-ID: <pmxkihhtsskkwsvdia4z2ss4wxpfc4a4kqxkjv5wk3mwdmpzii@6go7pizk2nst>
References: <20260226221916.1800227-1-tariqt@nvidia.com>
 <20260302192640.49af074f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302192640.49af074f@kernel.org>

Tue, Mar 03, 2026 at 04:26:40AM +0100, kuba@kernel.org wrote:
>On Fri, 27 Feb 2026 00:19:06 +0200 Tariq Toukan wrote:
>> With this series, users can query per-port resources:
>> 
>> $ devlink port resource show pci/0000:03:00.0/196608
>> pci/0000:03:00.0/196608:
>>   name max_SFs size 20 unit entry
>> 
>> $ devlink port resource show
>> pci/0000:03:00.0/196608:
>>   name max_SFs size 20 unit entry
>> pci/0000:03:00.1/262144:
>>   name max_SFs size 20 unit entry
>
>Code LGTM, I have a question about having a new cmd, tho.
>
>Does it matter to the user how the resource is scoped? 
>Whether the resource is at the instance level or at the port level?
>
>I worry we are mechanically following the design of other commands.
>Since the dump handler is new we could just dump resources with port-id
>there. No existing user space may be using it. Alternatively we could
>add a new attribute to select a bitmask of which scope user wants to
>dump.

You can specify what you want to dump with dump selectors. For example,
if you are interensted only in port of specific devlink. That should be
enough for most of the cases, no?

>
>I have a strong suspicion that the user will want to access all
>resources of a device. `devlink resource show [$dev]` should dump 
>all resources devlink knows about, including port ones.
>
>What's the reason for the new command?

You are right, one cmd would do. Good thing someone forgot to implement
dump for it :)
