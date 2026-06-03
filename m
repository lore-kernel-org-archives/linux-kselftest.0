Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148E7382F31
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496113; cv=none; b=D7TiteFmbsISvUGI5SdhdBy1lKOvcwl/OiUQGYJcHrQIC9g4IYPzCHIiuk4MzAhw+PwLx5d9ELQYFl0rZh1UDb6JnSsx4LE+vqAb7xFIeNggWMRxNt1QFujOe1EltnA0pdaz/RxVuIgRi0LfH21JT3hSv4wgRBDc2FmHoL5khjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496113; c=relaxed/simple;
	bh=np8yTAGyoHyKjiswZIV0dx/wnbvVdMEDawhwZGw0qTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/JA45tCi2LriBcHOpUhO+eNTG2AVTwSs6z3qHveR1s2bkJa8oROtoCZxPcbg8hPVadhovtCBmWZLlibY/md3eyaYFb7IJGJLQCb2LztSPMEQ2s3THgoDFUhflhUdtL2NOYaS+ZC0VS/7Q5HqBqrPNSNLuVm/fFFkEyr3vLeXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmjGPsCg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmjGPsCg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b1a48855so89655ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780496111; x=1781100911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6eaHVbDYv4hX/p3BkMc9yoT5MuLzy6Lq3RWtBuTNxcE=;
        b=hmjGPsCg1liRDzIKs2eWjset5lC/gH1E8c05Fj0ZygZiJr+e9nOXECrN6+9/abOGLF
         78wasu2LaQibM3erTF1FrKXO043gfSWJlX527gROJhD5J7/x43wm78ybWKuWci/THnHS
         rWWZq3B9oRaW9L3u3oz6m9HBPbf0gM6F5Cg7sWsrxOfuhVfVjRxkbfoUNiZAPCU4A6kP
         aYoK2pMRz0xpNy8767THIoW6eGRJThMfOnyDcwSXjXKmjVDPF3Eds3KC9UnBsJjuO6Jd
         CUHDubEik6FwS45omUJPEbxlC2Zqs8vjSLjAuliA86hpE3c3txYXJoT9oa2RH917COoj
         aNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496111; x=1781100911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eaHVbDYv4hX/p3BkMc9yoT5MuLzy6Lq3RWtBuTNxcE=;
        b=PPqFx96sePrHMkDctlYiEfiBqdzoYQ/AfxwxCmfWaucdlCOU5b++yxh/kIwZMlg2HC
         gkH79DFQ1ebIGcdR0HkcYakmQIYpP7hZBEaduiUa57Wd/4MU8ewa5Fkw3frNHUilfN06
         jT8I70KtTqdq0uzCo6Yd/jMdpcWrY5xM/a393LMv6zI5hA2RIsSDRt682P9ZU7OP0v2A
         7VvzLhCWnKhON8DAB2THBK+8HpDiLxlsK/JzQmiKI3rPuI0593dLC1m6udiORCsFAB4u
         ScYdvwZkxFB5R26/p0e0dU1rx0tFU2jwcVrTjpUDBYzT00k+a2+xcTS/zf0qZSmHcNJy
         32FA==
X-Forwarded-Encrypted: i=1; AFNElJ9U5D55i4/sVKEypMBmJVEtCCZOEvyTn/ofO6lmZzvODtB8TWJmoYAAwhHP26iSz3LN5zf2ttd+N7Ph1Kpi7Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAUi8+I00ZJDilx4IO244PrtHGas1s2+TEOfxrPS6ZNMgvNaP
	t7SfV0oSsyHal5J2U6K4sB/fH6D1Fr05mRJ9w8xskUAHeX+ubjADVZZPDcJcLEmUMWUx2tqN+ys
	q3AflgQ==
X-Gm-Gg: Acq92OEiJHbQvaSsuKPlhbj5AG2BXCk76FmpZ/q8+/qouN0MV4ydLKvMBSFz3jNFCe8
	wvD5oJGD10+G7h+DYAF7LPee/LLYOrABudT5C9vmYU2fi2CxB4GtuaMG30I+Ws79xyVKcDxMO90
	jTyPOgD33NCfXcBFa73bJpt+pdUL4MrjS0UFx4dS/c1JUOEdZbXWFun09ZEV04dVT2KOohG5nWz
	e7i4j3p3kT4CPL/hiI8ZrSEEWB+H9NCAJ2nSrsRfqdM7CKRXZZvSg0KpDmzQDpkVGKe7oTtgige
	NTcWBGdy17gQf24yhlCR3V8SOrj9P0kcu9SHjIsw4bDYJKlF0/EBzfye8bGBV4kZ2d8zoLWu2IV
	vjijfyWdDhxFmp4CNPbGiMs47DYEFtgsaz85PTJf6p+Wf7BRS4deAUOl0v2eazFIEbskjwZv1aI
	40YdNcfFBAW0r6FlZ7Ok/k4Ji+pbeL3nwj3R8lpvUsg5TiVVxITDzIA+kbVwQV0X7dZqxQNLfCu
	fZva9j0yw==
X-Received: by 2002:a17:902:c405:b0:2bd:5fc9:27b9 with SMTP id d9443c01a7336-2c16fa720bamr1530475ad.3.1780496110631;
        Wed, 03 Jun 2026 07:15:10 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm25583475ad.64.2026.06.03.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:15:10 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:15:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, joro@8bytes.org,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 4/7] iommufd: Reject invalid read count in
 iommufd_fault_fops_read()
Message-ID: <aiA26J0wfuRrepCQ@google.com>
References: <cover.1780343944.git.nicolinc@nvidia.com>
 <85c118a606fbedc5c132a1f5ec223a5ba23b92d2.1780343944.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85c118a606fbedc5c132a1f5ec223a5ba23b92d2.1780343944.git.nicolinc@nvidia.com>

On Mon, Jun 01, 2026 at 01:42:35PM -0700, Nicolin Chen wrote:
> The read count must be large enough to hold one fault or a group's faults.
> 
> iommufd_fault_fops_read() does not validate the count, but returns 0 as if
> the read had succeeded while leaving the pending fault in the queue.
> 
> Return -EINVAL in the undersize cases.
> 
> Fixes: 07838f7fd529 ("iommufd: Add iommufd fault object")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
