Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614140E8D6
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572698; cv=none; b=sS7u2E+UwKxAosReCYgYuHbGrjo7qCbvEtH2oiJBcs+/o+cyQ9bx3l5uPcPm/X8aCFuGbz9unmVkZyfTu31PolK4J/uSqYRmNZ5Mc8BrHnmhN6DEnjrbTe13csLiebFtFi9cj0yGRuQOjHaNuYici+i5sQnPEj4KeEyHcdJzgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572698; c=relaxed/simple;
	bh=W/W3zvPMNBs7G76j3kOF1p094KPwTL9rIaA3xKhxAak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szxs1kfY4jS6Y30bon9bSiBOwVoDpRAEIv9CI03J6VleIubeBZ/tB//GtRfSNMMgs7kGGoxmVzu99MVqxBSbzpky5Unb2Y52r2xyMr/5b8gyb/MwH7qNnLawGIhmpkuUQnvStKVoQh64rBsHZ4tJZxZcwFRDIvQyeLRiJ05k/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1audKXP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1audKXP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso108337a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786572694; x=1787177494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=84UXfrTD07ipm4YJ6onVJzQAj8OjhirewXBuPuaWHiM=;
        b=b1audKXPkNEsbprP/21dt8eCxWRxsYxa/GOozXuN5qGs32HUmVAgah8nnSlQiA9qt4
         yemXEBo77/c9hmwW4V2CajXk8Vb3S6oF2DaLb3dluWA54Upnz7x/okW/fG5kSLn7tDrH
         waGV7QElPGtLnMahXnqgsB8s23KGB7cK3MWrFol+p4ofEAPxjBC34xpCgPslOisc+jTP
         nZEUIc+wZpuZoaVddHf3mJVlxf/vUPWLp8TWzub2px7FuZyhgI8GCTTdJhcFg7aesNV6
         kUrqvuIqYe7gHs0dz6G81gU3E+7P3Eg/+GzQ5mn0QXxEp1tYc1U1A6arKPXsv+tgfATt
         PqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572694; x=1787177494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84UXfrTD07ipm4YJ6onVJzQAj8OjhirewXBuPuaWHiM=;
        b=W0xZAIRbCIX0Jk5TuyTIATCP0WfsiEP3nP7klxRBQc+1WWp4zc/Q/7LkhE/SIsWD3J
         /9m6UprDKVY4pzCo3KpQQpP0CFe697g2yqViJsAV0QvjdHFZfQoBXbW8Q4sGHlkWPRa9
         tf/sBm05lnLZzRfUsdCa0GhJvHfS2KJGR9it+kapBOMtqCz1c6TwVPxU2Wdh1uxq9pPx
         H9I3UopOR0E87LUaNgo4JRF7RBHLxQ3AIdA8KfCFN9mk7zGZt+NYNch7DnqIwhaKtCOq
         Ggcc/mwbaEz4yzDAjEZBOUZQgkyxeVJiRIcWnGPcMcM7BVjIOFQhFtPW6sdFTmu+822j
         /4Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqtlH/xrO1SLqdi/BwKcGxVr7Z04kOepnIeBo9UTS/fVGEj0PQRQago/BWGZdFa1pEchi0XElHBCEJrmrKqMmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXQCZD9Op0uq1Ji492I9qJow2VMEt4ToyFJrkHiU0S83Stlgn
	KXy1g8I2iW+EoQVcOZAZ416/UXcx+YAJ28yJ1REt8LFCuRvndqvID/pHPmphDEHtkg==
X-Gm-Gg: AR+sD11RAZ2BeJCSaN7Qru2ybkPz2lwZ+32h0EQKzV4pzaBZLCQq1y4MRcKXqJ8teWv
	7XJ39QMPmBqsKoL62meiACDZcuN0APXgZB+PpWOfeI2k4yKeKgECcyWImCfnRu+8vVJ7zwe3Zkx
	FmlS1uwkLnn/aHq2V7nCqhu5aUqBg436PgSaPuAr3qpIEB2j5bx1cnM7Ah8kCqsJNU6R38CB2uk
	JJb7cYzbjKAH7RY/qN5/K6Kz3msAzxvuyKfk7tyWeitk/+P4auSp+g77PUWUeYn1LJEzEhfHh6s
	b1Hd2zQe4ZIXlWLVque43dC4fIxbRw4/OyW5JgNzx1TyzDTV0waTsP4m0+Qsce1iU8gKsFDNoK3
	UInu37+l3AFhLEGfBnoY2DzGq1TStmXOtIGRfzz4HGomOc9wy55yRiIhlzApcPlOzCAfu17UwJa
	zTH5V2TdRFVpZTIqEzhamXGcdCjN8IuEU/Cmjcy9tJtp3JOzjqiA3Viw1nPNEFkH4X/XusSA39E
	tWJmkHCLcHfb8EFGShk29QUbf/j0w==
