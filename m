Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF82772D
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496798; cv=none; b=lJinVXmzj3dEve4b+WQm7NCOTSoUsUhN7ibi7Drmt35pLwQC0fv86WTEsB+Di0Gmohnm50hfypbMkbTy8d1xzoyzFTke2adWlzhwIOWXApPDFTJZU75fmuH2b1RIXhvNQpCmSioAmxIqsLlEAabvtcgg3CrR2K9PbvG/GWsK6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496798; c=relaxed/simple;
	bh=W2KgLfIMUq9nYm3lPVNNRuC+rhvj0c5Ysm7uBo7Ldm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RY2wL0Xv/3RJUcLWCZsoL3iSQlQtFFbEbAF9lwRWSxe6mLgXvz1qSGR0SjsNMsgu1mrMFE3aa9JQ9sQ8EtFoVRM8+zKsqtcrMR23ncLYEZWJ6/nDh9k/xnIvvxsc/WL4GK6sWzcHiVw8YZNKHzrHkRZumsQ5L9Cfxr1lL0JeKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lfjoIpEp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lfjoIpEp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b1a48855so91325ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780496797; x=1781101597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSsx/HNJMSWT4+DTHx2JEcyU4YhDU3KCMcSKr9Fho38=;
        b=lfjoIpEpvOxQf7b0pzoV61H41r7luLFBo/8j4ukE/1cP82vkmB/vEi0lX8J30PrJy7
         xub1ZDCvr1wA+64qIjTJXmGMPNHnN4pkdObh9qf0WtL0Do0jg5yts3G0fnVnhbFA9phE
         1vTS/YhMeWLESWIv22hSqKWtGSOnjQqk1wWbwiFf4F6fQRz2GWXt93sYhcuOuT80u2vX
         60zIm+dnBEuTkqPvRsTRp4UyxWaHBbxdc8Prlg+zRMXZ73IAaHQ8o8RDqhRbaZ64nSBx
         phJrveUPrMHYiBp8FtXqW44ZtazJv4B/k9Mk7OVROn9WXAArbhlUQ1Zov2n/IKi/mm68
         Pprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496797; x=1781101597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSsx/HNJMSWT4+DTHx2JEcyU4YhDU3KCMcSKr9Fho38=;
        b=P3GnbtRIFFeEsaySpITWEQO+hOdpEfw6PVm6R3yBck/IFC/Sz1AbywIsR9fNpsbgUd
         b/I8mKWwDWhetA48ZpiXNJrYGvTlBt/K/aX66qLk1WFsBgIl7DL+Dcc+8mouX8RU76PI
         Rs+d3d0ENQ2F5fDqZj5JsLPX/7sDssSxg919zqzG/8rUkLwGvdugNBa6BX+dzD/kqzog
         pdkliuFIrE/3C+HuX6Q2qAQglj2Fh3OIOnZczE8445xE+SZzxDn8Adb+6qaZyEKtDHYc
         5EO7LIbiEZZlNJU2XhEBp1E3wNJKZKtYzua1vCAufxGBlFS9Nlw96Cnf2kCUBFsjPGSQ
         6kEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RqDhJ3JzPolbqvl3xScCCJAwtqIGVk9g8Xmjd1HHvcPgVMNkZf9TkMaviz6/pV39s/s6GErPYrWeWroYRSxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEtU2RogwrxVNHiysEmrnRGxjsA3ANyGlgBTSFV0JNVXRQj1+T
	8uFUPt4itWCS2GMVQkkNw0vI7o4UXyYXYfZ9/7FKlyTULZEV1GmJzpCE8r6h0Qhtpw==
X-Gm-Gg: Acq92OHInEgthR17T5bA+91FBHdNvozQwy9LfmgztifFEd/jY62TSBZjnyxv04Iorv/
	9+n4HD+LHGtES8lzm4Y47uGpx/G4dLP/o3cHijYUn3XYDQPWJyyG6ufd0zvaJZP01GHdV1DPRSu
	+ZFdb1WnFaJvarQQHHsmZgB+c4Fen9fLZ9g08uFyt4faC1XDZcchk85HLV3ylLZPAjvXg9/2Dp+
	O/+x/KhVTQNAPgZO5YHzTuPKoO6cwPwEjMXum8QGdhB9zA0w6+oGfUiUXujNp4z94FD0C33xtvr
	sNtE1VWuNedqcA/tSv/n8o68BBPIDWuCGxtpAEbUYh52r4lDCMYj+xubLmyzbMiS3Y2YWu+EI6B
	5Ihr2xRoMu3+5Evbc1zW3RxWo8ukwFuASFlAfOROF9TeK+Q8CxxnpR8xoNe5RaJ1kuPLS+2tjE7
	uEVtxTL/aQDGsG0NQ5AeiKuiwtdvpdCmyB5uETYdQ9LAlkwCUEWH66fDckbDPFlvKDbEWPW4c=
X-Received: by 2002:a17:902:f712:b0:2bd:63cb:c5be with SMTP id d9443c01a7336-2c16fa7339amr1648965ad.5.1780496796592;
        Wed, 03 Jun 2026 07:26:36 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d240sm29068465ad.58.2026.06.03.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:26:35 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:26:30 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 6/7] iommufd: Avoid partial fault group delivery in
 iommufd_fault_fops_read()
Message-ID: <aiA5lmader-zPqEd@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <360cab4d4aeccb0bae275a970e2b3c340a71e0e0.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360cab4d4aeccb0bae275a970e2b3c340a71e0e0.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:37PM -0700, Nicolin Chen wrote:
> The cookie returned by xa_alloc() in iommufd_fault_fops_read() is per fault
> group, but the inner copy_to_user() runs per fault inside the group. If a
> copy fails mid-group, xa_erase clears the cookie and the group is restored
> to the deliver list, yet done is not rolled back. The function returns the
> partial byte count, with the successfully copied faults sitting at offsets
> below done carrying the now-erased cookie. The next read() then re-fetches
> the group, allocates a fresh cookie, and re-delivers every fault including
> the ones already copied; userspace sees duplicates carrying the new cookie,
> and a stale cookie that can never be responded to.
> 
> Use a local group_done variable that tracks the per-group progress inside
> the inner loop, and only commit done = group_done after the inner loop has
> finished successfully. On a copy_to_user failure the outer break skips the
> commit, so done remains at its prior start-of-group baseline; the partial
> bytes already written past done are undefined to userspace per the read(2)
> contract, and the next read re-delivers the whole group atomically.
> 
> Fixes: 07838f7fd529 ("iommufd: Add iommufd fault object")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
