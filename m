Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423574;
	b=UH8U/Gk+rlhmsWfcn0wFf3sRDd7p6rsT6fdRzyeH6GM3Rs+j7v9iONVWiTtYRVTWoHju
	 HxBJ2NDDdsSRKK36Pp1cFnKWfi+LwKM+CBAsIzl7MWDVaSU39p9yHFudfJeoxb8nDem8/
	 DDIPOP6N8qCZ0nHVGJ2XWz9OI3r+ZOBdoCsiG4DGkwJ3eCmAlGPqouqirDDfhib7riEi0
	 DfFeQUepRVuCSKFupHYAsWvGsD83Qz3CWxkfELfx17ZWMW5BlmjbRpOogR4035hbzldov
	 VsSYiQxHOpnWXvMwgnuN/HfIq9fUUIqwFTsJ5W+jT7Mzpbh4TLTrzDqAfIA3/T/ZdAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
	b=ZsA7+2wiLJdnaIYrNIGsFh7fkZD5hms1da1au+YG1XN5QUrNfeA7H7Qk1tL5ZOY+LaeX
	 V+SRdKdL/2X+MJOytMMX7yAKnrv2Ow3pihbF6wGvUnIXmzoflvzsmWcoz8VXy2mnyXxga
	 +AkIHgtXC6ckY++zMbal1iire2bgHRAKmhaw11Cv8hkIrocf6fqaYhOpCZG84gphNbX1G
	 SkeLJ2zBa3hPmqOe8tN9mIysgZuEGH4fiRYjhs9DHS2pjB2rOQKj2LaFUBZYiysCkybzN
	 fA17FIchIeTB0rPfVVDFrpTmqx2eM7LEOfa6GP8mhZ8v6sIbKdRGBAkBc8iDm5oLLUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktuBQ7QU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13B2606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktuBQ7QU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so30564785e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423572; x=1795028372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
        b=ktuBQ7QUWWahbDoFw7NOsY+5l4vBsnIvY5MwLmAcD2bGMzNwBzVEuFo11DL8T3nZXb
         Ae55H6AWLTlJdMUel0Xn0arfVmgrJ9UiWSwu51e0xm087vH7Y0oDmr03V1Kj+veKrmY6
         KEd8izWR80hPubWkTzL0/7XaJjcI55CORSpShBrixiX4OHgyd0LsUMT1uDJceIh63aZ5
         TRs2CfAtc6iGu7RZCx978vwPGLcxgVDUl049sNNR7rAy4K0hde8yrIQB7ts9FJFJ+USf
         XESk7LpJs/FwauPcUOYDMF2C20HXitFNZkIE/fFVPGyfWsVNIrfgYWkewZpClKnxh5Wi
         N0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423572; x=1795028372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmcUu24AcgALNJbfUMDmq5oQkKkP7zlxfkHJgkON/XE=;
        b=g1lL910FkNS6u8z+X4AIa3YyzlGPnWSlrgG0GI88R6Y5rBg5uld1IKCNcjv86R7dMk
         3z2Vp8E0Ind8L6IS1/2MbE+5PQSR4byDbwWtcUBq3TUzjV/31B0X0sijDLbTHm2z7DJh
         X7NQPZdqvucKs4lwdEasFuy2aWXWpjFaNAG2H8CdsEd/u4hz/PgnA4bj2cWzcozgh9QK
         kuJKhJTrnHsjPtWSCyzl3xcbH/RY9QtraeR1M2LnyzG3dE3ZpY3cmAkAQ7Z3kHe8i/79
         yxiO45SpzDt/ooH18SXkawvlR6lHsUVjVMivFiAtDwquD8bwBIzFFFJvgWzEOdZX0HqD
         M4jw==
X-Forwarded-Encrypted: i=1; AL+hErGieVvetM9h6loLv9oUYIg8NJkZbEThGP5JqpPnAh8Zkt15v9a6QGsqS6MIARO1vnNaGhjboFEEgPZIOyH4aMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o6rvE1xFxu18c7fwH2UrJQSXow7lK6byXwRJFvEvb12ZkgjIV
	6VaNPvxF7PLPi22MIxDe+tkpDlqlJtR79WyrND/SCli+QGimJIg4e3gR
