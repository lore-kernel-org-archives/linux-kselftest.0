Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE52EA173
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 19:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777577816; cv=none; b=CWHKmvemviRp9EzLzJRokBZQ8tNYG/tdjh/U+d53VBjnNLPqCM8Lq+OEKszpMmLnMxoxZ95DgatPKHeTNsojpykZNse/EwQKQ9XX1TaZ6YtEupv751dGS2A5wt6R8yjd+oPJCVN2xXd674R6EUOx4hgI9RMQWfbR8BOikF+ckbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777577816; c=relaxed/simple;
	bh=kUaXEcOy3Fb5on2h8tdsrwmdqxEnolVL9+3Df3P/8YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5NSOViEneSJN74b6SjGG1QECs4sw2BLMRde5rqPeYVMpVrPWJhy/bXE3kJB3OSbRb2Bf5sorGrJ6YuTJI3NvNOF7bDjrYSL++r2wiR+LYMD4js4OHVepQx9eB4r/jg4Z4MMoLdoAhPkkddIfvfEAiFDswGtG/TcvY2PtOHQKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=aEfLqINT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="aEfLqINT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so1388287a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1777577813; x=1778182613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsb2o8PCwX8XIiel3xz6873qrJeZ59wF+fwyebIss0E=;
        b=aEfLqINTrzKDvsoK+UXuuZ4dTYv3bW7yqwtJKonmGlZ1Ak0m2JBGZtFEUpfODB2j9C
         0obN8mKY82rUnXTN11w0FYJt6kyO5vQ7Co7dVXkudEQ8BpgqWxKOcZpGjt8QxPEV3SI6
         UPLXVsHvld62tITXxmTSEdYRqxeIa++WfpMnn7hjHOgrqtxwZvk9kpnUfx0pM7inl0Yg
         pMG3NGmy0SGbBY3b/EcfOMzYUIDiTVb6gRtt/1R8ywo4bTOiea5HEevbMcR1tvLgYMWK
         NSaQQX96UIgUcuhZ0zisXFtb4d8z4v7iIo8TufIIqHqgfE0daVACPkfoNCE6HWcd16mn
         Ot3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777577813; x=1778182613;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsb2o8PCwX8XIiel3xz6873qrJeZ59wF+fwyebIss0E=;
        b=ddAFS1zKaBhpA7yBF2g8991LqJSo0UjnxqbY8BQq8ifhXzRfQq2W9jXhJmM3Z6WOyL
         GN6Obyu2/XCY5iTKeCcwhQYjdi0pFPiYBtzHUDI0bBzgQMvZC6Cc/+vJV12kV1Bdn2G9
         qzf8Fq/k4fBbNestPCL4iG5pOJQ1QcJHt1hO9YiaiybY3a8Hm5enBqGNgOyqm+wT/Ufc
         6EvvUUw+iDNjg2UdpTbitCoPFJcku6uioAHciHm6QAwXhqFnaEhhaWLhKpzniZdnsqSV
         w8RhCVSfzbeSGZrkabwSLnBahMrNh080EwWktSl/Ibnn28IB3o3t7WkL30jMnGhS+OxZ
         vLdw==
X-Forwarded-Encrypted: i=1; AFNElJ/mfGGy4ZpWAX2m5q0DSGOd43RotnFi+ofGzHg+eOu6H4vUsQi71jqgjnmkkuNWcia017oEjBHxiJBuSeZcM5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeAyVZFGwlVuBZ+SIiuRzDa5VK2dfXirT7jF0ECjwppatxPPH1
	UH24glu6IcwBLgNOzsPn5p30JWNDmkMlpa1bneJc+SJ/25DYpN1rEliu98v7ZRqV0J8=
X-Gm-Gg: AeBDievgxQQtzmnk9j7IRVmLwqRl6dQ/b+dS9uv0EjnQR/ZNesCpgi4nrH6CglXD4d8
	VZwo1qGRcj83eNchuLl15K79+r2tYZNPWngocfzyjtRLSZEelmQCvCTFVDr8BqnQ8QH/Gz8qmeT
	p/+cT0M2wE1WgBNVWlinXK6ycYThGUUJtyFVwq4zoKDT2Buzj3b7uItI3AmwKcL1fHXzjGKVN3G
	FnNJKkkNUKatKjjGNd7JmiapaTcGKAI4e8/Fl3oXUU3WDiCIGKvnqg9DoMYqbSO9FPY/RS5//yY
	QZf6iVIyXxdqyYVGT79GDyWtyYiAPL83OzdVLQzbUaupUyu0ywqzjX4QGn8BVzcZcyp48O1eakU
	BznmqYlODLZWXNa0+C3VSUAU4KHdZNHd86uA3gyXVqPCN/zI3xGWdTsliBkj41ZiytX0++bW3qV
	/8rEIr4FP7JtuAfWA=
X-Received: by 2002:a17:90b:2e42:b0:364:78a5:8d40 with SMTP id 98e67ed59e1d1-364c30bb1bdmr4231151a91.20.1777577813179;
        Thu, 30 Apr 2026 12:36:53 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm221459a91.2.2026.04.30.12.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:36:52 -0700 (PDT)
Date: Thu, 30 Apr 2026 12:36:51 -0700
From: Joe Damato <joe@dama.to>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>, David Wei <dw@davidwei.uk>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Vishwanath Seshagiri <vishs@fb.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Gal Pressman <gal@nvidia.com>, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: Enable ntuple-filters if
 supported
Message-ID: <afOvUznmpTEPBJrS@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>, David Wei <dw@davidwei.uk>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Vishwanath Seshagiri <vishs@fb.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Gal Pressman <gal@nvidia.com>, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
References: <20260430165217.3700469-1-dimitri.daskalakis1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430165217.3700469-1-dimitri.daskalakis1@gmail.com>

On Thu, Apr 30, 2026 at 09:52:17AM -0700, Dimitri Daskalakis wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> Certain devices which support ntuple-filters do not enable the feature
> by default. The existing tests will skip (if they check for the feature),
> or fail if they blindly attempt to install rules. Therefore, attempt to turn
> on ntuple-filters if the device supports them.
> 
> Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/gro.py         | 10 ++++++++++
>  tools/testing/selftests/drivers/net/hw/gro_hw.py   | 10 ++++++++++
>  tools/testing/selftests/drivers/net/hw/iou-zcrx.py | 12 ++++++++++++
>  tools/testing/selftests/drivers/net/hw/ntuple.py   |  5 ++++-
>  tools/testing/selftests/drivers/net/hw/rss_ctx.py  |  7 ++++---
>  5 files changed, 40 insertions(+), 4 deletions(-)

I suppose a future cleanup might be able to add a generic helper for this for
all of the ethtool settings (tx-udp-segmentation, ntuple, etc) to
EthtoolFamily or something?

That said:

Reviewed-by: Joe Damato <joe@dama.to>
