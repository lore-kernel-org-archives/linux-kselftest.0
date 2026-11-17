Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891038;
	b=BUxFc6/mqyVKFoY5o4Sw3L60iUNDIqusjdERiO3r3zMcDAfzkH/LRnQSnS0Vnv3ctbjW
	 XZbNhk0FM8CaGIxSp6ChIeA9zEjaQo46xx05J0SwE5wdFP7TbKM6+TWwrCom18bVunC+n
	 G2H1RDOWysmdw7t0BsR/ilm4qYy9xHxy5n1YTlTLhNMMVzeo/Hjt+rt1ZeMwnBifWeud7
	 yB014b2R+Ud3i3Xex/kI4Inh9RG9NIovpB5WtnS36FrzwfKO2YfyXWn9fETO2/3JSDflJ
	 yyWeiXMneHiGSRS5mGWjTmSTZPhZJ97tww0S/wv22VPd9v9eVWJ+FAfluhkcy62AdVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
	b=pUGnhvc9sXd2Fa/kFEUqhkcJW4GpmDcy6sPDAT1ZzD3wUYrOAoj6aFK+GG/yHVh9xw3A
	 Ie0KisjeSs5HSiOAJdQD9cLiCgxFiukJvl8DyjmkqgWcUtLd3oU6+qVsPOhNTacAHjcqG
	 8YLTtVbFMDuDhd3L3JvLBcw3M4X9QmHGQfl5zvJyUIN8ovUqvbhzK4j/WdVBRMbVnaMe/
	 GQBQ8fjAJe3KwLrmzwb5gkUxvg7W9kJipj3435eV87dVhwDDqyCMmbnlEj+i4xAhz/KuW
	 feXg1IUKRTlsw66Q3OhR4oeon+HRWfxVfbfmGoylWvYGStZVpr96AI1S1t0KH4jj8zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE9A606A33B
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 04:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE9A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so5373826c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891037; x=1795495837; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=JVoEkBuRB7FQiKYHvBCxvAxh9Oaxf01xN5UIrTjfVi6OU10CeKbp241d27RcBRcSsk
         /Xi/x0gE95b4H/4imd4d7XC7TvMqKuqGtZq30FdKfitiezpDW1A26JSOriDXlFFBwZBZ
         HwMfdVtpba397eVPFTvqZp/IbohPL8IT2620Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891037; x=1795495837;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=ndR1oO9q1e1htlYGgUvw2eFLX6EVAewqquqpC2vdtYCfUHsCdc4c4beKrBlzqKgB9m
         mJgfUWZ/8AN1IwHdyNpRv6pvGA/JQMxa7coiU7OtFXKvzsVOz/gw9OxOhoYVpRoLnlrm
         S9KJci/SCYDT9Ms18bVFzgtOVo+8FDYJAiXt32UKPAzjM3OKxwgmS9X8dt5j7Bq2RICi
         PDBEzySW24qXdM4Xhu5tv9l3KOqjtU/Af2ZKOZCRk3p33OY9aEy+PKAbExGDZ74Q9ZXZ
         jd0SzoshXuigFINUBZ7MKo2JVuaDdLHb+YPtmV4OIwy4YffLhiLFvlMbk87M3n2YUsDm
         3v5w==
X-Forwarded-Encrypted: i=1; AL+hErGk7EH9HlXS8KY/Lp3Avq7WKW1oYmSU8jTkNgc4rX10P3pNwXJHfVEos4ozPN1aoAAESKziY9yGcIzIYCN1sAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91guZXunTWNgeqYHAxUsDx7hzi0oiT0eEjHaFE2Yt4dC8klk9l
	gkqmgKnUtMr9+5hfZURWdJvsuZ1e3BrlgBIVPnhnT+Gz6V0WbLwmV2ABCybSFMgoT24=
X-Gm-Gg: AYBFou0UvV6BE8KokiWIJfTqpIv53Pdyw+2x6EYYgqZW3d4MblCi7eSKN8fM4hqbo+n
	aR8Ly0U7/jl1isKKh5MqKijrTyBKI8RrunX2KqMJKOUSVZ0iDeBExDJHDpRItWxQV4Vl00L5VaB
	HwRhS+LqXd9f3IROiWg3i2MS2mvTvHnj8/E+jMwUSPjBzAEtTFLxUD+EXGpFO2FqJAgV0C6/J4T
	L7iJrD2tjckOOf5shSNDlfkzmJXmDISI0QysYuAPUnOuotXTTCr+8A2GR1WR8JfbC8bKSOqxe1Z
	fyViOd0O9vx0mJJCJV3j15wdNi+TLEr1pvcx9tAcJUlrsUgzjDts1DALxuywIM8ltl6M+kXLC9T
	2BZQnUxOfdtCUon8m/IZGPSW+PFl2RiLZROca9a8wNoN9c8kC/f8mqYNjbnMDau4sK9wz8+1wxZ
	3BlKHIv4nD6gc13uR02ELVhn/6y7BGCPGBtOl5rGRmqxBB+6VmADpn/lm7ZvRAmo8xG3POpt9D8
	xbD2E8o6fBPLhVDyUhmKdGFGKUS/HEsurUH4Q9bVQvi2rtYk6DdGMypVYO5rm5TEHwCnOHpScks
	jiI6blkwa01PDkbVlSoTQHVkqIph68ukPNPB4zheMWheYLce6n9UbPgym7cj1QgbDI6ll8A4LU/
	ojkbHxUT2Bu6qvOAzsRQivgiTjCYxL8qhp404PyWblH1zcwzvcxB2r4R+tVJghpxSVgq8p2HXT+
	UPPOv0t8WW6LTAzB7ZFeFOLN7V1ShHDaQTc9rBLEJ/uIPuUZoNZPY8vuwS6toe6oUT
X-Received: by 2002:a05:7022:96:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b503105175mr11734678c88.20.1794891037361;
        Mon, 16 Nov 2026 20:50:37 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53517692c88.9.2026.11.16.20.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:36 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:33 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] selftests/mm: test userspace MFR for HugeTLB
	hugepage
In-Reply-To: <20261115160105.2507650-3-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-3-jiaqiyan@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avvdGec7NCt5oAFr@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

Jiaqi Yan writes:
>+	map = mmap(NULL, len, PROT_READ, MAP_PRIVATE, fd, 0);

This isn't right -- a private mapping reserves hugepages of its own, but the
4 hugepages that setup_hugetlb_pages() asked for are all in the page cache
by now, so the seal mode fails with ENOMEM when the test sets up the pool by
itself. I think we either need MAP_NORESERVE here, or to ask for twice
NR_HUGEPAGES in seal mode.

>+CATEGORY="memory-failure" run_test ./hugetlb-mfr

Probably worth adding a 2M line or two as well, since this only runs the 1G
case, which is skipped when 4 free 1G hugepages can't be allocated.

Thanks!

Chris
