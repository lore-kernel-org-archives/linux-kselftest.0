Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=165.204.217.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177444;
	b=eQvLyV23BS/WuTiEuI8rqzIvp1/kdat7en1lPhFLYivJ8Y4vuaAqqCvNNlksvKo4QLaJ
	 u9Ux9IgV5RzhrjYEvKZvgJlv+as3TFzvtemubeSuZzxC7DTl2WOG21gofyfFZ7r1uf7xy
	 HIuBPcODsVykVOrgdpPJldffo4oEbig3NLsNO6uP8uBqHvW+rD3U9KbTUOXcoh/VMJOJE
	 g46pj3qM38NqO+3ivlLNCvAejviDP5UDPrmROzE/5yv8FctqwIcfSL++sTiBX8UIpMrnX
	 hBfGBsybmKgw7cZYseE7FAcDTCkUs0HWMESdFgFw89/0iLw1J1l95A652dIcfNpDqtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177444;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=APffcVtOjBkP4hCMOBGuJfnYZEvna26cwsWN9sZxx14=;
	b=braNR9wcFuWcHeEmuUFfbcumrkixJEjMJD9b6aOCGMc5USpicpJayVKYWfmlS4wbvi+j
	 K8SRp/a3OXpzj2h4vedeXDx/YgrLkoez79NiPN5qqGp+DHOoTy/3VAumq0VsNYclV+/fy
	 Dh2Xes1IOkPZd8NlEgNbf7Xj8MSsMYwtbKjP0luA2GQjf+MdCBj1DGZH1uBLWJkTvZi50
	 lTF0wFJSYexWi/XoPFx0y2PdiO8mOj1ALKkkbr39T93FSaKJ2KgCdycuhkWyBWg8NqtNs
	 eVZoKFNYN1YlomVga53OF6EWY7+KhNzJvLaMPkHbfc2ujIeiYzTmrfArIxQ+XwO/pgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=amd.com;
	spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com;
	arc=none smtp.remote-ip=165.204.217.251
Received: from aocl-turin-03-9e62.amd.com (unknown [165.204.217.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB831606A320;
	Fri, 20 Nov 2026 12:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB831606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=aocl-turin-03-9e62.amd.com
Received: by aocl-turin-03-9e62.amd.com (Postfix, from userid 1000)
	id 31AF417206FE; Fri, 20 Nov 2026 12:23:56 +0000 (UTC)
From: "S. Biplab Raut" <Biplab.Raut@amd.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Gao Xiang <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] lib/lz4: add KUnit tests for compression and decompression
Date: Fri, 20 Nov 2026 12:23:56 +0000
Message-ID: <20261120122356.2801415-1-Biplab.Raut@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e8235bd4-ad04-49d2-a5f6-f83463a8f8b6@samsung.com>
References: <e8235bd4-ad04-49d2-a5f6-f83463a8f8b6@samsung.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for running the suite on v3 and for taking the tests in.

I'm fine with you carrying my patch in v3 with the HC work-memory fix
for levels 10-12 via lz4hc_mem_compress(level).
I'll re-run the KUnit suite on v3 once it is on the list.

Thanks,
S. Biplab Raut
