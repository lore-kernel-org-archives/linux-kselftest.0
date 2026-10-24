Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851233;
	b=PO4OXh3UEvlPXdUZXsm2Uhi7VAPlUwriRnrki+0qWdrT8grjKEMXQT8rAzzBgzhzTjtO
	 5QYUBs2nkiUACXUGDGPfv/axTZF1ZNSI1puSAMVowlTvLO0ZgTD+g260ZkrY8uc+2gMXS
	 qpd2iXTWRpT0ooukmbczP/Fidg0/S4qujz5iORf+bDooQwIJE3oRQqFZsQj5UEmmd3liY
	 unTN1Q7sSF57T95nr9XfgvU78DONQmNAGiV2QistnufSuZGc8iSJgRaIuI5/b1X3iMx/N
	 sVdPi6bJQhZrmMBXZCeBQeek/uiM18fy8V/wCbQ0fKmCFxUWxoHQulhyAnmg5FH6CbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
	b=GvCc8vY1HryWydR489rZWi7Cmddpolym0u3Sqx47CbUQYf5Z7b03kMNQzxZesJ4AP3eU
	 94ByKzIGyXX2p5VMajGTxlacQrCQX1Yc/F7o1QfYVyGR+Tsu3Ixd8Uv67bL5Cy6CEgdU9
	 SrUTqejC2Wu7ZE8wSud2OObFg9Z2EaL8hT4qlY4272XB3TCF+NH/KElSom17aPHBBNzko
	 XVL4vWy/q5NrvXjtGwImgANnyRG+6leMDSJObNamBMIL+NxrbTQcpZjly8vCkO3ggIEj4
	 mrvJYzOE+uN6UrGmFc0nz1wlS2Q1OSP2WBKpjlHYvnoWoYet+MtFA/AK4WlhuJVBKTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kBUV5rEj;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83021606A31B
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 14:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83021606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kBUV5rEj
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c43fbcb4393so243047566b.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792851232; x=1793456032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
        b=kBUV5rEjp0fRCUpZgbFLngnN3udOkzuiE/cPfVhL7V9Mk0Yads2TUBl6eUFj+1LgC6
         vNouoW2H2tzekvc9PxQdtfpjFEX3jbdTMmwd4AE1emaJ1tG5z7aSKT0KTqoZXHSbA4yT
         y9pjERZW2GfpFS0TI7mh4aNeJfm2Y/NpYJQWPS8Fx5FprSX5mLr3kTrYdY2jzS3dE5gh
         ZclwHudEDohfCXwNmd8Vnn+MPKDd2Jw/VGrQ4481B7T6hOCExmh4Q5m02PDlvWau+VzB
         QuerrrrB/0kgHyExwFoEGOk+ar5xKZMO6N6H4/z9cBVNrLJpdDKlMvgVxzM3o+/aDINE
         OaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851232; x=1793456032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NinjwXEZqsyLzVMLGtZx22X19MLQYYpk0oH7D7uxDoY=;
        b=d8c/pLEU7/q5d81oIRLGpHwK0aE3XXt1hlSRGczFfD7cBAOI+Vklyr6TBS5u2IMkV9
         FNICE1HsnV+jxX5Cmn4PffdnpvTWgvA1ZQE8eOLbLVGVl0D3ahuj71J7cdKCkPtviMpn
         nUdi4TeYaA8jDwZcVdVnjdxGie8mnihPySGNAV+Ni3uq5jnHsLHUhitOzmVV7c2wNlVS
         D4gUNSgFm3DWUHK8BoIwy5ndoquYVjES0l6Kd7zM0aWJ3kahcZoHKdbLk437iFgX6ZRs
         iSFYECoZqrUGa1ZrJfKPzYHp/59MGH15wHko9iPgw+NS8GomdNLZuQgxBbRhdi2ryHw5
         o23Q==
