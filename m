Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE34C2241
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545555; cv=none; b=cDi/6ayBzRT0ayja40UgJBYP6dYcGCooOyfjB5HHsA6IS1FEPATVqnCnDZqo3Q73NUV0Ll1N4eWx4BoF+1x4Z0HhG9e7F2snqnhbDYeTyl23VLIuliR8gVCDjK+aPkLhGp2VK2YTsEDYpOH983xZbd1Br/m1/z3ghkjcZa5+nsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545555; c=relaxed/simple;
	bh=JOfTL5sJbEeKUPqnV8GkeCHd+99LXw7TYpKTV4o3L18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfE2KR9eMMxbupMZQVyCIbWfmVP0MZriZ+TGU0kUdTYNrVIhpOEccPqLwOgRR1592D4Zk4kprfFuWbgG/NlF7b9iOL/hY0SU2B5TpYIVQ6uXGn/pNxJWFKZk9i9c9C7kszeKIsphYrgcDSWpNtoTnkVg5/H5BJnCLZc/EygX1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/eXhsNR; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/eXhsNR"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-351f7a0b13bso1050112eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545540; x=1792150340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bMlxewub9p/T2xvh3MjzZ66gKld4I4neePTrZHO9Yw=;
        b=k/eXhsNR+usBjAXoyI5R3hSe/Tls1hLcb1FDLXE8BloAjRwR9NnUoowy4K0J4VaY+2
         IPRF1OHh048i2B2/zHyy39954hSnu+A3kkF0or0OgBdkM0uKwI55NE7bMBEpMKcfXhe7
         cmGrnX/2bKOTt1aSnJN8WvB9dFrf1iamKPwQyExe8oY3q+7kwg4ZpGSwj6sdsoASO7DT
         EmHK4dQTchqXroWSTorMQEm2sjx/tYbC2lvvBmNVIbUMhpLWhaSmKt6/w2vaCtwfiDoL
         wBcKmliggW4a54Ia3Fvbxj2fd/vhNmAWgk2yWuzwd+w/ybh/qjx7wEX1z8k9MmJQlLh1
         inSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545540; x=1792150340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bMlxewub9p/T2xvh3MjzZ66gKld4I4neePTrZHO9Yw=;
        b=h9q9UUBQv43fy2ZpCsk7/PRYLNZtpWNsXeCvVTeRl+X+IOuRYc3OxKBQ0JkP0FNohB
         IHUwM0UOmRGHjmhsWVKoTzmGkIZEmjuoXcfvnRPALtw51s6sl7NBQAb3FdmQLA9DwTkE
         j0FkyhwCQhRVsH7CgX55d6VNuojVpnnudRwLdmDYx/Vv+noiMd/sl/+s6WQgFKjs7X4v
         mhoyxK68lISJVRs9zLMMQI5TqKvyKkglop17dvw5U3e+YB74NrJ7vtMkmUaa3b5Epbq4
         WstnEdqs9zarClYdu6K7vYdbogwy8m1kQnh5p1hIOXWgTkl6+vrETGoxMHrmCawWJs4j
         rExA==
X-Forwarded-Encrypted: i=1; AKwUvBzD2OpjjG4EqUpECoDGhkdr/COl6JeFxBsG1DAdIaYnSh/gxHIRwRLOpVncFCDMKhyYzhF8QhpmHokMh9IJmxc=@vger.kernel.org
X-Gm-Message-State: AFuF++leCmrfX/QFzfTAH1s58sl/sFx73/pb848QBIf2IlT+FWB79uay
	b9lRPe3OP/PBjjE0XOEamsS//YVeYpSBjgsVObVIRumtc8F5/YZP86qM
X-Gm-Gg: AYBFou3wE+0y+NMxzEVYvfg5oQYxZVf5tX7D3qZupkoe6/dhJfZJ3kqf2iG6dD683/2
	FgO2XidcyXzjMXi0lBkl6P8wqqINlr/LePf151DTMzcV/tjV+8yHpaEkcjWNIfKReQK1QZzhXtX
	nZB+oPImuZ2VS/qtzbMRovDUgdkpRdcep83QedNOY+k/oDA9z5tbrZEoHmRb0hbI7JtamqXpO+S
	ytICBB7MQAAFygbnsN9WMLnYKs97Mzhnxj9uuGu5oB1/E+qF4Rh58kqnetQ3vc04MdvIeTsGIpx
	R2N/xLN+kB1fhq5g+CqcgxKzZtuTmKGNMq7DsCMhkEDk7Nt/iPEABz8i5uQZFcRWGshPA1EKcxi
	fCKuoH3JxZc+QZRRC+WbqNLGIpt9iBi2a6yThpdbhoD/YGECM41PJjJxGzHXvegdYH8iF2YzA7K
	1qRGvBH78XNr4/2PHQXzFGEqlQYuH+/82MsLA8FA/aOsPcrAT4ebxMeEULnVHbqPgMIe17LrBmm
	r2cqK2U
X-Received: by 2002:a05:7301:dd95:b0:353:58b7:b5fa with SMTP id 5a478bee46e88-3535f48136amr3132590eec.1.1791545539457;
        Fri, 09 Oct 2026 04:32:19 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm7529934eec.17.2026.10.09.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:32:19 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <iorlov@amazon.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: selftests: Fix ndata size check in test_mmio_during_vectoring
Date: Fri,  9 Oct 2026 11:30:17 +0000
Message-ID: <eef6bc34bdf7391c5d3eb4b1ba5e97819e22ae8f.1791542392.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mmio_during_vectoring() verifies that KVM reports the faulting GPA in
run->internal.data[3] when an emulated MMIO access occurs during event
vectoring.  kvm_prepare_event_vectoring_exit() always fills five entries
(info2, reason, info1, gpa, last_vmentry_cpu), i.e. internal.ndata is 5.

The test, however, checks "ndata != 4" before dereferencing data[3].  That
predicate does not actually validate the array size: it passes for ndata ==
3, where data[3] is out of bounds yet is read just below, and it spuriously
fails if ndata were ever exactly 4.  It only happens to work today because
KVM returns 5.

Assert the real expected size, ndata == 5, so that the subsequent data[3]
access is properly guarded and the test enforces the exit's contract.

Fixes: 62e41f6b4f36 ("KVM: selftests: Add test case for MMIO during vectoring on x86")
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..627ebc2ba024 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -606,7 +606,7 @@ static void test_mmio_during_vectoring(void)
 	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_INTERNAL_ERROR);
 	TEST_ASSERT(run->internal.suberror == KVM_INTERNAL_ERROR_DELIVERY_EV,
 		    "Unexpected suberror = %d", vcpu->run->internal.suberror);
-	TEST_ASSERT(run->internal.ndata != 4, "Unexpected internal error data array size = %d",
+	TEST_ASSERT(run->internal.ndata == 5, "Unexpected internal error data array size = %d",
 		    run->internal.ndata);
 
 	/* The reported GPA should be IDT base + offset of the GP vector */
-- 
2.43.0

