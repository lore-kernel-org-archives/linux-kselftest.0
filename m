Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423576;
	b=4sLaeNkvoZ5C/R3S78Nlt1Y/OU0pldqoivK3BTgeDe9ekrgv19Gt6EkLgadHbXdajrhb
	 N9YDbZXndgwUeAsLXEdxEWDITP5YbKcfIICO6JbZoaHHytPwzHm4mNJ7uKC5PF2aKrIYs
	 RuKoUrY/2NNlfymcW0mTQokAkrAd6Wlhx5KvfAXc2F8Xvbkvmt6jGBhBhuMe1StiT63e4
	 rRGmub03JomcE00j1BgoJWstiYzyaiFuvA9Ix7uh7ihrC3pMJCJr0nQwcJgGCz8ZbzARg
	 jC3bGa0Nf2zQ4pHCzStZCVXFb4NrbqIDBcP5rSU0B+nc5ish5aiqvG5itETVHRgO+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
	b=LIlUTaUiTFHyfOcM6U9iXfEN6JmRQGM/Z7zgic4Kalo2WKi3mkWRDQifPYznxle7G2+a
	 0Sqtb8UFbLAsx6b49DZJdp76RfaBIp1AyOJ0arXDaJCfXaC9/fY4int3UhCWF191PFuDa
	 b17uWu3OtAEw8eYZyEsukOf7NndAfCwueh/5wlkdDKwyuEJLxLQLiTEFkuMsbox13Z/nu
	 c5310XI3I5OZ7E3gSyTvtHQToMH7YqfUcmcB++JVfidqxNeVw82hJv/dBkNx2n48LzCL5
	 68rkT+ceO2cMcTOEF1XA3TzIybbtwh2gDSN8Hq0a+Rz2Lug04casJ3KqQtsKo3GRCcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umFx6mtW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9F606A889
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB9F606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umFx6mtW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso25328605e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423575; x=1795028375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
        b=umFx6mtWCeu3Eq/3p1zwDrv3ADRQERI+0lmurPLVwGrE9tim6pHiYPWGuu89DBqAxi
         /4ANd+yp5P7b1VItJ7jKuPC6mLLkg72KvFbJFA9/mMzyHROQ5AbVS/zb8gEUuoCWoHfA
         wuYNN+xtOKbbL0Czv/7VZfGAURMgFD7OnLo2zL/yaZKnclpHMehAgY9J5wsmS03kRI4a
         L5jVUtvsajj4/rE5B+NEX04y4bV95lzj90vDW3RuwWRIxn07nNJGjF9CaQtbtdD621mL
         dS6WLaC5mru9eERHNHXMkJ0l0gnA+z7UYRX/mFukeFbRlEAA0/2yHf2rOw/pwMhjZi5C
         utDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423575; x=1795028375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+phg1j19BXrf86wyrJWSlSmJGcdhYdq8codoDOSGqo=;
        b=a6VP24AYxZIuWQyOHGaIY3qpVeMoGcV9FBq0MeR87/1Q1Vd+c6T+3GL5DLWwJTzJtm
         PoebyDqUhTn8n2B8GS/GwsmfZv8AuX0kTTOHxM0g5kfJ1w11jtDl3rjlOloivHrupIS9
         EBlVZUnNpTEB4Tl/oB9UR0PkgdNsQv6NV6KA0NyEZrE3pRV7KsA6Wmz1ph969vJLbs1q
         yhLX5AyD5M3nafQkIHj4NmWrhVdShG/ichOLjv40NbvPOdkLETAG7NZWkggdXLZVCUzA
         4ZasbsXkGpDP18k9OI4mZvirdDRe7RZVvf+agxaOefcHGNPQFyr1WWkr1qIQN4CDK4K4
         zTMQ==
X-Forwarded-Encrypted: i=1; AL+hErEFNWNGckAotPMOJpIr6MWoKlkNVOftsO/aiW54iP3/skx6accFVOTJuQMWxV72uNwf7tEnaIXqeKRxGxPijHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n87qymMsEYT/Swy4XAnNWEAzfIQVDKq/WZ52qH6LdPgTlYjCS
	A5KvrSydN9mqbG6hZVLxYIS1FaH4JxFg8Zj2eszhiCgggBErAMI/trpU
