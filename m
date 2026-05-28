Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830233342C
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994785; cv=none; b=OUXpeQA24/WJnq4ZQvDHDoFzIgGOqmCZqLwSagkKjDGuLTbRwccTHNzsFgJst4Wj/+4V4rgr4blq/RZ/JGCcwiD8ByPxTyhgHM5ucp0vV2q1mDJRj1S3f6VvP8SL4zUA08HvgsKt/EqNgFLcnipwlUMwhA+HF5kw7Cw3/kFSa5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994785; c=relaxed/simple;
	bh=K+u3BaAhGcvOwP6Hri5H/3Q3PATtfO+X6e86JxPROrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYSsCTklRtLc9Z0Knc6dtTVw0uUvKeyB/MnhEDNBkGT/Bvp3+ePMk7l+ZYPiM1CKbJaTJjTSY2H1VX6z5E2F4/BZf6HcnNB/xYTjuLZ/xzHsmdksjF+ZKPYXO98dlNB2Iry/obpwOnCSvvKmHqcx60PRLieCoawE5IBugwwYcV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPmEL+fV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPmEL+fV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so6727491b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779994782; x=1780599582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2ZUBuHYLFWaBCKcO06WPiLzxJQqwEviAmU64GiN9ok=;
        b=tPmEL+fVHSrGRYBfCJcVg3KCj+ESdSPwsJ+dQSLrg/rIO2ss3m/6+ePSbybnXOxqs5
         i9rkUFw+8+PvxNJqwZn/Jz1r0EtOa4EGZ5PmranxCn7LpN9Lx1lgqPMF5i9Pl4gIEJyp
         tdacW7QZ9tIG2BM3SmfJ4y1RbXG2dReefH5XyHKS32tG62lo7jNDgIT/+ETT3eOBhOO0
         oZWyoPH20vz/i7TTo7GcN0WUiHLOpZ0L7RiYr+dPLilrw0GhZlD0MfHihql+nS0N6V2z
         QwGcofRsG1Z+fKDuuGyt7wBYw23r8bD1CahfGKDhF7Axr/dfA3jMJK5JAh3/HKu+IR5i
         fE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994782; x=1780599582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2ZUBuHYLFWaBCKcO06WPiLzxJQqwEviAmU64GiN9ok=;
        b=dnp2jo8xbNF8FVlySe3z5eaNX9ld2+KqT7+QWffoIyQ1x3mRUAhE4Wx5DQ8eHvvpLe
         gXFDy1VPi3Wnx83NPca/u0XG48Zoxjz4odpO9ymx1HesI5FZ0RWP7d2nfzZDLmL61fHO
         2bsY6F+ngRbFwZBN/45oIx0iNyCyRgPGwmZAkGgi5jfJ5GWZTTcHKVw3iN0purl0mmeN
         u1qOFxJKKiBkdCjyvGIwF3fQsXpjiy9GisgFgkl+UL6XaL9yQ40kjr5YQ0n06MbqqUrM
         RPLvYknkoyYcidQVzoD0CCW0foX9895zdWbzk81LVXKGYaGXKmUmxCSTIKM8PoA5XaV1
         Y67w==
X-Forwarded-Encrypted: i=1; AFNElJ/fhF+uU6kB6uMgoa8nxZa2Swr6l5ccnf4C971S5/d4goEOunJyAGuuAwfL/CSxZR/o2dwLXXcqizgT4E3EVhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8dEG5lKe7tcpXQQqR1DmYyWt0ZHVKQP7ZoLGJENxc67K5dqA
	1H/60Bik3+uEhxcI8H5+G+HnPBcD708Vk723GdE1n7RDoWwFQVNZpE/S6vJ+NNIpVA==
X-Gm-Gg: Acq92OFUqR5DsQJnkt1dv2/ybUgNkm0ZdsldkkvMONf4CLdjnAEfYPHO4maMx2LJTB3
	pB0ifxsG7rdL32hY1dIUtjTtVTjjXOEXMW6/6p69iZXMblaPc/IM1HwNqwyIROAHkLkiv7vqDJb
	NPpsh1pS5YGhV6YxgP+/o5HjanxsG6cjhM9xsyqmW9VmPQEemFEXfq9ApSDZjyNM+z1ihT+Dhy0
	Ifq2bG/suAGqkzvcuNgm1lZN+S3Q4wUhOwjU+HHk0d7iAnyz7vswG1amTrDm5WsnOE8AqdhvxpN
	F4j6c54K5CeS7Y6BmEy2pcfRXJBgKCP7bTd+zrbPzwOmh0jXWY7zgRjR2r6sHj0aqDk7Ho7rrOt
	CL5w7rgusC18Zbf8i//4LQorFrd5beKG5GYbd/rGA09r3aisKjeI45kLQ9xpcpcTkhIRZ2hTB19
	73H8qAi0ZskD/gRpY6/3DvQh4Gy1jpVftEggm1hOQI//PyDwnXKTLyLrZCdPoEQ9XA/rVGeae3
X-Received: by 2002:a05:6a00:9099:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-8420c4b6859mr239429b3a.25.1779994781790;
        Thu, 28 May 2026 11:59:41 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70bb654sm7090146b3a.29.2026.05.28.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:59:41 -0700 (PDT)
Date: Thu, 28 May 2026 18:59:38 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v2 07/11] vfio: selftests: Allow drivers to specify
 required region size
Message-ID: <ahiQmnWscsbWPqRo@google.com>
References: <0-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
 <7-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v2-72e9640932fd+2c64-mlx5st_jgg@nvidia.com>

