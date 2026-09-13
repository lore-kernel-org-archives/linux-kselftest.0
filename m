Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A92F8E90
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270365; cv=none; b=FwSPrxdMWzTPN7ZhiDxUbQH1XxSHuyo4H0SpgntlA3P0MytpkK3q84tcuEsvNb4hPNzQtZS7URT5Caco1Uqxh5kxWVsjp0t/Bm++/QWIdNADL6jXwlXxLv7XQde3ULAWVXz8K5uEP/xyfFt+/6dkIiKQwV3XXbP7uEaCrpY75Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270365; c=relaxed/simple;
	bh=kCvbVwZC83we+errokyP7K643YD3vh2QxPQNw/0AuPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO2J4y9hUY+GVl87hsKxcU6NanoGVZQ38Ebwix+/Hi2SO86OSj7YomwOmIfu4rme1sL1uYMXJ2rZIooHbnAfZtzEwdgoevMova5pt04nUUB80RgTx2RP7Vd1GjEM0BnMZpQgzFlEPL0UNH8bRukwxHaOrhWjHWzsZyfkjDUM0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxzJVUzP; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxzJVUzP"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so16003441fa.0
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270362; x=1789875162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMZTr/1imyQVYMPCbe2CDQylZItl7GAC+PPMeDYEaLA=;
        b=YxzJVUzPcOQO3IPLgJihQI2ShRUZ9nIZriqRkItz3cW5PrtidhOdIP1UI3ICDRwuz0
         RfWHzWKQtASqBjKJ+9OEHRBdEeOu6Q08YPpfMfaV8VoJBTylgqTK6ZrEZv5ml22ELsO9
         SkSNooaMJPzSdOmtSOg25zOWT9/l1JziyaAVkHsoTguN42t2zJbCHBeJqGxDpkAcfs2I
         jriUsr+BNIVeoZVDdElg+RghWAcImwCbBtVi0ZZVlipZXogecGtPvRJAbnTPQMBGYFXk
         tYX3hg0vYQn28RSUInppjeoadW7q37kxAwcbNoW9PNOzOAX0LLDEvN+QMzDVOSUtAy2d
         BYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270362; x=1789875162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMZTr/1imyQVYMPCbe2CDQylZItl7GAC+PPMeDYEaLA=;
        b=SBECVb3IUtpRxKAco3m5BvgB1/6LltzOnhGtTnTC2IZW0zuc4aqb6+x814VTQzzuyS
         PQu+Ne5dtyMhbzoKGTOw/raPqFmyCLsWxxTw+wpvfyQbImbvG5E6q9pSj61IcEy//bJL
         cM+e4fhox0C34uCzVUMNH/4OFaHV4A0rXAC7BNbXQdB5u+/oVstlvmckS7Mr9NM5BzjO
         jCQwwoehBMH+ZzjPEPNzXumWl5WqWGfELf5DyCKXGASwrtJQbJbjLT2BTSrH1mqnwLwv
         Q+mfIliYjpznEfrJc8m5Ubl3ezxWg6wsnM6gHj+01hqxksEefT0X94GZEpAMW3l/fzLp
         QQ2A==
X-Forwarded-Encrypted: i=1; AKwUvBzlyEXcduqrs+VVpZ2o/76N4vExSAPE1cOtVYu+trFUrqpluvqYlRKhzNz0dK791fzWjgA1ZeqVnrgPnEyPuhs=@vger.kernel.org
X-Gm-Message-State: AFuF++mD9ucySiCZoOXYsrloUAMj+Vw5OQWnpHRa3REplXSCjF31lenx
	cvp936wpfx01mbgjSkL/kFd8A8hvu/SAygtXAM7loDsKJbfaOztdlpmOdN3Hd+zJ8Js=
X-Gm-Gg: AYBFou2mAm4LSWOXaebbOaskVisKRKTx1ZqpOebMYEMz3ZhngQ/1VNLAwQMoZenGgoz
	lZ5m+u8MgbgzWRCA3QmdRWZl1pSOEduf6vtjiKtaX22r6cdyfbPOa4go3RhOOaxYmqXJ9zM+nMg
	TeMs+iG8Bn67xwbRH3/AzwoCFGt0xgZaz0bnWwhn4T4GEKg8Pd+MIIJ+j9T+z8oMJmzwAocU8LY
	aT58mjdsFYBO40Tw4zn2KZEIhPmQVHit0AYYv16AhhgaADbavxAXD/pSHpX6UX1ZkMmdZqpZTBt
	GTPak5WcIP+JAYwnraSgzPqQwRUFgq+BDBM5NKkS0pPWCkxX738nI270e/ie7avQkqJF91N/QXQ
	WvQ0b4cRleecUcK15oN6khCeBONNAsfSmMvwUVunZYjQQahdQCACxGAQOFwwUoq0vg/x3J1pFPZ
	YV+rPi5YTyPtLkz7/SLlAMGL8rRk8NIQh8oSbLQddFGkSmFDOCASVyXpWglA5bTFHlozewX0HXc
	HcmC2x5VaqHM6N5f+mxILZUK/KPvjM5KzvKq11/iK93
X-Received: by 2002:a05:651c:19a0:b0:3a4:d4de:bad0 with SMTP id 38308e7fff4ca-3a5a5022d47mr13760621fa.19.1789270361516;
        Sat, 12 Sep 2026 20:32:41 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:39 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the generic RX path
Date: Sun, 13 Sep 2026 06:31:52 +0300
Message-ID: <20260913033213.873609-2-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184718.64ddca2d@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-2-littlesmilingcloud@gmail.com> <20260902184718.64ddca2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:47:18 -0700 Jakub Kicinski wrote:
> > +	SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH,  
> 
> This name is way too long, maybe
> 
> 	SKB_DROP_REASON_TNL_CFG_MISMATCH,
> 
> or
> 
> 	SKB_DROP_REASON_TNL_OPT_MISMATCH,

It was the longest name in the whole list, so fair enough.

Took TNL_OPT_MISMATCH in v2: what gets compared is the options the
packet carries against the ones the tunnel is configured for, not the
configuration as a whole.

I also renamed the two other reasons this series adds for the generic
paths, IP_TUNNEL_OLD_SEQ and IP_TUNNEL_ENCAP, to TNL_OLD_SEQ and
TNL_ENCAP, so that the three do not end up split over two prefixes.
The GRE specific ones keep the GRE_ prefix, next to the VXLAN_ ones.
