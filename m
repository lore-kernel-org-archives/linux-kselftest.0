Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFE3803C6
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264248; cv=none; b=W6jJmLfDIs0NkbIFcfCdGxZa84Kbg0GLffZ3NM1+P1wtuEAmUfB2JpUOHKl297kq9gpnqzT5/zKl0HhXSquwHATKoFmMC1WJ2JUFHGfCiL/2S/nWpWt2OzjBv/AOu62vDq7BhGxp2+5s8YTMEW5jboo6h3GRXK5BNMaJZdOna1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264248; c=relaxed/simple;
	bh=VLcBu7t3GGs9ny6P9D7YvTad/szdfGp2ixcpdsRq5HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3+K9E8wYOCwHboMm7rK4O/iaj3GqTaFnTAaEVzMteQycLli4pocpH/e/qogDSpRTXFUD0t1dzDj/LiB48Na6XEJWTBh6NFD2IwtiLqK8BWGmEqEhGlsiSHF8gdZmJHBQ5YkDwoaOfkE+3aV7sQ8LtSUCBmK8SgNQJjmAUVXSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SPQu9Lyi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SPQu9Lyi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36643b96b99so1191323a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778264243; x=1778869043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lfybjzrKM6rnzgKjTQWtFqMPUXdJr/Seij04O29fu8c=;
        b=SPQu9LyiMepEnZ1Kz6LllNvA7jQJOUP4GJqVZSwd4C1OisMukW6dwZjvzJbAKkqAhC
         89P+1MQGbotFdMWdg1eVTphkjuFs1CjNV5jIkrlH2bQes7W29O3Q3vdBuz9zxhvZIKZw
         9F5z9xDnL3ZBcgGqUsgXBEFwdxciuCKOwW8BSpaUNu4x+v1sBcerP4ly71m3X2Io4T9T
         0Gp2Aw7Ws9If1Mm/4WQ5cJmAxS9s8GLR0XPQsxwkqzTpBz3TD3IPie2apSOpWpx1mDJV
         BrraT7ufyn10iiQblGVwOkDBrAiQQcC6tlCcN0lVUsQ+YbEeFYFy3PrQ9reZAJPDNiqd
         okLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778264243; x=1778869043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfybjzrKM6rnzgKjTQWtFqMPUXdJr/Seij04O29fu8c=;
        b=N/axRnaTpZ/JFZtHVd5KV166LJ30/DfOdk0RMbUIf8koeNstdvql7tiKsLmndqeHi6
         YLqt3dGghPsd8ekYj6IB3xHQucldne+hRajRrw744Jqy29gzwft+VhrYMZdM2j49hq4i
         Cg5Uy1dB3cruQ8XewsTEno3+bmXdn9MqbYVsZaaXjkXio1+ePzDifSPF5qCzaTZDzTgv
         y1xLIL630ZbkWT+6UItEfTZ31BagH+Vz2ikBBEEpyRFEdDF5HBW3grTiLkVU4ZrGRtO+
         MJ2Vy5ciHiSKlXNZcWoTSgshmY2EuL//W77yQBB0cmksv1fF0NV+OKAdZsglNtYjMA+f
         K16A==
X-Forwarded-Encrypted: i=1; AFNElJ+nWJ/dvuq4imcmtjn1mdVdgiJTyD2t9TaxfPS9fToOLuHD6B/BE92RVaz6Ui2RpFbSOxFtPM6JIKbYgIPAWoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PEx+Sw0EYAXuokiV55sV/IWgwflCv0cunHr+ucVpvZ8+qnYL
	0w19JhMAW4GZaDNhRbjCAqxRhZM/km/By5mzdfv4FHrhV1mvOh7WKRsSxs8kpa3VOw==
