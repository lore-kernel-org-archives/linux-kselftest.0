Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC93A7848
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176694; cv=none; b=tLzN+yGPahiHvZyv5dEeXTJi1XLp4pTZKAL7BpDH+KQG6w/Vv1gb50UHYwoOezGFj3GkNwfMYDHDkgvUPFqzsUgzvHt0hSdk/MT5ekXaDWeF3/MmUX5bQorDVzBgYy81a6DTq587NVBmIhLddVJkV14kvQtazvCtXBNVRTjM7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176694; c=relaxed/simple;
	bh=MGb5suHwKenoO8+Yoit0TZ1mClXS7TepI3s00xmuOag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F77nWGtdj5RxPflhwKW8jTXWU1pCBBcvjhBLe3gE1Zka7wFQQ2nZsJTgXWgLHbTK7QxgcTnOoz0c2uu3Cuc7N8ZU7h3CXp8sEMosTzOWDErtOCgIEHY7/aR6NRu1vHgQZe3p/ea84ZOYTZwODvrRqqVFjVbNqqO6l04R3utpbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZITh+bIa; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZITh+bIa"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so172618a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176692; x=1786781492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9dVgwGHiDFCuZ0x2p4Z0K2PT+mB10F3qNo0u+NxB+U=;
        b=ZITh+bIajm7bYWL/DiNPGuZ6oWti+Aeoagi7E6GE4vCcaGjfD4jZ7xT1ET7vVGhcsq
         msHlaZ1nycChIHwiMUX3OCIDB/abgpAhcLgwX/cXxptfhsQ6tae5aWSuGRaaBqqfGy/i
         Y2i/48oCIko3JSzYpCZ2yGoA2XtwzPcMpouu7RFwpX+Z+UTjJPet2ioIIXsdCcQ5NTOl
         eMKM1ivHEcWZ57qSJzU1Ex5WOtJKS11rTOmDYaWFdMxD0KZXOIccmafIYGdiSo53Zaji
         A4LKpwS3R67akJ6EfQQHVMsrD5Snx0w8JPXYEAAA/QaQfV4UrcUtAzFGnknxcfztQ2a4
         jwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176692; x=1786781492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9dVgwGHiDFCuZ0x2p4Z0K2PT+mB10F3qNo0u+NxB+U=;
        b=W5uxV44lG+VG8UJc0Rs91VUA4iWxAA3kYQcSkQJUnSmb9BeR3E4qn5n11GiE6xuXzs
         GvuXjmN6iT4tbJkevjw3ZfQw7ltWYcnEExl2RDqDq6f9lzmrhOlT9LWzpP0P2N2s6S+Q
         bkXIGR9YM/ttjIBYPsyqTznWU5gFT6dCrk/u9vC23YS7Br7qmyjJ5yXYXL2ar7GSoRXy
         a/wZHhtkNv+ioVAkhDjMPkdF3qdzIi9jbT6cF2tUm5HWDRfniDdCTVtAdv8XdgSJC1nL
         TPpumtvdPWZZykrskA57yD5ktTPPGhh4uUykrLjgw7V6lrJFdT9EYJ6NgyCXJbaTCWQZ
         IDIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPPkDU1SS4uNfi0IPj4pV3pvHrY4GUH8a7A1bWzNE6kaFQEIitcFADwuJvUX23hv6dh545PCxiOVhYQiunJZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJTgp+K1Onf6CvZS0uE2SO0P7qwjpVz3C+b8914b8TgPgJ4DZ
	rVNaxR1sj3+3OhBi1AaoJpNc2ieAmJUCn06/e3W2ttw7ZO/IQnu5g8lo
X-Gm-Gg: AR+sD11XELDMY885joAp3plSLBAkkZsa/PmuEQlNexZctm/YqvQ8ypfWKPW1xmgwFqK
	fKullTkA2YXMuWqafTMvF4X6dy54Q7UV/KjIgXVv3vHkUBv28F+8wsIgZKGt+R/OTxhL0E7gP3S
	IwkbW9gSlyxhfxqG5OKL2MD5gNwd16zyNrbPs8dewY2ubB9tnm1S2VBv5q2JSkKYTxT9m0uL2Du
	eJb/4BJJ5wjXviFattR9kfO/VkRQ0fc39+dk9AIuuHYKnuflrPCeZvi9o8af4hUlf9IuPwhZGDL
	2YLcdZsXNI9siNGaHM/q0cml1yraLUF7uJJcYX0wWUJpzJQ0OjT89qtJcNWVKW6HJpj73E2DmGS
	WHLMo6re3IAbsBvNKJPigR02PO1K33BBJNeT0Ct5Wpad4UkvRCejWE6EBrdr83AVGMkXyfmvdYd
	AtKjqG4DYgD/b2+HZtSlDzRDC0tpQ8W0dYLZEawfmRwAFRO2zuvPVgATvmS+K0E7H/kkFC7cjxj
	IXoqGlhUPof
X-Received: by 2002:a17:90b:258f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39282247ee9mr6250045a91.5.1786176692047;
        Sat, 08 Aug 2026 01:11:32 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b41d9sm13660310c88.5.2026.08.08.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:11:31 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: selftests: Free the VM when NX hugepage disabling is denied
Date: Sat,  8 Aug 2026 13:40:50 +0530
Message-ID: <20260808081050.408657-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260808081050.408657-1-gokul02k@gmail.com>
References: <20260808081050.408657-1-gokul02k@gmail.com>
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

This is not an obscure path.  nx_huge_pages_test.sh runs the test a
second time without CAP_SYS_BOOT for any non-root user, and main() calls
run_test() with disable_nx_huge_pages=true on its second invocation, so
an ordinary run of the wrapper script always takes it.

Free the VM before returning.

Fixes: b774da3f2e57 ("KVM: selftests: Test disabling NX hugepages on a VM")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/x86/nx_huge_pages_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
index 70950067b989..49b70c05daec 100644
--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
@@ -120,6 +120,7 @@ void run_test(int reclaim_period_ms, bool disable_nx_huge_pages,
 		} else {
 			TEST_ASSERT(r == -1 && errno == EPERM,
 				    "This process should not have permission to disable NX huge pages");
+			kvm_vm_free(vm);
 			return;
 		}
 	}
-- 
2.54.0


