Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65835563FA2
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000692; cv=none; b=qmTH6JoUeGfh8lmpqhwQCViW335tcQnu/+PIu8EJxGD1FAJQeEfF1D4dgnolwUCA5KaajUvsCkOYabQ88c8hcCLSoId6/s26VNXKKfZ7k1vX9xgvheVN0Ho94gaw5Mx2vvTY8qsVcD/Fs4P8YWXJEFgW3a6M6O73hd0L61V4X3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000692; c=relaxed/simple;
	bh=dtUsJXWeSz1xVwH1+9EeXPGbnhI+hff+JG7zlK3YZqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loPwtElob7n9QhOz4yq2voC4T/HhLy0iLlwVK8EG51sfU5rkW3EMm20pYhFz7xG5i2V5hacoLDQh9rRxhbZhluvogP1LuQ9tvTM2MUj7ZHLloIPGnojlv/PKP/ucwyI/GympcHfH5vVdwWgNw12KQsfb6rBr9LTLmfpA1MQxieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mBSJhznH; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mBSJhznH"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917aca1aee5so7259176d6.2
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000690; x=1792605490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hG1OkPWuMhUm94pHMuNzy2S0Df1yx93ZBtOMVZJLjuQ=;
        b=mBSJhznHRtXxbKIZVZ81KM5wfc5kRAQLnbb/jY9vVOSxzZXfQ1UtLPoi50u9KiAOXP
         WmtKQuWEzlS14WCG4fGC+nwA+jHI21Oom1+wUVSiJ6yG8oTthFDRL7LgpDZ4mCyTGXZd
         JTU7923W7ga8DFcLiSRec73UufkUFPRenbd2pKAPmuGsJKm562C/HWoWhHA8wbsXtHls
         aOw/XeGHyXifxxZIIq6XFHFxJ3H6IQWblN41AKtJv29PeksaRk0tT/RA+OUMDE5YjAiz
         Sd5GgnPZpftyI1d7R6d6CjMP5UeMTYGRx98Byrczw1Ogzv9m9ra4u74bHbNxQh6wv9ky
         fLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000690; x=1792605490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hG1OkPWuMhUm94pHMuNzy2S0Df1yx93ZBtOMVZJLjuQ=;
        b=jWAZPRxalniAjk8K8/qzuG+MF3YwAsAtVB5f3fIBWne/1QTT71h2mMUNqIoIbI1Fk7
         aU3QvbdoDGFhM8vdVPbu2o2n47De71cEGVGV+XJga1ipJ3ulER2TpFDkH5lKsVl8f2lV
         +l8gsHLUfNXbvhLOnGgO1memgNhZQ0hZ82ld4SjW+ptV3WiNA1Tktjaz0TL6kd/GwWLF
         Chyqy3DObVTWv/TyORf5VvuvF4npexVcqAVtWbdDbqafFaYUXjKP6Xr5zeCjZeMk1HT0
         DVdxky8heap4dy+WPX5OWsaPoC6o8UTh0wuyBGueVl1rtz+Jg6x1qnXqOTPJHUIDt2py
         Sing==
X-Gm-Message-State: AFq9FYKocFzPj7XOkYMRhk3yHO3jM5JKPwf+QXwDHePhVgo0/DeaJ0Ei
	1w5dokwLCs2BSMDToy7zJNxfYZXJ/uAhytLmwpLPRydZqDjhp3ppyL4CvUV5UZIf1gDEQKuUeSu
	0yN14Hsw=
X-Gm-Gg: AYBFou0sjJde6gn0XuIaU2NrnEGIlrXDN62glOjbjVDjhHyoHFHtgCYiGW+18WAylo8
	NI8/6Yprk2X1mGu3EgIDTH9441hJRrYp40K/yDs4C52mpyH2cUnT2om2Ac7o489WyXx44WBq1Zd
	ogaB9bSS3duWdNyZNT3ISDu8blKMawcFWLHMvJohp3ioH1geP3OC31JEWvnvf6XxeE57Jj2SxgU
	eQUh1IxMeemLGowGjEwv/9XqwWnvPTYV461obAYCM124DaBykmpw2+q/k62qsSlh2ahd4vqULb/
	WTzpDx11NTi0sDSuc9KA8BKdBSrGjQzCpQnPC95Z7vTORWYhNdDy8Oid1l0qPzU29S54IZrUtlN
	ZCg8lZH5+h+ieZdKZWwUPj5d2uAZzMGCN1pZO6dMI9GXdCV5rSoJzyPAP0F8OO40aw78b85XSvk
	G3AHX/aWS24Wbi8sU8DKqpQq2+ZypEx1z4zHtwZYfw766WkZo4aVzPTHugHzvzOgJszbDeZ/mrD
	mb9QlH1a2ZbFWgTtOk2UA4f2oLdqjtotSpXuwidQXQAVGv2bg4qW8z11JB4
X-Received: by 2002:a05:6214:85d2:20b0:91b:5e33:9858 with SMTP id 6a1803df08f44-91b5e3399d7mr195582466d6.54.1792000690352;
        Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 4/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
Date: Wed, 14 Oct 2026 13:57:52 -0400
Message-ID: <20261014175756.2035176-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither hint may be applied to hugetlb memory, so madvise(2) must fail
with EINVAL for a hugetlb VMA. Locked VMAs are already checked here and
PFNMAP VMAs by the pfnmap test.

Check the hugetlb case for both hints.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index f122154fac05..bd78f63f1314 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -127,6 +127,29 @@ TEST_F(madvise, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* Neither hint may be applied to hugetlb memory. */
+TEST_F(madvise, hugetlb_vma_is_rejected)
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
 TEST_F(madvise, zero_length_is_accepted)
 {
-- 
2.56.0