X-Gm-Gg: Acq92OErrNRDLJtnGZINvCVU6KiC9nY6HJdLpAv5I/m58YWTzcrGAIEnvs9q48WiB+E
	FYFA8JpgVGHhBSJ/nEn0tRxhCMAvV9gwox7iy49xA+YfWFmz2q5opARhlwQt6uilBLqh4ULLgvx
	NkdbYjGiRQm7OkoFmtjlvQflNc3kkgrkq4GhWsCcKsjywOScYUQxGnUGWYogjCjvGSwFne2ux25
	/3lGpitIidjnJzixJ/2Cyj+Qw4ivt0+zMIZH9CSbOo/eDbST+Xo3lWZWQdjbn4mDcL5qCH4z9YP
	g9KG/UUOrfvqLfzDek/EDnvRbOFXnyWSXGrDDJU6BZ5vXFZMI38aLRDk1MWzk4B4X3oX+8L8kCk
	q4gC97tbp5MV0HLA9sz0nyF3l7w9+qNrnboTTsTF9oB4NOQgH1JT9bNsFXWHFDI5G1t+GC+o3qo
	u+6+y1A82qiUIUmmCzL2yHROcL6DuJOBgvQJYGbJzYcKWQUCvlUWqAS+gTo2xDL2/FMqeKNvIo
X-Received: by 2002:a17:903:388c:b0:2ba:ca4d:5186 with SMTP id d9443c01a7336-2baca4d52e8mr83072255ad.34.1778264242933;
        Fri, 08 May 2026 11:17:22 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm29264725ad.66.2026.05.08.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:17:22 -0700 (PDT)
Date: Fri, 8 May 2026 18:17:19 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Aex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Raghavendra Rao Ananta <rananta@google.com>, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] vfio: selftests: Add support of creating multiple
 iommus from iommufd
Message-ID: <af4or28EA6PGEd12@google.com>
References: <20260505221518.619123-1-skhawaja@google.com>
 <20260505221518.619123-2-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505221518.619123-2-skhawaja@google.com>

