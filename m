Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863B2C0274
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424454; cv=none; b=XU792643TmyqT1phZr5ZbEnJZMUBVEr4X7FAHIFRVWfdA8x4T+21bt/bWSO0+YrMwBCmp1feaR/UCWVyBX0PR4hpu13fIXQwC/lCkqiGEkioGS5EY+Zwx1LdXEA0ulDkz9zfV3dSgp79ZIkeNAQLPnJ1iQp4aSDk9R2w7k3+e3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424454; c=relaxed/simple;
	bh=o6x4ZrBFFyJQtHw+/MAjr/5xinzQ/QrvRCDFwRw7OyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/LuejjOPWRqH3b4KkGD61A4mdhoaf0qw9dyijc/BcrzE97/b1BgaouF2RfwiqCqNhiZdh1kiiDs60Q+fBG3pwVfkVKdrw9EZxfJBTNgt1ZFD/2oVuO6pycylDLL27X4PSJfkirl3WOkge71wtp7l891C5UXHO73VFTRPhzxL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcTfIPB9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcTfIPB9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cace91f112so30171545ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424452; x=1787029252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5Yp2+G0Crvx2BGRAs6e0B1TwVgIjZjOOiINjptRlyQ=;
        b=YcTfIPB9ph5gDPCus/zZNwdB46op3PQqqkySYdeRWfrfPtO51j++jP1GkG0gh0SfWw
         BT8VcPgYEZo0/AzKuqq1KMWi8s/o8XxFMYZ7X/k/QMntKSud65IizKtIt51JSrtlXF6T
         rukx7QrUjESjCKacQwVKXE/7pEjunEV/7ilobvyFy0fH95Iu2KDuVkgjPjZ8StKgUZhL
         +0Hxi9N7Bzu40wkA70mioHe37tAiIbtkPmUSC2I9+h+Dr7liN70dJYP8BxSTtVXrfAJ7
         lsRs3pzOjXVojkqvNPKsjrQvlTecV4XayIoRFpZfJkyea1ticqiP9d5qtNjee7VTu7gE
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424452; x=1787029252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5Yp2+G0Crvx2BGRAs6e0B1TwVgIjZjOOiINjptRlyQ=;
        b=LsRzR0oSD8wdU2+gsBXPNlFb8ovK/+iC1gAaDUCsmOf6D/UnH7lXz5D5Ww9AXP24+d
         SN6+CTHHWEZStgP38PJUBE8UoJXvs9Gm6P2tan8Kk7EL16bzYT7QmRzhrXMjrcmyIanM
         dFswlB7n3MgYkeWPoT1jo1ElcPoh/JACRlA0suizrtqFS/+3DwQaacvLQdzyo+17tuzm
         A9CJlT5TdA9VkLygOoAowFRggFrlMjc5bTt4A4lLML+OrXqi1VFZ8ng2FhFanyCI07al
         axZYWrpxqx7RbhfD84KlEf26kyVxyL+PNaRlzgRjIZHJngszxAZJ3JEtlpptjPxuxOA3
         ISzQ==
X-Forwarded-Encrypted: i=1; AHgh+Roooa4c7E2Sgsy4ETUUrQXW9jCdp8jMOS54YMBm26r0Mh8s3fuYUk+HQaR4/5hyhYAX6OJFFVjDaM57sSPNY78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkNdFCW3wc6m5BRBDtk4neirq+Ipix76a7W1Lckq1vxvuupJNZ
	yKzkLF0hhu5m/DCIznFmBQmTFwe4WN86DDuhlXOvKcN3xw664N5H1U3g
X-Gm-Gg: AR+sD13V9PtqYOZx86hDUupoAZTP0alyscCjbVYT0kw+x26OyamSngnjeIiyHy8WaRc
	XoUudh2sQfVrLbJiFSsPnELcMGCQuuD+SrOnkSlhsUFoYpFo9vCOEQVCjx5u5ae0yclnUt3O+9I
	AekyflsN5fgRwD3B6O7tUhPhh2+lttE8WKlynDiLNE/+yOfY6lo9ACh66WtQ4JTc2lktWJiXG0d
	a7foUjXPSchAwvvFwWnV9OlNmMX1if5lIB4dlDABmLE0dq2u6rRoCmk+fUEqH+vzjRG88YNK+h3
	aquU1KhBEBpCZcsJ+Cf7soE1LuwUyDPYLcNbT406AIHH8ifY78uqGIvoJ3w7Vy35i3rDNMhaV33
	hmPGbA5vBylfPQ6vFd6GAMtnm20wmgiOGzpzfRqK/Q+/Pp20kV0XW9wMRnsNN7qpAh4CIMcLiRO
	e8qfL16Z3riQHnbRCV42pTNd22hirEAXr3t2W1sr3mf5UkOzzWgAJUHmehA4yaZxH9DVz/Ec2GX
	w==
X-Received: by 2002:a17:903:3c63:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2d3179240a8mr10712955ad.18.1786424451576;
        Mon, 10 Aug 2026 22:00:51 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c619d0209sm587312eec.5.2026.08.10.22.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:00:50 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: selftests: Free the VM when NX hugepage disabling is denied
Date: Tue, 11 Aug 2026 10:30:29 +0530
Message-ID: <20260811050029.530698-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811050029.530698-1-gokul02k@gmail.com>
References: <20260811050029.530698-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_test() returns as soon as it has confirmed that disabling NX huge
pages fails with -EPERM, without freeing the VM created a few lines
earlier.

Jump to the kvm_vm_free() at the end of the function instead, matching
the pattern used for the SEV smoke test in the previous patch.

Fixes: b774da3f2e57 ("KVM: selftests: Test disabling NX hugepages on a VM")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/x86/nx_huge_pages_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
index 70950067b989..e3b20033a884 100644
--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
@@ -120,7 +120,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
 		} else {
 			TEST_ASSERT(r == -1 && errno == EPERM,
 				    "This process should not have permission to disable NX huge pages");
-			return;
+			goto done;
 		}
 	}
 
@@ -213,6 +213,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
 	check_2m_page_count(vm, disable_nx_huge_pages ? 3 : 2);
 	check_split_count(vm, 0);
 
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.54.0


