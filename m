Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429935;
	b=hVoZn7tzeKkkMMkbfyMb/LD1SrO31D8zLRe0Zf01N/LpbYEyTvyGJC/bpup/+WgOKDaG
	 t2yIp9sfQwQn+m+QTwxSwP+oh4RB+P+cicjXkcwK3LyIMoMWvvvlIFXhExWnSlJraCLhl
	 vp+iW/F+qORc9hIfCrWREgxEMlaN+d8bY9pZcY4p5O08d9CGYwjWA2BtZeGWyUeBH+3II
	 /rh22ayaTpFhS9k3R75JAVZntPnHRsGSI6mLW2zi9mI5SyOKs8l2M0oXmudFC3ie1CY5e
	 r9HMdszLxmjNXm7/adjo8zW9JPfvPy1zXiSqJsAhp8Jdo8Hu8NSiMvDuj9wiA8oDjvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
	b=zvfKI1QC91LHfN614wBlIlZoDbiEw1Jgb2wiKkfpNfAxBK8WF5VgUYYQuaqo1zU++z1J
	 o1JfZ7YC822KKEYPTgiXs6x3tqzAMG2D2BggM0fEz/1cjKZOvOrIifPiJd17PvN91VtSc
	 1ceAh/UVHFrULBZIIu7CR8zXxWcjM65i5kjDtNeCvtpIHaRQEn944To8ZoYpfH7kIbXPW
	 iMDvwMAvXmGht55KflPhZgZDrtb8EIRv9WA+KqPSdaU8UY/oOs5j5REN4aT4/XM0sJcRs
	 EMZTx62XbeGNeON48nN4IoaEjuSGeVEckPPS4Kr/SlOjYh/fdbo78ktnQRv7iBQ3CmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PyFTpwlo;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46F8606A339
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46F8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PyFTpwlo
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5366ae57896so11834301cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429934; x=1793034734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
        b=PyFTpwloOkXK5za1FQptmH+fWmci+DXmyJN1c9qTpOg5cmKP1epyMvWht8hqDsonMd
         sAzzWKSbt8N5/EHrlOhV0TOBeqbru2A5kbmqz2cXA2wqSBVFuJUw8i7//sgKmeA/7q4r
         dGnqDUc8j2oufejwGw7t9b/83jTLykyR88SKrsVydYxZG4RFh15s+54wJs4amGeyKBW0
         nJBu6D6FnW6yr0bigYj/mA+99ImJVuMWpMOYWWOElqQdfqJ5dVlhP4djdKnQHqtyqoTb
         aPFfLmzTo37AP1KwpZ+YDamtmdWyXwkJ/+YrlRIwzdVMJbQm/nkHphncicbZsPtPiKTV
         Fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429934; x=1793034734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
        b=hZsbIggEOPcZVklSl7S/tjouIW5eWVTryc5WUQdnzNop3xcul+C2bwtQlKoMKZ5gks
         Up2j9mr//pVSXzFbMZimsfi44pgRlH+UsHOD0SeYa/gQmH/WB3AgSSnnpm0eOp9diqFr
         s2eLY/Jnk1PRVv7BFWtrOig1RwryQyP+TPspiEnuryWV2ipucgXpClUDIFhCEtkCuk3K
         lXVnk6W2u5mac4YWBVBFif3+pgeC4Nb+mD6a9mtYSRE8p3oG9LIrxeaBviJVffTbZ6A8
         m3TBEC0o1BzPV/4eekd+tVwkgGbhCoBVlew15aX9C8W4NZZ8SKDqYDnSsEK/w5x8RHuL
         krfw==
X-Gm-Message-State: AFq9FYJYXjpbqL4Q3FJC2fR0/1vJ91zyv+h21QdivurjcxOmBNx7iv4i
	fn0Dx0s5SLHYxgLRtUwolI9q4lZ5guqz7QoobKne8AXxzM3dTa6e1ZhtI2qbLXvFRBGNFMdoBcq
	5HYFh3oQ=
X-Gm-Gg: AYBFou2ThI4o83840HEN0mXAIzasZe+SM5Nj7ZNt/vD2108JWm03ajhk5MfJuWV/Y2n
	+aoY3b1bcZP7yp9kq6QkTyASSBAGQ76Lwp6mHzTgdt5y8Sh01n9XZX3BHzshiFYfBDv6fMVPZEj
	TCOF9l9bBCVRo99Tth6+w1Nxt/cnucLBO3e6vp3OFCYrXZ6KRYsUvyuddRAbYOVvGQxOP9bLdgF
	8IL4suo2sEShxjRbKzCWKzqIo6cp+90uShwo4ff5OkHyPARAg1hPdOncNqlJCtadrtrHDwq938J
	HZZquLJ9wRZQj5fVEiE8DEySv2oCGWOVOj0tetjQhQF/mUdK34mZ1bCRB+541rdhG2ENEcchMsU
	RAmINBSfLlCRDEXwPSX2PyIq3PzCBQHOGNemFedX3Ufb6aj30OB6zvmJSHMQLjLhQ5y+r36Z3VZ
	f5IGj8eRJcQIpBIUl+1qiKn3u4Mj+fMJ/fwsoixi+yxSqS/cHRPhBYmB0YJLp9VdVPta3uHSkDS
	h2q+NhXIe/ySwGg09NMDHRo0xFnR6HagKmeu46E0hVrATSBN7KNt7hyKn0e
X-Received: by 2002:a05:622a:229c:b0:51c:fc4:a144 with SMTP id d75a77b69052e-53645bf1ad1mr120809701cf.4.1792429933560;
        Mon, 19 Oct 2026 10:12:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:13 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 3/7] selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
Date: Mon, 19 Oct 2026 13:12:02 -0400
Message-ID: <20261019171206.3331374-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
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

Neither hint may be applied to hugetlb memory, so madvise(2) must fail
with EINVAL for a hugetlb VMA. Locked VMAs are already checked here and
PFNMAP VMAs by the pfnmap test.

Check the hugetlb case for both hints. run_vmtests.sh does not reserve
hugetlb pages, so when run as root main() reserves the one page the test
needs, and restores the pool on exit. Otherwise the test skips if no
page is free.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
v3: Kept Sarthak's Reviewed-by, but only a couple minor changes,
    e.g. the hugetlb reservations / skips.
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 8cbbfd4c24c4..0874726ec141 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -141,6 +141,29 @@ TEST_F(madv_cold_pageout, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* Neither hint may be applied to hugetlb memory. */
+TEST_F(madv_cold_pageout, hugetlb_vma_is_rejected)
+{
+	size_t size = default_huge_page_size();
+	char *mapping;
+
+	if (!size)
+		SKIP(return, "hugetlb is not supported");
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
+	if (mapping == MAP_FAILED)
+		SKIP(return, "no hugetlb pages are available");
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+}
+
 /* A zero-length range is accepted. */
 TEST_F(madv_cold_pageout, zero_length_is_accepted)
 {
@@ -276,6 +299,9 @@ int main(int argc, char **argv)
 	page_size = getpagesize();
 	/* The harness forks each test, which inherits this. */
 	pin_to_current_cpu();
+	/* Only root can reserve the page that hugetlb_vma_is_rejected maps. */
+	if (!geteuid())
+		hugetlb_setup_default(1);
 
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
-- 
2.56.0

