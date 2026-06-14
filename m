Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAEE70830
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441141; cv=none; b=hPxkBfDeweGDDjedHna0jiNMYBe9tIfaNmyZE0mLiL0eRp2/D4u7tKe8o0glseOwfOmNHMkMYampoM3M+FUz1pJBcxZ2eSI760vy5oDX+aF3oAzPwWGz2Rt7pkvoLf5KkiNfohiAHBkT5ytuAV4e3FGQVZ5oJeuwG+yDdCWOwD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441141; c=relaxed/simple;
	bh=yMmkTx/uXoXsBnrgn56mvQD1S12q6dE9Jk6UX6Clw2k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Ngf86YLe2K4kkbGhJPrKrk4eg4kx+o+wb25iCkgxpVmenE3Y786N9cT0KU8Fcj4+VoJXxvMNfEPtyLg12HnjeYFke28XAB3DnhnF568g38KQXvl/BglWCy1XBz5LKr3ihXh7ihU7+dk503Pob4feIQw1CfNT9hHIQP7aMHdqmcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gU//xLw5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gU//xLw5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso27706596d6.2
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781441139; x=1782045939; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/HBHoVpPWPsjYGNIDUxBanZVmGWwZw2N5BsDYoGrN0=;
        b=gU//xLw556BxZJYP4vqk/krh1cnIAC0mmfStGQZPIuHprYLMcjC8Ru5LZTkKjBq46n
         KPCsvKEmJFvHAXE+JuKwLPtTB11GQTuHXzvzAXnVyYipPPeHzZe6rNL+U3IDJlYVDQh1
         AADodzHl5WI7VP/nd7toRW1KMK+2hFYwN9X7ZbO3cBCnvkY2ydYYxrCDsHo6MEu9gysh
         XOMrvNwaCh6Rz3Pd7TMCqZIYBgzQWt+E36X31rTuLYWHlirFHLBp9/hUesnvgRof52JR
         3qOnl4nkXXI9N4CQs6MmEOK2+OAgsTV5PKymLB9RF7Svadmca2Qb75capYplm5AL6vVL
         8fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441139; x=1782045939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/HBHoVpPWPsjYGNIDUxBanZVmGWwZw2N5BsDYoGrN0=;
        b=N6YKzpnhkIUaI9xemZwOG4vw+bO0ANrN1zbQEnxzSFgk6p19qZ8qA0J1yn2TttfBm0
         jNri+i9+a/0OJnGY0z44Bc5chdsxAxuXaczTIHT6iJ0Mnnx+0UP8knS3TKbrenGyI0Jm
         okvRp/hR9dqVIFRcIAAkz8/fBP6LWWFUHD9qEbK0Zcycs07bepOtzYXmThe7iQZ3/kQd
         p0DMm83umgLVSBBbmb+Cz3UrhYmUyeyHSla666Jz9zBKiAxMuDOcTvdLtw92ljVXN+Oz
         pWWeTXDVgImfysHBprU2v4MbQudNLQoWm1QHhSRz3FPzuuzN2JMDFYw/iRn53wUkqn8y
         XvwQ==
X-Forwarded-Encrypted: i=1; AFNElJ84Cffyfve8/EjDy89eayX1fK5++nS04Th2lwn+QTZ1oL027jjeoE8rcrW/B+j693qUD8dhaVyfwf3oKLZgEVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1SfHW5ScmrvgqvcI/B4J/PraZaD3x5+LUVWBc28whePGPH8Ro
	0gdCfJElSfup94d4tI6vdhHbUz+PSI9xVH/MQ3im1W4zpHS4Hvn9e7+9c1bq4ou5tfs=
