Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DF4485CD9
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206467; cv=none; b=Lj71SypMA99CTAQR6lgM9I7VTAmWemJUzxC9ZLc5vYXLvxmK7UGTUBf6mmZOaO5M6omX1WbK1B/pVftn85QnIkEXF1ic3E52kmr4Ljplw2l/ye+JHc7UWdi+2J1d2388KaYb5RHTgdB+kTmBEONcNKdA475KIDAEyoWVt0PbXCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206467; c=relaxed/simple;
	bh=SippWX+xoSkF20XXjc5MLFhzuRKSu+Feuro+st5YeiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMtKeSKqb5Zw2BOP33eGQXIRi8Et+sedWVqN/CsSoy89v72+u6X9XDP1qW3qTjUIaCGcbyeKi9wnv7ZJeU9UidrX221X+1AhBKs7cQpAfOeRkn3ympeMR+TApr2JLmyfNdzb+Hmgf5M0eQ98vs5nq6On38FASqqb+G4pQC6ahw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyvePpA+; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyvePpA+"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so300059366b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206449; x=1791811249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=CyvePpA+5myhEw/neft3Qi0/VUFTYG5o456QppG2/5G9A7H9FId3WTbBHx92BbDih3
         4LHwzEeHMw4bsVoy4ghXYLnVyzQmc3Pt0m3C+oZcTb6uwWl7nasYTcIjezFXsWeu9zER
         thV0rkZZZxmmS8fy2eaY0H5qWPUpLiRUvK55PN6+JGLkJRFj1bbf2KPTnHhId2DS9ugV
         7Wo5kWmTBYhH07RDCvxKlHV1nwfMQkiQc5yYc7bHd0t9oNlr5C9+UadIxvLO240oDVQd
         HkiESF/uf7xSIHadAe3DnCy04kNQTyE/I9pVuX/PyyqPVdDsTIGcq+XqQ3i07SASQUp+
         byWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206449; x=1791811249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=iE9Im0v9VYD6J/VM5jetCYAhNh4FbX17gui5fgEsGzDAJlXDYgM0oJVWPnKYedXwGU
         iMib+zP7YPLgVpTLc8fs7oD0FKSqe6wfNwOyb0BXsXytfrw2kIjN5D0leIKqXkMtXSaP
         P4e0lYW1KK9nSdyOHR5IuWJjz8ImFldUIw9B4s6kEkhm9McmeoEWSJsEgRLcmJ8Ltxdl
         j8F1I4QnGEcfho4Autfkzlwwy16YlwqIpHqvVR28zbm7KIbUWwgOhmZt6dbzhaV2A1PR
         Viw1/klYGCE4aMyJSonfOsPMHkOZVMT6su5+LMHJs4kOKL/1356HR7ys4tWNSLhYVYFk
         OlFg==
X-Forwarded-Encrypted: i=1; AKwUvBy3dap1s6jTrosecP9kqLhvgMJbQyxOwZQkttIOpxPBOsrfC5/mgD3v4pjIjpY/kviMIFYj2LNiU3kjplUe52Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nyxQ/tYYeJDCs7uNCPh3XBv7WIQN5uZTMTD7RbJnOLoAhqGKQb
	bAj6LxCpvn8CCeogTzWBfRWjmY6rxupIgnCaUxmFdz3Jphvg97G0P5tT
X-Gm-Gg: AYBFou3S7iFDkFB9INcvFSuKdjJbYX7hCNpwbxgcnH3/GkUDn7IpXi5o8Ck/jrpTiux
	376lHfYyCQTDT3vquue5FCl1NP2sFqFwO3i+vA2UEMO1DN69BlL22dgsgx1Nyc4SN08GlMoUlKx
	Bw/QyX++c2wpmaBFnTG+Fe6kAnaeyJJwaVsDgRr/Mu09oH9vlMH4tkvnMKBNdOq8ULxmLGjl3U+
	xyH9vodibtuRwYMAs2epLiqDkHxMExBspRf9w00XNRvPhkSoiFEdV/kbBpcWtgdNfLRta5It2kJ
	YQfS2OAiNJv9Lahm5pR4fFe89tB7sZT+DEB0734DK8sZ+svUih6b7kyt/IW0ENqZLGl74HQkaY1
	1bz3t0JXxk50EfX1hf0Ylmy+fh9T4pxHFfv/9CK1VWHXzwTmAUos/nuaU5si11vuT3fhlKe3Fg2
	1NACKZFjsxKuGD1kfH63mgaSuyJU9KMdX+XWdbHhP0ejtR99a9+1bginXwFavQ8QPvLFICJH6AA
	MpmsAuZhS2iVhuLeYHpR8K5wrT49ZbRG4z75QD09oO32JQvvlJLBFP0Bpc8pArwNDUAoNknOBeb
	PolmjUiZFk7rAQJGHUchWhInui8J2KuMMoM=
X-Received: by 2002:a17:907:9614:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c2e4ad13957mr911322366b.17.1791206448599;
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156333a04sm79392466b.60.2026.10.05.06.20.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical run
Date: Mon,  5 Oct 2026 13:20:46 +0000
Message-ID: <20261005132046.30025-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/5/26 Christian König wrote:
> Well filling page tables by the importer is an absolutely clear NO-GO
> for the DMA-buf design, we have gotten down that path already and it
> took us years to remove this functionality again.

Understood, thanks for the quick and clear answers on this patch and on
patch 3.

> The problem you are facing here is that dma_buf_mmap() doesn't work
> because you don't have a VMA.

Right: the memory has no struct page and is deliberately not mapped in
the host, so there is no VMA to hand to KVM.

I'll post a new version of this series. It drops get_phys(), the ranged
invalidation and the guest_memfd dma-buf import (patches 2-5), and it
does not touch drivers/dma-buf, as you suggested in the PAL discussion:

  https://lore.kernel.org/all/c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com/

KVM gets its frames through the KVM-private guest_memfd provider
interface from David's series. iommufd gets them through a private
interface with the exporter, as it already does for vfio-pci. The new
version adds a small registry in iommufd for that, which replaces the
symbol_get() of the sample in David's series. The dma-buf is then only
the handle and the existing revoke.

Thanks,
Fred
