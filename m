Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F3477E20
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271643; cv=none; b=m0Oyp7BhJsDyHfZmvfw8xIYPt8TOhW3HlD1/DrQv03bXQSGv0mGbST+0eKrnES483bvdPWnB/88HdODAskbsguF2hqf/AhZFaR8geWvZpuviwWxs4gvunwzdLWZ6hr1JZOGXC3KbY9zkoNKgfqtoHnD6Ay6/wueKYOWWJ43aIk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271643; c=relaxed/simple;
	bh=0Pwx3Hc37IzwLO80eSQXq/W0rIj/++qSYLDeySdhkw0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=KEbWLxIGJEsPYRgNO0o3sOT7+Tj1I4fEaZmbvUU1ZCo/VthbH89tcB1mbzQDJBbK6SUlAj7hmJNUk9EbbLyZu8L5EuzJwM/hEyJQLnRWbc+oCKk0gE9fqZypxQGdR/ZFy6MMaC+9tz53E2H+4QHLfZb6cmMCOL5ocqz+hmiidkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2tUAyQp; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2tUAyQp"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-86162c086f8so18279567b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271641; x=1788876441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZpnRHfRMFzEAWLvemeBKEVpeIxRl4kUoq6EWJEKG1u8=;
        b=Z2tUAyQpjVHmYHIACH2obA1yvS74UvLMNOmzvhxyId/proVm7vacQDaQyP6PHS/zpc
         KhnGCQDErfMSCuVBqdeKDVkTHs+L80Wc3ItPD0Glhb2j34ZgN6K7fu7JKUIT7FTG220r
         VDs+qS2aMgrH7eiKoimErZnaH4ohK/rwgV8ZFSdfRfWECzh5r6RpIyGNXvxA/cRRSotR
         myt0aSZ720HyKSFA/OfRYZngNoPoDtZV1fR6ke1SqPp9AU01V6NUI9Tt334yt7WdO5IF
         N68qD5V+61mACQ4V/VOF15C0Un0w3P1VzvWmAmfqg7PGXnnTqjZeNfPXAiZXca6AMmzb
         5J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271641; x=1788876441;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpnRHfRMFzEAWLvemeBKEVpeIxRl4kUoq6EWJEKG1u8=;
        b=dxZNrtD/zkQvBMWyLc4wnYsNWf/fVggS0RjaxdRxth9KWxj9N8GLg0TJ+Ca4Upjt2D
         O5aMHFEpseQkMFUBgaSw0hf1b8E3ophISjvH6H5Jvn8IVgfd60AHcjYVn/UilWe2Dglt
         EoqMWQAzmEHI8sZslC1bJ76/4o3xmIBu8mwmlcEsheAaOlhfG125TxVgaqUM2XzIMtxo
         XPcqCw5SdbTl5nOA/yrzzqeu5bS93EFwvIh1ywMM7OzrsIlGIRypLNlWH02s4Lgz3QNe
         zhpaMKl1CTyLd3kcv6rSbYM4w7sKNYdzkH9ISvHG9ytvlyyf83ldFPFU0nnq1slWm4ju
         gD6w==
X-Forwarded-Encrypted: i=1; AKwUvBydvSeNJ9YdxJdFiuq4spjgncKH3mTQueZoDypsvYKXko0FBzLDRimNtf/wfIb7KxwhwrqOoqyb8T2oAj+Jo30=@vger.kernel.org
X-Gm-Message-State: AFuF++kdktbllFxi1sfqJfcAl8QdBhljst4Vl95uil28x4TLVCHTvRuz
	hlYqVaiQHJMsCPHgiiqyB8Sf0G0T713t9e9c3WwCSzMGWSLRkFGM8aWG
