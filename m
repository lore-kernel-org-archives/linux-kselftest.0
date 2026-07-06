Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90B43C7D8
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371790; cv=none; b=cKE1+kAhifLLaaLVZvxHZxGxCg48PLHHvVrvWivsjHsiUsl+RgbC4DFlaiMvCss9nEnm4XUCsB2mmL/i1e2KyTnKrxvTLpGx7hqHSjJIWQkmvYE1ZeBtcIwO4n/g+YXXHAIFaZQ/FmlG+iw7OLeWb1qxRq9aHl6or/SkD1oId9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371790; c=relaxed/simple;
	bh=fRwVRAmzazXUDn32KSeqZ5ViQIt0hag1CTDsltSIb9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQlTyvVNTEZff9HF/ErTl0hfVg5fGYA3aNA1PbVv3T1NS4uX/EsYYA1HlXUZJ0hxCgYS9oBXDqu5lAwBW259POn5LF3/hCrel661PcqqT+/ydEm1zcoEJaN+lp3ZV2Q9QtGUXumbTzgxH6CwGEBzpS9T6wgjeg25AhTw60jOIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XyFFul4N; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XyFFul4N"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2243319a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783371788; x=1783976588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCewW54bhoxJS9ZE+EEQyKSlMWHdo4kMqBhJSyC7fA=;
        b=XyFFul4NVqYYqAss5c0IilFj4FXi7EWrPY6HBItGy7gxNAGmOG4Icnlt0woRQL6PwA
         vP5Z7TkKAQ7+9Z51X2DoJf30VnR/3oeWIYahENBV0m5sGxpf+3Ytr7u6BW3aXyu7hhSf
         cYZl7qPuxkZ2sDUeTWlrqsetDfITGpXluA6ExnP4EzM0bqBFu0JmYLlolfY5mWLGQyJu
         oOuAMXSRpDYNEjuw57dPZ1icP0bkYslKKLKLBqPMgO/GBoY0z/S7eB+FkOvjEO7bLa2G
         6+WcTaaPZcwkmLuEzE5cmv8OFJr4WJQZ49WsYsrsI9XuBqW8elxbGAf5yKUz1C+vsHSc
         2YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371788; x=1783976588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hCewW54bhoxJS9ZE+EEQyKSlMWHdo4kMqBhJSyC7fA=;
        b=mAcZV9pREIc25O50EmBJZ/30NhsSQWSL09vEXF68ft89GKZeZ67iXZUlCvSwD9JB0m
         S0xf4GFimmNFFD9xb65ZhxI3jp48+EA+OBnXasu3ERtgXzdtMZNmseFTKH41UKfNS35u
         Hd22UZRB90Kcg35jBMSdf51R5Y6i9D32djnRpiuW20xZhSgfaMpFIe+UK9z6R9mkbYBp
         UZseaOofgt7+P0bfEcp9Unx+UkQlHN3Dnco/D2M7yfxqXN1Fe8GfQjjPQVRoRHj+aw3a
         WDHV14s9JmjVFT3pfdbzmFhn/JbjgiQlRVqCv1AAsNE5zWG50fX2VgV4SLUTbj2Sp99d
         weGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh6V91gizuZYLesRp32eSfpF4movfyI+UoZjFpwtKJOeOvvRdRERlE5WvPNxzr/ixOx4PgtbnCxqctfGUce/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0rfdHYhlexc/1hX/wx02d9SoBBJ/prhxWzA4yW2oI4eGZxkQ
	hwGcU9k4tiwBAnB53+uLlZm7GPGnsVjnuTV7Y0vGeDZHS1+T+/IXNGi4Ylwwhj3Ltw==
X-Gm-Gg: AfdE7cnAN94xXrJ94/hd+G2/JxbpKgtgEhYQJPuDc5BpSEjkdT1gm7iG1H2EK+ferVc
	AcoJPIHLPGzMNWSWkbmL5Zof/RrUfWoKmhr0ev9ozHf6l2C4WbyyoZBAC//8itdT76sxC80FL8x
	fUfgdd6C3+36DVgqTKlKNI62kKhfDIN+paE0dQbXkVvYSoND57hcsI75aOcs8k5r15SzO2j0WT3
	mj44TlqE3XjVvA3tq7R8bQK03VcsXcE6R0tWIjpj0gSr7hAbXsSWSl04ZNQYVMprf4sQN9fh95c
	i4OSkBqnAammn+vMwaLspnfSPs7yZDQi6D2ufo6jvs3FKi5QDIq0vmIFXlTv2VbdH6ORhhX5ara
	fyVaija7bxYHlvSstnOO0+rCveMDqiiqbaDqTosO3CV9qhGVGole31Y5EDAOjFMKOqM/fCStpLU
	eghWzeuB/gojn/qQvnQUzQhRqU4Zzg5vK7sVQuwaSWEzNIkFW+lTM=