On 2026-05-05 10:14 PM, Samiullah Khawaja wrote:
> IOMMUFD allows creating multiple IOAS and HWPTs under one iommufd, Add
> API to init a struct iommu using an already opened iommufd. The API
> internally creates a new IOAS and also a new HWPT as an option based on
> the flags passed to the function.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>  .../vfio/lib/include/libvfio/iommu.h          |  5 ++
>  .../lib/include/libvfio/vfio_pci_device.h     |  2 +
>  tools/testing/selftests/vfio/lib/iommu.c      | 62 +++++++++++++++++--
>  .../selftests/vfio/lib/vfio_pci_device.c      | 22 ++++++-
>  4 files changed, 84 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> index e9a3386a4719..89249a294920 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> @@ -9,6 +9,9 @@
>  
>  typedef u64 iova_t;
>  
> +/* Create IOMMU with page tables */
> +#define IOMMUFD_IOMMU_INIT_CREATE_PT 1
> +
>  struct iommu_mode {
>  	const char *name;
>  	const char *container_path;
> @@ -29,10 +32,12 @@ struct iommu {
>  	int container_fd;
>  	int iommufd;
>  	u32 ioas_id;
> +	u32 hwpt_id;
>  	struct list_head dma_regions;
>  };
>  
>  struct iommu *iommu_init(const char *iommu_mode);
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id, u32 flags);
>  void iommu_cleanup(struct iommu *iommu);
>  
>  int __iommu_map(struct iommu *iommu, struct dma_region *region);
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index 2858885a89bb..1143ceb6a9b8 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -19,6 +19,7 @@ struct vfio_pci_device {
>  	const char *bdf;
>  	int fd;
>  	int group_fd;
> +	u32 dev_id;

Please introduce an initialize this field in its own patch and, in the
commit message, explain why it is being added and  how it will be used.

>  
>  	struct iommu *iommu;
>  
> @@ -65,6 +66,7 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
>  #define vfio_pci_config_writew(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u16)
>  #define vfio_pci_config_writel(_d, _o, _v) vfio_pci_config_write(_d, _o, _v, u32)
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
>  void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
>  			 u32 vector, int count);
>  void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
> diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
> index 035dac069d60..644c049cf9f0 100644
> --- a/tools/testing/selftests/vfio/lib/iommu.c
> +++ b/tools/testing/selftests/vfio/lib/iommu.c
> @@ -408,6 +408,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
>  	return ranges;
>  }
>  
> +static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
> +{
> +	struct iommu_hwpt_alloc args = {
> +		.size = sizeof(args),
> +		.pt_id = iommu->ioas_id,
> +		.dev_id = dev_id,
> +	};
> +
> +	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
> +	return args.out_hwpt_id;
> +}
> +
>  static u32 iommufd_ioas_alloc(int iommufd)
>  {
>  	struct iommu_ioas_alloc args = {
> @@ -418,11 +430,9 @@ static u32 iommufd_ioas_alloc(int iommufd)
>  	return args.out_ioas_id;
>  }
>  
> -struct iommu *iommu_init(const char *iommu_mode)
> +static struct iommu *iommu_alloc(const char *iommu_mode)
>  {
> -	const char *container_path;
>  	struct iommu *iommu;
> -	int version;
>  
>  	iommu = calloc(1, sizeof(*iommu));
>  	VFIO_ASSERT_NOT_NULL(iommu);
> @@ -430,6 +440,16 @@ struct iommu *iommu_init(const char *iommu_mode)
>  	INIT_LIST_HEAD(&iommu->dma_regions);
>  
>  	iommu->mode = lookup_iommu_mode(iommu_mode);
> +	return iommu;
> +}
> +
> +struct iommu *iommu_init(const char *iommu_mode)
> +{
> +	const char *container_path;
> +	struct iommu *iommu;
> +	int version;
> +
> +	iommu = iommu_alloc(iommu_mode);
>  
>  	container_path = iommu->mode->container_path;
>  	if (container_path) {
> @@ -453,10 +473,44 @@ struct iommu *iommu_init(const char *iommu_mode)
>  	return iommu;
>  }
>  
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id, u32 flags)
> +{
> +	struct iommu *iommu;
> +
> +	iommu = iommu_alloc("iommufd");

Use MODE_IOMMUFD instead of string literal.

> +
> +	iommu->iommufd = dup(iommufd);
> +	VFIO_ASSERT_GT(iommu->iommufd, 0);
> +
> +	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);

Please avoid duplicating this code. e.g. Something like this:

diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index 644c049cf9f0..4909cda5c840 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -443,6 +443,19 @@ static struct iommu *iommu_alloc(const char *iommu_mode)
        return iommu;
 }

+static void iommufd_init(struct iommu *iommu, int iommufd)
+{
+       /*
+        * Require device->iommufd to be >0 so that a simple non-0 check can be
+        * used to check if iommufd is enabled. In practice open() will never
+        * return 0 unless stdin is closed.
+        */
+       VFIO_ASSERT_GT(iommufd, 0);
+
+       iommu->iommufd = iommufd;
+       iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
+}
+
 struct iommu *iommu_init(const char *iommu_mode)
 {
        const char *container_path;
@@ -459,15 +472,7 @@ struct iommu *iommu_init(const char *iommu_mode)
                version = ioctl(iommu->container_fd, VFIO_GET_API_VERSION);
                VFIO_ASSERT_EQ(version, VFIO_API_VERSION, "Unsupported version: %d\n", version);
        } else {
-               /*
-                * Require device->iommufd to be >0 so that a simple non-0 check can be
-                * used to check if iommufd is enabled. In practice open() will never
-                * return 0 unless stdin is closed.
-                */
-               iommu->iommufd = open("/dev/iommu", O_RDWR);
-               VFIO_ASSERT_GT(iommu->iommufd, 0);
-
-               iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
+               iommufd_init(iommu, open("/dev/iommu", O_RDWR));
        }

        return iommu;
