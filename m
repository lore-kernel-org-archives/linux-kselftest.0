Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06423E9284
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 21:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372581; cv=none; b=ROmmTD6ch6D+7IL1dvSIJG5jgDU5rmb+y+rVwZ0S32ohOu5hokTMQDxmb7Wd9ZiyWPdRQbVe4Omlga29GlilO3tbynRUBaguxNDVKadtjZ29/9B64VT7w/RKEY86tNMNOWpR12nKZSSN7/wqoJoeFDD7++ynLoZs176+XXD3J/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372581; c=relaxed/simple;
	bh=WICdANMRcBggP+LFV7A4kdek+PDiJFQmRUwULQJaBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0uGwn4mPGLeiFtdYXhWMG+PelNy2ZtPpSgcQo6FCANSIFUmdwPm99KcZp6PpMIJ8uHkKL/TsBlugdILnlmATnp6YGlnhQGDzfcY7/2LlKXc0bNt8uEmxcxD6QmZhKU4sYPnIpUtverXQmTbCMrVZvIyLtYH+CcJEgNUQ7bwfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OiPadX6i; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OiPadX6i"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-847a5528b33so1871315b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783372579; x=1783977379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LUYJXxyTVrF/Xf3zdbSU1O7JfO1KsmE4iaB7Xr6SKQY=;
        b=OiPadX6icSufkFFppNKQKQpksPUsfoEL2NqGVr1/sGij460r64UQ/tyJNTPktQd166
         o/EL2q6JAjEidvwH/FFgjOB/yrIri4mllSBkuSq27tXJjsZ2Z54trcSJvnyNdFjwIhCX
         rPVhfPQhzR0JHv6Jl8/qoK+mkAyB7VLv+BM/G6LTYumxK3+5PPUXkHsLd1kxFgvK3aub
         +C8Uh59hAl9owOWdD1KTv6Q8Oh3olLePNssZPsgISe1iDyLKw4afPJ007bjiW7ZMIJxs
         zaVGBLGiRKUitHVDQS1bIJC4fZD0DB6CPgr/CJ2DxLJwZNchVfTt3PB9u9cnVsMFxS3P
         eNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783372579; x=1783977379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUYJXxyTVrF/Xf3zdbSU1O7JfO1KsmE4iaB7Xr6SKQY=;
        b=KsqYEeUO/e2egf+MlQ64kdlm1e1rRScuwbsVu9aUCcEm31MPnPpsmUjPy8bdHdtMqG
         ySm3b1IGdndiKzQoXZiPc/2B182DhjAE2bwLw3cxOfBXU/0/yS7hudQHwEFsG9j7HhaT
         cvZ3GxBh76LKz9GWQ2Stg2S+/ReFvVlrW5YiZU5DWIhTCri4gSln8yz6Z7AjKK8OWhs0
         IXD/QK6olfvQ+VuXkpjM1RsVyuG0quXDgOtLFWBIh2KqWGWEhuxr9kLBGCTtJeVSzvlk
         pspwuuIovgGRnuOoBT5baSkOeHe5U51HWVDwPbhIlNxZI+AnsBo/3HRwMQgn112+K4jb
         bArg==
X-Forwarded-Encrypted: i=1; AHgh+RqRGySW2p+ug6bMg4vmOqo8Bi4dAYN+t5gKocbyHkgZvSlu+82RKhc3XIGRssMpmg0rLyPn4a8iSq6f4b+pdHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5CUrr53WHsFxXn/rk7cH9L5tAyYq2tbituXx074ak1/6LhgM
	2BO3FDMF72I81PkznXH7IIW7iNkMEEM6ZObkgf5zVlhO0RZT8iYDSTwpmB/s1a+/Eg==
X-Gm-Gg: AfdE7cnKQZFWbxMekdXkAfJl+bsROi8ijVyEcV8bc0QF/mwiq0pwT/IO19sxGbqUs9Q
	NwUPJIy+H3uTSF27Bdbksvm3t64cywzn4DZurNOJXH1SRuchRrH0gier4I0+3gY3DkrG8BjmI8P
	mWn5eH/21M6Qafy5XFgIANlzAvJ9EIKqIXVnyxxkhHbXJEAHO4pnMi1Jod/2bM6+yBqsbWfXXsu
	jho5Y9APrq/KYp/6ZUcqfuLRqPxyxVuDODTnBEzT81PQZRFJ0/Wm1pScHgeF2AVaDhzwHdfEptp
	3BKZkPkHo6y958hOjbIGRNPZyYI4plr2hklvqOgSsFTOKc90bgrI4JVh9V7xxjNOJmQcf8dBy/W
	XTBb7dDIx+YaS4AStsyT6nl1PYLJfgk17DjCpNOBkrsewnReiK5ycgCmeC0HhSWSDyDx63OmyVq
	6XnDN9DemaFtQybBfGV1ChnmlrldBRTTgnZGPCy94/mNznke1l6tk=
X-Received: by 2002:a05:6a00:4514:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-84826c8fb8fmr2436174b3a.2.1783372578727;
        Mon, 06 Jul 2026 14:16:18 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4edb4sm4354758b3a.33.2026.07.06.14.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:16:18 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:16:14 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Alex Williamson <alex.williamson@nvidia.com>
Subject: Re: [PATCH v2 08/10] selftests/vfio: igb: Factor hardware
 programming into igb_hw_init()
Message-ID: <akwbHgu5iOBlBR8k@google.com>
References: <20260526235417.2058313-1-jrhilke@google.com>
 <20260526235417.2058313-9-jrhilke@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526235417.2058313-9-jrhilke@google.com>

On 2026-05-26 11:54 PM, Josh Hilke wrote:
> From: Alex Williamson <alex.williamson@nvidia.com>
> 
> Split the device register programming out of igb_init() into a new
> igb_hw_init() helper so that the same sequence can be re-run after a
> VFIO_DEVICE_RESET to restore the registers that CTRL.RST clears.  No
> functional change for the initial path.
> 
> igb_init() now performs the one-shot setup: region size assertion, BAR
> mapping, CTRL.RST + IMC mask-all to put the device into a known state,
> and vfio_pci_msix_enable() to set up the kernel-side IRQ trigger.
> igb_hw_init() does the rest: ring pointer setup and IOVA calc,
> CTRL_EXT, PCI bus master, GCR, PHY loopback, descriptor rings, RCTL,
> TCTL, GPIE/EIAC/EIAM/EIMS/IVAR, and driver-state initialization.
> 
> vfio_pci_msix_enable() moves from after RCTL/TCTL to before all
> device-side programming.  Its only side effects are the VFIO kernel
> IRQ trigger setup and the PCI MSI-X capability bits in config space;
> neither has any ordering dependency on the 82576 device register
> writes performed in igb_hw_init().  Performing it once in igb_init()
> keeps igb_hw_init() reusable from the reset recovery path (which uses
> vfio_pci_irq_reenable() to re-arm the existing trigger).
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
