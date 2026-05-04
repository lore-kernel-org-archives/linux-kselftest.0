Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1A386435
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934149; cv=none; b=MXSm5UrkZ3MtQiVm4gQETqWjcOFMtYlu72uOIVaa7Bvjx+IWVeplPBCKICkl5B5Nf9Ss38Aby+ZWC/D5le8boWgb0FFtyyI16Qkg89/7LqoqpZJjRKL2ouYeUON+q3GeZFVRwIt31bxNY01SmsmlG5zp5YhVmdQT9ke8hQUxhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934149; c=relaxed/simple;
	bh=053J+k+T3qlqygZGjMWRpvpwj73ZalGKJrYZu+NUK2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sML2dvSe/iH+ttopar0mXHDYWk9jDKR3KtBi+KjhUPIRSEZ+zJB6146i/tza8VwmfiCCl3506I6+Z61bo9YJ1GQsOei/pDeeeC4FDC4FuMs5EwXHUzm6YLcpbGiFGBrsyoy+41y114ssJrhn6Mt/ejNczLLumNXTXnLBJ39mBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gUaCOBo3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gUaCOBo3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8016d642b2so569239a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777934148; x=1778538948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQ3tNPMFkM7QrJ5Q+mR4uTB1pqSv2OnkcWUNEBkdVs8=;
        b=gUaCOBo32sIC5Xy0u8Jwox7KkqYuM8Saf4HXhvj8cCNhQ+enMJ21rEWaazHjDmEZ3V
         rYf1PMP3l2KagKvbEAZiwtu6yEuP2yV/SxjwwR9xrj4WaJJTbFdIHu/yGIqxqQAYroME
         tUpLIwWCUvHMxDVEVOp6rIcwn69yvS9tV+VxUNDPGecbAVyZdaYtpgF1LhlSeWsCZZjR
         dSG+IQBVZq8z3k4tfWnUXiMaAqI95VnC+0fNbrQoIf0MVs7m2gdC+cdCBfyQo9W4Vxx4
         pn2zSV/9uT6qAj1vLTXCgkRtZ46kMUCFSlaLpTt8b3zLYmx1McVBZhrng5QrMVFuUo8V
         hsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934148; x=1778538948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ3tNPMFkM7QrJ5Q+mR4uTB1pqSv2OnkcWUNEBkdVs8=;
        b=tThxBcsYY4v0Biqnr3VuFVlP2GLTsILqwPobbRVrdbujt/tYqPfE1IbWh3AwUEPv4y
         NhAZrdXu5PnhZLPT0/dx75Y4GagLqcW1paWaHQ+n0soXT1w9zrXGSzqtiOu5DDs+2luB
         UKH+qBP7gsIzVF9voBJZKjyu6L+giEEhGtGFwdJ0eha6m2eTCrfc/3fHq2OOMhBteZvr
         Kru4CrvERr8Go1LNXJdGTMix073SH3T/HmePc3mvXldrSHAepVktShD7UtJLx1sWd8Rp
         ua88JGsX5rV9vH0RejBQpLGee3h1yL8ibP9ciWX2HfgFP+5uBrwisLMybkuhHJ3H+Q6H
         gZAg==
X-Forwarded-Encrypted: i=1; AFNElJ/cADp1pSDjmqR2h0LvH/cKNv7m9T5LM6+bKJ7f6NEgkhOsAac7m6EKxRNKTiGCImJTCCr1ufEkHmj0KuUDiK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9er7zwMga3JCQGqJzkxRvWzmbGTZBDyCrJN5nanbG+1YABFQ
	+GMFfS4DMv5cNR6SXdeYvFBGUO2z1hxDORHbowWUDtSGgPhCzRwOabj6BR6oLw+b8w==