X-Gm-Gg: AYBFou080KAnWLj6CjiNcShOfyY2ZFiX06j07r8V657I70N6sVXMynr7vUsytR+/CAy
	y+kS/X0arezXok6XaJWMhdSn9hdC950jDt+w71PWjI58xj5JZt50KV5/ksymM+34aN5mhc+fJVI
	Vi+U24YbBmeuEGvnFAw5kS26juaTc05kQnXbxKYbxBD4Aj/3DiIzXRUYNIdvbPNWpjcyomXeT/1
	rXHZCKw1B1H7LGM0t1qaaDmpuP36OSufMnfy8X7raCIebSpWxrUOtj6w8xjg0eroM9CxL4c07nA
	OBxwvNcWlyg23zsjngXo4z9I/1CU6vR1i/Td5dchtU288KAw0gUYeinMce1X5UUJMt/mgsrfijb
	hEAPk9uWFbUpZWPINLm9Nc8L7P3hf2WWDw0k56NZlsG5QE/C4ytFYIlINLPjYSP9RISE8vzJEd6
	UkUtawlkzf8eFB/+wzNYojPxoRBTbSKHGFGIOGvS+Bnw7vkA/fDma3ZLLf9Czu2Hmn8q8covixs
	36ppN3A319XqP6adez9YtGAnSTOrv2T5Mhm+7Hq4v98QQhiBHvW
X-Received: by 2002:a05:690c:6:b0:80c:16ad:2f16 with SMTP id 00721157ae682-8694a045dbfmr25369617b3.8.1788271640592;
        Tue, 01 Sep 2026 07:07:20 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed19446sm74640317b3.14.2026.09.01.07.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:07:19 -0700 (PDT)
Date: Tue, 01 Sep 2026 10:07:19 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Nimrod Oren <noren@nvidia.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1bd3bafef8eb0@gmail.com>
In-Reply-To: <4804ad0f-ff5d-4b74-8285-9595c0c6732d@nvidia.com>
References: <20260831163734.1121891-1-kuba@kernel.org>
 <4804ad0f-ff5d-4b74-8285-9595c0c6732d@nvidia.com>
Subject: Re: [PATCH net-next 0/3] selftests: drv-net: split up gro.py
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Nimrod Oren wrote:
> On 31/08/2026 19:37, Jakub Kicinski wrote:
> > gro.py runs its full set of cases three times over - against SW GRO,
> > HW GRO and LRO. It's our test with the longest runtime. The 318 cases
> > take 12m30s on mlx5 with a debug kernel.
> > 
> > We will likely add more subcases here as the time goes on, so it's
> > time to start splitting it up. Long runtime wastes time on retries
> > (if any of the 300+ cases fails we try to check if it's a real failure
> > or flake an re-run the whole thing). It also forces us to increase
> > timeout for the whole test suite.
> > 
> > Jakub Kicinski (3):
> >   selftests: drv-net: hw: rename gro_hw.py to gro_stats.py
> >   selftests: drv-net: split gro.py into one test per coalescing mode
> >   selftests: drv-net: bump the timeout to 15min
> > 
> >  tools/testing/selftests/drivers/net/Makefile  |  9 ++-
> >  .../testing/selftests/drivers/net/hw/Makefile |  2 +-
> >  tools/testing/selftests/drivers/net/gro_hw.py | 14 ++++
> >  .../drivers/net/{gro.py => gro_lib.py}        | 68 +++++++++----------
> >  .../testing/selftests/drivers/net/gro_lro.py  | 15 ++++
> >  tools/testing/selftests/drivers/net/gro_sw.py | 14 ++++
> >  .../net/hw/{gro_hw.py => gro_stats.py}        |  0
> >  .../selftests/drivers/net/pppoe_gro.py        | 46 +++++++++++++
> >  tools/testing/selftests/drivers/net/settings  |  2 +-
> >  .../selftests/net/lib/ksft_setup_loopback.sh  |  2 +-
> >  10 files changed, 131 insertions(+), 41 deletions(-)
> >  create mode 100755 tools/testing/selftests/drivers/net/gro_hw.py
> >  rename tools/testing/selftests/drivers/net/{gro.py => gro_lib.py} (92%)
> >  mode change 100755 => 100644
> >  create mode 100755 tools/testing/selftests/drivers/net/gro_lro.py
> >  create mode 100755 tools/testing/selftests/drivers/net/gro_sw.py
> >  rename tools/testing/selftests/drivers/net/hw/{gro_hw.py => gro_stats.py} (100%)
> >  create mode 100755 tools/testing/selftests/drivers/net/pppoe_gro.py
> > 
> 
> For the series:
> Reviewed-by: Nimrod Oren <noren@nvidia.com>
> 

For the series:

Reviewed-by: Willem de Bruijn <willemb@google.com>

