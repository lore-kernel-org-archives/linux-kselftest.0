Received: from mail-vs2-f29.google.com (mail-vs2-f29.google.com [74.125.227.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26E3DA5AA
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384147; cv=none; b=fj/7avZ9Om7VviDfuVBthzeLmBKU1fPaCr5zgRuneBwozHiYk6A6SMjSckhm1JjzHdLOHXawVcLTzDBGqFPwyTA97sio30PYBpzDWQRN3CbfZWmnp/Gp5C/DPsb+NaA7B3V8N9t+ZWcL6FKAgslJidoAyN8BI2mXuGWWfv0QdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384147; c=relaxed/simple;
	bh=cnTUXTL+vStDgG+NMGmRCGSw2eobuM+C7j2kYz4fpJs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=L+oJVO45qONlIRGEnZkW7NEG/aiPxfpIOIARFc2gmLUNyJvIiPLJtIKd4NDWHN4WSUgEd59PQZvV89OhSSzpSNrm2MGhtRURctwjHBB8iCM7fBLM6OKNM2KkKOGBLPyIe85eWYOCwR7quCrkvRqaccmygI33DNA7bCyTdISLCZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+tk9jcs; arc=none smtp.client-ip=74.125.227.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+tk9jcs"
Received: by mail-vs2-f29.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so700693e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384144; x=1789988944; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pSenaxNrN7Rpor0LAgOLds9XDBBj6mKAJnNQjXr1NB8=;
        b=H+tk9jcsWYnD1T1LdIUJFhMCxtsEU3SYXPSuIjoNcE8hLPypo3J+s4/f+kuZnQNtZr
         6wscyZIgdeZtT9j5T86fQox5qcaGRb9tR9HFM+wt08cVHyDGyOEQ+rHZJrWAfL8/NMMG
         3DS+3UK/lwceHEjD+WxGiKhDGSipXhTSw3EWxWBmrLWUYjzWQVOwf7Txb47ynrXOQPIQ
         XFiPRNJsmHsM9O8RkoKo++n7mbiqAKA/xpx4LN0jhgyBbbUlgMt4I/ydi0U0lVgPmEa4
         nCPAQ0w98mknKE0r4ea2pnuEjPhNgFV6GKfneFVRHxQhk280rLtkGe/LMbnMi5ltkrAf
         S1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384144; x=1789988944;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSenaxNrN7Rpor0LAgOLds9XDBBj6mKAJnNQjXr1NB8=;
        b=aswwW5mH5HGolbB34xwdGbXRDKoVy9G4RdqosgZqm3pZvy8SkTjfn00HgCn7U4PxaS
         KjByRqMt3HjCgkfISsUZooh0nq+y9j6tSzub1FIX9YNYk0wSqHmwW3YDECY1xLtOm47B
         1P+0ct4NmJzrMaXPlx4H8OOF0FvWG6kSUkt0xjUcOE85ECkTjUcABX74bMaM1mbOdsSO
         yDIR2gla12p5WuhOL1QoTtXrrCtKi2TpvLtuVuL5tQnZDINgwAcp0PXOqPAVSric7TNV
         xZhpmnYjuKTmgVpe/RfcnmlzqPEwc1ps0hnFd6b4F/IE4gClILOni7Ard+eWp/sJxr8S
         sbvQ==
X-Forwarded-Encrypted: i=1; AKwUvByqJgkB8XKvT/xS6cta47ThZaFa4ebsQw+dm28kB9fYU63+JJema3aM/6/hv6if9XmQhp40OrTvVo235JZvsy0=@vger.kernel.org
X-Gm-Message-State: AFuF++ljK+ea3eDpDseOe0YO3k/J8BtWOU9Su3og7mIZck0R1yuE1GAD
	ZcGTTrta9bFY/8L1CJVowagt0pK293cJcw5MhG9BYoaD1WjJeNJ4f0vR
X-Gm-Gg: AYBFou2p5Dcf3bMQvEDMTiNQXalnM5M8omoYRT9bUIJqVK14CqEXScatvrwbQpsUAut
	aORbGvPoq5kddwxdOSnbeGGoa869mf12IduPglCUzDmxnCkEmveeSsMQNagq9qENBIEop3K7hu6
	nLybHtUChD9J9nmVXOqz7QRSigGjZ29KeCFST7OwCyQnAAtYkLWJps+f8SK3FZMvh/jVzz5GNUJ
	tBDgM7GUGr+3UOPf9J0tIU8sHHsMEnd/KzmiZ9YG+Vq5vAZsdgcGnVC2L9Wq0q0cwsqkIiQ05OX
	/1GWsDX8Ij7kzQHtyjipfcOfdfYvSGox0NRu+6o8r4eCOfMAGqcpb7U7GmxWCPi10T1klL++VJF
	gnZVieXokhdC+zhsobtz6r4+W2LwZ4MyI6R11lA3/Tf27bEo8ApZKhcZ61M0YaFBzshb3vdzMmL
	9k7oGVoAZqSdPRdZH91jM+neNZZmGVR51OTIzx9epE8OlYXGvw1sy44A+Xg/+uDyVN8qZ7hneTh
	aVZL0G74n75GR8=
X-Received: by 2002:a05:6102:54a9:b0:798:8ca:3452 with SMTP id ada2fe7eead31-79b58398adbmr777052137.1.1789384144530;
        Mon, 14 Sep 2026 04:09:04 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm73606186d6.23.2026.09.14.04.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 07:09:00 -0400
Message-Id: <DLEZQLZQJ93Y.3UMMAGWW10151@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 1/6] selftests: drv-net: psp: fix linter issues
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-2-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-2-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> Fix ruff 0.16 warnings:
>
>   C403 Unnecessary list comprehension (rewrite as a set comprehension)
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
