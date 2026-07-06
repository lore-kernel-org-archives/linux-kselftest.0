Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44F3B7760
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372604; cv=none; b=GLXNjFJxO1iH0BJ4zoV2eKYY9m7p/6P2dxuXVx/Y/pRY5A+oFAiS5WB9sJoLSIjXAwvNlwFNKHTs5loDUW88Jrgtlozq2X8J+Feo0Y3dFFXuAgAk9Wgz4SpuldFFh9cDhh/XDrBNqNoX49R+YAv/sF/RnL9IcLm2t5Am4bnYevQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372604; c=relaxed/simple;
	bh=4GnilHduczk3eh6aVBjNmxjoSJR+DD5x02tgYeQxXb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKs8CICGoTIdAxUijmzTAHcN6HFcXVUaQofKeI0X0aq1nioJaeV+FgZJknPkdilF6h/JB76iI0IjonPFhocUxwTyRLb030+uEwkqozaVhuml22nspGTtpbZqhSorIPHAeQkR5yfAxSSusLKpzon4B3VSdEMX5+1FjywptXhCLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ML0wLdsJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ML0wLdsJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8478a25f268so2611608b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783372602; x=1783977402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5hIaEd5PA9pW7IosYUjHC2CfzgghDNBXbRfDIivL3g=;
        b=ML0wLdsJHKwFfjGsYdFUrxY1e+M19mIEdQO7sh0eTHNKrbZt/rvSttEIRGcclyE0Fp
         aJwVnD+CZ7ODOlqUTrGbN49JxoxvxFI1sCBvx88mHyT76q3FmawLJVtp/fSyvCqkV1oS
         vzfpeObU2YiLV9PguQeVFh5jHLRxkxv556lVftzTueseiK2lq1mu6S5MYkLqWqs2Aq1L
         Ep/KPp2oYWZDUrrQ+8lGOwKmoosHYukPViWFatukY5gtAiFeAPwNA+McJpo8tiRrKP4p
         N91XUCT2OAYTYm8iFUjk01rn1eE8ne8v2cdGNFXlAFgRKWwEcRwiiNp5EIjGIY99wgjo
         /d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783372602; x=1783977402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5hIaEd5PA9pW7IosYUjHC2CfzgghDNBXbRfDIivL3g=;
        b=TRu5fm9XIC9iNEgj4H5TsRWzRHYTad3YTob1YZciY7neHniL5qIF0EJHsJG5rk9Lj/
         tPhH8BqtcHMYwk6P8yO8h9wt0ZlBRwbOQO/D2bnlrWDV4QIzgUjgArylX49TiQmI4qTw
         76qfPZXh3E2JhNTTWh6E3Wpi0LFtZiGOqHhqdukPVwM5oQvNCbPwdtgS06YCucbYWjCn
         g5xsjTxHMEdamOiVqnsRloyeUe1jBjyhp20aFcxvLZ499EohINSZzL9njjMQykRWo3tX
         KT2cruus199kTCZuwH1GqSCGXChhF471YWexuSx46iNkg6Q5evafbCYq9o3Rt/5hFT4U
         fCTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4KqQNzG0nJXZbycTosVSbMaNLf/oxFUtJZaa4lKr+4LYkESkNQEL6d61aOsoyizSbDEjIgEmivnlWR5NqLsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVe/hlfhoCK4VVPRR2W6MOfjNqMs9V96VHH/p5lgWYxKZ7Amy
	3WyebKDZFalZg4E2+h0NyFnUTbZjEHT5JjDAqOaXmRr19LgNkaJWR2hJWX/IWOVv1g==
X-Gm-Gg: AfdE7cmZM6+NSoIQT7g3i8ARnPnK09sK/DcvwXt7NRG07InizeZiOf5/n3jgA6QN58N
	A16t6M5jOj31RvEOk3u7iz6WJqivyRcjRHyjP09BmpwLRFEGbCqEmE9/NBRE3T3luhQ6AjRKNSQ
	fRv0SGXwgc95umjiHwtecUtRe0m/Gyxz63QnUEgRTi+hcNuEX6bmj44yT844qPUbNOk26pjai2W
	0Gqq4KWg2YOl55yTAR1Harywwt3OLwGiQJOloKQx+b0nN3FTw/hWRr7AJTA/WIoLlJlMG5dX6Ck
	U0nVT86mTi0HDujggvdpn8y0W/vr4IRSU+ThmH0zN9BZkWtmKIaVX4mGB6kYlvKBbCLpop3Vt0F
	P23kcD8qy6EWQ9qQscJipec5dhK5kHz6Xz9M0NN1nRrjWKorR2bFKaGuOFB2HcyagDikiHpsDPf
	/YAvhvTo40IrUu1H0MeX9BDrYC6UKUhb4FtS9h3YzDdE2s6O+GIBePBQ9+uaNyuA==
X-Received: by 2002:a05:6a00:18a7:b0:845:4d3d:c8c with SMTP id d2e1a72fcca58-84826d3e363mr2212071b3a.39.1783372601975;
        Mon, 06 Jul 2026 14:16:41 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm262662b3a.54.2026.07.06.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:16:41 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:16:38 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v2 09/10] selftests/vfio: igb: Recover after DMA-read
 faults
Message-ID: <akwbNmaeX0Jmvs_x@google.com>
References: <20260526235417.2058313-1-jrhilke@google.com>
 <20260526235417.2058313-10-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526235417.2058313-10-jrhilke@google.com>

On 2026-05-26 11:54 PM, Josh Hilke wrote:
> From: Alex Williamson <alex.williamson@nvidia.com>
> 
> The mix_and_match test intentionally submits a TX descriptor with an
> unmapped source IOVA so that the DMA read fails.  On real 82576
> hardware the resulting fault leaves the descriptor engine unable to
> service subsequent valid descriptors, so the next memcpy in the same
> test iteration times out.
> 
> The 82576 datasheet (section 4.2.1.6.1) describes CTRL.RST as the
> software mechanism to recover from a hung device.  Empirically
> CTRL.RST alone is not sufficient in this state: the visible queue
> registers are reinitialized, but the next valid memcpy still posts
> descriptors without any TDH/TDT progress in the same process.  A
> fresh device open after the failure works, which points to a reset
> scope broader than CTRL.RST being required.  The 82576 advertises
> PCIe FLR; VFIO_DEVICE_RESET drives FLR and supplies that scope while
> preserving the selftest process and its DMA mappings.
> 
> Add igb_error_reset_and_reinit() implementing the recovery sequence:
> issue VFIO_DEVICE_RESET, re-arm the kernel-side MSI-X trigger against
> the still-valid eventfd via vfio_pci_irq_reenable() (this does not
> touch the eventfd, which test fixtures may have cached), and
> re-program the device via igb_hw_init().  FLR clears EICR and leaves
> EIMS=0, so no explicit interrupt mask or cause writes are needed.
> igb_hw_init() resets tx_tail/rx_tail to 0 and igb_memcpy_start() zeros
> each descriptor before submission, so no ring memset is needed either.
> 
> Call this from igb_memcpy_wait() on completion timeout, preceded by a
> 10 ms delay so that PCIe/IOMMU/AER error handling triggered by the
> just-observed DMA fault can release the device lock VFIO_DEVICE_RESET
> contends for.  The delay is heuristic and tied to the fault path, so
> it lives at the call site rather than inside the reset helper.  The
> failed memcpy still returns -ETIMEDOUT; reset recovery only ensures
> the next operation starts from a usable device state.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
