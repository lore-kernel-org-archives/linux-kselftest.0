Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A46441618
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929326; cv=none; b=MzgXXztvH29WG+N4S6mQ+ERl2Mad9LygMzvPGMdW5U/lEU+AH0dS5kK69e8vy1ASM9zbnpwucWa2ZjHXrH/VSBBJnGdfkcGlRts4rhJweNjjvsj/7TRcqaqxOtM0B4nqL57Dxpho6lJIZUDIQcdQ+6Q34UYyxlPzn5bcA6fZf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929326; c=relaxed/simple;
	bh=yK+v65dl8Oh8uBTbkQmHDaAB5BEVO8HHtvGN1jZbaD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYK8iBMXTB+gg/DDHGozE0ubp5AsxsIL5W/2e7QC2ei1D7xmxIpbDtaTbSFUMvsbvPov7xjZOJSi0UgeXSLiEakv5zyPwxOXN3theGh0EbVfb1YxkW3My36ujHdCg8ONuVevCbAF8+RoWyQ5GzN1dgjXr8v27oPzV/pYqWxAxXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QIBT3HMY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QIBT3HMY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cedda2ce6fso8182475ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784929325; x=1785534125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tXCbJonP5RTpEDTMHQcyo1IXdRFWvNUzhtlZCMlOUEo=;
        b=QIBT3HMYkZq7pp+I+fKoOJjBzHciOhjFrdS+vbK3cWUL44uStiF2Qhmx5Ro/u6VObS
         Lov+froDq8UeRkfIbvy/ODFpShsLpVnP+lP+Qs5WT76g2ofKLjtQsj2bpTdxipO+AStx
         dGQGMBYOHOBL7QIv1+FMRr+9cf7hPde/qcf8yqLqQcqQ3etJO6Eu16udOByJD588eVv1
         mxI6S6ABF1x2cApnSkxun6yK0Mt4sOCjwtW6mQg0/djV9cvZdRWoDgp0GjxCzCo6NOZv
         PmkVDj7q3XBx26L8vYVn616BBoIU1FWTbsa1pfTUyIl6N0pKINC4gAIpEvvHJIbQU0bb
         IQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929325; x=1785534125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXCbJonP5RTpEDTMHQcyo1IXdRFWvNUzhtlZCMlOUEo=;
        b=WWe173YxL4YIhVL2nPRxtMtzkZp/js2lUcZTBgFMYmsbDljHEk5zuhXLVWif/hnXEH
         /kmDBHqC+M8LwkdwnrgDl27mLktQMO7GkzyQwi9nAVRC679rneJJzNtsGYaOBpAZPvXx
         Y6X0sBl8TMEKN6DvRXnbjfSTeOBq0o5TZSJNzhgBSXena7N8CVsvIKilRLy7mhvPI17z
         9bCwDfnIpZV/GMtq3UcEZRDetbETOWWE4MaxewuNmuiCLR5YyDkJVWQ/DtlRM1zLLFvA
         Ioe9GvHmb78JeCmDO+9IYgPfwhiZakuDA3GT+rg2MWJPf7N0b3a8VMV1zgNA3ymRkMhB
         t63Q==
X-Forwarded-Encrypted: i=1; AHgh+Rovftnoh1PXXAeyvvRRSJ8aI0eNOHbI3mzel7ggiS7/5UcOt+ETFnkRrKn0Kcudo8p/YuqsHNMsV+fbIaLw4/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4y7p6HEsF9MbFaLXvOFre/arzy9Ssgs705doIxwRdbin2qqkB
	OqVCTDSh2WGLa+FeONfjn7vKpSkFs3zCZLgtYZrTCrarOIvXezTgwM/Du98l7oH2gw==
