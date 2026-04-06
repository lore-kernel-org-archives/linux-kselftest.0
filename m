Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6038C40B
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775516905; cv=none; b=ilLy86lHigZBYPlEygkabLEaBDNfd7XcPKQ16v1vzHDYW3+2n5Mnt5wxZRb2b+9QXE3N4breqIq99JVWLirRNYGnz+HTSKUMvWoDsFSwP1nkNy2yPEEUY7AmP1DXVLA2cnEpjdAb+ojnw5Tmxs1RSqlvli+85nTLtSWH7N78ab0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775516905; c=relaxed/simple;
	bh=/a5Dkh8WNMLKekzLba+ss6TDeVCSPsEl9pPWQ8V9rkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+uKWtm+3aXhcyBIonzwxp49iz8Wet8Q8tw1wBSAm3rgJIHb4HFpn/eNlltKcxZgQ5lUxE1qL/l6V8zN4nlcKqkarzmhaqEQCY7A+e1fHDFytTINeEfVNvpf/ObqdzyeJykp3JM78RVpEyibXY6RZff2hXNrhxTVKdRWyO7BBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PImEbw3d; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PImEbw3d"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab232cc803so19073315ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775516904; x=1776121704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ5dWOM3uIstb5rK1L33RqJcuXkE4TKVzPfj3K/JoaA=;
        b=PImEbw3dbdtaCxZ9WQFMVDStl6vrLfB3lZhdZb3v72q4TB1UjYraIBXWBCRji+O/sH
         RxQIHEJ7CL0BKPm4Gkpkl/IX/XmREssjyJDSpD8ZN1+GNZOnYY+FTi8Bs/Px2TtAYTVj
         s3vhj58KiOXQP08yj4bwrqsMgo5gVonI4e0s03Bn3FRo1f7tl86t6bWKV4wpj5/qJl2F
         29Ev66+DXlCAgA5GV6LvkhnVwP0afSZ6tSIrNgC1nT5iCwhu8pN0DeQ7FDGQRpQQKv2p
         4uXOC4Cy6toBhm3NJUL3w+fdNtSs+Nv8Dp+e5isGNs5NAiYWDNmn6UAXL5FYNWpLs5Lf
         PPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775516904; x=1776121704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQ5dWOM3uIstb5rK1L33RqJcuXkE4TKVzPfj3K/JoaA=;
        b=nlCvkwwNXGjvAkzDEQHqkKqRd6Bp7NVifCkdRcQ0kkWIOp6Sw9sfyL0QssgdcXsVYZ
         9jV6KFtBhiHOtN7HbLDyRNcAupQE6nXLZ+zXBQ/dpqHeTZ/7eRnr1lY/z+2HACIW+7Sj
         RSvZn1WHacXR+SG9ThmNHyoYxkwctUO3PB8QNX4bVAt/usq2iRLQywoBl8ucmvY5d3b8
         dGT9jW3j1t5Bn86Om6O2n/XhWo4WfUEl17EPL7TYiN/XsOIW/i9wQVdfM9YuZoova5rW
         Zi6n69wLplqmnwV80rIkyb6apn9DeFj6YvtP/L6pwRCTx6lx8R4Y1f/dqo//uEjOJDOd
         JDbw==
X-Forwarded-Encrypted: i=1; AJvYcCXphUYbdQjNmrkoV3Zbjrg0/lDrjLnDUlsu1vpzU/hvz4CAL0pbCuiURIgm26+Q32LSRZPlQmGV3cO3bu8ZT0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8oiel/7k+jIU6lcXUC6fBdIH4CG2mU6Hn8HWHkHApRkt83yQ
	ZnlQhnJjBWlC7V8cnEup/N7CNrITo4NO09VQBpmn2scMaP5rpdFU2y8u1ZgGsIEQ7w==
X-Gm-Gg: AeBDieuR+PGIsw7hOv+w/rp6gu17Is3Vv5vNnHODHCmarI8ubjoL0Nj7MyUjpjUPvaW
	Tram00xMuXjnSk585N86F9py+u/sniVwPlVHevnoJ57eutHWjlaVotydYoi0CcO1refWBIy3cTm
	/nxA5JyWpb1jpzN5UXB5OliTWhMlErvBq/HCbeyiLKftRFhCkWvIHpTnFj1cDNhpY5KdkjqsJOq
	F/aCfOHCSG8i2w0JzGWnsFXkx3sUfkBRIBOw+1OnjH+/MbUSpBy7vKL3smhYP1E54SkxGK0vRrq
	c092oBsgKFgTSJrWsCYZktuvzwbnET1FBj/ld5n/dBoIyFvQO8UCVEAwBoANQYu9ffBjFuVvUQV
	Clw1paUMNz2/8Q5/Jx/Tb6iSYZIJKXKbj0sz116BeH+7Yf1k+65tIpiojUi/jKE2XYHQ6ppV80s
	QEd3/VbctARvmkDofz/4YfYZr5XlWi3TMDJOHhg66zayoXy4AFMbbOnWNcSNCrcr2Ol8w+eOTF
X-Received: by 2002:a17:902:ccc9:b0:2b2:4a31:235 with SMTP id d9443c01a7336-2b2818b006fmr141475565ad.26.1775516903557;
        Mon, 06 Apr 2026 16:08:23 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a348esm162239185ad.57.2026.04.06.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:08:22 -0700 (PDT)
Date: Mon, 6 Apr 2026 23:08:18 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/4] selftests/vfio: Add memcpy chunking to
 vfio_pci_driver_memcpy()
Message-ID: <adQ84lY4fLs_MCsU@google.com>
References: <20260403234444.350867-1-rubind@nvidia.com>
 <20260403234444.350867-2-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403234444.350867-2-rubind@nvidia.com>

On 2026-04-03 04:44 PM, Rubin Du wrote:
> Add a chunking loop to vfio_pci_driver_memcpy() so that it breaks up
> large memcpy requests into max_memcpy_size-sized chunks. This allows
> callers to request any size without worrying about per-driver limits.
> The memcpy_start()/memcpy_wait() semantics are unchanged.
> 
> Update the test to use 4x max_memcpy_size so it exercises the new
> chunking path (4 iterations) while keeping execution fast for drivers
> with small DMA transfer sizes.
> 
> Signed-off-by: Rubin Du <rubind@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
