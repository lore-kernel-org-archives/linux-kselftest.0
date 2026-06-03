Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD13AB298
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497988; cv=none; b=Sxa92JOvtnivY90Gdk4ER0s4/BRR7ea777mfIvA7FgoEPR6xJ87/GAtb/ZRXZAIjKtd0sR4BEJlGvsNXHJNdALqraELawYmvT+pBA68qTXOE35EtODeNJizXxDTooVkDY1SqHZucNSCJdRyOc7xzJkg9F2HekMRVhUB/gDpVxMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497988; c=relaxed/simple;
	bh=tGBk5L1oFJO/P+xtNYGuto+/t9YS1RPiu3G+FYN7QOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yyt3mJH/WrFy7rHuwXDHqbf1HcldqurgUcERVIOKngYVfkKcEBMRu2XAt0Au8Kll2c/P79mYhxeFATtBz0dYSAu64dEMvwZFp+a1QjMDyy3t1kxPY9hELNHvDK2cJYayLZfzPq0OFpZmY90QPsA0uQfhG2B8SRLnBEdD029FAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoWtrtJV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoWtrtJV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b1a48855so93715ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780497987; x=1781102787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqOHLB4Z8uMw84hLhaHogABPafTAVpzk9ZFgr9w7mCY=;
        b=SoWtrtJVqrXsTT+Cess/JBvK4M6QDeXs3UAodrfgBVWhYUHRp/0gR6QPJTIFS6wBfP
         8Uaykh5/SmBpTNzNrIHWzrzMazkMoilYuWE2UXLqvmUUCb2+izBrUu654U530AFNYjQq
         Sbzf+7L/4fHR2aD5Gg18WMuQZGIR2OIbnnoA9nrqdOkjcy9k0Dn9kZlYzURJChUthsDu
         b67C1stUrFARIcrp081Lzn/bTbwZLyoJiDwnPlG7QFqEMCzTqDDWR2mLpbLDVvOUowk5
         0aYkRqCyx73xwJNvWrXw9RPuAVsy4U5xfmRoTktgX18AxXrYBKyJxjuh48hYMnq19MpS
         nP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497987; x=1781102787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqOHLB4Z8uMw84hLhaHogABPafTAVpzk9ZFgr9w7mCY=;
        b=l49irJW2JZHKyRt5a0QV4uIIQzu8UB01G55B4qKWKqY5Z8uhyBSp3TXo6qHzW3Nn4n
         WzUPDWwY0I5pPEI868/he34H1uTC0OTJOzdR3RAp+mabPzo3CazZLrvS0F3tu0uEAzVI
         lytz/p6UuzGpmXBwvAbURTAlJJt2f3+pQD+8CigBF4VgCy/Ngm/kcXQRYRoWOiLSvqjo
         M8BqKCZuQU7WDNptAHaCwM+mXGxNpsaLFwHFxt7/WsNzz0z2R3RZvFFFwEPYl7PsHwXK
         Rnfb+wJpbe/Lax4knxFNtXGa6ctx0N8kbq6wzkrlz7mb3qOT5wpJMQhog9mPitL9kDiC
         HUyA==
X-Forwarded-Encrypted: i=1; AFNElJ88wUSUf3eX/G1w0I4IwTv64v4XksNtoZ9rd2EMevyBOsI1Y4JZeFnde8BinEzQnnO0nfx0UciT2acDKSyrKGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0Ao+AQQIDzEc7vLC9alOU0/0FGYvZSlwq7+1aCB8H/DxUNGQ
	/IBv/XiJcPM7Q4aOmD785FCxIVAt4fr5/EkFmRlhHCg/kWPjlOy0BNb9mroE0sySKQ==
X-Gm-Gg: Acq92OHizQG80YNgeF3Laj3NznVbNnTgLMeC4y9yhkSJVXPgc1f3ieSEkn4oOP+qxZC
	6kwUWu6WcFsfC0Jt8Fw7WgKFuWZHdY7f7pxyvRdoLamlOin9szXO82u7jmQ/Y0d2DboPxqiyUvZ
	EfKHB5fizXapLAls3tcDHzoAaCQHluQarDzyTECKrvU6RWMQDnjE+SVS0AQE4y1+dzqkKcAps0t
	2IoYEcRTtjL5jte5cughiuVekmSJoEVca+hOq9UY0gqmsBe1824QzqOG9w/zuj91VgM47iyJ/XT
	LdSiU7As5ZTBS+cD2Kv+8lY20zMysm0ui5C2m7cFEJDhRaKk0/w9uFbKY+wKP97+iP8O1VAdaoj
	NlLKHxsvFSGjtaIMRnSxKqVyHoCmcscfLlOYXkI7YlV2tM9074fR/Y9Aw8sGp8Dxx/r3Ml3c+O6
	5Uz3pHifwYIneQGHd/nieYJka0Mrd/2rtSLFW9MhpG1QzBMgTyOoxUkJB8g2HvgPc+o5tPyGM=
X-Received: by 2002:a17:902:c408:b0:2c1:5756:1230 with SMTP id d9443c01a7336-2c16bf60842mr2091185ad.0.1780497986471;
        Wed, 03 Jun 2026 07:46:26 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm3185925b3a.29.2026.06.03.07.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:46:25 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:46:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 7/7] iommufd/selftest: Cover invalid read counts on
 vEVENTQ FD
Message-ID: <aiA-POwZ8KT2ijUV@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <7bcd153d306f2cf04c094c728c0ebe146855072a.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bcd153d306f2cf04c094c728c0ebe146855072a.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:38PM -0700, Nicolin Chen wrote:
> The vEVENTQ file descriptor must reject reads whose buffer cannot hold
> even one event record. Add selftest coverage that exercises both the
> empty-queue path (the upfront size check) and the non-empty path (the
> in-loop check that fires only after an event is fetched).
> 
> For iommufd_veventq_fops_read():
>  - count == 0 and count < sizeof(header) on an empty vEVENTQ both
>    return -EINVAL.
>  - count == 0 and count == sizeof(header) on a non-empty vEVENTQ
>    (event has trailing payload) both return -EINVAL.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