X-Gm-Gg: AYBFou0ydN0zUxWEDdwYHN+KhEzsaGX3QA4/EuFnEnCUbu5XZIsOFnKu6ZU1UXKoxc9
	rXNbJBxShnbYy3bWOWEnUbXgkSlmDgSev2Ypnv3abbJ/1UgQCQmTi2SDVLGPbF1PYCVyPuWsHrm
	d+a+LpG88bOaL3TNQnmQztynUZSo3I2V03/DmJsCd92mwEe1nJL1BU9TXl6RDH81peIl89+h+R+
	TqBZT4e43OSpjGImqBPK8yavmf7Q6qMvHAxPTmFkC+c3VY+U/jYGLID1Y1vP+jdHMbmaAH4IcXc
	SdwK6j1cJ32Dldx7B8RIB4XBW98mUdkbqyGZrVt32O4xIKmwIkRm/n7tUmSpJwEuVaNXVqfnwSP
	oT3k68KGiZYTjPkEJm5SKxPOT/k50evi7O0p1FeIhF3bdSrlLvkzvNv8IBrqEbqqseaXTC5dtjD
	58GvJRJtOp1w3VROWJ/Gahvjt0bUEXhblWNQ0ayRc889txX3xVZ4Gix2lU8e6JpbkgNlZU5LeWI
	6h3IYEtzYYa9n5W4EvWlD12jKIndoUAPt17O7pIv9L5ajSHb/ak0vecUtFQYJkk2boDDC5e8lr7
	gffPn9kAzdfqB6Re1d6Yl/bxakSkCsCkYRi4KLVBId2bkACEYwUOsYeBkMNOfclwuGkt9wfpkt8
	ECNFuybSG2N0l1ElZ0Mp+rGe9++DuNFugsHCPws4PhG9fZnfGTPBG07CRlnDq9GFvxQ==
X-Received: by 2002:a05:600c:1986:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ba0935d295mr60270305e9.6.1794423574703;
        Wed, 11 Nov 2026 10:59:34 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:34 -0800 (PST)
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
Subject: [PATCH 3/3] iommufd/selftest: Unmap areas that start inside a CPU page
Date: Wed, 11 Nov 2026 18:59:31 +0000
Message-ID: <20261111185931.94882-4-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111185931.94882-1-griffoul@gmail.com>
References: <20261111185931.94882-1-griffoul@gmail.com>
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

On iommupt domains, iopt_area_unpin_domain() unmaps and collects PFNs
in one walk, which needs IOPTEs that line up with CPU pages. The mock
domain maps 2 KiB per IOPTE, so IOMMU_IOAS_MAP_FIXED_IOVA can place a
user address with a 2 KiB offset at a CPU page aligned IOVA. Such an
area must take the per-page read-back instead, or one of its pages
stays pinned.

Map a buffer at each MOCK_PAGE_SIZE offset in its first CPU page,
unmap it, and check that no page is left pinned.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 tools/testing/selftests/iommu/iommufd.c | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index ca2b35e9d443a..14c8a12a3bc17 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -1890,6 +1890,36 @@ TEST_F(iommufd_mock_domain, all_aligns)
 		close(mfd);
 }
 
+/*
+ * Map memory that starts inside a CPU page at a CPU page aligned IOVA, which
+ * the mock domain's MOCK_PAGE_SIZE IOPTEs allow, then unmap it and check that
+ * every page is unpinned.
+ */
+TEST_F(iommufd_mock_domain, fixed_iova_offsets)
+{
+	size_t buf_size = self->mmap_buf_size;
+	size_t length = buf_size - PAGE_SIZE;
+	unsigned int start;
+	uint8_t *buf;
+
+	if (variant->file)
+		SKIP(return, "Skipping file variant, the test maps anonymous memory");
+
+	buf = mmap(0, buf_size, PROT_READ | PROT_WRITE, self->mmap_flags, -1,
+		   0);
+	ASSERT_NE(MAP_FAILED, buf);
+	check_refs(buf, buf_size, 0);
+
+	for (start = 0; start < PAGE_SIZE; start += MOCK_PAGE_SIZE) {
+		test_ioctl_ioas_map_fixed(buf + start, length,
+					  MOCK_APERTURE_START);
+		check_mock_iova(buf + start, MOCK_APERTURE_START, length);
+		test_ioctl_ioas_unmap(MOCK_APERTURE_START, length);
+		check_refs(buf, buf_size, 0);
+	}
+	ASSERT_EQ(0, munmap(buf, buf_size));
+}
+
 TEST_F(iommufd_mock_domain, all_aligns_copy)
 {
 	size_t test_step = variant->hugepages ? self->mmap_buf_size / 16 :
-- 
2.47.3

