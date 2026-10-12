Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2649BD83
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818992; cv=none; b=KPMo1a5pmoImiT/38XlcBdjyFUzcWR2yZ8lKIiPBd6LPbDMK5XmCJyhCyn6DkVK+wSWrc5fzabOpITgfo2i93tGsb19qWSHSAJ/0qJuSV22nPOLQTrzMKqQlkBEkgfHAIKu/McQYsV7JVoDnlRDj+PWSOpG3htPuYtn8yuOdsL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818992; c=relaxed/simple;
	bh=S/6wBu1Qy0PjFWFsGd4NPUc2/G0ASzabS+h4tG5IOy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDoOLAoHvJ/DVNab+EEcn3hqqdf9gskby0OZ1nGDfbSmY+chuzIa/RbYmSySShZejizdWjvQ2SRIBBNKaaWfi9Erqz2/rurBQV/Aw50sOGNo0ds2DtanW4TBOFUf2pwoVd6CYA5G7pb5YCDbvrZZin/lqwHDLz7l2/SvS7Rzg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m73PG3x6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m73PG3x6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a17baef589so16375515e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818988; x=1792423788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=m73PG3x61KDHhuB9DVBfOJWPmuH8fpsxbuwo+uzeGLMXAJwi0r9Pruq63ReOCV5ghn
         DJcxD9KJlFH8z2oHQsI0eaPD3ARFY88vIHcynvXnkdKSu6GckV2Vdf2Ew5gY3HpiUKgJ
         YtvI4P228NiUf4X8SmWa4xcSQg5FZRLRPl03CO9mihO5i1UZDOCoZESurDyToeXEFZj2
         EXCYCQuCEdtiZMQt1k7YkXtjJR/XC9gWogq1Faj/NEtcPeUmelClnala+Lq/kAPHVuO8
         3EecEa8Gqz1LFhfWNFZtO5KHjyt2R5Nwm2FGpmu703LtgTfc5s68HRFSG4mlMdtuMivg
         bpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818988; x=1792423788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHaZjZ/K9HkcWHP0xoN3hdI7zGw/VH12N/DXI78bY9w=;
        b=jqgJL7x+rKqxbZR2lwO0jr8NIdULXmwcIiL3uwABjAGy88eFz35lmlHyJ/o+9B9ZRa
         uxaFiCtqWqFGFX+WHtLpbsrTac3wsW97x54hxswy7vfGVVgHoW5UsXiqg5+wgbZD4+/Q
         W1nQ+aOC7MBmolkeI1xC8ehxS+p1Ptc9P/Yx3KnkAjNso3z+BgGdJN1tRCWvDO2bX6lD
         WvHSR6FayDm+6rAhKq4fJW6qbgjQ5vq06ucBo2bQoMy+dl5o2IWQaT6zrKkWw5sCKorY
         peZQUr2ivwKM/2L4lk0mxxfkqdHySd9Tk4szz3/+iAhLD1CuEoku4i5+UFXMPMGxXtA/
         iZBg==
X-Forwarded-Encrypted: i=1; AKwUvBxd+f7kx8GWptckuE+bGheUfDGUaNl3Y3gHZha6gOo0BfGI6KhUeAUU9AnXsxWn9hRuUBFel23030txzc8JEk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW/QdfeoXhcA/HYsf5R2d9tB4FfQxez7J7pzOgCasA2ZcKXqAS
	we8mNX073txPId5ZxiOCcLiDWvuPl0mPWJoKUx0TcLCVvRZEPLXV1l0S
X-Gm-Gg: AYBFou2+NQJAeWdVJxBiG92xXTuw3MzpHmyisVGatu0Ar/lrk3oaIq/SmMN6YWY/Xe5
	7CoJb7S5J+BYa9wHEP4Pd46oGOBZY0Mi+osz3zhGcULfoyFSTPhQXFBN+XmSEx+txY2SSNiLVQO
	wvaigw6923XJJmmxDuyIqwk+L3UhnBY9Sydw+mG1QHus8/zpmlvTST1BW/Vll1NLtXJa+sV4f7+
	cdbz028R6u1P7MwYf9ZvUjSeIrc/Bcu/2dlwtpsE8132tlTqk9UPA9H53EAdFpyVYScCO570ywh
	GNifHXtjAfIqJownLWxAaUBdCGTpAMioVaD1p2LjkOeFG+lXHxvmyE13uF81WGqFVsohcqZFhex
	+sV/1wD3nOWsjrdQ6HiTCOj41f9svckevpwzhJn6JWaa8iJ9QLXveY8Oa9PgCRFS/1JdHiZ5qZ6
	xPrV9bpdDMpPEc3wUrVmycZMreH++KITwzH7h1zYe4GGw60F132Ob4a2ssBD6Y4DLs5b29yLUO2
	VNZGaHmHEAGWwh+HgdzcIJwg5BVe2sp5l2CFgsbw4y196FcxLAeNhFJrUXjiaYVBovf59EA5kJ1
	OJYV2SooJj7/ZFAdaPk6qbFO5LojfCaJo1Y=
X-Received: by 2002:a05:600c:8105:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a18e4841c1mr177576875e9.14.1791818988354;
        Mon, 12 Oct 2026 08:29:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm299058135e9.15.2026.10.12.08.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:29:47 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
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
Date: Mon, 12 Oct 2026 15:29:46 +0000
Message-ID: <20261012152946.63489-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com> <20261005132046.30025-1-griffoul@gmail.com> <f0077cec-10fe-400a-b229-f7434e297364@amd.com> <20261012144616.GF14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 11:46:16AM -0300, Jason Gunthorpe wrote:
> I don't want to keep expanding this hack in iommufd. If dmabuf is to
> be used then dmabuf needs to provide a pluggable way to fill the
> iommu_domain that many exporters can plug into. I don't want to
> hardwire every exporter into iommufd, that makes no sense.
>
> The existing arrangement is to motivate solving this problem
> generically, not something to be expanded on.

Agreed. The iommufd registry I mentioned above was never posted, and I
have dropped it.

The series I posted since takes another route, without dma-buf:

  https://lore.kernel.org/all/20261006183235.16576-1-griffoul@gmail.com/

It adds a small interface in mm for drivers that own memory. Such a
driver hands out files, and for each page of a file it tells the caller
which frame backs it. iommufd maps the file with IOMMU_IOAS_MAP_FILE and
builds the iommu_domain itself, and the driver revokes a range when it
changes. So iommufd never knows which driver it is talking to, and there
is no symbol_get(). guest_memfd uses the same files for the guest. The
iommufd part is patch 5:

  https://lore.kernel.org/all/20261006183235.16576-6-griffoul@gmail.com/

The iommufd part is mainly there to show the interface, and it needs
more work. Its revoke unmaps and then remaps, so a device can hit a
hole. I would rebuild it on the REPLACE operation David discussed with
you at LPC, with the scratch page as a quirk on the IOAS.

Is this the kind of generic interface you had in mind, or would you
rather have it hang off dma-buf?

Thanks,
Fred
