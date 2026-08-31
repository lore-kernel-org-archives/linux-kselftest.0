Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C637FF7A
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205980; cv=none; b=V6A5dY38xvgtVA2xVFVdsBMMv5Z/u5PidBLx6CAl771QWk+N6jDeDD7GWOJdZYTxyNW7UiBlKBL+7B42LKSPLYL4DZlBGUuYRGfLeb9Gh+ZoswX6F/hAPd5J47wE5XL1MlJSC7J6VjIR+8wjOTSph/WR5ydnUxOoLnUUxT/JUW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205980; c=relaxed/simple;
	bh=/zl8wY6TVFp7LoblMONX5vOgUc8p+oWSg/xEnWuTjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOIooKnYOHyHk3XuwQWI5EWWgZSB6yFfVL9nAtxSaYbf77Zr0kDrVVoiHLq3UlwfI1TTy+Ry0I83ypPv9+dTOPWLhG6xTeVhK8NKncbr3pSeXOQNPummaZzKscKbaG4mdfDexbWlCHGXn5PAPNSgBlwQXUhbzuwg/7TrJygYS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UjAQUBpZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UjAQUBpZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so2363615ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788205977; x=1788810777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBtl123r0qPUkYpJ4sDiuLzxWfXta9JzxkaMn6Qm0cs=;
        b=UjAQUBpZ8xUImRey/6SIa2+bQVuy35INcK+FFAfNgrG7kjlTSbf8aoPRaOHTnfIZV/
         ZNLUqr9v+tPzCVgYsLOTsl5oeS3iMJGuyi40w6c/h12psSY3PwBiP6oDkAccHSpAfrFL
         C+Fth0WjhndbOB7pQpxkwB9gIwMxq0yRau8dVuhll2TJRlCUfov0bHrq/NeTEiq3Cb3P
         Dxztaw8lK5Qx1MuQYNCDvgBh87NAU837NHuqz43mLvTIxMIvcxxWUeiQZVjIXwKH9VYY
         QUEXLbQ/OOzH0SKJBZmbT6gVhySDwP+dqLHzAkLAdQIrr5UpxhvQVMXUR1KE4KVINwXk
         vlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205977; x=1788810777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GBtl123r0qPUkYpJ4sDiuLzxWfXta9JzxkaMn6Qm0cs=;
        b=d0HxWbuAV6R1jr+59EmWl12Cd3n26qYLNWrLquH1qZPRu348f2KyR7jQdZOqk+w/40
         AcfMvV9DZlOj1o2kru/jDB2r3AfvFpHr9qQvccxzmsj3yvCnxK6u/CVEZM0R6oJvR7pY
         YJn/p1ev0S7zWKU4LfB4DGhL4piIaeuW806qSG5Z4/TXa6uR0URhpEnrQdhMkKd7oNAy
         R3MHUmiwGRP++Hu46l/RAUn314dDpD8NMI9BmhTmsn8qF/Xg5muVHlC+Vo1YTpwz9y3x
         lW471+zfNG1W8eZqr9EZOetpG8YLTQLxplFYw+8JXxIjoA8txrc7iusTGcyIxQhho6Jx
         mweg==
X-Forwarded-Encrypted: i=1; AKwUvBwfJ4E8FgHaa+NrRiE1AaI1tIhmE9E/aBxvvGvASrZDvB7yw3cdwUE0fks6bUlgjbjAfB5qoKqJ+xZznp9zewM=@vger.kernel.org
X-Gm-Message-State: AFuF++kw+9QvkCQYymcsCK8e7ldddzfvigBPES5HJGvtQgC9duCeVJEW
	XlCdcYbdkViSuMn56nfSu6B4H1YSJB/Xd/VFk3n4c/w+UizVj/V2a9NW5WEI/M0gPis=
X-Gm-Gg: AYBFou3ulRsdNtKHds25GxFOcbpGBwMU719C56J6p5DW3g7LMpe20nHknc9af0Dg1Df
	gT/3rhstQrIM+d91XY61T6AjcHI6bZIMvcUxsqPxP+UVJ3DWR3zDyBhA5uyV38wm92BQHdc9pzF
	uVElycTBJaMtxKnJNEvkJWDNk27UD04KuLSsAQa1Av3YjLoPVZfd/kRNBL7UFZOonPa4JM9MjuQ
	TXbbqaFJGZ3JJV1LeLAafVNlBlnCJNtMt60pdXCDKjSFTq5xa0r3VhRruzRxSM6YQiZmQhDz+bA
	528bos59KLGYCPd8BoHk7HR+WQTptLF1WAJZamX5ZEKAvL2anoLvx5Itcn5i3fNvUSQsxN1pAqu
	3lGI2SpraNM+uMWoDx21Ksq3Q1wlMRo87IBDMsUF97hezkW8jJAcQpqwd9saWBvZ3PVlbBEB4qc
	EWpZ+dlI6ybz3s6X61XA0A5yZrIsZzuE0kXxQTNkeiHt1Pp+xJKsOg7w==
X-Received: by 2002:a17:903:2a8e:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2d9527fcb10mr4767035ad.6.1788205977086;
        Mon, 31 Aug 2026 12:52:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8fdf63db8sm27557455ad.27.2026.08.31.12.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:52:56 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:52:55 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
Subject: Re: [PATCH net-next 1/3] selftests: drv-net: hw: rename gro_hw.py to
 gro_stats.py
Message-ID: <apXblw7gc6yZs9G6@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
	willemb@google.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org, noren@nvidia.com
References: <20260831163734.1121891-1-kuba@kernel.org>
 <20260831163734.1121891-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163734.1121891-2-kuba@kernel.org>

On Mon, Aug 31, 2026 at 09:37:32AM -0700, Jakub Kicinski wrote:
> We need to free up the gro_hw.py name for the HW-GRO half of gro.py,
> which we need to split by mode (sw / hw / lro). The file checks mostly
> qstat counters, so name it after stats.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/Makefile                 | 2 +-
>  .../selftests/drivers/net/hw/{gro_hw.py => gro_stats.py}        | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)

Reviewed-by: Joe Damato <joe@dama.to>
