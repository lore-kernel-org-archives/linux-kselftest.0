Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658C9336EE1
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517016; cv=none; b=otr7g1Q9Np3c6tRZUZFtzqTzXzZMwPj4r9mfIjhKzjZMcLtlO/kdsdcMz0jVlX2zjNl+Ou/l90I6IXusKDx4UOiOIkEr8Qx9jpgBbxaCWV3ZOVyLnnEio2tS/NQo5vg+MGkVnPf/w8Zsc9+foO+ZX/AaoqyPtgq0DhOFzwY/fYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517016; c=relaxed/simple;
	bh=dYtpan+NvrAKEFDMvshQt8e4RqOzg6I2Ga9L5YfFh3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agcw4+SYsgYCG/tPFJkQfSQHDcDASUba4j/JuESlpcqSw2uxyJOaJq1AiHj8e+D9t4/d5W9qu61o5FODftL9rThotEClIMaJL9a6FzdAfea3Fxkep25RK0UAZBpX8lWJv8wGmltcP0qWvgiSJaghiqOsrgE0HyoQKhHZiJOYhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKhjNPaR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKhjNPaR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so2154412b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775517015; x=1776121815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DcLs8Uhgq4/4jyOLHzTqNDrLOx4pblWqu6j4JVjyvgc=;
        b=rKhjNPaRXhrr3iuxECcZbb+HAfI9RKWEYMPyEgMRHHdXX9zIOPVZDr0PbWGcaC1DkY
         kljrfEDHIGuX8yjzrZ3gb5NUzUJGWi1S/Q0CGqMpSYTvqeinq1p2EKqC9VPwxyhbO23B
         BNUMrA8sMZU0jntTzkOoKukMkoA69sKpjV90ztV6Xo/6XJcqF9w1Li7riFD9L3HfCGnK
         bIY0TvkTTCnuSEd36BrAhBuFLthJjQHsIcNlpSuE6OUsYucesAfrJIJEZiqFjnDv8lob
         sL/uc1NDumuO6IiesigqRAH9cSvHPOUIcX/q7wiwx9/r08iHpr9XCBL0Ho7RqQ7khUNw
         HktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517015; x=1776121815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcLs8Uhgq4/4jyOLHzTqNDrLOx4pblWqu6j4JVjyvgc=;
        b=QS+qzQDmEk/YkXYAcI4S56zcR4znPdAlVhPf0VMeJ/zTb1YCmYYW6JEPDwFjCCzk11
         Endp3DV3HYgfHkg/DtrYz1/bVMV5cAWptZd+yv/SHaueEPzSniq5084VVfHTh79i6bnA
         vLeeIb7kqg0B0rjCEUEOUYqd/FrZJ5UVYs0TKEqhDm/P3igE5e/SaROCXmV3hkvDP/Ak
         Vi8dkOUIzb7FMpe2J6bg1LGq4NqB3Lhh21G9sPes/CUUIcOy2wKB1TC08ix+0nVfkJOR
         h3jZQWXfCrmDJjYcVLE1zuAY/5wZiF5XnKEsw5CxSPSgLgXyhTEdE84nh8OBwwQgwa7j
         0LGA==
X-Forwarded-Encrypted: i=1; AJvYcCUFqif5H0JbzSOfxEgbbBf8+1PgS8OiYMRSahCHjFRKwfip7EEMcFeRLSGvNE70J06vaEXIzs4tNAPAvEr/XXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YySjyu73vUG8HEEgfm/QoKQRAn81qNwH/QY6K1JMGsjQjTnKnyD
	v4Uc5jklCjPC+NEn51g3PcmzPlSjRzURMIqsLh44Lr6BlOWp6niB0TTLU9B1dfDuqU3I6Ks1iyR
	VeTk2NoK6
X-Gm-Gg: AeBDieucJ3JP2KLNsdkrwEiPznkI7344cGdKvNvqGzKaKr3IdcZDYQtzTF3W7CW91Bi
	/3sRb37y9dObFYnXNSFG/Bpss99oOcUASrfiC4GDSXPTe4akij6S+zjn/uSkVSLrlH/YIb90OKc
	zkFPsrXO02NjT+Q7tOvX3n1k4jqDe53l97luHqe4HMZaGsn3IIC/zM6yF9LfPs4sDN6U4gZ9jr5
	FsYqAVWObJpiVSmH4sgwaTvVLA/ekx+W6YDd0pRyWJxImegUI1XdeFr9VU7lGkkiyF4t58D2fJG
	27NFCSYi+vtAUjTN0lHtuvM16MgfK+HIyaIEEyFCU69AC1m2Ipatfz2p5lo1HiCwxgMvP31M0c/
	MtoZPdUgWJNAdSmGw2uBwyJHPFay5hQmVPxe8zD5dcFde/HcdDmtHqJGJgAS7Z936wzSYTAiwS7
	W7A63nF2xSGTsUzbkAFM3qYeAtRhweo5PSsqTN3hV8TghaHX4DFyXJEHjeoReywQ==
X-Received: by 2002:a05:6a00:14c3:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82d0da8edccmr14036237b3a.19.1775517014393;
        Mon, 06 Apr 2026 16:10:14 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbf6sm16276871b3a.52.2026.04.06.16.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:10:13 -0700 (PDT)
Date: Mon, 6 Apr 2026 23:10:09 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] selftests/vfio: Add generic PCI command register
 helpers
Message-ID: <adQ9UUOy9-VmGIY_@google.com>
References: <20260403234444.350867-1-rubind@nvidia.com>
 <20260403234444.350867-3-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403234444.350867-3-rubind@nvidia.com>

On 2026-04-03 04:44 PM, Rubin Du wrote:

nit: Please use "vfio: selftests: " to match the rest of the VFIO
selftests commits.

  git log --oneline tools/testing/selftests/vfio

> Add vfio_pci_cmd_set()/vfio_pci_cmd_clear() read-modify-write macros
> for PCI_COMMAND in vfio_pci_device.h.
> 
> Signed-off-by: Rubin Du <rubind@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