@@ -478,11 +483,7 @@ struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id, u32 flags)
        struct iommu *iommu;

        iommu = iommu_alloc("iommufd");
-
-       iommu->iommufd = dup(iommufd);
-       VFIO_ASSERT_GT(iommu->iommufd, 0);
-
-       iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
+       iommufd_init(iommu, dup(iommufd));

        if (flags & IOMMUFD_IOMMU_INIT_CREATE_PT)
                iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);

> +
> +	if (flags & IOMMUFD_IOMMU_INIT_CREATE_PT)
> +		iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);

Does this need to be part of iommufd_iommu_init()? Maybe it would be
better to expose a separate helper to allocate a HWPT for a given struct
iommu *.

This would enable use of HWPTs in iommus constructed by iommu_init() as
well, which someone may want to do in the future.

If you go this route, please introduce this in its own commit.

> +
> +	return iommu;
> +}
> +
> +static void iommufd_cleanup(struct iommu *iommu)
> +{
> +	struct iommu_destroy args = {
> +		.size = sizeof(args),
> +	};
> +
> +	if (iommu->hwpt_id) {
> +		args.id = iommu->hwpt_id;
> +		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
> +	}
> +
> +	args.id = iommu->ioas_id;
> +	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);


Please create a helper function to do IOMMU_DESTROY ioctl. Then here you
can just do:

  if (iommu->hwpt_id)
          iommufd_iommu_destroy(iommu, iommu->hwpt_id);

  iommfd_iommu_destroy(iommu, iommu->ioas_id);

> +
> +	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +}
> +
>  void iommu_cleanup(struct iommu *iommu)
>  {
>  	if (iommu->iommufd)
> -		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +		iommufd_cleanup(iommu);
>  	else
>  		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
>  
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index fc75e04ef010..e2b71fe63cae 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -322,7 +322,7 @@ const char *vfio_pci_get_cdev_path(const char *bdf)
>  	return cdev_path;
>  }
>  
> -static void vfio_device_bind_iommufd(int device_fd, int iommufd)
> +static int vfio_device_bind_iommufd(int device_fd, int iommufd)
>  {
>  	struct vfio_device_bind_iommufd args = {
>  		.argsz = sizeof(args),
> @@ -330,6 +330,7 @@ static void vfio_device_bind_iommufd(int device_fd, int iommufd)
>  	};
>  
>  	ioctl_assert(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args);
> +	return args.out_devid;
>  }
>  
>  static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
> @@ -342,6 +343,21 @@ static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
>  	ioctl_assert(device_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &args);
>  }
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
> +{
> +	u32 pt_id = iommu->ioas_id;
> +
> +	/* Only iommufd supports changing struct iommu attachments */
> +	VFIO_ASSERT_TRUE(iommu->iommufd);
> +
> +	if (iommu->hwpt_id)
> +		pt_id = iommu->hwpt_id;

nit: This can be folded into the variable declaration.

  const u32 pt_id = iommu->hwpt_id ?: iommu->ioas_id;

> +
> +	VFIO_ASSERT_NE(pt_id, 0);

Why is this check needed?

> +	vfio_device_attach_iommufd_pt(device->fd, pt_id);
> +	device->iommu = iommu;
> +}

Please introduce vfio_pci_device_attach_iommu() in its own patch.

> +
>  static void vfio_pci_iommufd_setup(struct vfio_pci_device *device, const char *bdf)
>  {
>  	const char *cdev_path = vfio_pci_get_cdev_path(bdf);
> @@ -350,8 +366,8 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device, const char *b
>  	VFIO_ASSERT_GE(device->fd, 0);
>  	free((void *)cdev_path);
>  
> -	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd);
> -	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
> +	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd);
> +	vfio_pci_device_attach_iommu(device, device->iommu);
>  }
>  
>  struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
> -- 
> 2.54.0.545.g6539524ca2-goog
> 
