Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B9443ABA
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141355; cv=none; b=omjp4QKcmKfnCduLwMxcthLIczZ14E/xgxp2k6KaltOnxgRpZKPlc5YPSK6fyy9mTl7Qb08lFd5EEDLCRc0gPpWlvZcCMl2utQMh0uIJ/vTwe/TA4XNSnuL1cU3+DI+y6L+PbYz7VoShn5sEFjNsrqhZWG1KhZRnjh7mSNDpxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141355; c=relaxed/simple;
	bh=EAL0w1drlk9iRFR44y1KTfcczLiGqgrQS+sQXndKFGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6WNC0+UemWFbxD6DO1Kgb4GWQ9ZW5xYZRrdCVzn4XzWnQzE908mqCgXQbKR9aqSuf0uAKsrsQkW66p8uoU6SRajFoVXO1D2+c1UQ9ncUX3kiKHTmC7jr/BX6hZ9b4Fq3t7uiwFCEJsSuux1AZUIdDB5Q1BRh6nfxhE1HX7lTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/xS1Har; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/xS1Har"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso27837335e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141352; x=1792746152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0+d5JuI7cYWqs6zSvGD292VqwhHrlteYqsYUHwcriY=;
        b=E/xS1HarJM/1VjZk6VVExV4VjrIjxI7zxPYbwTlA166+kCdMwWdyE+RYgG5UALv/xg
         MYNmnlQdBFTEVsJxooSR21XC6p1YlIFXLWXM3403qSeLtsYazUG/be6Oy5UPqWBPTruJ
         IgNL/6l7+IQRbnB3iRvIWLWirXgHl169CY36SbGwF4i5A+qZozIg04xePRX+t0K28LGO
         zz0wTHPNTNGgbT40shis3KLbPOhT9vOoDv0T7fae9J4d44m40JzuPGttSmLrAsMca2E6
         Z4ZatE8038/DQIamSWd8N4XmbQ5t/0+ooiKg7VZjLjSO74JYmeh3qXl2YDea2pzbWZ+F
         +P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141352; x=1792746152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j0+d5JuI7cYWqs6zSvGD292VqwhHrlteYqsYUHwcriY=;
        b=oVum8+2z3jmJcwn4M5g1us3gZosRoy8lv/bsDxVvGFwj48zzG5/y5YYttHsU1CC3Fe
         Z9WrdUMK9LsvLy3nqtr1uDfpC6eo1nMHQLD26QHTsWdMzDYRaQnzgb47GV2c8NwT+epg
         CdM7sDYabzzipic7h0UoQcZktFo7gUFHOQO695eHWPliJ+3dl3Cd3oVgXPclXzs8GPM/
         Cnz4wlr3m/XLoQAtb5x6LSfrijjYNme2Miq9w6ollEpxDhRj+6kin/VHMfAnNmRZTGKY
         r0hvJNptYE3zBpUt1bBTKAfkjiAw9AVk58xkxCGGKJJUnSFWOO/VLvTkq+EvzfMtaG2a
         uZkw==
X-Forwarded-Encrypted: i=1; AKwUvBw5cqUxDlJwtMGfcjoZJyetuVe0+bwTopq/ghwk7fxOJH1cFSadHaqCB/L+/O/z/lmLaBv1o58GmKGzinrTqBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzB+DeSja7g1qdTQ9FGXXeKGtrRRDHtFH2pzTWbSdb6PazVWli
	f1kmdWZlWqs/zLDTxtfJbCQPKcAppWLSuTDiT57IX6LPDqv6J2uLgdGm
X-Gm-Gg: AYBFou0MatjyLwXnzLK9F02aF6n2f3IHnij/0RsuTk+/DjCz9/BygQKxpRdOTO0XyFE
	ee20eZYJayQu6MXGc3KXbCSs71DCs5tuX71EUK59hpaLse/VaYZ1JYW5CybC1ZbnPi4lBo6C2kj
	V1VJ8I6MGOIdoUg+pibGTgcHFxYdtVuz96ENJujSELlSu0F6DFLrQ93STEgSW1z2x7SxPbnASEn
	7cLNZo9JV6dI0wI45jivaqwE839duPEeB7NRaAt5EzNCe011rQEGrWZYXevNhfIxkc4x2dFaCuE
	KGZAa89MhQcSDs7t0Hmpbj8TRhd+O7EANsPFRlGiwiI5qFYY2/x6g6GTKiqfIgfLVQxo18+AmiU
	tiRriWXSxjstjFtNfbeKPnpdrLm78mgF+ka2FPQ5PhNZs5HGQUBL4GtxhY7Kwc1m6S0sDiS/9JP
	SzBu5E0KJX0KbYc/mRFbxO0gZJz/KH4SM0XH6Tja/VtlEC+2K3P03KV+6SCe7tDl0emdn56uU8u
	D1FZiPm3J793WjckhomtXMhbKZzY0FlG5FeRmUqfrl2Bg==
X-Received: by 2002:a05:600c:46cc:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18e4c06a8mr416698625e9.25.1792141352107;
        Fri, 16 Oct 2026 02:02:32 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca30aa4sm16138995e9.2.2026.10.16.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:02:31 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommufd/selftest: Check dmabuf MMIO mappings filled from another domain
Date: Fri, 16 Oct 2026 11:02:24 +0200
Message-ID: <20261016090225.3824-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015172243.GE13920@nvidia.com>
References: <20261008125206.11990-1-parri.andrea@gmail.com> <20261008125206.11990-3-parri.andrea@gmail.com> <179200036595.15213.9864724554843977359.b4-review@b4> <20261014211608.291608-1-parri.andrea@gmail.com> <20261015172243.GE13920@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 02:22:43PM -0300, Jason Gunthorpe wrote:
> This sounds better, but I don't know if we need all this code just for
> a selftest.

Fair enough, I'll drop the selftest.  Thanks for picking up patch 1.

Andrea