X-Received: by 2002:a05:6a00:3923:b0:835:6388:655d with SMTP id d2e1a72fcca58-84fc6ce7c17mr1032589b3a.14.1786572693710;
        Wed, 12 Aug 2026 15:11:33 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef7109658sm202295a12.16.2026.08.12.15.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:11:33 -0700 (PDT)
Date: Wed, 12 Aug 2026 22:11:30 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH v4 06/10] vfio: selftests: Allow drivers to specify
 required region size
Message-ID: <anzvkibgzTae9eV9@google.com>
References: <0-v4-021df3fb5a3f+98e-mlx5st_jgg@nvidia.com>
 <6-v4-021df3fb5a3f+98e-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v4-021df3fb5a3f+98e-mlx5st_jgg@nvidia.com>

On 2026-08-12 11:59 AM, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. Since drivers all use only their declared state we can use the
> value directly and remove the SZ_2M hard coding.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

...

> diff --git a/tools/testing/selftests/vfio/lib/iova_allocator.c b/tools/testing/selftests/vfio/lib/iova_allocator.c
> index 4a660f636f4972..c8075575e9131d 100644
> --- a/tools/testing/selftests/vfio/lib/iova_allocator.c
> +++ b/tools/testing/selftests/vfio/lib/iova_allocator.c
> @@ -13,8 +13,10 @@
>  
>  #include <linux/iommufd.h>
>  #include <linux/limits.h>
> +#include <linux/log2.h>
>  #include <linux/mman.h>
>  #include <linux/overflow.h>
> +#include <linux/sizes.h>
>  #include <linux/types.h>
>  #include <linux/vfio.h>
>  
> @@ -50,7 +52,8 @@ void iova_allocator_cleanup(struct iova_allocator *allocator)
>  iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
>  {
>  	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
> -	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
> +	/* Adjust the size to the allocator requirements */
> +	size = max_t(u64, roundup_pow_of_two(size), getpagesize());

...

> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
> index 5e65434d2318b2..52b9c2a2bbb9b6 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
> @@ -32,6 +32,9 @@ void vfio_pci_driver_probe(struct vfio_pci_device *device)
>  			continue;
>  
>  		device->driver.ops = ops;
> +
> +		VFIO_ASSERT_NE(ops->region_size, 0);
> +		device->driver.region.size = ops->region_size;

I'm seeing failures with the IGB driver with this series. I think it's
coming from here. The region size needs to be page-aligned so that the
IOMMU map/unmap calls can work?

The size of struct igb is 0x20080 bytes which is not page-aligned. The
size of struct mlx5st_device is 0x200D000, which is page-aligned, so
that's probably why your Claude did not notice.

# #  RUN           vfio_pci_driver_test.iommufd.send_msi ...
# /usr/local/google/home/dmatlack/kernel/trees/review/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:42:
# Assertion Failure
#
#   Expression: __iommu_map(iommu, region) == 0
#   Observed: 0xffffffffffffffea == 0
#   [errno: 22 - Invalid argument]
#
# # send_msi: Test failed
# #          FAIL  vfio_pci_driver_test.iommufd.send_msi
# not ok 33 vfio_pci_driver_test.iommufd.send_msi

Applying this on top fixes things and also avoids a potential overflow
when doing the roundup_pow_of_two() in the allocator.

diff --git a/tools/testing/selftests/vfio/lib/iova_allocator.c b/tools/testing/selftests/vfio/lib/iova_allocator.c
index c8075575e913..66a160d4ff9d 100644
--- a/tools/testing/selftests/vfio/lib/iova_allocator.c
+++ b/tools/testing/selftests/vfio/lib/iova_allocator.c
@@ -52,8 +52,11 @@ void iova_allocator_cleanup(struct iova_allocator *allocator)
 iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
 {
 	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
-	/* Adjust the size to the allocator requirements */
-	size = max_t(u64, roundup_pow_of_two(size), getpagesize());
+	VFIO_ASSERT_LT(size, rounddown_pow_of_two(SIZE_MAX),
+		       "Invalid size arg, too large (%lu)\n", size);
+
+	size = roundup_pow_of_two(size);

 	for (;;) {
 		struct iommu_iova_range *range;
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
index 96a940ea59b5..b31abfe2c7ff 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
@@ -36,7 +36,8 @@ void vfio_pci_driver_probe(struct vfio_pci_device *device)
 		device->driver.ops = ops;

 		VFIO_ASSERT_NE(ops->region_size, 0);
-		device->driver.region.size = ops->region_size;
+		device->driver.region.size =
+			round_up(ops->region_size, getpagesize());
 	}
 }
