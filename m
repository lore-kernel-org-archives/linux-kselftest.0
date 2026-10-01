Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA84C9E03
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894808; cv=none; b=QOmnyQWDc9S0TI+VH/WIK/JiEJxgn2Ukm2gKZ87lUXu3T6X6NldUEMQ9m639HNAvu/6DoOMXTNA2wPh9imLu8zWCbmcMoERjPiJD+n0Bb1gWqPMQZ7PNrb0A8m6EPDenFgLTwGNIZRpGqTgSK0fdElTGQB538mS859s1jFbEesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894808; c=relaxed/simple;
	bh=I4Eb0TQXvIje7w417a5e7xobqbWORtKJ3XI4af3ycUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q1f8T43MSmrV7t+J5ORLuPIZZ6DCl2XBkp1AtS26h7qCy8XT1sNtoVRzlR4G96aqgi4hTBFDDGFSBz1E1udAU/qx+0Yk+eawL/PL8dYipuK+rumwkt5y2W/lLahTsQNoodhAyBP3Q/HoWUv8SrthJoqR8qnhNM2fOiYrxnv73Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fEQyV4DG; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fEQyV4DG"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8886b1d3242so979297b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 15:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790894806; x=1791499606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0wc41/LqtlI4rj0/ni4k6LG5KAkWTAQw55eEd0Lzvs=;
        b=fEQyV4DGaWITeMh1P2XQ+dfEXTltnyx6bF0iOcvQCoLZGTCT5UZglhmE2SrRNZjoSi
         14rOF4fiAcvAIiot5lN3nlLM09sF0DqqrSMh2dxVrShme1bqnjRuh7yA1LwbVVwX/TWs
         CsmBLlmnwXOFvF0raxZ+Flqh5Jpg4awOh/MTw+1ZwGovCprIq0RVXdLLAX68Kp5TZDOT
         /5Le/Z5xmfqiUf2ImwLOKSIl718Ge++oo/JD9wfhvZp1hpZld8GpVcywiPWKELhmCA9t
         83Us6De6+yGoLEYUhHJ2rURY47Y8VLgVUY8DSsbh4VHLrMw+b/P/FO8kTVuKDUgco7MP
         KpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790894806; x=1791499606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0wc41/LqtlI4rj0/ni4k6LG5KAkWTAQw55eEd0Lzvs=;
        b=p6yq1zHKTCmudI64vM2N18Hc6+jrBYcnZYcmD17+HvNMD2DWUEV4PaFXJ6emXow322
         8k2+hjt3UZBWeiu2g4Noc0DVP8UyM8PgZU3uL/odkaU81jPcGjHSdgOquQEQQWAD7Xjo
         r9jj/CCNF/3TMnp5uF2bRXWDbk2EAfPdZ4E9M0azztylGeoJ45VAa5lWopORoea9jfKf
         98euUSEjFeN7jcQIBqO3TCAHiE/ggLQ7+b4r7EPoCbdSgaT8IY5YCwKEn0FWLjSD3V3n
         Fh3HPUEWPZ+CWgq1fey/stykRDlD3Bzr2RoRSrrVhNXp1/UJkgT0J4gtjhJngX1eblIt
         SGTA==
X-Forwarded-Encrypted: i=1; AKwUvBz4P7xLBzepCkBnWKxUVSgiC+FNI19guM33d103hX4mr68EgfXBD+5Wkz5WOjN99VtwxgbvxR6/sRir2YBSwnU=@vger.kernel.org
X-Gm-Message-State: AFuF++nj8EgMQTTJOmDniC6Enq6+XZbhOtWJ9UMTu0Wm7VHDwYvMzL/C
	0eQ/hkIsXkQDoS/7ydJKjR4nYKo/VLyZM3VBH8uWyLH5I75BZOWIoXWV2yZVkO6RZXqfMWy74Ou
	Uhg==
X-Received: from pgbcs6.prod.google.com ([2002:a05:6a02:4186:b0:cc7:d1fb:4ccd])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a10:b0:3de:8ee8:8306
 with SMTP id adf61e73a8af0-3e0bcfdd8ecmr751775637.31.1790894806215; Thu, 01
 Oct 2026 15:46:46 -0700 (PDT)
Date: Thu,  1 Oct 2026 22:45:30 +0000
In-Reply-To: <20261001224531.765278-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001224531.765278-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001224531.765278-7-praan@google.com>
Subject: [RFC PATCH 6/7] iommufd/selftest: Add observability test for iommu-nr-pages
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Logan Odell <loganodell@google.com>, Pranjal Shrivastava <praan@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a test case to validate the iommu-nr-pages fdinfo metric. The test
maps sparse IOVAs to force page table directory allocations, verifies
that the metric increments accordingly, and asserts that the count
remains stranded after unmapping, verifying the current behaviour
required for future automated reclamation logic.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 tools/testing/selftests/iommu/iommufd.c | 48 +++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index d44b34b05757..f5f4ef01ea4f 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -3613,4 +3613,52 @@ TEST_F(iommufd_device_pasid, pasid_attach)
 	test_cmd_mock_domain_replace(self->stdev_id, self->ioas_id);
 }
 
+TEST_F(iommufd_ioas, iommufd_nr_pages)
+{
+	char path[256];
+	char line[128];
+	FILE *f;
+	long nr_pages_initial = -1;
+	long nr_pages_mapped = -1;
+	long nr_pages_final = -1;
+
+	if (!self->stdev_id)
+		SKIP(return, "Needs a device attached for HWPT");
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", self->fd);
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "iommu-nr-pages:\t%ld", &nr_pages_initial) == 1)
+			break;
+	}
+	fclose(f);
+	ASSERT_GE(nr_pages_initial, 0);
+
+	/* Map a page at start and one far away */
+	test_ioctl_ioas_map_fixed(buffer, PAGE_SIZE, self->base_iova);
+	test_ioctl_ioas_map_fixed(buffer, PAGE_SIZE, self->base_iova + (1UL << 30));
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "iommu-nr-pages:\t%ld", &nr_pages_mapped) == 1)
+			break;
+	}
+	fclose(f);
+	ASSERT_GT(nr_pages_mapped, nr_pages_initial);
+
+	test_ioctl_ioas_unmap(self->base_iova, PAGE_SIZE);
+	test_ioctl_ioas_unmap(self->base_iova + (1UL << 30), PAGE_SIZE);
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "iommu-nr-pages:\t%ld", &nr_pages_final) == 1)
+			break;
+	}
+	fclose(f);
+	ASSERT_EQ(nr_pages_final, nr_pages_mapped);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

