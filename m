Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB353E121A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 23:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674921; cv=none; b=N9BrTWCxBkw7P84cdgQ5B7wy02ZzrpGveXOm19kkV3UHDvX7crs79yHhqGsgwqzqk/cB87AcE812OZIzUuRLsZLWGLbilofZGaPFZ121JmhPHqbNtpbFUzIKB0MgPi1T1oOXsUNXx7XSskgr/0WlLTh2oNTkZ0JIpuc0bW0i4NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674921; c=relaxed/simple;
	bh=3Cr1A2POjnzCcB+br8SYLnQSxPktoAwhRXdyXXPM+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgbjO2Q29mEsnXN90xTXjsP+ukXo5QDCyxNR4gG7B801yHkE2bJkdxfF8iw5lUCLQRSnU+CtNVKOI0MU5tvUBoJesIngmzf3ITR7acHAToE5wbyDRwg+VayyK0EKjWCjJ2O7nRuX8kc6SkQmpwRpHbNlMccwcP9OUg3vv5Bd1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IDed4SxW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IDed4SxW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so7904078a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 16:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784674919; x=1785279719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aWumlEryAynaem4cRcgrK4xla2uDWMaLo/YhEcBEUA=;
        b=IDed4SxWCLZqmn/TSrpuwNbKh+HjxKUkvypBwndDYPp/fjg1RiEmaMd2aIMf5u92G+
         Q6Hro1edyv67bT669kKYkhhMAOqGL1jeMdd9NxVg43NEJJQugNREmMEzOujWBXpxy6HA
         hmN7pOnF2goqqitaNdnCab1zzXxl6BFinI1eByakTjNGygx2CVb8sNjAj09aaU/cZimu
         sn9CIRCqy6EHQSlgI1T0Xw/BJcR57ZOHz4DGY6AQVMj6FLS9qXwy8mGrXrHukKfLPB5C
         0r49nkMtNrj1oRp+Bd8C9odWBGmekuPWzc3v4hSBtJFVE2xrLavUcthk47Ty0g8XNKcc
         bSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674919; x=1785279719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aWumlEryAynaem4cRcgrK4xla2uDWMaLo/YhEcBEUA=;
        b=D0flBR+NLRru8ZAQnINae19Dkx27+fkkfB77OO5PcXwbOm0ywGC7Ihc0cYy1QAj282
         RJyRn0MAwphcEHZx+o0TCk5YwZIodRXU4dnuRBo1IaAA9Ar+TfVuaefCLyzjKbyDRFRI
         mpH1mMyqlF47IVNcoQvW6dXe/XhUumVKn/chXtNW1EGEnj82KqRoZ/uUJ+xa4pdAqaPd
         mo7SomfwrRfSBaCi8GFe8cY9yKSWP47hYcxyj7QRsCX3bwFdfIS0IUujtyF8BG0dG3Y4
         3mZBL3DN2iEtcdDITKrAriHSy3KNnEsoAQTe8LW1LsYvqRFFR9kNPjUILBmLz8VO7x0A
         RONQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEh16kvs5RNEcRL8zQU9udiW1y1uf6Q5GB2BgRTRp8x75Ut+6uu9LmgyifqdoGIYfXIV+fZJb3hvhLO9yVc6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Z7JrgK3okVt3WBnXwfdJMHure27sDW1gxMQEpq28/nvIhaM1
	tJRBbJE/jq/iSNbuAueAy0bFo5JUA3XffYRpBJ0LBSp7Vp400J7rJR7MdtlW1/bSxA==
X-Gm-Gg: AR+sD11LyIk/rA2OwKryjZxUPNTHSxdoBJqrMPQzIi9jkzXwiqg0DVGoYiFmvNBHVlr
	sQYOXT7RDwVNAPGq85zrAWyp2p/ODpuG0hfyJi9uWaYcb/FtJ6HH39bkMP2p/an8q6FXiE/NB+j
	hy6sEihyk/0WGbO6QvRaY58rgYW5dO2teuI5aR9nEF+L85Vcg7dc5EXe/FVeUEmX+xMbI6iAWzj
	1Nc8c3gpAsG39AmElaTT3gT77y/BWo5bzEpYu7xERekkL8laToC2SGLSgxOFFMn0LBIdn+9TKRy
	4Cti4pYkfidC66e1FObAkZ4d1E1SEhzYCNIc25JORUkLWP279/l1FEyIcPVWp/H+d+Xj3sLQpOH
	mZy7GK2fAqUp9Kw241AU4nZ8UWHc8k7XHMMkg9PiglDrQ9YKBKyrq2q7N9odt/gU1BA8N5a9hHp
	fr+9b9RddUPRUkGjua+9nLe5IiCOqU11Cr6SR7QSuU