X-Forwarded-Encrypted: i=1; AKwUvBylMubeWdOR6xJswZp3zweVsmkm4sodVBvEIcMg/MAgAAhp4c/GCr+2TWQsaPd3iGOvYeOaCRUJT2tAg6HUJlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2iJZZrGRt8Kyuq+IwlvfHmK3MkbssnUJz7ucVVQcByBJ2ljIe
	0YDERPFcYRMXaG/io6K48NoY3VFEwGSOjOBqkfGoBvBaP+S31S/RuDSZaPKLb10Wbg==
X-Gm-Gg: AYBFou0yz+xCRo0mWMeHWWdkATKYElBw4p6cU1vXPtGBO3Nu/OtbEjVd3l8+2NLZHNP
	lVwFbOYqPwX5jawDTPw/uaB6XZnMzvsv4jNHAIn07+3VRiPpUIxo3Wt+g1xUKLy8m931v3GRJMD
	Suoz1UIn1BNDbc7jzNmrGcuh+SUP1JnPfOZbcaEuXxtoQITwOqzc33wLtJZmM2Zwoi1faWdzmpV
	YjAPHQ6eFmRGWCnYH+yEr8W9e0bmLpfwUO0cRJ11ra4B3HnRL51CUzWaT4CCNHrrldVMgQoFD0B
	a2rDd7K9ZNnj9R/pknNcYqN80oK6t2wzlvizrzuQyaCZU3FrFzwi200UbmTrwqBr6UuqsrpKQW5
	ywYkFIiGdoLIh+pMf2xN2VIY5JnsfsJChrsta30w7ZLPA9W8h05AH5tS/cb0kzI0CWVcvonQRtC
	Ng5UFNQTyPoMIwe4oyYGgOZizJA54zFK1bKvXsY1U0EVTnCroQznVwqvZLJs4iqdD/24K86sm9b
	MzZKmgywb/gAj9fu+HsILdMUIuQXlAe3VBYIOdU8sSShAkGZDGOfNOVab3dRJoQzCvF/WEjBn87
	Urr5hsAbiuloiMaJrL0a+0LH6ejg4+ki2lgDFOitLjTwWwjsOCNyYwhI/BHc4dihLz4PlKFIBdA
	unDQGr0hMW5Q0G64VNewB/Sw8ZODWwWnwwX75cWlsvFc7AHDr75OkXRhAeHbHh6FlFSNYVE+NuA
	zAn8QZlBffggk72606d5sWFeMYC4VdMW7ShdZqbTQTd2+7HGTbeSrs2j1K2we733LjeBVtHqR5z
	b/YeEgvDyrm+KVqoYAZj1LKNvHTJA==
X-Received: by 2002:a17:907:6e86:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c46bddb3308mr236179666b.9.1792851231288;
        Sat, 24 Oct 2026 07:13:51 -0700 (PDT)
Received: from Desktop (p54afff47.dip0.t-ipconnect.de. [84.175.255.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm95461066b.10.2026.10.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:13:50 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	Nikolay Aleksandrov <razor@blackwall.org>,
	idosch@nvidia.com,
	Eric Woudstra <ericwouds@gmail.com>,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v8 1/2] netfilter: flowtable: tear down direct xmit flows when the fdb entry moves
Date: Sat, 24 Oct 2026 16:13:49 +0200
Message-ID: <20261024141349.2145994-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017235849.1066624-2-julius@bairaktaris.de>
References: <20261017235849.1066624-1-julius@bairaktaris.de> <20261017235849.1066624-2-julius@bairaktaris.de>
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

Hi Pablo,

Please do not apply v8. Sashiko found an out-of-bounds read in it: with
a vlan device of one bridge enslaved to another bridge, port_vlans counts
the vlans below both bridges, so the gc looks up the bridge port from the
wrong device and reads past encap[]. Resetting port_vlans at each bridge
fixes it, and a selftest case covers it.

v9 has that fix, credits your patch as its author with your sign-off
and a note of my changes instead of Co-developed-by, and is rebased
onto nf-next. I will post it once nf-next reopens.

pw-bot: changes-requested

Julius
