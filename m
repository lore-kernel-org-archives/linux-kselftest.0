Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630961;
	b=xPll4LJQho4A9/kWfs0arfi1GEoiLZer4mldoC0Mhm1jWaMJu9w8jC4ic51ugwBs5Dui
	 R2Tw6lXThJTVImbgJIo5dbLBSat1/MyOrwdOOCPSt2p9W/9mbSvYTKzq+DY8KhWCIO5Bh
	 YOxxle6ZjRVctR3tTAhycXB3HaYKq50hB6lYbSx+x0SF92PsXA5KMoyx0oNKm427SAd/L
	 VYcV407w8jwRlAPFxsLkWyw9rJZq+W9UJvv13QkDXxQ0RHzMMdh5FcYR5/w6vHUwzm7Zr
	 Q/km1O59Gw05cHCmKgLIU5oI13yj5WUCt9bXCjjDx1vU50PZiBnfmVR2rTPG40YXlbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
	b=M771oZS4qIwUt24gyb8iPWl6+KTIpr+EfgjaqoARrwqG0eT2ATsvmdWjjoSi8c+wRPKm
	 oIxtJFBcnJqM/YV9nqAW3ULVzrF68rDQpbaroFeqqzUYa9RW2BaWfR66xBQjG/7l0JCVN
	 M6R8nwjQkVqFswYFY7QdR7U1ZfSoPQJGSEL2dHt3saF8gjrb0fMoG3eycMkPJ0KDDO72q
	 7Hu7vY3ERnMaZSXGI4bJyav1zobQDGI+bXR1P8VrWlqK+9N7F05CjJeC+W/9fxHr7Os5X
	 D9FHkjI4VEDei6aIyaEp7qchr4s3krqD9XBxO9vKeTVLNGXdo0FWWzcMAQYziLGgSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B252606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B252606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0291cc0f2so76128885ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630961; x=1796235761; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=XltHJeJcafnoz7rWSdh67DNM8cUVU33Kf/95Saqoq1SakVT7WitG6OsBqDZPGchsCE
         y/G1PGTFqEJu0lBEmJpEIiHh2bs+IcYU8n5pRQb6MCXjpvL2vVXWyjr78fxLTeBKFKQH
         LbZNOzgfAlbMrtPg3br43/a0SJZBBByAaTgwqOI1btWwBNj5Ty//bbU2AK1YZTsmpv+P
         Rx1sqeQZDnE6Me/PAQ2VZSIlCF1Pj+UVs+co5YrbldjuVaIcAFJ5jyFNTi9XJNwyBgom
         juH/Li+nPLPJ/sXNQ9fbhC3+mMLejxLcvsDBSkMQCDsTkfuIdqvNpOGCTIPpHqYCNwEs
         6FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630961; x=1796235761;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=AnJA99//3VCQLQvwoI+gFKmLRPluGEX8OC3GJgU5KF/LafCujc94RtNfzDRY3zAyyA
         P81U/9mR/LsFawj83HBouvL6SKizuiTpBfF1pjHzNxT88uldsa23sbW8NL6rHd1AJxRE
         t+WyddGXQdRAYi08Swjkml3i5yuT5npOBxsLt7SiaqVgpD5Qehihw+Hv5wRi177SOUfm
         gvLc8YqljQqHu2pz34i1KJzDyC0qhsbz92vCFFu9+PBpnfgvrXzbzCDiCzPD2cQDG7kx
         TWQ2f39Zdm+41TK1E9XhuBoBbaqGv26AWYtFDI1Y6nXQpJ6v/IDkC9ckXefJwfDUm8PE
         pBYQ==
X-Forwarded-Encrypted: i=1; AL+hErHt8W/SgI1rwx9ZwNOYLSydDfAoPRZcNHll2L2iVrUIOtltP+DRGRNFzArJQFEbTScDCB9siyu7Q9MuYadJnz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K1R8SgWyP62K8t2F7bAdrfmrkrjYQecVYSVgWG9Ap9eaB2CsQ
	GdecVHA3VJ1yR9IHp7/y/ml0GO6EbwO3SfAdGQvL1HqVg0VZ9zKzSo4PJpYyKA1z+3QTdD203Mu
	PZoUpUBXRAMqOJGmKqb4X/4j3jIgq+dT86A==
X-Received: from plau5.prod.google.com ([2002:a17:903:3045:b0:2f0:349:b3a4])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce85:b0:2f0:3e44:4761 with SMTP id d9443c01a7336-2f03f25e801mr195497385ad.54.1795630960732;
 Wed, 25 Nov 2026 10:22:40 -0800 (PST)
Date: Wed, 25 Nov 2026 18:22:40 +0000
In-Reply-To: <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-pcie-link-endpoints-v8-0-19d49c17c05f@google.com>
 <20261125-pcie-link-endpoints-v8-1-19d49c17c05f@google.com> <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125182240.2292209-1-rathodpriyank@google.com>
Subject: Re: [PATCH v8 1/3] PCI/ASPM: Add internal pcie_aspm_inhibit() helper
From: Priyank Rathod <rathodpriyank@google.com>
To: "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ilpo,

Thanks for the feedback.  I reached out to Manivannan, Bjorn, and you on
the ASPM thread to check whether Manivannan has a v4 in progress or if I
can take over finishing the core ASPM changes cleanly first, and to align
on the per-state counter API details before implementing it.

Also noted on avoiding bullet lists in commit messages, and I will fix the
port->dev lifetime issue in pci_lmr_release() that sashiko-bot flagged on
patch 2/3 when preparing the next revision on top of the ASPM prerequisite.

Thanks,
Priyank
