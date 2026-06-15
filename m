Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5740FD9B
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541931; cv=none; b=kmjyIn2pmo62SgI7+J7JU1+0/nMbHZqPHPRuzUGeJ2/TJIr/4jjjUhszz7krTFtaevpl6NoWL2VTAla1vIi0FInw5kSG1hC+2RS/SIthP/vLEk/MT1nCqaNwVs03OxtppfzZO6E+moA8IiPvRy5KmJJt0PIkHzv+h3k6RsdXnYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541931; c=relaxed/simple;
	bh=Am9Jq8ZPWVvsetHtt0SyO5DKTSf2oVvFUTTjrA5taFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAKndg7RYxwUc8+EbZ2RqY29C/yuwSE/6epEqArrb8HGggqD4ubiFa7snFLfB2EYupZYQOpp3qCWkZKgZ1KYmZ+8PkZm/a4Ln62Re7xQfZE8g1szYI/1o/ChAAc6NRoGWdGHXesMgmwAwAw0LSxlng0O5boxnLfGR5DMjIoP+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IzCPkZzF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IzCPkZzF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso32370105ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781541930; x=1782146730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5AymUI1dDecjLNnO9PnzUKcv1HNQ3H3YwtBEkoZtTw=;
        b=IzCPkZzF+4aBzIOKuRT6HgeEYcT06jZWUb9aibx6KubStCPYkufajKTPBT9bnqh84f
         qnHHc7IVhtDQT7jgTjJIz/UseEDiC8nnJ76Kodm0r0jYqpK8oB06kqdSQwkKLcYmFdYm
         iwN4nSeM6BH1FxVkgd3uqlRZIqVgy90puKP9TVoq57R6F23mPbzEcwFdSHXM83iGf6LN
         LCBFn9yfVz0TwEWw8xQXF+ZMmUJVAgD4SGhGaAdllmj1OdJte/I8PfYDEz4nVsRIVsXQ
         eU3E6jPnl+SvQE05FTE+1fe7BE1Ejg0yNDSMUuRUSs52Jz9A+/7rorpQj4rebrz44RrS
         LdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541930; x=1782146730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5AymUI1dDecjLNnO9PnzUKcv1HNQ3H3YwtBEkoZtTw=;
        b=qkbpTnvVC9z8JoyCIBTJ5usL2vhWcPq4Oqc0RrvtHklDGGZfTNDuJjeooDTn776NLj
         bo3Puq/8Kl6erysfQsl7AWN1VK0ZwBnuYiKpiVdfgHbpK63Clxba6bG/EuzFe7BURARt
         4HkI4o5SVjCI2zogKhbQlu4xu1lyz0XZR7jBmREld89SI26e24lNLxxaRQYw34nUv2LA
         LkckQ3Kc9pgtmLN/mHOqAQpN1Stkok0kMhgxXB5F7oGIMksRVQ7u0eaP/Awm9gN4NpRy
         evTEejI610yGYjuiK7pj+sbPf6qG4w6vnzHAR3++IHOIie+BnCe+ZTuYFEubadfp2fGN
         GmtA==
X-Forwarded-Encrypted: i=1; AFNElJ8e8h7cb6CyA3q8qyURsfS0GgFMJ7rgGOeVr8FFH4Y92N8Oc1W07M/cTzPjpPlUczg4nN3nie/lAGchzSUl5Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgXDw4n1F5cMT6FOJsxL/hHpjcn9+j/B+2XAkUe0LrOcsGoys
	+qGa1dLKK7Ce5KTRpGb/yuoDUIA5wQpx1SGeZM3A6fCxftI2wb4RAjZVtqNoSupiQA==
X-Gm-Gg: Acq92OF+gYt1vc8WYDO6qn9fUPlrYgmfkMy+udmVscoRL88rU3bYPS7/Bav/T30ssUX
	xED4U6NGt8/FnnOl2LopauYnLilyuwUXVUNycGDkAd2bVQPArQpuD2+G/tUpiQGLEbqRYFme3cR
	XElS0XkiQmKmQuCu67dZ5/p1hWa9lx3y7togno/Fm0eqm2arSBCtmr3jWxCIJWuuPVgTluTIHCX
	s+wOeR/O9jWUlP/IYa17pBQB5ehCLcXybn0irIviBgGy4AZo4TIR/i+34QFYVl2K4lDGo3FTD3i
	zMz6RjizBrDtu2akFHwHE/IfHB+e17A5bGJ20l8gSmdNiA97ZXahXRNRlvpQSZrgLEsfqdU+UqT
	FG1A5K2npITkUk332HtPPJKQJKfY1CR/OY0XLF+pPLp4sTNUdwTP0iMgfqvE0N0F2DwO+2p4h/S
	1JHztgCwLSdJYtDinNmdPX2IAJNWvDYAyhwNI7HIR9uqVt0MM5QvhFCuoXtYxRDA==
X-Received: by 2002:a17:902:e78f:b0:2c0:b7e1:7f08 with SMTP id d9443c01a7336-2c41235c53emr158816355ad.28.1781541929234;
        Mon, 15 Jun 2026 09:45:29 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm104582015ad.21.2026.06.15.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:45:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:45:25 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] selftests/vfio: avoid VLAs
