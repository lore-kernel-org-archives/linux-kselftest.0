Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0BF3EF0DE
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777654904; cv=none; b=HEJsbkGuZ+513mz/GGEbqn7aNQRos46TIjqn/wzsAYZ+LUBQfefbP53Q57so1U0+hOOy2QwQYiDTg/uikTjDGmXIZt58lcej498oLB7p23+hYjJlT9Ehjbtm2KecNrL5YKWS3vgRomuUyo6B2ntc/nS/NZjn88HaFPvShw5TbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777654904; c=relaxed/simple;
	bh=064idbmQIFqz04QrVYQYZzDXbFXPCliJXULxXIEQVro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWlBiIflk+v7YBycTzLehMk/+VNx32ZwBbqiE3vvD12pS9VyHCaE2iH1ylo/iBwGGaigqsuoqg/syoQbFlbPlSqW9nDiQxjoqOY3p8G/7IQsvgUa5PICUDwkyrh8sA1kSGSj7rEnc2dGYIzF3nWporxugfJkc7udMfWWooIH5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzzsJh/s; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzzsJh/s"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e68e4389cso22436061fa.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777654900; x=1778259700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=064idbmQIFqz04QrVYQYZzDXbFXPCliJXULxXIEQVro=;
        b=KzzsJh/scavAcz1GG6L1MY9xnAutWZAsGaBCQloYXkgMw600fcaUVbhU+4wTFX2r1e
         5Li2vyl+yW9/VKqyjnbNES6diU55RKPG8xta7nUdQFfBTBLrWN2/yY/lcMob0OYfkzO1
         bAqdWcn6XQd8zzdgQ4sEwulTrrZ1de0Ro2uR4qNUwQvEQRVG9I5HHolrVyfFFQ5/ISov
         yXBNvfH9y3Td26QW3Zs/CR/qATpl8FSWUhh4jp8c7rMH0wYJNr9+FaAeax/85OGTUaYx
         e6fDXiDq+/PZ+/dsSaOPtzCBrWEyASXwNec6y2GkN63e9XZy+khlByV3oJx5UDl/48EH
         pesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654900; x=1778259700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=064idbmQIFqz04QrVYQYZzDXbFXPCliJXULxXIEQVro=;
        b=rPxqQ6H2Frv8eW5VyIReNssrqeMWL+keDOadMW7d8JtpQMm80Dp+oGNV2g3pH3e3iv
         T35tcdUlcj6kVQ7JN+wtt8lLTP1i10kl/9UWHWgIoE/2MFM31nG57b0oYJa5JCi6bHMm
         c0B1/yqNfKD7fMP3FKEYCGYmc3XBQdOyYFLdXTi9MAnmLeajJcpx0hJErlLFdYvsdeOz
         QHeOkgRgvpc71QC8q3HZpbpk4xeqj6DJDjzoJ0qW8djRP+J8nVz/HH0SL+ZqdJQBVqUG
         rnRbiagcV+FKrLdZCAKsFHh2OeHWdMDjqeWf/HWIjT/Gx4Mj3iYz4UiagdQTS0fXUK4Z
         QaIw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tlbw/zmTyE/NaKtRLAesEb8MZxPIH0z8xR6WW9iF6I9SZBvTTtr0k3aAY76WhKdbqx42WizcFgJOtRAC+hjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqnuIKO2Na/vO1mKfqgxWpF4QDtw4DOFoZ57QZQO2BFm0SAYh
	Gx/NvllebTSvBJjZGPNOHjrf+3G9aqP9D+c/IDpnTdCm/jeHfrQqLQZA
X-Gm-Gg: AeBDiesp8iXXMfIPHqK47stAAlHM1HA6L/BBDn1rf2rFCshBdZRdtKKmZPARshTNA2S
	wdzcNpg+Qnm92AJET4Qj901xRcetIaLHhdhqCotESF2xyG8+z3XZMBW42hdnOs7JTJTP8ISGUBe
	Yo9Hlfjgkvl9S7Es/iJN4J7aUKsWAS5gJdQHXeWvlnasPntDyaa5Y00gmSc/xqgQ1Xe0S6uwH+W
	9GaskvcgMK0VE7ukR7N55njPtFBdiErOkkNtd4MmqhsjDPi3oxxShJf+NUWoK+7XIC5GFgeF7RN
	/Vbg+JMhkMVE9yrw1UL2+6hquU7yXjxfp9blR0X1/zlf0VRuhz8Qxv3og5qgwrk3+yB7dz4Z6jS
	1UziMctvmigWf48yNYeZpA8qdSlDblNIkhiUFQPZgE/GoJMs55guu2HmccXYkFi432RMg0VTpMv
	5+EOWna1ktKZDxyBQFVdQySxoA7BZAFf3Ll1IRF3IxKd/wXy1mTwNTwI9oU8hUEGgv7TZHa28=
X-Received: by 2002:a05:6512:3d94:b0:5a4:1904:711c with SMTP id 2adb3069b0e04-5a8522e3765mr3276021e87.29.1777654899294;
        Fri, 01 May 2026 10:01:39 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c2330easm632749e87.37.2026.05.01.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:01:38 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: matttbe@kernel.org
Cc: martineau@kernel.org,
	mptcp@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	fw@strlen.de
Subject: Re: [PATCH] selftests: mptcp: add test for IPv6 subflow SLAB placement
Date: Fri,  1 May 2026 20:01:36 +0300
Message-ID: <20260501-reply-mptcp-v6-initcall@vebohr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <44e564f8-d059-407b-8f5e-a149dd76dea3@kernel.org>
References: <20260501151454.211598-1-vebohr@gmail.com> <44e564f8-d059-407b-8f5e-a149dd76dea3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Matt,

Thanks for the review (and for cc'ing Florian - same mistake twice, noted).

You're right on both. The 755 thing is on me, and i'm convinced the
standalone script is too much for what's essentially a one-time init
ordering issue - the fix commit is the safety net here.

Withdrawing the patch.

One question if you don't mind: if something similar came up again and
a test *was* warranted, which existing script would be the natural
home? mptcp_join.sh seemed closest since it exercises the accept path,
but i'm not sure if checking /proc/slabinfo fits there or if there's a
better mechanism for that kind of thing.

Vastargazing
