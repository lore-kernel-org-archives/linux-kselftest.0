Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270279;
	b=SNpwHqNJOym2ZorCKQHPIrY9Y06nT2KgtyFhgd3y2bnyRZdOLysvDsBVfJqGzxoV7o7N
	 Fu68C2j+FdrxjaYfLMXK38sd8hA6FksADbNtKdlnHxb36jnMRJCM2331ITB2kDSeoZTYL
	 pgABwjeb65LRzw7IRkmvk3JEMZ4PdgKcRGkvrhWqEcpkgIRN1LepYBqEtygir/DQeRATN
	 Ss98oDCOYroNw1NLpu0j45ThVYNzzP3i8EOxNnS6+Yw32ToSSXCE4crT9jxpuT2p5XRwe
	 gygNNS57uv63m55+tqlJ1zKN1aB6CsI+KC4Bw2fIIPjthO//arLB7kSSwoazbXQ+Q4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
	b=pL8y+64W+qC17IATxaYxo2iW7nLY1ozBuYCAsySZJK+xXRu/h7c7w4685vmJXrWVnVqJ
	 yVW4GxVAhjgV2ysT1kv/hFK2dKJ23vKP66UI60av0N/F1ij3a6xuJkbtcycyt8t1a89dw
	 MotQakOPxHL4b4sY2AqV0PJYgCYScuOXUu0o91nx6mC+NWUS8xO6q8BQ6JjUvvoRCWSED
	 uU2SDVPPmWq7BI9tFQgLrPO7V86hKgjZmLcU8dBDOnw3LXbFZYOdXfkfoeGA+5Ru4kcYH
	 yL0fUf9cu6xU/oX/1gbZAGMMY7LGwVFSOTaEwTYHQxwIUC3pLA7vzZWXX8DV1Ch836A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352D606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 00:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4352D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so21692325ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 16:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794270278; x=1794875078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=TuVRyzuWUgVcsf9lNq678ixAFJhPOzvFG4t3LRHWBAlBem5Qaz6FmOVOsmGd4DW/L3
         WU+Kwj6rfd2umV9dl9/VTCpXF/I9sEA96nbYfl9Oo5RqfmALRzU9IMLvz0Oh2MF8S+5r
         +ZW/jM1G9O/WQVZme8EkVhftOC6lEUr4xRtvYPDvHvmL00PopnsM7nOyymLOgvQM/RnX
         wLWpWi4iOC0GVGlmhfgGdoSlR9872llOD8o6fXNDODhkDXS9r5lTh0uAoht/UuGWphZF
         Etf2c57hXs8kdFp4LjsVEqn9ikfHPTPyqnkwYPPvRGwHwZi2QwpE4jcn6alAxH2G7jX+
         Dc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270278; x=1794875078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=us4l+hQ/CmjHp3VuXQTWX2bdZN1Fm26yp0ZPl78ZxEb9XL3MiyWxMywbbarLoMXYZn
         BLuCiBZLe4B2M+jpu4poBj/MI4XXAiY17vLoR+R4JG0kVzesY5UWIjZbuZOw6d9bxMKo
         IHkHf5TqgEmkwUbtkVktiu3BYtLcDTl/vWRDvvbe5cyvR7sO3guTUrrm+2mqqO/x8R6b
         /hmlj6WVnJW2bvshEM1s9tvkkj0733g6ZeFanyBVRWNmCY+hKw+48lRa/ZDVoPFI7m4x
         fvYsRJlrdWe2zgUXI3L8KQ4XCVfC6hBHapQofY5NN8tpTP/Cjyt3i2OuM6R02I5aJNS6
         hMCQ==
X-Forwarded-Encrypted: i=1; AL+hErFB00aZqyYgU7X7uerbUK9I/F8/adQzOp813DTLpYWVsDYzYyVfzVngvL6XrYJryuCDyNVyCRkI7Llwq0XuHm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ujeb1JJprqJPEv1Rle3Sjd23C48Fub+rLVl2Xuswxp6aTBzG6
	BaGqjPGdyRUTfOsJnBpWq2D3VSJ7bZnOSk51XZgYAxtxu0izVIkS4OCGwN5pYUhEq6NhSi52voY
	72hSit3CPSeup52tOItadRLZIxQQHBA0ZJQ==
X-Received: from plpb13.prod.google.com ([2002:a17:902:d60d:b0:2e9:6468:1ffe])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2302:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2edb8fa3768mr7596535ad.1.1794270278310;
 Mon, 09 Nov 2026 16:24:38 -0800 (PST)
Date: Tue, 10 Nov 2026 00:24:37 +0000
In-Reply-To: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261110002437.2376944-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this v7 series now that v7.4-rc1 is out (both patches
still apply cleanly to v7.4-rc1 and pci/next).

In v7:
  - Both pcie_get_link_endpoints() and pci_aspm_inhibit() are dropped per
    Ilpo's earlier feedback, leaving aspm.c, pci.c, and
    include/linux/pci.h untouched and using the existing ASPM API.
  - Retimer receiver discovery and margining coverage (receivers 2..5 via
    LNKSTA2) are included in the pcie_lmr kselftest.
  - Both patches passed Sashiko review with zero issues.

Please let me know if you have any feedback or would like any changes.

Thanks,
Priyank
