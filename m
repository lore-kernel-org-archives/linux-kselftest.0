Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12C30D3FD
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982802; cv=none; b=o2sFcNcGj5PQdEKY2WmR5tnM5Avs3IdTuJOVh0hIgUzcaiQnsK0HJVdMV6hFuUin1DUMVazu6vVehpdUIhPV+3o5FEHdpebQAnFAW0IaidE4iTyQluZniUwwNwItrp0MBFAG5gqBmzCEn4wo8TFBzNdWZucP1dXYW9H/SEh4G5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982802; c=relaxed/simple;
	bh=9yk6zMUB9FUlkphNWRIxPU6GBt18cBIBDMGvC3Wc76U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAutQppv1F2TaSTh7RbhwfQPEQkRrQqe5VynlqaoEUoYXWBwKI/BDv4IS+ItHLQRU07md3dJBK58hww1mGgu6zNMcJrt5mCvh9aaKry38GAwcRw7q2ejCd01O35jvfjYgG5HNSJ6M9rybHV/m8bwO8wCXexFAvqd6EqM1TF9vPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0xxH7o0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0xxH7o0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so37173435e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982790; x=1792587590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OgXMBMEg+uoBGiGA0DSTy1cFGCRIK3xSJyq5hnxZeo=;
        b=d0xxH7o0MQwjSlJemvZqnBlEknt0U/DvdZ2q2/u4gejhAFp4bQlHDp6BH6dXvzbti0
         tOxC6iKhNyfaHpno6rnYRegfAH9WHq2BGoh4jQdj+4e0wZt8ifGaEVxgv1Rh52RrI69D
         Ug4p07Q3EMCZ+ta7RzzCLDciHi8J/GuiOHtJnnRDH09f+57B5r8z9S8qqnDkNrCtjzFq
         kEP17D3A3P+gFgfGmWfScuKJ2px5oevqWeX6fXmhul2H5sIdqHv5vRgHrHcO4fEpcchj
         6yyQWFr3EOin/qRDQkXbuOmqQi4p8i9Eb1yzsWs+SSFhjmU9KfGebg0ZT87TzPB36Gh8
         PtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982790; x=1792587590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OgXMBMEg+uoBGiGA0DSTy1cFGCRIK3xSJyq5hnxZeo=;
        b=YCn164VvrdXz5/s7HKJ4iQa9ILxA/5Noyn1kQ9n7SBf7ZikC+hierLmgknT9IJS+x6
         mkaH2nqZwERgeKRWBeKCKBE9SOObI77pnroumJRayFc4UUItcVKfracngdYhnOWLnYsf
         8vLgsRZNDhHrk66iFqOgLr58pv6gsISJyEFAAZ1i5MsSv05fElnY0P+0mCZtUOOPsiTU
         7DnbQYnXYwveW0Q4/u4UzWySlV1iWQgmXxCiFX3lbOTlmEErO9FqyNRLS9ofB6eoysew
         lb7eySRMgSJtDyHLJ5zyLovqPn5wedcKoU5tkxg9x0GW0h1FKd1Wv7FwIxGvJ1JssSxq
         dl6Q==
X-Forwarded-Encrypted: i=1; AKwUvBznjhH2W1d4SipFWxJBsF6bXr0CIpxDpHApx5P0R5nWltwEDRSqPrHNe5o2aKwRLzk58hCdxefjCJB958aYpIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+WPK4qEfshsz7DwJIRNURTvGgaBL3T87a6Fwyn5JcoqS9snEf
	SGfrZgyoKQlc0EvclSE4LYoN15SLkL+C5IKTIih8SeIbu7GEC60QdZOq
X-Gm-Gg: AYBFou3+1nm7zwBjWXjBgImOumXhDhNXC9hOh2g4EIwc85J7H86t3BpBOiRPWJEVBXI
	vi7lJUTbmKT1yiiYr5gXTdjbA7CVUYNaPHNHYgeOKsKWe55vmO0FADe3+38ZcFoMFY5U7+UWNdN
	Ca9uymCaJNUnh0uqbI8ShLLwJKjEi/wV3zEgu6kK4xMwaJSI9OONmORE6ESMb8BNy5GuXyEvUiE
	ziUPUBdQPlA1ajLpE+A1B6nn0ZGwZNnLUZm9ODJms3yRiha9RLKmpAU/mGrZiEGb7Vn9Qf7j6+M
	gr7XA1Mo6qhk0K78ubHkYP7lhe55XYKjJm8I/VRDbiRmVRC4xJLr5yiEuKWcIdJtaCMs36as5OE
	knzu6ebtv5Q8vMnQVgJu3ctV9yCj0FrnIcJElL4cy5CKay654Mxlqe8o8jFlzyb0IMF8wvVn2Ee
	q3oITFIHNy8KrTTRvCr3hw0I//iTYpjFCWzwqvmIKTuFmLfK56qsAApzt1puh8untVy1yod9aqy
	A==
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr284790065e9.8.1791982790508;
        Wed, 14 Oct 2026 05:59:50 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm53105485e9.3.2026.10.14.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:59:49 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/7] vxlan: vnifilter: bound a single request and account per-VNI memory
Date: Wed, 14 Oct 2026 15:59:34 +0300
Message-ID: <20261014125934.413864-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179198195143.320699.130100546123857623120@kernel.org>
References: <179198195143.320699.130100546123857623120@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/14/26 15:45, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered

Manual source review of the vnifilter netlink path, after noticing that
vxlan_mdb.c range-validates its VNI attributes while vxlan_vnifilter.c
does not. Prepared with LLM assistance, as the Assisted-by: tags say.

> - Whether the issue was actually triggered, or is only theoretical

Triggered and measured in QEMU, from a user namespace holding
CAP_NET_ADMIN only inside it. There is no stack trace to quote: the
symptoms are rtnl hold time and uncharged memory growth, not a crash.
The changelogs carry the numbers.

The cover letter states this is a policy and hardening change rather
than a fix, targeting net-next with no Fixes tag, at Jakub's request:

  https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/
