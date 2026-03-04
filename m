Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DE3A4512
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620463; cv=none; b=OftNz/13p9Lc7gbi1GA8HWlpNaSytJz1ly3+Q7sngHsXCWCpRVLbrodOrdLM8bhLJpzNj9R6DhbUMqW3biTgEQv+YhwM6OAb+9SqUvY1JK434bdbveIsKmuZ6LJA1W5Ol2CO6pd1lMkvh8O4ujEMvQ2hFPT71xOAbSPiZn3oJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620463; c=relaxed/simple;
	bh=rsnQDpKzEj4Z2yTxDa6CF8A7GwiuAZWpSeFHHfKXoIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iD01rTqz3HlR4hPZgAEN7+Q0OMz/B1No4vFTTdziH8ie8fe4GANY83/oJH6m/vbPm0IpPsEw9UPgvii45UtkxfEj9aKHOykTe8IaOlwm+EvM5zNeOisEVwIS0FS90wxommtfMM9pHo3/DIsfLcDJgiOO6BaAkZuHf7c6dDjKt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=v2rTtyqr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="v2rTtyqr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso68405185e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 02:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772620459; x=1773225259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32nyzB5LhHXwJ+wC7E/bptZjPbk/YG6iOgM6+tf22gE=;
        b=v2rTtyqrqtUBZRZMayOIVCD6cb/dRadEr1ZBV+xfFXusUUFhTF3mrzfOOrD7c/opYZ
         YQgH0hqbWZKce4PpDbXZ8a8RwGDvrG2M64JofNhHGVUMfdTPYUYdK8tu2d2PoU2Ytkv6
         LxVxw/wOPG6Q68agLIzHmXKpat2iiGwS7W3V2vTdOhR5rF2g78dN4Bf0MSsOpZ4KidJ8
         EVzwdyijcHyYft4V3uwpiy3hlz85lFcUsc56iWsFje+KBd3d3vC56CT2Dn12nL00neu+
         /9KDjPoQY3dgsbyjB7uYkAnKpdBg1V7V46rOb7ItSsVB633YyHNx0zo4R6evplg3NNTC
         RQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620459; x=1773225259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32nyzB5LhHXwJ+wC7E/bptZjPbk/YG6iOgM6+tf22gE=;
        b=Aho9RCxHkQQK2eDaTpSeekpK3GsRS5m2jpM/8gke+LFqrfACsyF7Wiv/OjAZO847b8
         ImaA9NMFHIIij123Q/fFAG9jAact7r0borPEzblf/c/zrYSG8sLrD3eUgnNHWmAnXqBQ
         rGnCrVEoTumJ/SOT4oPvMoowZuJfs5XZoermt6pIiw3v9KfBo+aUpvPhtKE0aW8iEUq5
         Udh86Ismgh8Gits/jERquBVZB98OoIq5x4ER/LJdRTRIKHr0kyX95swpXV64EEHpTXqe
         9Gd9cnO6ANx1xSSu8gLE17ekrPFD2hQgs+Kdty2ayVN8F7tNOEpzTFqABK7yMKwdV5g7
         glFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1BsJZTJwOlqZ2Ot7PfQTO4r5Xn4Dw3e43DhUwbEvFClRX4x3kmhyO0Ep/boUeEpaHcpHsZdDwpTlOawE88zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnFso2Y5gYfNtOdSF3dgo5/OUOiWI0R88dxK5Uc/cxJ1BVQFY
	ncO0hVM8H1EyqAOOz0VED3dPAuGzl/JE3Z8ACqynokgszt6hb611OnTMhYHb3R9xUWU=
X-Gm-Gg: ATEYQzz+hXU9o+Gr0kOkZ8f6TJ7fciiBb2OfbLY7L0ZeaAPVX3ana6nAnc7IKAMq+ur
	EIponnLQRvYu6KYGWp8Ec94FUsbt7UeXb9WtXdEMGaDjBrOYjXfRfO5+it2JorYRQgkipQWVasz
	baysvm7IwsUYRaInWZ3tQ4BFkQ5v157RUX+MbNDTJAkNrgW1nU1BZ9DT/RLbclFtfI8/cYcq7Gy
	+/mq2ZhcUi9H+jMhD09cqAelh6U3ZsOp86ZYfJQm4kP7x01vvAGVI8xdpZdmbmasPY4bdVOGRhw
	1sQJffbkdYwR8Sp1FeX0vRnh1cjCNbUbbIretHLe8Jh0IOvmAQfDrDakiprLDtbqEwQ7cMfrh7L
	It28OFm2smNeoLw3X3VghIE41HcqnJLVI3ZWujdg60AtFmoQyavfi3yXFpDjrk0wxtX+jQ155o6
	nw6vBRP0BFcQRvx9CyNImblGgTfbfCpBwYgw==
X-Received: by 2002:a05:600c:1e2a:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-48519848388mr21825225e9.6.1772620459148;
        Wed, 04 Mar 2026 02:34:19 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm41054094f8f.21.2026.03.04.02.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:34:18 -0800 (PST)
Date: Wed, 4 Mar 2026 11:34:13 +0100
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
Message-ID: <jssifysprwuafkinc3dguspngxmplrngqxvotp76vhvu4e5lp6@e7mdrjqc5rme>
References: <20260226221916.1800227-1-tariqt@nvidia.com>
 <20260302192640.49af074f@kernel.org>
 <pmxkihhtsskkwsvdia4z2ss4wxpfc4a4kqxkjv5wk3mwdmpzii@6go7pizk2nst>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pmxkihhtsskkwsvdia4z2ss4wxpfc4a4kqxkjv5wk3mwdmpzii@6go7pizk2nst>

Wed, Mar 04, 2026 at 11:05:06AM +0100, jiri@resnulli.us wrote:
>Tue, Mar 03, 2026 at 04:26:40AM +0100, kuba@kernel.org wrote:
>>On Fri, 27 Feb 2026 00:19:06 +0200 Tariq Toukan wrote:
>>> With this series, users can query per-port resources:
>>> 
>>> $ devlink port resource show pci/0000:03:00.0/196608
>>> pci/0000:03:00.0/196608:
>>>   name max_SFs size 20 unit entry
>>> 
>>> $ devlink port resource show
>>> pci/0000:03:00.0/196608:
>>>   name max_SFs size 20 unit entry
>>> pci/0000:03:00.1/262144:
>>>   name max_SFs size 20 unit entry
>>
>>Code LGTM, I have a question about having a new cmd, tho.
>>
>>Does it matter to the user how the resource is scoped? 
>>Whether the resource is at the instance level or at the port level?
>>
>>I worry we are mechanically following the design of other commands.
>>Since the dump handler is new we could just dump resources with port-id
>>there. No existing user space may be using it. Alternatively we could
>>add a new attribute to select a bitmask of which scope user wants to
>>dump.
>
>You can specify what you want to dump with dump selectors. For example,
>if you are interensted only in port of specific devlink. That should be
>enough for most of the cases, no?
>
>>
>>I have a strong suspicion that the user will want to access all
>>resources of a device. `devlink resource show [$dev]` should dump 
>>all resources devlink knows about, including port ones.
>>
>>What's the reason for the new command?
>
>You are right, one cmd would do. Good thing someone forgot to implement
>dump for it :)

On a second thought, if we merge multiple objects into one dump, how
does this extend? I mean, the userspace has to check there are no extra
attributes, as they may be used as a handle to another new object
introduced in the future... Idk, it's a bit odd.
