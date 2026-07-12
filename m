Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1B343D9D
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783874937; cv=none; b=dK8/nCaen028RACetNL5m+0vQLQa0pzdCyVgisRqpVYNTaLSd3L4JFAIwnFn1rYuVUIoMZ4YImpKo74O2nqilVdmAgI5h+a+5eDh9T4ciOeKv42uomzWZZZ4B9Bf6DS3WHWe1D82c2XrzHEOxE37mMo+CEJLR80FizUNFQ+kz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783874937; c=relaxed/simple;
	bh=Qt4v/dZ/atl2InBXlF6Qg0mek0k2Z3U8e5b5n5VxTGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC68S0JpSPCoU+scdqGqDbdsS2A6v3K6bkZwnYkZz51+ZoW0xFFhq3kYrwLufMw+T7iUW6dvR/t6NcWKA/rjS6NTCJIZ5Uv0aSb37a5+d5fqztmAJ53hyOM+duxsAKFRWYl5AIKVxtSICeTE4x8xhro8JlNqJPQOOZeQgqk95OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=exA3xckI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="exA3xckI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c0006ea8eso17023191cf.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783874935; x=1784479735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgHRZ2oQs3owZnO2hrgFCKNrpUU4ppVoDgnNpxTspCQ=;
        b=exA3xckI/kwOvLjpG0265GkWKjFMTEExa03ZRLlisFWFPJgMrfb5xM0MRliv681WIU
         tfpUoFytMgOC8WbEMQh1al1W3ZRT7YGNy/QLrDnOBOZ7+CL1ZoLPKL94lwd9+/UXGwIq
         cOn0qemgQaiKz4Vj6MyKnebBkRhnCqJcgQK8qQOT1TWGlG/kwEpRt/D2G822FlmIU+Ys
         HLTGYpsrY3LOn6Ykla0pbYSNnc5jAVspIrzBR+c0128z1wn2Ay/GoSmE1j9wW4VWVFF7
         XjnjDLMUPUpDE4yGm+7pr0ho3L6WL05aoXXC1RSbzo9DnQgTqZwhB6uvpugxUuhLbnaq
         1RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783874935; x=1784479735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgHRZ2oQs3owZnO2hrgFCKNrpUU4ppVoDgnNpxTspCQ=;
        b=RzrbijGPfEsKDaxspyP8ctVJVcMo5vAB9X8LoMY1J7KY7dWBXEt9HH/TfsoKJLHi/v
         sL1QkH+a1TcJwW7qjufut8svtc8Pc4iWvxe8WxZe6aTiSCwxg+WWEAKRX11ElvhImq3/
         wHw5RUfmzsNpkNMVNJmDT+K+tLjYUf3eL01Lj1pLCzYdImf86bC9iy0ho8Qq9ImV2oyb
         VGpkEwIfcyraw5M5RNgxs55wKaHIjtNT74IzElOdjKEV1/AwugU+aKRcP4Zk4NRjvIwl
         PDy9vEEmIUyHXYdEHIphaZ3jHSRh8RnBC9imBT2qGcUf8E6pjnXyuh5aME+/ePBJe2tu
         jZmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7EZdYT4DzNhdjn3BBVi++CrljCbvl7ecclwGZrM3OTMD90uKBem0cGM8URqoNAwjji4CO6gGPQZcbaIRsNTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyL4KsIg4lCeYBriZbGwRGvEKmmYw9His5/i0vQtx/J7z7ABm
	bsohnVF/B+yL/Ea+TO7LVb9PxUggVfNNIOVHYvFYqDb1LxCtdWWqd4xXN/wiT23NSZo=
X-Gm-Gg: AfdE7cmxdpf3oCjfOEtGzVju7p5Vv+xLEZDlnSxmHszIi2H+99uRlKaCLd6HrANft2C
	eO4V0AMfKwG40CGH2Ncb8xl0mb1GyudfMEBSdxW2FOQb90snO159uAZjuPxpzqzoFvsvplWm7rg
	zHuyGtyumyVMu6KBS2uJOkTgBFQleq/rqiSkKy2OBZ+aWCWcxK0k4AbKb38w3GPLnouRFXc1Xgm
	1V/Tm5VVAWvRBWwzKctR3Kwxpq79UMBO53DaqMerpfrFfznu++liKESuXSaSpLaePOk7bdKLRtR
	MftEpSFQC3LsLzx4n6mcSzNtgu63XhOYZDbRoBkGsb/oecwtMX/sh1CVHQJA+atiOQjw80BYvXT
	oRNvVO82tGlu0lFY/nGjZMNHYFezV+89q192eyjQFe5anAug/iiuSQpKq8WRikLmNp/QJzQsg+s
	5A2tr4bbBOF+77Rxbi7sxDKvrd5jgEC4LP6QPYBmtBPx37HTkmivZynpUqEzxa/bLMHHQD
X-Received: by 2002:a05:622a:7281:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-51cc9d5d02amr30044441cf.22.1783874935089;
        Sun, 12 Jul 2026 09:48:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae20a40sm68575071cf.15.2026.07.12.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 09:48:53 -0700 (PDT)
Date: Sun, 12 Jul 2026 12:48:49 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com,
	david@kernel.org, osalvador@suse.de, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org
Subject: Re: [PATCH v7 00/10] dax/kmem: atomic whole-device hotplug via sysfs
Message-ID: <alPFcfjlzSHYk3jA@gourry-fedora-PF4VCD3F>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>

On Sun, Jul 12, 2026 at 11:44:54AM -0400, Gregory Price wrote:
> The dax kmem driver onlines memory during probe using the system
> default policy, with no atomic control for the state of an entire
> region at runtime - only by toggling individual memory blocks.
> 

Took a look at Sashiko reviews.

All are either false-positive, pre-existing issues on isolated patches
that are actually resolved by later patches, or something we previously
agreed on (WARN/pass in phase 2 of offline_and_remove_memory_ranges).

So series is clean as-is.

~Gregory
