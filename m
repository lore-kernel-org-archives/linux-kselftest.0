Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634F3F929A
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371344; cv=none; b=fYetlPr1N1spsTzkv1bclLXVGREe40G/g5SvZgwTPVG7oNSIrx9l1n2ZodM8ZDwAalZIiKM/BGKvB1jbNqz5oIkIgAB+mYLUAV0ooe/wYNskPElULbiUabViDRUk7u/RQuMdYeb7BSeNXywxnfDb1Dsa2sFjiBYFa4xInsFrgwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371344; c=relaxed/simple;
	bh=nruYDjYkbVoSbTlu8ww/YfnNlPxR3BwUDyr7YpbGo70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvWDELeeMVii/gMhK36aCwW6HM4Kc2zsAaTTxkLdxftOaPmNjfz5ynKrV959law2UlGNTkJ/osdjEVhQWrWbYQ+miFdK6+b72o+rzU89hTMus/JZCjbZd/Y9ajsJ1Yvmwu770GE4jA6GdgPMivgyIepib1SckMmmRfJ2oocuFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=if1Z/eZT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="if1Z/eZT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847a483e344so263360b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783371340; x=1783976140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAKNTA5FfU2S8dXtknGgkQ1uEtqxg5UVf4r8W8OhjYc=;
        b=if1Z/eZTtu4Y6PqfiIVg78VuoGxKinIq+QC+pRNCjopx5djzGXSeQugVhIkcmfY0EA
         UAi4QQJmKltz7cnXvRauCGE3aX/j4gquxi901xxOi+EGM3dlaAkginzXz+ZxSu9NSUF4
         knYIC71WfR8z2plIx4r+RF5k7Bk7jZe5VqVuWW/+eSw6qoNeN/Bg/neoeLfX7++MiOgU
         YLYcRan09ZWHbHpx1UJvFegbOLdrKVeGHZUrHN55A4R+o+0qrkvxggTNlj6SgY/ON1S5
         IzQCAG1wzruLXpFSWJ3rVN56K6pCJhb5vOsdyovs69nGfMqRvmprM4j0chVepqM5yqxD
         SDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371340; x=1783976140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAKNTA5FfU2S8dXtknGgkQ1uEtqxg5UVf4r8W8OhjYc=;
        b=AE8wQtm6mqeiyoB0RJ/oJW70mhwGhVyyix8ohCkG6ZenVWwsGiAoy8yDPijJbwl+Tt
         ij9dmxBs6fzBjv8niuOAYkEmNumHGl0cwE5YvzjzEBHfZydqidT/UhJKRACBuhFZk4Fr
         J5tJhCXyi3Nf2EfunOdL53TZTy/SQVOAeEk5bfsfEUgWHau1T0lMlWfp2rs/qNXUidb2
         wYnNpf90riP3wkdTOAk39YF2VffRMEcSbDtHiTsRr7HayUChJFZwZiuDWYazaNO1fsrP
         IZTEzlG1Q5dtOdYVEJ2siwXYNgBBxPDA3R0WbOkxZYQbWICVsXUuV3uGLyPufcNRZd2j
         /u6A==
X-Forwarded-Encrypted: i=1; AHgh+RrnmIHBZvgEbbK5XlovpE1hPCTTJsM2CFpmhkHcOPPUGmysW9OX4TN8R1W8Usv6eP4eoHMdOt/rs+5KZXA/rak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22CVp30pH284tUosJP45vDIEvcVHFcEyURvXM81sVf3PuEJj6
	tYaUL/K+c4rt6VaEn9B4Zs5oY5XdiN438wHbEa8OJiIZKRG5W/tr1tS3JsbG4RfUuQ==
X-Gm-Gg: AfdE7cnCAxGuL+tK8bd03cpr6E5ORzYvw01Gh2MC/zgzEREv9TDAaEeSyHNFrYRPkls
	yjzvzW7R+PRa9bAjNUv6ilz2zav0q1JRbcCOmxt7JnLmkVW0IIcJ+FviuBzIkjN1qlcmZH3SPzt
	6fhV7DTn7NXri2BJ6IFmX33lDtLcpkbwPNwl6xtVRfl+82qvr6wU5aoEHXCbZSH7PE32Wvn+HwQ
	/vgVNZEUtchujDkJ2htnTiLjnJhkKhmEw2LStW3MnCSO13UvaInvvFzQqPD9i3DWpIMrucyhf7n
	D0rhRmiXdHI3TAh74whxCZp4DWsoh6/fz6loazc4AZ/lMXtwNfz1NLxPKs0e3Qd0Dc39yoyLq4z
	bZLHj5T2eT1AKLQakXdGNS+RORxrwbRr1LhgqAhG/CwDFFQu7dJV/YI0mPcrrnGX8dYdhbMgssk
	xc42dFDi4p6jJ845VS851sd+iEkfSyOZsjC/1WlWYJnmQ87HPR2DZVspjiFYhaqA==
X-Received: by 2002:a05:6a00:328c:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-847e1928c3dmr13916968b3a.33.1783371339851;
        Mon, 06 Jul 2026 13:55:39 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb754asm32680a12.13.2026.07.06.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:55:39 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:55:36 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 00/10] selftests/vfio: igb: Add driver for Intel
Message-ID: <akwWSNbHc2fprpcE@google.com>
References: <20260526235417.2058313-1-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526235417.2058313-1-jrhilke@google.com>

On 2026-05-26 11:54 PM, Josh Hilke wrote:

> Alex Williamson (8):
>   selftests/vfio: igb: Use PHY internal loopback on 82576
>   selftests/vfio: igb: Use advanced TX and RX descriptors
>   selftests/vfio: igb: Program MSI-X interrupt routing
>   selftests/vfio: igb: Extend memcpy completion timeout for line-rate
>     hardware
>   selftests/vfio: igb: Disable PCIe completion timeout retries
>   selftests/vfio: Add vfio_pci_irq_reenable() helper
>   selftests/vfio: igb: Factor hardware programming into igb_hw_init()
>   selftests/vfio: igb: Recover after DMA-read faults
> 
> Josh Hilke (2):
>   selftests/vfio: igb: Add driver for IGB QEMU device
>   selftests/vfio: igb: Use offical IGB headers in selftest driver

Please switch these to "vfio: selftests: ...".
