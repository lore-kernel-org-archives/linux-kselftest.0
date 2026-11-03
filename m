Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667278;
	b=CsMUQhLpZlgvqrYRXiEoFjqWJYOVpJ+dSi7tEAH8mHwbFfKtEC/jrB4nGNx8L9JVEnMr
	 0wwoGD4WyXRbtzwxPFRBBkNmiTzDP448lGyGnB57lccQ4hjCTRSEkLNSq5TuCqmxmDjoW
	 tOge0rmZZkpXLughTeDOUemHPDfP/K7ZvjXe7RWb4hdQoQpj89rtANJ05aiCV8eD0CoQM
	 6KjuP30kddmwgCr9OupE1C2IXZCQwizWUmFL3nH1S8RtrCFTZxPzyz6ovJqYYxx4PEZD6
	 +ruiSKSOqzAdnlyYH16YynQNh0uf18CyWsILmP/rD8YpNbJfcyvhI0sL2EBtKNCUS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
	b=R2jrsDZmmEOHbfyskz9aXj/MGjjtaVuRNknXgBLecESv4cI4vHvDn4pwyiCBfryS2pn8
	 S3RPIw0ihiXSPYwa6UMbC9kq+EJKZqzVfhag1fCOFBt5Oa8x9ITmDXEX/p5fR7zmfZtpk
	 D2/X38ILaPtTCPR4CWl8mIpmMSW7X9hC5kSf8uaKmWS/QE9LwGDX2jzHlyJj9QYuYgb/d
	 0k3cNZz6BmKm3LWnmVSfpST6ILtl6XKtnYd3NGPzDUSyjxPt+gXlt1+ZFTeWEw/DC6Hpq
	 ddSG9E4HUVNLWArwv0CAb0fReMoD4w3GEczINC5OHZBw7CiogbCo7OtLUkrZfFWDGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KviEatYT;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B832606A324
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 00:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B832606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KviEatYT
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so898461a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 16:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667278; x=1794272078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
        b=KviEatYTCIe1F1JARjiYMmm0IkQvlTlh+vAksjy3ez66bujdFRZbGuoM22a/8Df7GQ
         dqAiaJJ/eSXd71fyyfygKa7D0On0JxLQ0AVk7/auMm8Nwv1MpiNehNqGFXkZm8/tg8H6
         NzKyLzB9UagV8slm6uiWZAs2IAvfv7bLeDFkqMz7BqxtLMFWHiGesb3XBkUkxlT75Cid
         pVxRQTB+8Wh3DjZjHfbsVFhcJfyd+h4aSCKeGkMOgLDxBWw4JGFYyyybHcOtIgNM9f8t
         zjEjQI0iouSAbFxd33BQhSTXw9isYjuyz1kwVKh1+TLV06gCTVYOSDoqZbT8YId59zo2
         gqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667278; x=1794272078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
        b=KOli/UOkb9jMBImh3ncZB6YpgyHNABJm222CfFr3sNSvz1dqIliQWlb7cOK83UJo01
         xVdKvEpbc+JAtdU1VE7VH6jaqkErrflYlm1m4HSAwZUsxrMYpkihy9/Oa9c6ZNirSm5H
         3j29h4ea5QSq1XSm+2WM6UdRqykRxBM+m4G//OnSx3vysEJWZqJY+mqvOdpnr4uInrGk
         ImDQ4TJhGQHaGsaADiqe6n1xBWjH5bYbxvMiQ80nOruaTcVtn076bNXoTE4bPps4BKxU
         2WhRPXD7z32L/k1mtMFJIW7/WTHFI5Mtx9+kkDp/CY/DJpD9yy473vsWIbBB3uX6cNai
         kTKg==
X-Forwarded-Encrypted: i=1; AKwUvBytSL3QGxblmXDnOU13csdepF55RGqRVB2xpgPD7ThEysu1WWeqEQxSHsyRoC13wE0ncvhkMiyhO9E//jLjzNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9DKlew8xG5k8GblinUOKwwKR8W+VMNWgbXvsh8V16vdFyAkcL
	i6seS742Mz+6DIckvLGrRVS+kD5YQGJHnx3Veyl0YZedheSarr0qLXAURAx8mWXDgA==
X-Gm-Gg: AYBFou2MybPMeiyxnWXoimiaMO7nTUmwRqpvfE0P7jWBjxFVYQHS+oML6+5Dy5+and9
	1uCWrks0PVtRFXxl+nSM24kMM4quXhoHqD9WyRZpLv+4JaT1DACn6PhBr8ZvM1lsULOaqXVhZi2
	pyu6SO2Rc1jpF1APe+OsdjzYAK/9ZihKLLPHKlIaSoN0IxZ6ggBeA5mZOc/87UM14YHO2JFnJBC
	Yg4LK+u1k01G3Zv56o5W9vxjPSxzD/bu3xE7jvBXg14iyfiNsacY4jHpH212Ri0IeoQU2csKVqY
	mjw1XgD9seOnbdy49JppFDN3YvUjBSFytdrRDp2y2lBfMxRDZzuIxO3TRcsbITvc4cMl7kqFHyk
	uocJfXeCSbcosYmNXhRm93jvmjQJXkXp4WHz6dgLgIS7CqU4PKEGpw7vQ269fMKIJankw7AFf3O
	duuLarHe68/WxPMIG6Xc5RP6qEBzh0uUDJ40Vdw/NxphKp3tJ9DhRtiyIPwQEIZt3WT0xx8V2vx
	bzyF60B7PrZCli5j21zZByOYjSSeLC0xYw4mmsovHoENusO/ysiJmLsMktWCBXgItN/TLnzLfQe
	EK818YlUherZb8ZORJWR3SIQAFSfR9s3oVtUYKSvqpV1F948SlmfX5VWbx+8SfLSTw==
X-Received: by 2002:a17:90b:590d:b0:3ad:1da4:2ddf with SMTP id 98e67ed59e1d1-3ae8980ed29mr8608648a91.51.1793667277032;
        Mon, 02 Nov 2026 16:54:37 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm10260602a91.0.2026.11.02.16.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:54:36 -0800 (PST)
Date: Tue, 3 Nov 2026 00:54:32 +0000
From: David Matlack <dmatlack@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>,
	Matt Evans <matt@ozlabs.org>
Subject: Re: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar()
 helper
Message-ID: <aukwyHVkAXGEFI0E@google.com>
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-3-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102230445.3993629-3-almasrymina@google.com>

On 2026-11-02 11:04 PM, Mina Almasry wrote:
> Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
> a BAR) of at least min_size bytes that behaves like ordinary memory and
> can be safely read and written without device-specific side effects.
> 
> Detection is backed by a table of known devices, starting with QEMU's
> pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
> membar-backed=on.
> 
> Suggested-by: David Matlack <dmatlack@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Matt Evans <matt@ozlabs.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
