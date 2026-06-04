Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F34418CB
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578732; cv=none; b=rjoHIf2szs7OZ5a4dxdM1aEpmLB0YuFIzBBqxRCDm2dQfHiPzsXqyym8Z5vzCTPidelViFYtG7YHIKljGVRPyzBwvE1HX1yOBFXn/o/jF2iCEPc3DVKtu8LSAEPkmkyP85HYrKkBU3g40LgdM014qnw2IrRB/oL8B9eSZ6Qkyrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578732; c=relaxed/simple;
	bh=OBm1VVRLV9hTK6acHhaWSaLn8uBTeuKKPYlhF6rnx/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/6OEKSjPz43kCxVgmJq899gib/YVLRRx7fGwKtQ7qi3YFs0jgAPujkwYLF+8yg3+SQNoEWLYHmTMcP6iAliQSBt0TrTgcGb4VUmQmBa99BuKxhcbCsu7hRNMkVXSKs71jZWzwxc6SGJH4/uq8qLSMmZ68hIhCPOlB9jzSeVt5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QlwGeDI+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QlwGeDI+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so8319705e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780578730; x=1781183530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeztH7p5NnQQR0rqBoGB3AILnqpwzKey0VzI8U/0hC0=;
        b=QlwGeDI+vQBttrkUv4bB8A3QG6OeQkMqL8NOlGSO3/vB0mS5OVBTpIdv9xy95jEt4A
         JqRpzjN6TKjSKxgVOtDMfvRYKJcRzDohCPiW4udtZAz4lYFc4v+hdjTSsXnnV9zbuYsK
         sFa4KQuhmRuZXDFCaf21UbFwHoZRmCZQoRji/99A5YFs3eg8hxN23eP4whgkY5i0agQt
         l0u+5i8a6ZIbvtlHlk8FJcoW26AJRCJGvujr6sAJAsfgzLTu3k8c92HKJVad6TRCrU2C
         jqWWXD/MWMOk208FIOZXj8/mGJ/QvRqq8gvHZbjpmIu0pKXQFAb8JT5wKStQDPkPPd4b
         edzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578730; x=1781183530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeztH7p5NnQQR0rqBoGB3AILnqpwzKey0VzI8U/0hC0=;
        b=e3+oNm9m1kuzx3IgwuI7lExJlxpvYWEJkgwuLJ4R6xYBv05hsqk9OLNISsr/DyIVn3
         nfcQ62EOh/2CH9oOO31zSwmDTLw+Ed56L2m3XmhYKCnVJoBduRfeBKCBsVJErpt0cYgM
         ADZsbIXxKlIfYuGpZowLFUf3QSq6EoTDtiNb38ku4UQ1HV0+IZrv9Nfej2HP2toa3v/T
         7FhUaFNYpx81Y79t7rx7cuQAT95QdWjyMK1f6+a5Di9NLsznNSxiwLAsKM/fIPwGdSGt
         g2G0y+CjBuhaS9ISOn/P3VRY2NWmt0QaS3/h6HCQZzjUFHEL2w3vjGUEZUQzeiY/nLGg
         fUpg==
X-Forwarded-Encrypted: i=1; AFNElJ+qC9j9qsgfeETA3/w8Ts6sHE5zT9h3nMQGZIu479Um0/d1PnskyLTcr+871fswxBrzlArnv8g5l/e2nbeib0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rFrOvo54bRszJ/0IwdLl9+LwQ8U0FkV3EpbAyP14O/KvKb5F
	WQGrFH2bKNo+FRqjGbRkd9m19RIbFzLJ7ErYS4RbLGTzT4MVi+GNSNJEjrtFG09X1RDN5wlbQBC
	2/iqF
X-Gm-Gg: Acq92OEg2KrdOPFssvC/lIUZ8k6NTFjGhC6aO6aQHiEApxOO3INW/Z3ktULRmF08LL5
	hzBgZGK3JrWLKqTjlxDmQoEGKtlobsHrcpOWVJtAUjvYCUXB1M+Ny4Q711WucleeCZmXzM8gxLJ
	qdXARtJNL18X4BXz/OrOtq4KC81W8RYJR9+lYfHUN33RqEYvmYOrUD+R2R833PmADcRG8xWfwGf
	AviTIoCwajXbUqfpN6BzidiK4Rvq9lJojc3iiZFQITqdOUt8kZu9NvrXOJtbcGpHmC19cmUAsxl
	emSiPe0AVgrVRT7jbTUO1xwVmH9x/GRmwZabFdz5iV7wJuA5KoONa1Fs2Brd33zQE02nbrFSKgo
	qMtkaQnMs5B00s8cDqA/A0Donh+UFnLXSDQJ80CyHhZJzU1j6fbLy16+KPdeOzqmL80gpWIpwSb
	w9eI0/HmlwOKlwYJe13FQOT15lUFg7giYiuQj3
X-Received: by 2002:a05:600c:46ce:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490b5edcbe3mr118541755e9.25.1780578729826;
        Thu, 04 Jun 2026 06:12:09 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm72658335e9.15.2026.06.04.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:12:09 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:12:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: mbenes@suse.cz, jpoimboe@kernel.org, jikos@kernel.org,
	joe.lawrence@redhat.com, shuah@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/livepatch: fix resource leak in
 test_klp_syscall init error path
Message-ID: <aiF5pxL7T7wa0S0b@pathway.suse.cz>
References: <20260602124509.365996-1-qirui.001@bytedance.com>
 <20260604083208.1071428-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083208.1071428-1-qirui.001@bytedance.com>

On Thu 2026-06-04 16:32:08, Rui Qi wrote:
> In livepatch_init(), if klp_enable_patch() fails, the previously
> created kobject and sysfs file are never cleaned up, causing a
> resource leak. Capture the return value and add proper cleanup
> on the error path.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

The patch looks good to me. I would ignore the proble reported by
Sashiko. so:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to push this patch early next week if nobody complained
    in the meantime.
    