X-Received: by 2002:a17:90b:4cc3:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38e4b43ce07mr21638970a91.17.1784674918093;
        Tue, 21 Jul 2026 16:01:58 -0700 (PDT)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea78479b9sm52577a91.1.2026.07.21.16.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:01:57 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:01:54 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v5 0/5] vfio: selftests: Add driver for Intel Ethernet
 Gigabit Controller (IGB)
Message-ID: <al_6YkXnE_vpapNR@google.com>
References: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-igb_v3_b4-v5-0-91503eddb98b@google.com>

On 2026-07-14 08:57 PM, Josh Hilke wrote:

> Changes in v5:
> - Restructured the series from 9 to 5 code patches by folding advanced descriptor
>   support, MSI-X routing configuration, extended memcpy completion timeout, and
>   PCIe completion timeout retry disable directly into the initial driver patch.
>   This ensures a clean, fully-functional baseline driver from PATCH 01 and avoids
>   intermediate legacy descriptor, timeout, and bus-spamming bugs.
> - Reordered igb_remove() to reset the device before disabling MSI-X.
> - Switched igb_irq_clear() to write-to-clear as required by the datasheet when
>   EIAC is programmed.
> - Refactored hardware reset logic into igb_reset() helper with proper sleep
>   (1ms mandated by datasheet section 4.2.1.6.1) and poll-assertion.
> - Simplified reset completion check to usleep + assertion instead of retry loop.
> - Allowed arbitrary loopback test data by enabling Multicast Promiscuous (MPE)
>   and Broadcast Accept (BAM) modes.
> - Fixed igb_send_msi() to use MSIX_VECTOR_MASK instead of magic number.
> - Link to v4: https://lore.kernel.org/r/20260710-igb_v3_b4-v4-0-56e7e2576cc1@google.com
> 
> ---
> Alex Williamson (4):
>       vfio: selftests: igb: Use PHY internal loopback on 82576
>       vfio: selftests: Add helpers to re-enable interrupts
>       vfio: selftests: igb: Factor hardware programming into igb_hw_init()
>       vfio: selftests: igb: Recover after DMA-read faults
> 
> Josh Hilke (1):
>       vfio: selftests: igb: Add driver for Intel 82576 device

This looks good. Let's just fix that reset logic to avoid a magic number
sleep and then I think this is good to go.

I'm super happy we are adding this driver. It's going to make doing VFIO
testing (especially for Live Update) a lot easier by enabling us to
use the driver framework in QEMU VMs. Thanks Josh and Alex!

>  .../selftests/vfio/lib/drivers/igb/e1000_82575.h   |   1 +
>  .../selftests/vfio/lib/drivers/igb/e1000_defines.h |   1 +
>  .../selftests/vfio/lib/drivers/igb/e1000_regs.h    |   1 +
>  tools/testing/selftests/vfio/lib/drivers/igb/igb.c | 564 +++++++++++++++++++++
>  .../vfio/lib/include/libvfio/vfio_pci_device.h     |  14 +
>  tools/testing/selftests/vfio/lib/libvfio.mk        |   1 +
>  tools/testing/selftests/vfio/lib/vfio_pci_device.c |  22 +
>  tools/testing/selftests/vfio/lib/vfio_pci_driver.c |   2 +
>  8 files changed, 606 insertions(+)
> ---
> base-commit: de61419bb27f985cb878b19942a55b026c9c865a
> change-id: 20260707-igb_v3_b4-49194c14373c
> 
> Best regards,
> -- 
> Josh Hilke <jrhilke@google.com>
> 