Message-ID: <ajAsJXWxRQtkIaCf@google.com>
References: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v2-1-4e4df462908a@fb.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-scratch-amastro-vfio-selftests-avoid-vlas-v2-1-4e4df462908a@fb.com>

On 2026-06-15 08:47 AM, Alex Mastro wrote:

Please follow the local convention for shortlogs:

  vfio: selftests: Description of the commit

> Allocate VFIO ioctl requests dynamically instead of using VLAs. GCC 11.5.0
> rejects initialized VLAs with:
> 
>   error: variable-sized object may not be initialized
> 
> The replaced stack u8 arrays also do not guarantee native struct alignment
> for the aliased pointers.
> 
> Fixes: 19faf6fd969c ("vfio: selftests: Add a helper library for VFIO selftests")
> Fixes: 20face8c75ff ("vfio: selftests: Add helper to set/override a vf_token")
> Assisted-by: Codex:gpt-5.5-high
> Tested-by: Vipin Sharma <vipinsh@google.com>
> Reviewed-by: Vipin Sharma <vipinsh@google.com>
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> Changes in v2:
> - Reverse xmas tree variable ordering
> - Link to v1: https://patch.msgid.link/20260612-scratch-amastro-vfio-selftests-avoid-vlas-v1-1-ba3acb635f0a@fb.com
> 
> To: David Matlack <dmatlack@google.com>
> To: Alex Williamson <alex@shazbot.org>
> To: Shuah Khan <shuah@kernel.org>
> To: Raghavendra Rao Ananta <rananta@google.com>
> To: Vipin Sharma <vipinsh@google.com>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  tools/testing/selftests/vfio/lib/vfio_pci_device.c | 28 +++++++++++++---------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index 94dc5fcecbeb..c65d5ed33e51 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -30,13 +30,12 @@
>  static void vfio_pci_irq_set(struct vfio_pci_device *device,
>  			     u32 index, u32 vector, u32 count, int *fds)
>  {
> -	u8 buf[sizeof(struct vfio_irq_set) + sizeof(int) * count];
> -	struct vfio_irq_set *irq = (void *)&buf;
> -	int *irq_fds = (void *)&irq->data;
> +	size_t irq_size = sizeof(struct vfio_irq_set) + sizeof(int) * count;

optional nit: s/irq_size/argsz/ (same for vfio_device_feature_ioctl())

> +	struct vfio_irq_set *irq;
>  
> -	memset(buf, 0, sizeof(buf));
> -
> -	irq->argsz = sizeof(buf);
> +	irq = calloc(1, irq_size);
> +	VFIO_ASSERT_NOT_NULL(irq);

Could you add a precursor patch to add a calloc_assert() helper to
assert.h next to ioctl_assert() and snprintf_assert()? It looks like
there's quite a bit of code that repeats the
calloc()/VFIO_ASSERT_NOT_NULL() pattern.

> +	irq->argsz = irq_size;
>  	irq->flags = VFIO_IRQ_SET_ACTION_TRIGGER;
>  	irq->index = index;
>  	irq->start = vector;
> @@ -44,12 +43,13 @@ static void vfio_pci_irq_set(struct vfio_pci_device *device,
>  
>  	if (count) {
>  		irq->flags |= VFIO_IRQ_SET_DATA_EVENTFD;
> -		memcpy(irq_fds, fds, sizeof(int) * count);
> +		memcpy(irq->data, fds, sizeof(int) * count);
>  	} else {
>  		irq->flags |= VFIO_IRQ_SET_DATA_NONE;
>  	}
>  
>  	ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
> +	free(irq);
>  }
>  
>  void vfio_pci_irq_trigger(struct vfio_pci_device *device, u32 index, u32 vector)
> @@ -118,15 +118,21 @@ static void vfio_pci_irq_get(struct vfio_pci_device *device, u32 index,
>  static int vfio_device_feature_ioctl(int fd, u32 flags, void *data,
>  				     size_t data_size)
>  {
> -	u8 buffer[sizeof(struct vfio_device_feature) + data_size] = {};
> -	struct vfio_device_feature *feature = (void *)buffer;
> +	size_t feature_size = sizeof(struct vfio_device_feature) + data_size;
> +	struct vfio_device_feature *feature;
> +	int ret;
>  
> +	feature = calloc(1, feature_size);
> +	VFIO_ASSERT_NOT_NULL(feature);
>  	memcpy(feature->data, data, data_size);
>  
> -	feature->argsz = sizeof(buffer);
> +	feature->argsz = feature_size;
>  	feature->flags = flags;
>  
> -	return ioctl(fd, VFIO_DEVICE_FEATURE, feature);
> +	ret = ioctl(fd, VFIO_DEVICE_FEATURE, feature);
> +	free(feature);
> +
> +	return ret;
>  }
>  
>  static void vfio_device_feature_set(int fd, u16 feature, void *data, size_t data_size)
> 
> ---
> base-commit: a26b499b757cfc8bbff1088bb1b844639e250893
> change-id: 20260612-scratch-amastro-vfio-selftests-avoid-vlas-395eb3dcb3ab
> 
> Best regards,
> --  
> Alex Mastro <amastro@fb.com>
> 
