Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD9187346
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141695; cv=none; b=TZOSUNQSODy1p1bVd+TmQ3Evvy+Mw6EHUwo7zxW2Ign6Z94sGmSd693CN6UoNUahU9J9/7wP+rLRq0D/elZOx3a1gM5+hHWFHrttMGx0gKnnJrA5n0/sErP1jNickJTw4uo96FornoLcwoBg6cB0J5Et709RsgpPTNO//FSKjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141695; c=relaxed/simple;
	bh=K0zsIsEW8Yn0Vht5R5cH081Ha1e8oN7aKLVhk3oUXX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekFKuhCH10FE6RpfDxQZhcU1FXjb2VcGtYGF5AHxe6YFdcbBeKK7TZ358jgo+Lq0+RQWxz7OfXy1DTHi2nOk2Co/NdtXfry/csd7kDV7Osh2qnhQ0/POcgukVFj9EYP/xfJ8coKoVhQFvrEkWKzYe5d0C8RB/2ZKDe0cAfQtKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQzY2xlx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQzY2xlx"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so39689a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786141685; x=1786746485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8g4CqNNY+lAFMI0SaWVSjLctp/XfPNWJ0tNY272o3EE=;
        b=IQzY2xlxyXHHuB8xkTjOM2Q4lYdOEsonMYBlIQ6sGnxNghN6boUEL2Sj+9YnfCuXEw
         BYOiIzjrSRbXqexnfg/5d03iXc+iHFlUCbtVeNNj/VvsQaL9IH7DIcvSUQJVtATmsFM+
         mPFHNubFatREccdNfiHP/BIhfz2TnctyCClNYIhjETpbH3JTb/2UkyZZJ0Yo76/2WnK4
         W/9RThR2McVethI9EqxFQkyaCwlHoChj7TpLDbi1aBDJAwwhin8uyMmR4SpPNO+LFzvc
         4Aci10HL9aRUlpdUfpdzJRjBf3DfKKr6qdoU/ElRRVBlzThMUiIu0XupN2i1IKn4ESwK
         dL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141685; x=1786746485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8g4CqNNY+lAFMI0SaWVSjLctp/XfPNWJ0tNY272o3EE=;
        b=CpAfPeM4yPOr1Lnf8bImSI1UT+abGwSW1QWAhJg/lENltEB7tmFH83BO5J1Ht535T4
         WcQVaJ+Ve2FPSRXZawyB8eJKbn1UUv+tEuOZj8MA82cEr0fgHum5kd7agaiIpcEv4X3E
         yfoE1mdH6kdZ2vZ5HcOtf2RZcWCFE/SvfZhk3vGqcwsMsXvriKO+krubVBL3HcanrMlJ
         BRPC+nnHQjGigH+Sez3XlpPGqt2blKXYIcbnSfmPIIHvXhGsAvg64R738RrNIEobkQZf
         RhTXUISDL729/2UiufGHjViVr0pSRPT5uikuFEiJD+LfTCTduP/ES1A5Vv9qYz1PgA/l
         3iSg==
X-Forwarded-Encrypted: i=1; AHgh+RozM7VGcayKCNCS1Ux96QfZpDPlERKdX9KIi2uZKnZLWuZmgoJXU7s/VLXkM9lPTrYgGN1kWm0VKZeTzTOOoRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG9GxSB8Dgguk21nrteA5O0wTtdWqV5ms2snUeAKj89QzTYS0A
	7xzQkMLvtMjhXaWO3oexHuyuX9ECCTBHMEJzJDH6UtmHVEXWzrUjnnI7dyCb9/8DoA==
X-Gm-Gg: AR+sD10qO7X6pt7y6CXfrGiH5MsDPchBlrW5AZmtYj9iHbFvKhLBL+V75VbNkgc6R4W
	vO0noLhzAf+/DrFh+R61itRY4YU7eLlUav1uQR4jHlskejmy6GOtBQCiT52ueKfBFxWt7BkFJ/5
	Ohnnoh0z+ZcUJGrndvn/VcGfjQ20eA+DSX66brrYv0I6wdgs42f5siK1IQITsPH79g6Db5L5n5J
	bEGgiTO1wFmViAfUV4/LNhiGPHJB418gUHyxgtxmUH30NzEc3FsTHQKBolwTyroPGdXHOJ45toS
	JxGsVS51Ef82h2DkSfDYZFV96kS8Iqe2Cne1VSokp922jgReQR5oIEPOrdGOFH12UMr7dbKVUL1
	cj2IufZcYuQaGiehEJMfS2lLMgC2CPN2LuwUJY/Kt4EkLSUBaNIz+SS7jjBGFqGTWHZQ8jasaVc
	8X1w3KLHyMVBlSlmpGkMDt78jSLFYftKaqg4DrOJOGGHzEyulMeZ3gVGkxi0ZjrJcoy3WLF33mf
	i5ZvYD/etByJgWHzHgZh7bwYwutQQ==
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr29628863a91.4.1786141684888;
        Fri, 07 Aug 2026 15:28:04 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2c714sm6201387a91.10.2026.08.07.15.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:28:04 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:27:56 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Josh Hilke <jrhilke@google.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v10 0/3] vfio: selftests: Add driver for Intel Ethernet
 Gigabit Controller (IGB)
Message-ID: <anZb7DlyLSMgp6sK@google.com>
References: <20260805-igb_v3_b4-v10-0-9c86dc849c0d@google.com>
 <20260805094621.665d5ec0@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805094621.665d5ec0@shazbot.org>

On 2026-08-05 09:46 AM, Alex Williamson wrote:
> On Wed, 05 Aug 2026 00:20:57 +0000
> Josh Hilke <jrhilke@google.com> wrote:
> 
> > This v10 of a series which adds a VFIO selftest driver for the Intel
> > Gigabit Ethernet controller (IGB), specifically targeting the 82576
> > device. IGB is fully virtualized in QEMU, making it suitable for running
> > VFIO selftests without specialized hardware.
> 
> LGTM, passes on physical NIC.  Thanks for the re-spins.
> 
> David, do you want to double check and provide an Ack?  Thanks,
> 
> Alex

Acked-by: David Matlack <dmatlack@google.com>
