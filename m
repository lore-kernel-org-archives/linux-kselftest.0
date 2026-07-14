Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA945495528
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042117; cv=none; b=G85y0c2dPLoaMYVb+2IshPdTISyGiNFzrSI0bpvHV5e3kCg7Wx5jHzDKElUcPEEbugDvvcimQZnSewd9oLqDaR93jGM9rmcmk3rGpAeLRNw7npdR7btS/Wc4NflHOhnVjo/HwkPWbpyJ9enJZGM2cMoQLXMCAurGXk4ZnQBd5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042117; c=relaxed/simple;
	bh=vk3lJYsQ6kv5efXhe5IXY+0n8uW9hKBTtNoO26/F0xo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hmzg4hsxocG7xQ4UX7+g/2Vkqpi9Tp8+r3EP37cTummYSt10/V4OsbPbtzUpov77GaW04Ajx0u2yJRYtGaZfoQUbVknJdnuHKqoOiPVIAlj8Zpsz6QHxNTTDa4elwS3aMj7lVLhu1k6jHfnnvD+o/HE7twZPPVjsYT89NwylkPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cXAbhwxC; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cXAbhwxC"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84857446424so9008342b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042113; x=1784646913; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOi6e266Y3mSv+Tn1Q4zn00EKJBjh0V4SkK/1ApFkGE=;
        b=cXAbhwxC1l71o8RZqwj5fOoLRKiP76rP/kX3zsAGquOeEtEeDjawKJOMAq4iIODr3T
         5TTJ1enzec5g2l+jcPRAXMR58yC1nc4b/pcY1Gyyjpo4W/mJbN+bT4z/XVKC0ibUsT43
         rVp0o8dmKSCO6Ui+DcfCxmpvWBgicJW4uDsKvtif2Oz87dEgBJNTnn9P3UJZGhccMgBX
         KSn25OE039XDsViwXN7TINoskS3oOxShSMs5mi4BsG47T+wzCH7cVI5vgjJ3psEfVZbI
         xCP6c6yURk88vIRB7v14D7S3dsIpE9+S50MyHiebrUxWNUXAIqHgc+XcN18+ibRDN2mI
         ilfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042113; x=1784646913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOi6e266Y3mSv+Tn1Q4zn00EKJBjh0V4SkK/1ApFkGE=;
        b=nOKoNn/HsBHJq6GsJ0yGqExXMtz8Gb4W9X9zK/KTG0r+Ud1BbdYKApJKnIHwRrNmqZ
         FYkjViJh9CVTMitxpTjlVxTojTVgwZ1SlWaDievnjq62hUS0lcgcxcBGdsw/GR7L3QSB
         +K6v50QN6toExoYyLEuhCdiABfGmE41YuIDtkjXnoc+mCtDS+qaAE+W9qf+izjfmZ38D
         Hx503CIr8rhzedWNL/lajMT7j9FChsP3L/VsrAKov9ryKq+Schr23R9NW1aYyF4D6hFw
         EN+cWhYK6sDRWbW8RclRHV/zfKta8MKZaroovjKbpaiHtit/fANyR3LIU/IYY/8TWjhj
         J73Q==
X-Forwarded-Encrypted: i=1; AHgh+RrxGNc8U90vjuK0rEKO9aCEmCrgHNu7YFMYex4oBxpEjcpdIlF8qy5Abfe3L0OLn8P8JMgbpWfgw4wXt8pK+ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaLNeu5t4NId54K5SIYa+4mHSCN5feTQhulyQzRlf/iqSsa7i
	VlmdZvdYn6tAMdCosWCSVZy4pSH3uEGYpr/NfTQgKksRXGpskN5ak9aV/3I5XwNiu2Os9xXPZgF
	Rru3eOHjjyw==
X-Received: from pfee10.prod.google.com ([2002:a05:6a00:bc8a:b0:847:a829:37d1])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a27:b0:848:2f7a:2e5e
 with SMTP id d2e1a72fcca58-8488976671amr13012571b3a.77.1784042112537; Tue, 14
 Jul 2026 08:15:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:48 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-4-vipinsh@google.com>
Subject: [PATCH v5 03/20] vfio/pci: Export vfio_pci_dma_buf_move for vfio-pci module
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

VFIO Live update during freeze needs to reset the device before handing
over to next kernel.

Export DMA revoke function which VFIO Live Update will call in its
freeze before reset so that P2P DMA doesn't error out or cause some
other issue.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index c16f460c01d6..2c05fb5a171a 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -376,6 +376,7 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
 		fput(priv->dmabuf->file);
 	}
 }
+EXPORT_SYMBOL_GPL(vfio_pci_dma_buf_move);
 
 void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 {
-- 
2.55.0.795.g602f6c329a-goog

