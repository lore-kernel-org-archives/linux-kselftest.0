Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2837CD20
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826834; cv=none; b=Jz1J3k0kapQsvEkioeAZHmocjvYuOM1qyxxOy1Pt2I0uQrkD+XoDZuwEyfMRy11kr+bOTMyDobH91KHAECqeEaZwfFcI+kaAHU92CEge0G/6iH4d5roSGczC9as2InKlzNg1S+i5tZ8hb+u8fxb2Zoocjl/UghQC0UgKlNbbhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826834; c=relaxed/simple;
	bh=ebx9DytCjEe5hkX4lMtfi5pzQvgPYCMmi4NGe2LpsWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrNdnISZrCxOk1xEQNrILUeIitVcqM1y9ZALbY+bXxfLizKU383tmmmrChP+iAomncy+Szr2gCqtf4/HCgFXRAwBtfiyaqlaOIFXy2EZHfPE0VGE6I+CFqUckOTFa99HfZc3g6eFcnYFuf5+eLhKFyGTv3fSFYuMdtXsSB8Swk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATPjrw10; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATPjrw10"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38be5e86918so41905581fa.3
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826832; x=1778431632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebx9DytCjEe5hkX4lMtfi5pzQvgPYCMmi4NGe2LpsWw=;
        b=ATPjrw10h1EqCjqyBDFmFmTj42m+UPelzagG60oKl8aoaXllRLR+UKCV5CGZ0r9ZJY
         6ts3iCFXIOwLceciqZ2VNGskSoACul1ce+u757TzkEm7PmAk04AfTSECOmZ78jbfQQA9
         9USvWXdb9x0DTcF0wXCtPpnzT0//gpsX6xrK8oVzFHP5qpxdVOcx+NyHAncUFkS839hP
         3y6jCU5I808hXXIrQ+/eF2UH5VRuMQe4Zym2GFor4mS8HezxRQyRSgz+ZPNz2QrIdEvF
         AlKttAWACApdH96SNEzHYvt2GmVdgLBASR7Apc+UfxB9ssj3OSmY/c2VobeZ74QYIEmh
         ZwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826832; x=1778431632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ebx9DytCjEe5hkX4lMtfi5pzQvgPYCMmi4NGe2LpsWw=;
        b=kExR/SicadsBK2l9Mm0kr3NEna7r/ko39qW4x5TpWM7GRWTrc8aiR89y05Uf0eXk8y
         HDRtzVxrjuV0sWQ36JtU11LtT22j7cJ130CSE/wtZmZDCG2ry4Yf+ElWFLpJVRKAeKOP
         L6vEF07c9f0W4HvA4sgkgvFI2CVF6NeHA0Vzz+z+XhHxx40dOQMg80zPizPTTOxigLkB
         iG7HT7wwZP7nbCexc8EQamy1WSnd8iFhoxDHyirMtEFcuNn8O18KuLjfVzKBBTBcVoNK
         BQB/edxoypYKcsh4jFDAzOc3NQP8ahVG5q4fHiokFSYJ5mfGtqt854Eg6HAMo97jFxFh
         +2ng==
X-Forwarded-Encrypted: i=1; AFNElJ+hwxuvcTHjvMD+heryHJYh8k7jM0ScuMUqrR177tH3Z8rZcK/xJo76rsDGflHVQQL/6FssfzZZag8zm1NppSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygdel35y0saYxAxFTEl2pkBtGaw9O2h74e+XPECg67SAx82MRX
	hPf19AiRd42ux7pHuBZZWED5F9KLd1YhvBc4gumTal+HwNAVPdpMgZdy
X-Gm-Gg: AeBDievU/fGpFASdI7Rtr+5wRs9nhtdfb9XsXXOIWFBjeACjFxGEiFFb7hxYgKWoAcP
	/BT8jM3pSR2+m0Z+5FlqnGANNnu0uQjM+vedKvakcCkwHQeDRYjQWsbQLV3kfBWaSyfUtjxxkWx
	dZ2y4DSzq4E7wG7v8n81RvLAGh5Z56N1RYkTNErI4tOFy/1Yof+cBg2bmOlqMdbkDuf3JcnCRNT
	9ZGZ9uL8RB7HNZXP606l1zczZfgJp+jMIcFaDSdaHCRxzR/RoCu+m9/0CQ2PAHWyIC0VPp9pafs
	tV+d1yXkShrGWI0WhYUw1gi4wGX4p/M8/nbpgvkKOfgexYV456glTA8A4NQIv67+kcB4mcS5CeK
	3CgdiOwnH9ZpMSdgSZ2+IrwQoHBFrDGcLFDJ5ZmsOHvO93hyTqtuFbggjr4+wYCAX7t9vp44dvG
	1HvnInxw2dtxcLpXnvgjtxPcnysTIF+R9ZzEm03z8fVOxqu3qA0JSzd+jJaNSB3Fcpg4jthzc=
X-Received: by 2002:a05:651c:1501:b0:38a:aba:9bf9 with SMTP id 38308e7fff4ca-3937849422fmr21458861fa.8.1777826831339;
        Sun, 03 May 2026 09:47:11 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361323f4csm23033091fa.32.2026.05.03.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:47:10 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: fib_nexthops: detect kernel splats from torture tests
Date: Sun,  3 May 2026 19:47:08 +0300
Message-ID: <20260503164708.348543-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503061740.GA98182@shredder>
References: <20260502122219.262611-1-vebohr@gmail.com> <20260503061740.GA98182@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, May 03, 2026 at 06:17:40AM +0000, Ido Schimmel wrote:
> Do you have a trace?

No. I did not run a KASAN-enabled kernel before the fix; the commit
message stated "would have been visible to a KASAN run" as a fact
when I had only inferred it from the code. That was wrong.

> The netdev CI and our internal CI run the test and look at the kernel
> log for splats. Both did not flag it, most likely because per-CPU
> allocations are not covered by KASAN.

I did not check what the netdev CI already does, so the second claim
in that paragraph ("the torture loop just did not bother to look") was
also wrong. Combined with the percpu/KASAN gap you point out, the
patch does not close anything.

> I prefer to avoid such random markers and rely on the system running the
> tests to catch these issues.

Understood. Please drop v1.