X-Gm-Gg: AeBDievs+n26eXNc1GCIRGas5Qn37zukPsxur9dHC+tjcSvD5ZP6A9qw+SJ+zZJLSVU
	vVwashgAfUdgxg9ftTJTl6P20nS/EiJdZd2OJjg0MlkSJ9RS6ICJKLyZDeJ4paH/t9lifLfAUpb
	xNAlvmo/XIxWkJMwiNZSIGZjRLSa9zTmd/3foQtokN2+NvFYa0FhrkKKS69y2rPb1GFM6FRymuK
	dyXpCW4aIyZirqDU+geG+AwK9McmcCZviUsMgL5ud4BeAS3azOwMCzL596DiVLdPjqMBPJ5+Ogb
	FFxiusU24SddIzMB9LvKsmxyolg1wbbMncjC92BZRFIMNoam+f5WjyIYbRITijE7sEYuZR7vgK9
	ECy1nAH4D+EJ7qlE7z7s3RgrRy1JxJvLqFqahJQnCvFg3F3RiwvcRT904UxGy65lVlUQ2z1FIai
	E7vaa1I+hAnLWFbsKxDOWz7+03471yb8Y27Zk3gbhmCRnN/5f8SIyBn9WKDQDMlNzkD7tItlMN6
	ZXTww==
X-Received: by 2002:a05:6300:210d:b0:3a2:cbd1:11f with SMTP id adf61e73a8af0-3a9ea589e46mr1260508637.5.1777934147330;
        Mon, 04 May 2026 15:35:47 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcaa477sm10680045a12.31.2026.05.04.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:35:46 -0700 (PDT)
Date: Mon, 4 May 2026 22:35:43 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH 09/11] vfio: selftests: Add mlx5 driver - HW init and
 command interface
Message-ID: <afkfP-8UHaoyLd5Y@google.com>
References: <0-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
 <9-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9-v1-dc5fa250ca1d+3213-mlx5st_jgg@nvidia.com>

On 2026-04-30 09:08 PM, Jason Gunthorpe wrote:

> +/*
> + * Driver state — overlaid on device->driver.region.vaddr.
> + *
> + * Contains both software-only state and HW-visible DMA buffers. HW buffers need
> + * strict IOVA alignment.
> + */
> +struct mlx5st_device {

Can we do s/mlx5st/mlx5/ on the series?

I assume st is for selftests and that is already implied by this file
being under tools/testing/selftests.

> +/*
> + * Probe — match mlx5 devices by PCI vendor/device ID.
> + */
> +
> +#define PCI_VENDOR_ID_MELLANOX 0x15b3

nit: Use #include <linux/pci_ids.h>

> +static int mlx5st_probe(struct vfio_pci_device *device)
> +{
> +	static const u16 mlx5st_pci_ids[] = {
> +		0x1011, /* Connect-IB */
> +		0x1012, /* Connect-IB VF */
> +		0x1013, /* ConnectX-4 */
> +		0x1014, /* ConnectX-4 VF */
> +		0x1015, /* ConnectX-4LX */
> +		0x1016, /* ConnectX-4LX VF */
> +		0x1017, /* ConnectX-5 */
> +		0x1018, /* ConnectX-5 VF */
> +		0x1019, /* ConnectX-5 Ex */
> +		0x101a, /* ConnectX-5 Ex VF */
> +		0x101b, /* ConnectX-6 */
> +		0x101c, /* ConnectX-6 VF */
> +		0x101d, /* ConnectX-6 Dx */
> +		0x101e, /* ConnectX-6 Dx VF */
> +		0x101f, /* ConnectX-6 LX */
> +		0x1021, /* ConnectX-7 */
> +		0x1023, /* ConnectX-8 */
> +		0x1025, /* ConnectX-9 */
> +		0x1027, /* ConnectX-10 */
> +		0x2101, /* ConnectX-10 NVLink-C2C */
> +		0xa2d2, /* BlueField integrated ConnectX-5 */
> +		0xa2d3, /* BlueField integrated ConnectX-5 VF */
> +		0xa2d6, /* BlueField-2 integrated ConnectX-6 Dx */
> +		0xa2dc, /* BlueField-3 integrated ConnectX-7 */
> +		0xa2df, /* BlueField-4 integrated ConnectX-8 */
> +	};
> +	unsigned int i;
> +	u16 did;
> +
> +	if (vfio_pci_config_readw(device, PCI_VENDOR_ID) !=
> +	    PCI_VENDOR_ID_MELLANOX)
> +		return -ENODEV;
> +
> +	did = vfio_pci_config_readw(device, PCI_DEVICE_ID);
> +	for (i = 0; i < ARRAY_SIZE(mlx5st_pci_ids); i++) {
> +		if (mlx5st_pci_ids[i] == did)
> +			return 0;
> +	}
> +
> +	return -ENODEV;
> +}