On 2026-05-15 02:30 PM, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. The core code will round up and minimize it to SZ_2M so as not to
> change any test behavior.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c         | 1 +
>  tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c       | 1 +
>  .../selftests/vfio/lib/include/libvfio/vfio_pci_driver.h   | 6 ++++++
>  tools/testing/selftests/vfio/vfio_pci_driver_test.c        | 7 ++++++-
>  4 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
> index 19d9630b24c23f..40b8541b588eee 100644
> --- a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
> +++ b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
> @@ -418,6 +418,7 @@ static void dsa_send_msi(struct vfio_pci_device *device)
>  
>  const struct vfio_pci_driver_ops dsa_ops = {
>  	.name = "dsa",
> +	.region_size = sizeof(struct dsa_state),
>  	.probe = dsa_probe,
>  	.init = dsa_init,
>  	.remove = dsa_remove,
> diff --git a/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c b/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
> index a871b935542bad..c9b28365c5eb6b 100644
> --- a/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
> +++ b/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
> @@ -226,6 +226,7 @@ static void ioat_send_msi(struct vfio_pci_device *device)
>  
>  const struct vfio_pci_driver_ops ioat_ops = {
>  	.name = "ioat",
> +	.region_size = sizeof(struct ioat_state),
>  	.probe = ioat_probe,
>  	.init = ioat_init,
>  	.remove = ioat_remove,
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
> index e5ada209b1d102..547369c5cff95a 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
> @@ -9,6 +9,12 @@ struct vfio_pci_device;
>  struct vfio_pci_driver_ops {
>  	const char *name;
>  
> +	/*
> +	 * Size of the driver's state structure overlaid on
> +	 * device->driver.region.vaddr
> +	 */
> +	u64 region_size;
> +
>  	/**
>  	 * @probe() - Check if the driver supports the given device.
>  	 *
> diff --git a/tools/testing/selftests/vfio/vfio_pci_driver_test.c b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> index afa0480ddd9b2a..5a46800cde4c8d 100644
> --- a/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> +++ b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> @@ -2,6 +2,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/mman.h>
>  
> +#include <linux/log2.h>
>  #include <linux/sizes.h>
>  #include <linux/vfio.h>
>  
> @@ -80,7 +81,11 @@ FIXTURE_SETUP(vfio_pci_driver_test)
>  	driver = &self->device->driver;
>  
>  	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_1G);
> -	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
> +
> +	VFIO_ASSERT_NE(driver->ops->region_size, 0);
> +	region_setup(self->iommu, self->iova_allocator, &driver->region,
> +		     max_t(u64, roundup_pow_of_two(driver->ops->region_size),
> +			   SZ_2M));

We have some other upcoming tests that want to set up the driver region, so it
would be nice to move this into the library.

  * https://lore.kernel.org/kvm/20260511234802.2280368-17-vipinsh@google.com/
  * https://lore.kernel.org/kvm/20260421231557.1254270-8-jrhilke@google.com/

What about something like this?

diff --git a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
index 19d9630b24c2..40b8541b588e 100644
--- a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
+++ b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
@@ -418,6 +418,7 @@ static void dsa_send_msi(struct vfio_pci_device *device)

 const struct vfio_pci_driver_ops dsa_ops = {
        .name = "dsa",
+       .region_size = sizeof(struct dsa_state),
        .probe = dsa_probe,
        .init = dsa_init,
        .remove = dsa_remove,
diff --git a/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c b/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
index a871b935542b..c9b28365c5eb 100644
--- a/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
+++ b/tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c
@@ -226,6 +226,7 @@ static void ioat_send_msi(struct vfio_pci_device *device)

 const struct vfio_pci_driver_ops ioat_ops = {
        .name = "ioat",
+       .region_size = sizeof(struct ioat_state),
        .probe = ioat_probe,
        .init = ioat_init,
        .remove = ioat_remove,
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
index e5ada209b1d1..547369c5cff9 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
@@ -9,6 +9,12 @@ struct vfio_pci_device;
 struct vfio_pci_driver_ops {
        const char *name;

+       /*
+        * Size of the driver's state structure overlaid on
+        * device->driver.region.vaddr
+        */
+       u64 region_size;
+
        /**
         * @probe() - Check if the driver supports the given device.
         *
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
index 6827f4a6febe..c70c22b1a86c 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
@@ -28,6 +28,9 @@ void vfio_pci_driver_probe(struct vfio_pci_device *device)
                        continue;

                device->driver.ops = ops;
+
+               VFIO_ASSERT_NE(ops->region_size, 0);
+               device->driver.region.size = roundup(ops->region_size, getpagesize());
        }
 }

diff --git a/tools/testing/selftests/vfio/vfio_pci_driver_test.c b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
index afa0480ddd9b..36d977542274 100644
--- a/tools/testing/selftests/vfio/vfio_pci_driver_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
@@ -80,7 +80,7 @@ FIXTURE_SETUP(vfio_pci_driver_test)
        driver = &self->device->driver;

        region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_1G);
-       region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
+       region_setup(self->iommu, self->iova_allocator, &driver->region, driver->region.size);

        /* Any IOVA that doesn't overlap memcpy_region and driver->region. */
        self->unmapped_iova = iova_allocator_alloc(self->iova_allocator, SZ_1G);

>  
>  	/* Any IOVA that doesn't overlap memcpy_region and driver->region. */
>  	self->unmapped_iova = iova_allocator_alloc(self->iova_allocator, SZ_1G);
> -- 
> 2.43.0
> 
