Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF734EEE3
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 07:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830307; cv=none; b=UUNLUq9XTnLK0DeX+r6MxLiaUCywRp7U8gJGlYDiVPiCKq/j6FmeMFLUkpyTBXUdvDT5wudu7yoIz9F3OqS0ZWbDdzo83b/CEZpKr8Ofo5rtJVsvCmAqzBmXX2WlVXTe28FNYajWm0sNV5H93pejCZbXzPXAsnIC0/S5tRebrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830307; c=relaxed/simple;
	bh=+hky/zfH+OhSR25hMLMVlR53mo5fy/VZJ64ZBtRjY4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pDrMOyWD5VusMIQwA2HPjKhrO+mkpCLUkoQtM2kmCL6VYrZKWrbAFJxrCbuy+629mkogUuWFvDN00fhlYo9rhx/sQj33vqZtp+ZuqSGyBfxUzNJo/JW2AjCP4awCdSD/nVpYe9PvLO9FNyKJVMMUurKV5OHfI500NxL5uKzDtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lm8TnQtB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lm8TnQtB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso28781253a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 23:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771830305; x=1772435105; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RvAUEDsFvuEub5+rTz247CsIuwfFrabNfZjGGUr2GkQ=;
        b=Lm8TnQtBUDLln5he1GSE4aQuCI7bPX/bjeCm8cdsgw0g09sVhB6FahV1rfOxdoUHxj
         /bRaMpqIpbtaIrnsMy/vwgivYMWrZrelUQNsxC6IjbR23ughBs7ItTh9U/xOMoqagpwO
         /RW9zMnAoyJnH1UIvCZA56SOa5U4sETu8CJvToLt39cdLDi9WpmcdGhbOFrNEWaRPfTb
         t2/dcTt8iIwg5FGSPWEg6FEHL2yllENZRFhjQavMsGx+owGwZ35vXuHNskOSWgrI9bqr
         TPMxM3WMJGC6WLfE41gz4I9pLM1+9S/aRq1k+j2cGYx25g08FICs0hkAQOOsmqfDiHYk
         XtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830305; x=1772435105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvAUEDsFvuEub5+rTz247CsIuwfFrabNfZjGGUr2GkQ=;
        b=jw9jwtYsRKmJ4mpwgnCBcrecTVEruixrUe6rrfJYJTdBY9kA2kyUU53M5gu4brVwgq
         d/IKulmCeSiPXqYoLeF7rdMt1xAlELZQ4xQ89OKWyayNttnlw/C/yzSGDIFH4rNTB3Uc
         duO3zTHUYmSdKojPbwSMzcsSltAeBt4CI42xscH20wBJiHLn3jsuOr8ok832HwPZnImU
         gV3OcRgwljMo+CuaCe6HkD6bvzRLiS4XfGkhdhUrj6IGDEYoy0CAIdCLueSjvujQ8Hba
         rJKECQMSguqVbcdISukNKcaWZBncBIqyPkuoCs8B5T8nk8BbwS4SlJY9DSOdIae659gv
         ouPw==
X-Forwarded-Encrypted: i=1; AJvYcCW1FfxflVNKDmyQUt9TKBeGKP8KTjQGxXjLRk9Uwr7v6l9MvDUWhbSBjR8yaM6+whYpzAvy6gNtnEsQ8UtnxPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAoZl+8I89wuMvsvLfZL1iFdPJjnI0OLQh/Qu1jvAK14SaY1l
	6ZQ3s+fye3naNeYdGlT/kvZFuNfdeadyl/0TNg+Dd/QpNwr84WjyNioDWMDKxNKGdLPNSF1A751
	Kyx/UynQAgt00BDlBCmqZFSj0XQ==
X-Received: from pjl15.prod.google.com ([2002:a17:90b:2f8f:b0:34a:a9d5:99d6])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4987:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-358ae7e86a8mr7189605a91.6.1771830305202;
 Sun, 22 Feb 2026 23:05:05 -0800 (PST)
Date: Mon, 23 Feb 2026 07:04:43 +0000
In-Reply-To: <cover.1771826352.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1771826352.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <3ddd0a3f248de622221c67d3a16ca058e77e74e5.1771826352.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 10/10] KVM: selftests: Test that st_blocks is updated
 on allocation
From: Ackerley Tng <ackerleytng@google.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	ackerleytng@google.com, seanjc@google.com, shivankg@amd.com, 
	rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, rientjes@google.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	pratyush@kernel.org, pasha.tatashin@soleen.com, kalyazin@amazon.com, 
	tabba@google.com, michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

The st_blocks field reported by fstat should reflect the number of
allocated 512-byte blocks for the guest memfd file.

Extend the fallocate test to verify that st_blocks is correctly updated
when memory is allocated or deallocated via
fallocate(FALLOC_FL_PUNCH_HOLE).

Add checks after each fallocate call to ensure that st_blocks increases on
allocation, decreases when a hole is punched, and is restored when the hole
is re-allocated. Also verify that st_blocks remains unchanged for failing
fallocate calls.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/guest_memfd_test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 81387f06e770a..89228d73fa736 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -218,41 +218,58 @@ static void test_file_size(int fd, size_t total_size)
 	TEST_ASSERT_EQ(sb.st_blksize, page_size);
 }
 
+static void assert_st_blocks_matches_size(int fd, size_t expected_size)
+{
+	struct stat sb;
+
+	kvm_fstat(fd, &sb);
+	TEST_ASSERT_EQ(sb.st_blocks, expected_size / 512);
+}
+
 static void test_fallocate(int fd, size_t total_size)
 {
 	int ret;
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
 	TEST_ASSERT(!ret, "fallocate with aligned offset and size should succeed");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			page_size - 1, page_size);
 	TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size);
 	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
 	TEST_ASSERT(ret, "fallocate beginning after total_size should fail");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			total_size, page_size);
 	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should succeed");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			total_size + page_size, page_size);
 	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should succeed");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			page_size, page_size - 1);
 	TEST_ASSERT(ret, "fallocate with unaligned size should fail");
+	assert_st_blocks_matches_size(fd, total_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
 			page_size, page_size);
 	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and size should succeed");
+	assert_st_blocks_matches_size(fd, total_size - page_size);
 
 	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
 	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
+	assert_st_blocks_matches_size(fd, total_size);
 }
 
 static void test_invalid_punch_hole(int fd, size_t total_size)
-- 
2.53.0.345.g96ddfc5eaa-goog