X-Gm-Gg: Acq92OFTvF4CZkP0x6jUb39ObZbJaAMIBxbxC+woxjG/NcAivBUIrcDc3vODyHd8x3O
	ppyYvkHVegWISVDFadA1zceHDP6TXNo4MN9oA7c07+p7TiVHa0JPVM+6x2XoXuahPa3sy/0TxAW
	fyMaOfFJCT5jBaSKlO3ZumhzppA8oIY70Esl4WbRvvJ71hgD8Nkd3Z+Gff/u3O4nEdhQO7P+s5s
	VOZgZmOwPh6ps0yq48BscnsCh5Z2p7T80fuP12JWMxAi+Eso4fwaGTyxJrkdUQM1L0iQuLmiqnl
	KvMcKEf2rm8tpUeAr/A3+MRYWatUov+PH5gNDnb/caMbRz9AaoT/9cH1lbKeQqUBQM2XG18IuUP
	qgQfVicKShdLXxva7fggY/wQV5nJqH4opQoiE5pA7JjXYBAGbNbRYdXnQpNG6VVFu32mHRQjz5+
	LAwouvofXKyHpQoi5ji0doUTtU6TO9jQvwCif16B6a+Clch9TL6UPdLhxYbKLtgfXXjebRkTA=
X-Received: by 2002:a05:6214:23c8:b0:8cc:f135:52ab with SMTP id 6a1803df08f44-8d32f695300mr175932556d6.39.1781441139508;
        Sun, 14 Jun 2026 05:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d3045783b9sm77600166d6.24.2026.06.14.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] selftests/liveupdate: Move luo_test_utils.*
 into a reusable library
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
 tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
 dmatlack@google.com, linux-kernel@vger.kernel.org, 
 kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260612214512.464146-3-vipinsh@google.com>
References: <20260612214512.464146-1-vipinsh@google.com>
 <20260612214512.464146-3-vipinsh@google.com>
Date: Sun, 14 Jun 2026 12:45:35 +0000
Message-Id: <178144113518.1257322.4443569681996758075.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=505;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=yMmkTx/uXoXsBnrgn56mvQD1S12q6dE9Jk6UX6Clw2k=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqLqJyLv1Y8RHG3lTIXeMb1ViNrbot1jVkHVENL
 VoWuHOWiSOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCai6icgAKCRC7dyhM23N6
 3nz7EACOXaEbbe8vnns23e9vjsayU9RkAd6COiWy0fS1zENcHbpbP8579VwlAlYQ9ZKFjFZ8/z/
 m7VU/8iXA+4aU87PDqYtZAJbH2UNC5yXEjRiY6v00hsli423yYc8DXEKIQkfSchRiXXJpoH1N1a
 Zbe5y37wIjdl5LX0HcNey23/5kICwhuQOKi83qpNxhpJuTOpR/78UUv4q/we8yVH8EfPr6m6GLD
 /eyo4Ykzk2gOKMn3r/fDrRgnj+RQe5Gbus61zVz1xxXTQF57LMjwHibyjFXxmHl/8g77S+OS+1v
 EJPwFoFjGkf1RjaP9LpiMTke6NizN/ZOl6OxRsrOBJnocGv2ZIfdAhNQNi93fczfTrS/npGNTIq
 VO6xXlQpY1IxkyEXb8vGW9+6d2kMIiu21kmcO1jmzbyyp7ryHHMetOc/5QYdQWfUH2Za4Jzfa16
 i72ah/OJB5z3JS2oDUnmctk69vao04vWDdE7x+qD3vzp0z2CA4MsUHZ79HdUWE9Kx0eNF7TC961
 Omy976+bY/2F7UX5t+MmbS6onFJST/KfC5ffbpkt1wlil0wvaelNu1p3u+WRwsaFq9q7G5zZo2L
 h/He+qe6Hytci8fvfMnAjaT7hhLnGE+FadArZgsjoJn88u6MyhqIEu1o2LTSaezvIraUrKUqgu4
 u/jBWqYrHjN6Bfg==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 12 Jun 2026 14:45:12 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> Move luo_test_utils.[ch] into a lib/ directory and make libliveupdate
> library. Pull the rules to build them out into a separate
> libliveupdate.mk script. This will enable these utilities to be
> also built by and used within other selftests (such as VFIO).
> 
> No functional change intended.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