X-Gm-Gg: AR+sD12Ztf3YDop9oPvxK1vX5j7fOcZCTCDyvCVXarAgTufeXKRp6SEovVe4VY2LoN0
	DRnEnhM0lhIW5kd4Pw+wNVlx4KgUtJQ8a0WaKgUQPTs6vGBLAf8JreJPivHQDteTFd7FhY/QMyS
	0dIjJg6fv4D9HlFCvOwH9k93CzRUVZ2mjP9tUYZYOQoL0DIqOs9H3Ozok/M9yyBr6iCzM80DtNv
	0e59PVukuiTfg0RvCREwEP7BVgmH0qIUqU8GsaYIXgTuLmgBLKhlON3lGGznEp/AwEXidDtgRN1
	yVUedZT3dCn/YEBPaNY0qNA5anCIItGc1gNBL0WpR2OUDJYB4wLfH41wBHeQVWlH21Kasxij6Lw
	0eu2gGdZc3rcbfnctSfF7py4Ww/PKSKnPXkjfKEDeVPyqjdLItybTZCO1q2phErfQZ7oimQVAYr
	E1ghC1Ef2A1J0McFr7x6KxkhtlEu3Q8JNHhMOcY47J
X-Received: by 2002:a17:903:3d06:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2cfde8473b0mr1424615ad.27.1784929324250;
        Fri, 24 Jul 2026 14:42:04 -0700 (PDT)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb35sm607925ad.12.2026.07.24.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:42:03 -0700 (PDT)
Date: Fri, 24 Jul 2026 21:42:00 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v6 0/6] vfio: selftests: Add driver for Intel Ethernet
 Gigabit Controller (IGB)
Message-ID: <amPcKEBsrkTH1JqQ@google.com>
References: <20260722-igb_v3_b4-v6-0-0be1d29918d4@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-igb_v3_b4-v6-0-0be1d29918d4@google.com>

On 2026-07-22 12:15 AM, Josh Hilke wrote:
> This v6 of a series which adds a VFIO selftest driver for the Intel
> Gigabit Ethernet controller (IGB), specifically targeting the 82576
> device. IGB is fully virtualized in QEMU, making it suitable for running
> VFIO selftests without specialized hardware.

> Testing
> =======
> - VFIO selftests builds clean at every commit
> - vfio_pci_driver_test passes using IGB driver + QEMU. Use the following
>   command to run the tests:
> 
>   vng \
>   --run arch/x86/boot/bzImage \
>   --user root \
>   --disable-microvm \
>   --memory 32G \
>   --cpus 8 \
>   --qemu-opts="-M q35,accel=kvm,kernel-irqchip=split" \
>   --qemu-opts="-device intel-iommu,intremap=on,caching-mode=on,device-iotlb=on" \
>   --qemu-opts="-netdev user,id=net0 -device igb,netdev=net0,addr=09.0" \
>   --append "console=ttyS0 earlyprintk=ttyS0 intel_iommu=on iommu=pt" \
>   --exec "modprobe vfio-pci && \
>           ./tools/testing/selftests/vfio/scripts/setup.sh 0000:00:09.0 && \
>           ./tools/testing/selftests/vfio/scripts/run.sh ./tools/testing/selftests/vfio/vfio_pci_driver_test"

Extending this, you can run all VFIO selftests like this:

make -C tools/testing/selftests TARGETS=vfio install
vng \
	...
	--append="hugepagesz=2M hugepages=1 hugepagesz=1G hugepages=1" \
	--exec "
		tools/testing/selftests/vfio/scripts/setup.sh 0000:00:09.0 &&
		export VFIO_SELFTESTS_BDF=0000:00:09.0 &&
		cd tools/testing/selftests/kselftest_install &&
		./run_kselftest.sh -o 360 -c vfio
	"

The --append flag makes sure there are HugeTLB pages allocated for
vfio_dma_mapping_test. The "-o 360" is needed because
vfio_pci_driver_test takes more than 45 seconds.

> Alex Williamson (4):
>       vfio: selftests: igb: Use PHY internal loopback on 82576
>       vfio: selftests: Add helpers to re-enable interrupts
>       vfio: selftests: igb: Factor hardware programming into igb_hw_init()
>       vfio: selftests: igb: Recover after DMA-read faults
> 
> Josh Hilke (2):
>       vfio: selftests: igb: Add driver for Intel 82576 device
>       vfio: selftests: Retry on EAGAIN during device reset

Reviewed-by: David Matlack <dmatlack@google.com>

Thanks!