X-Gm-Gg: AYBFou1j6ti2hKdANeB8DGVnhM/yoKQyHTj/lsQKPleoLZJOJ6JHQ3dm75CihBADOBm
	JNUkMTnVgQ1aDyqXJwuOtAxLCpQ7R2tPov7DPkMG8VeQecimqGzQ+eaNeBoeu2tEvpLSJ5ONRJx
	AbMTKWyGQpUnrBgBMttWi6vuXos8cvZeOninGIQyvgrAJZ6VGRtrZfDPEclHtNQjbkvVLvg5SN5
	X4iHbhkeKG954sTSP/nWAhJ/QE0SFUzJT9B95f9TEcl2j65PTGQ0wh40s9sujL67nQsWFxQFDqG
	d+CETFc4uqp6UGkuZivAuzNHXSIWnTkUZ7kub0fQOMrRDXwz6lTr/r3HmM7y1f6rKMYkCafGScL
	k23ALAITRH6+t1lx7a4+7Uq2WFoD8ivZs7pYjPWggQPwKI9evBCLPT6F1lExDwv4c6/ziIaGlVC
	lfGLwbRnDJHLYbr4cDbG6K3a3sPq9X38bhGMrHKyPEHxW5GAuV0Sr7q2p92wZzmX+/zuu706ikQ
	NLuqF1Ki0+znUM9KS2F8kEPP207jzw0edxPej0l8F0KIKOVcfsrdpCfkt9He7jbaskj2k35DZVh
	iO0L/lNXl9zJudrpuYlTK9ofnWYlVJuPyZLTpqGVSbr7M4Biuqwx8BYQCMeUaMJJ1QZ101LwUZk
	MdlJZfdqHKdGlmbX8H7jSUkSeh7oI6KPCu424et/pF2oAjESqnOm1T8EGht72G22dZA==
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr62798215e9.24.1794423572202;
        Wed, 11 Nov 2026 10:59:32 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:31 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com
Subject: [PATCH 0/3] iommupt: Unmap and return the PFNs in one walk
Date: Wed, 11 Nov 2026 18:59:28 +0000
Message-ID: <20261111185931.94882-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

When iommufd unmaps an area, it must unpin the user pages, but it keeps
no list of their PFNs. It reads each one back from the IOMMU domain
with iommu_iova_to_phys(), one CPU page at a time, then walks the page
table again in iommu_unmap(). With 4 KiB pages, a 1 GiB IOPTE costs
262144 lookups before the unmap starts.

This series lets the iommupt unmap walk report the physical range of
each IOPTE as it removes it, so iommufd unmaps and collects the PFNs
in one walk. The walk also steps over holes, where iommu_unmap() stops
at the first one.

Patch 1 adds iommu_unmap_sparse(), patch 2 uses it in
iopt_area_unpin_domain(), and patch 3 adds a selftest for the areas
that keep the per-page read-back.

An earlier series [1] proposed iova_to_phys_length() so that iommufd
can read the PFNs back one IOPTE at a time instead of one page at a
time. The unmap is still a second walk there. This series collects
the PFNs in the unmap walk itself.

The series applies to iommu/next. I wrote parts of the code and the
changelogs with Kiro, an AI coding assistant using Claude models, and
used it to run the tests. I reviewed and tested all of it.

[1] https://lore.kernel.org/linux-iommu/20260603151804.1963871-1-guanghuifeng@linux.alibaba.com/

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>

Fred Griffoul (3):
  iommupt: Add iommu_unmap_sparse()
  iommufd: Use iommu_unmap_sparse() to unpin domain pages
  iommufd/selftest: Unmap areas that start inside a CPU page

 drivers/iommu/generic_pt/iommu_pt.h       |  61 ++++++++-
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 144 ++++++++++++++++++++++
 drivers/iommu/iommu-debug-pagealloc.c     |  13 ++
 drivers/iommu/iommu-priv.h                |  24 ++++
 drivers/iommu/iommu.c                     |  76 ++++++++++++
 drivers/iommu/iommufd/pages.c             |  98 ++++++++++++++-
 include/linux/generic_pt/iommu.h          |  24 ++++
 include/linux/iommu.h                     |  22 ++++
 tools/testing/selftests/iommu/iommufd.c   |  30 +++++
 9 files changed, 486 insertions(+), 6 deletions(-)


base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
-- 
2.47.3

