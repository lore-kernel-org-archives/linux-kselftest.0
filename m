Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B53B19DB
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563003; cv=none; b=t1B6hwsdO1gJhmMS1XyS2jFmLjHInDqCSwN37GCNFkJU/Q/4bWBQgtt6A4OwVWBv5hdy87vn2jGt7+kwqeuBg4udMmwFs/TT0OiZuPdYQaliJ6vaU0bRSM4Jaq+v8gzDMe+a4frQNbGaL+Ws0cT1kfDWA5Zrncbs3meN6ZnLrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563003; c=relaxed/simple;
	bh=/Yl73U+9+hZySoBzIGlp3yaYYlVER2vb9pSNdybI+Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO/wFO1c1ssG0IHkXMMh39uPcWRXQMe/eAgZy7gkavlBDRAhCoM6yM7HTEtzrRb301qiKeos7yrMMQe8scualUDdJY6oIQj4HD2YzF6jH1GCGv13hBv3i64wdnovdVvjgzUFytfzSTYnJcW3SWMsybd+oxGquNXrLYD4kufUq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=QnBm4EPG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="QnBm4EPG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488c21c636dso1681705e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775563000; x=1776167800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Yl73U+9+hZySoBzIGlp3yaYYlVER2vb9pSNdybI+Io=;
        b=QnBm4EPGga/YD8LUYHFKT3LfwyV5j3aNhXoLiy1KXb/NSZefWel/dGF0/BXlXH70jL
         q04rz7EXo4BZRf0TbBkNEo55w8zpxZD6TztxNervWbS68mgkzgtsgnbjtMatoD90R4Rj
         3Wsw2GKCw/9mSo5axGSulCFB0bTgecAwovvp6NbnID+fZ2Hqu8NMW6Pp2mpPCfs1Lxz4
         LZpmbJlepk/9daTAO/X+/aJCDcl2hUNywPPPSJ2aCj/x2ikEmdZF8U4a678sMl7a8xs+
         gaDUfVbdyBRNl8GTg1xWMrzuC64IfHetagZnGePsX3EGgiVnuyetUDqu4DLFGWdnHDNV
         ESIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563000; x=1776167800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Yl73U+9+hZySoBzIGlp3yaYYlVER2vb9pSNdybI+Io=;
        b=ahlkYYnmVIIIOBbU0nWrOK80yAnVIs3iWJh+Xb4mv0Dfq0hFFKVspfyN4Ssmw2KsX1
         mnwkBOiU7ms3BI31sjUvJ4az5c+6Gc18ddnMrpN8hYYuyc4n36dTbEIfvmlaxWMArZCC
         qXUfs2p5FrSZThX3qG41PrXpQ9BptKWx+Wsah1IgsNlOv5Q+uckEBGAXFXBgXKefRpLx
         HuC7rq1awwJh0u7jEhQshbXgQJYD6DLu7IbS4RJTaQDendYgrjziUTGlBLTICBteYCrb
         bTcLJPR4OphuCyWKhiqvClRdLKQeyNtt/wtYTl14E9dHrDoEShS12Z4gB4VMEj4Aitnz
         xcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjVkfP1JNZEkW7FwDuiUubbepIp06QRrMs8wNA48KEkYFOUw00yn4657RAJb5sLwxvj1ClnHbEsTwB9XWYghM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytj0h5siA2ezNrzuOdTvU/6NEnsLr7qpYzmuPMc2MTWzNItPjr
	ztdAq1mODjsKKZze/syLxOmym6AJHhvpd1M3XY0RdeD9TftCKr/hKAIivN089CDA5OBWxivrWqg
	6pvTj
X-Gm-Gg: AeBDievbgRVxh2S1XNaFq1IgoSI2mKG7t1cTJ8AYfD3cYdnDMQGGYN1wWtNeDq8c6KC
	fvJR2a8KmKq9PElK4hTl46tEhBz41UL757XNC13+uv/kouruWmN5+JZjFbSGuVFizzka+SD6cGT
	Q4M6WzSHHBjR6/YUFuSV/RvCxp5d9kuvWW8Bw050ddyLZvbxyQKJ5oDhxqZgRsv4qQUHsS4c1gL
	yubWMyEoHzingLtAGXJ8d3zZotVROa3S0rgFKecJH+6gV5SWXvsJnm6aCHgCLwq3RrkKLNepIZ8
	vq7+E66yruSCzn6othRGGSdDSI6Xac5tpP4EWPC82qQBzO2vTC3XnjoMdLNRUAsZjfT2WSL4BT6
	yKVeQfeoHaoQqWe6hJPzY54KMPn3/Cg3WLVjBhNHmGhZK243ZE1gPU1UobN46BVrohWGvv0nt6o
	EUHIxd3/rzjvcKNvkVME5/Z8OaVJ8Euf31JY0MwzjRuQ==
X-Received: by 2002:a05:600c:e40b:b0:488:869c:eda4 with SMTP id 5b1f17b1804b1-488997aad9bmr180106005e9.21.1775562999937;
        Tue, 07 Apr 2026 04:56:39 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7a024sm116032235e9.23.2026.04.07.04.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:56:39 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:56:37 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 06/10] net: team: Rename enablement functions
 and struct members to tx
Message-ID: <iy5qqgpyajolnyhas6jw6ojq6abvgxsopifn6uiha3jia2lkvo@miuj2vnsmybk>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-6-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-6-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:42AM +0200, marcharvey@google.com wrote:
>Add no functional changes, but rename enablement functions, variables
>etc. that are used in teaming driver transmit decisions.
>
>Since rx and tx enablement are still coupled, some of the variables
>renamed in this patch are still used for the rx path, but that will
>change in a follow-up patch.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