X-Received: by 2002:a17:90b:51cf:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-38755d40263mr2591393a91.13.1783371784418;
        Mon, 06 Jul 2026 14:03:04 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3d66036sm146a91.17.2026.07.06.14.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:03:03 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:03:01 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v2 07/10] selftests/vfio: Add vfio_pci_irq_reenable()
 helper
Message-ID: <akwYBagw3pFsN0Mt@google.com>
References: <20260526235417.2058313-1-jrhilke@google.com>
 <20260526235417.2058313-8-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526235417.2058313-8-jrhilke@google.com>

On 2026-05-26 11:54 PM, Josh Hilke wrote:
> From: Alex Williamson <alex.williamson@nvidia.com>
> 
> Selftest drivers that recover from a fault by issuing VFIO_DEVICE_RESET
> need to re-arm device interrupts afterwards.  VFIO_DEVICE_RESET tears
> down the kernel-side IRQ trigger so a subsequent VFIO_DEVICE_SET_IRQS
> is required, but the user-side eventfds (and any fd cached in a test
> fixture) are still valid and must be preserved.
> 
> vfio_pci_irq_enable() refuses to be called for vectors that already
> have an eventfd (VFIO_ASSERT_LT), and vfio_pci_irq_disable() closes
> all eventfds before resetting the trigger, so neither is suitable.
> 
> Add vfio_pci_irq_reenable(device, index, vector, count) which asserts
> that the requested range has existing eventfds and re-issues
> VFIO_DEVICE_SET_IRQS using them.  Signature mirrors vfio_pci_irq_enable().
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>
> ---
>  .../lib/include/libvfio/vfio_pci_device.h     |  2 ++
>  .../selftests/vfio/lib/vfio_pci_device.c      | 22 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index 2858885a89bb..a362e2b2bfda 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -68,6 +68,8 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
>  void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
>  			 u32 vector, int count);
>  void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
> +void vfio_pci_irq_reenable(struct vfio_pci_device *device, u32 index,
> +			   u32 vector, int count);

Let's add vfio_pci_msi{,x}_reenable() static inline wrappers below
alongside the existing enable/disable wrappers. And use the msix helper
in the next driver patch for consistency.

>  void vfio_pci_irq_trigger(struct vfio_pci_device *device, u32 index, u32 vector);
>  
>  static inline void fcntl_set_nonblock(int fd)
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index fc75e04ef010..7b8394d0ac50 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -106,6 +106,28 @@ void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index)
>  	vfio_pci_irq_set(device, index, 0, 0, NULL);
>  }
>  
> +/*
> + * Re-issue VFIO_DEVICE_SET_IRQS for an already-enabled vector range using
> + * the existing eventfds.  Intended for drivers that need to re-arm device
> + * interrupts after a VFIO_DEVICE_RESET, which tears down the kernel-side
> + * IRQ trigger but leaves user-side eventfds intact.  Recreating the
> + * eventfds would invalidate any test-fixture cache of the fd, so this
> + * helper deliberately preserves them.
> + */
> +void vfio_pci_irq_reenable(struct vfio_pci_device *device, u32 index,
> +			   u32 vector, int count)
> +{
> +	int i;
> +
> +	check_supported_irq_index(index);
> +
> +	for (i = vector; i < vector + count; i++)
> +		VFIO_ASSERT_GE(device->msi_eventfds[i], 0,
> +			       "vector %d eventfd not allocated\n", i);
> +
> +	vfio_pci_irq_set(device, index, vector, count, device->msi_eventfds + vector);
> +}
> +
>  static void vfio_pci_irq_get(struct vfio_pci_device *device, u32 index,
>  			     struct vfio_irq_info *irq_info)
>  {
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 
