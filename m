Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003614;
	b=kyF3y8xhJy1uE9R39tj7x18zBuiQmLpSOi5TxVYrlsEc5Effpv6uQvVEJs6AHjieqYbK
	 WCY9HET1WTOOWgJ2EN/pp3EQQSapiGeKzLQQ6+L55Mw+Qw8woCQp6rBEDzc7u9n80f592
	 Ph1WEMOoYhqAiEynUa4RjG7HERZyGgn3eXbxHsoVCVuYddbmM/tjey+wxlIC51pbI2iXN
	 x9BTA17fQAPzI1+8/yG8EoNF/3IGhLbe3Ae3giW9Kfm00V3tCmgLVuxr/YanYogEdJMph
	 tDNDbPSvjrdsiTaN5kHNo9h6YgxdSOpjwGyffzoHU6/ee22Ky2lDOoPf5A2LSr/cq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
	b=McQ0wZVnjMrIsvaNf7OIPYqilSKUdYO5xR+PY61fv0Nqk1Ulr2+c7MJ8EEbGh9GHBSCY
	 Mo9Y5MBweTyxtRcfZAZoUZb4svwfSYp1GY9LaLxJ58ICLcdLoEy0gJp13j3glWUR0napi
	 DcEdj0iD5+g0tTslg1h8gC6OgPzYTYxtAikLqoeUDzUd+2cdx0FFtDrxEO+J4nczXcs+9
	 8QNsgvM0oT/qSLkFZpO1hNg+NpEuEXJEZ5o7aRbcLVK0QALQdRDpIzr1hjdVCO5fsB9zq
	 pvn5XTrYNLqQuBCmKHDQbI3/60auwqaHQha3juzEMtcq8aeViu2IzlfE8BaFxK0N72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12156606A336
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 22:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12156606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso552605a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794003613; x=1794608413; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=LXEDKNDBLRIJbYbtObAwr4pGaCKvFWMV99QdmyNI1LdRkb0kyu8RPs5U/rQq4a6M0h
         5ASlz3BmDk3LbCaPAyYM+ml0fpr0LBMu3Q0UZRphZODpbT5qLOGmsnp2iuyMGrmWopeo
         0rfHxzgGItR2A3RsjfMqH1RMIqnPHk/DKQcOT7SxsJPifbZx3trsUOLshBP/kzfGPp40
         jwfo6kRiQl0dxVV33yemWrOK969JVlnLk1sX53xxNvUOyU2suRXcmx/I4zRoch0SsKrQ
         gy23ukO+EfJuK2oVUR2elXb03hZSdEx1PEMUCYg04OuYdXw6vsu9TD7Y/3wa6Yuenl32
         VwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003613; x=1794608413;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=Z5EC4LrA6MxxH/OJ5QKGiu0kfInqjYl2/NVv/8xXKt87DBMnjJWdFgfxR5shkHUj6u
         lkCBL3hUAcfYH77F9SQjWnMPORO4fFOTvkpyLVQRzwKty6xMGOrG6lGpMkJQB+V6fDo/
         soUiZ5R2A8Oy5iWnYnk1NaVKEbFBMTLSr1go6RSSSBXTrrQeuSmmTtnxCyPEpNYVP0O3
         shcSU6B4ii1FSIAf97MPsG+gONv5hSuYNh7pfLeXSlnWRdNhA/oCcl2rrWgQvklgVI4B
         GhjiNCNnYpJa5zYqYJrDF9FRFeCjqYIjO754aPDqN0rxmqzAhJKks6FcVWjHePacAkAO
         /2yw==
X-Forwarded-Encrypted: i=1; AL+hErGzS/JFgiQbPjLm43JrrqclceIPvdU4g7VcwysoojgOyKST9LHF0GNQa57/l9tr4//8eZWo8DpopF3OKhrwDVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z97oANN4I/ubZFxYHDZcQJfDXswDCu3F7r3mAaEx/Y753sAuCnl
	cro4aDbVhDG+CnVUJGfveiSsPW4+NMSR54Cf/sBbVFB9AZLIgImsES0OfgVu+17Tyw==
X-Gm-Gg: AYBFou0IBF3l2TzSNwgQdEpwB7PhFXx03r4vzq+6JrrYqa+F0EpRez8NLq2lgwHQ3nJ
	XbE5s6OmeWHJzHkcvBn8FislGzBgyxGvhMBESzmufqwLLdZZBOKXxpoLBxuEYMqvuqldDigwR9G
	FV/hsgnF4oK9rduEFU/1kK/awjPmn1433K5PXYKelwBRrKiw56ML2z7qmB2gl0WBFyOvhrZtyNr
	erWAurz2GQEkzHBR8lxYsBbS4LRDGx6CVOJqY4v28q9qmXw6+q4CpMLDDJf7aplXQWsDI4hnTuB
	2vLcyFZwLnmrSks9JZmNhZkOizJfvXPLvXG834H4RA+2Z6bu/XlrkAuUqYBZWlm2YX/5gpDjMZx
	KylWZh1nv4sAzRRkSgsnmj0ourez3Lf8/xbz0hS+B9cMbxf/E5GWpbgF1EDTU2KgS8La7yPPuU2
	vCuNTYemZWg4/WjMkmLicUzy8gQ1U618TPA8m35rYhMdgpFdLZI1vEiqTkfCAyWXC1Atz9NfYn0
	khWYQCQ1Xw6XbJeKzoX4pJmoPngpQZjktbcRbZxjdq1hkVlSU1/wFU0mT8VydRzlwy2WcH8VD27
	CDVDWZjZV5wOSwEfpUblJeqxKEtizP1A7rJrcuq6hT9je1r22XFVul2FIY+W0ws/PW4nYw==
X-Received: by 2002:a17:90b:3ec8:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b0db726100mr3762406a91.64.1794003612758;
        Fri, 06 Nov 2026 14:20:12 -0800 (PST)
Received: from localhost (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm528979a91.2.2026.11.06.14.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 14:20:11 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 22:20:10 +0000
Message-Id: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>

On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:

> David Matlack (4):
>   vfio: Enforce preserved devices are retrieved via
>     LIVEUPDATE_SESSION_RETRIEVE_FD
>   docs: liveupdate: Add documentation for VFIO PCI
>   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
>
> Vipin Sharma (23):
>   vfio/pci: Factor out the reset logic in VFIO PCI device close path
>   vfio: Export various helpers from VFIO
>   liveupdate: Export symbols needed by modules
>   vfio/pci: Register a file handler with Live Update Orchestrator
>   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
>   vfio: Add helpers to identify device files that can be preserved
>   vfio/pci: Preserve vfio-pci device files across Live Update
>   vfio: Introduce vfio_find_device() helper
>   vfio: Refactor vfio_device_fops_cdev_open()
>   vfio: Add API to open cdev device for Live Update restore
>   vfio/pci: Retrieve preserved device files after Live Update
>   vfio/pci: Protect incoming preserved devices until they finish Live
>     Update
>   vfio/pci: Take over preserved devices without resetting them
>   vfio: selftests: Build liveupdate library in VFIO selftests
>   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
>   vfio: selftests: Add iommufd noiommu mode
>   vfio: selftests: Add helpers to map DMA memory at IOVA =3D=3D PA in
>     noiommu mode
>   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
>     state
>   vfio: selftests: Add an attach() driver op
>   vfio: selftests: Test preserving noiommu devices in
>     vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
>   vfio: selftests: Verify that opening VFIO device fails during Live
>     Update
>   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test

This series is getting quite long. I would consider splitting out the
selftests into its own series and we can iterate on each separately.
