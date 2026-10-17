Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4F3DF007
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234989; cv=none; b=DAs+t40FzF+mJXdiOdSAd+AKtazB1MVdVOwX3PgzXAj7+biXU13i43zMchQICmIJQNRbwqfnrwoO2RFf1gBDEe38lVtJJcUlOW2FTXErhNQ4El2+veBRdGH2Vi23kepseA5r55xlP7hCF156wj2GpWlhoEXsRN9sQG1rfGSlbKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234989; c=relaxed/simple;
	bh=TLOEjtKkkyoqOjy0bb8E298VSARXyB4QATRkuXYijPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6VwlbgiKJzTvu96EJwGatk04i/fUhdkp1+BrFnfGztHRHxX9MwwKM5d43e5F7b36XAqkZIalG54EvQWRzG3I+30RS/tvDIGmmgvOyOguJC4RevBCYJzD0uegmLqLTaxp8YZlaXBDlNU75XHZUktDH8UbZn2V3MuASb6Mmqrtuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThytcYn5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThytcYn5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e86dce4510so2717135ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234988; x=1792839788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=ThytcYn5txu3H56QdvuVT+NSOD7MVxqo4kngLpbDOPh1loAOt+tj/wGXt+/QbO8hgd
         oA21WHYIxKqb36E2ELchuyWib2Z/DHvUuXXigKxIr8m9UOujHFq+eFSA5yLjL0Bo1sAQ
         BFe4YsvsSiHvxgmhJAFreGlE0BOUKMlmW58r1BpQACeI4l1FAwzpoMWZstoHoma/rMiK
         9wsZv41TW+S+iIBEwkE3UU4S3P1eIAcBUWsVxJioVY0sF8/IDjNh7izlY2fZMFSA46X+
         BNYbFw3nPZRhUqt0/3uYRJzayCH25qKTmNzPysIdlD1ggWIgr0HV+JZMvrnrPk5v8s/8
         I3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234988; x=1792839788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=ttJxbOj99pwEhDZPgsq4Bs/qPdjxjJQ6FaanD+bzC56uZCNzCnEqcag3PLinwVKQSZ
         KMFsVXWM1qjvLwr5EB9rTiv2w2yuVM7yk+q/k5kikDKSyOqLtxercaE8ZXyX9Sd88MCF
         mhTtJuZ/h8H1evU43nFWoFt88HBpNbE3Vd46Xj+4S8QIcX4mqIj+K92no/H2ET/8H9T4
         hC+d15aAsgTStsdcF7Xyjb++ytT53l3kGXN/dbcqtIhegl/Puqqc3irASV87fIxQvzza
         JOzR9LWKV01WBBI+DQatyh731ayaLgVaDhJkM15/3RfjuI6QUbKOEDe+oHXkAEobo70d
         0qWA==
X-Forwarded-Encrypted: i=1; AKwUvBx0DIO6/G1vlD2tsI7JMSIfp8/h3yvNmHRuCYH/oPIqktvWNHm9WYw+5Y4wOFkBB6RC4EE84xBLmVNVVh+0+LQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaJSf4iQZXinAPFMX3/kTjtPez0wM6ViOo9VD12+FjZXRoOYMc
	va/j5vo04dxfj+LtCo15oK/rOLWWEiHDQHCAk+LARiJ7ZDDjOdIwGGBe
X-Gm-Gg: AYBFou23sP/nkdGFQXAzl8t1cUixmWsrGXc9H6ojlii+d2vl8PjfNFuIeLIzp06IhXg
	dtifMof04UVFr97sK3vUDUWm5C1GWIbJJb7dgmkAUPANyqNJag6S8s2UWOdFjzzvQJ7BmmXFxwS
	ssqPXlf0hqwMeWyKasVq+pToujw0w3RQrWuWwgp7RibGVn0eFg+OVcl2g3nhTwivXI1lNhdaRrc
	rJxWYQMd9b3LqgmdxvXfPZzZzDs9X798JJzrcHB/IGhVBPiaQoAhfnG9DI2Yg+54Jrt0Fybpx+z
	89X5oQW9MwWTSADnP1bx1iNrCatd+rv74tvn+BfJiXRS/z8MwhWYB2h20nA3AOUIiCRhuztfsHN
	cYrGINPjFgEPElOl/dJpNGo9I0WdYR6I5YN63w3srDbfQ7IJlwU+hl8mGuY0lgMHpQSvYiOUMi7
	T6AF68HLGGX61r+xrK16IQrpDqlZGnGdUKcK6mU+S1Uzs27aEa729fLS5/3OvKcemtn4/iRSHGN
	3x6/QErd2bKKfaU63xCqA==
X-Received: by 2002:a17:902:e949:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2e9a6d3c1admr19606475ad.74.1792234988014;
        Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:07 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 3/5] KVM: selftests: Use the shared memslot base in memstress
Date: Sat, 17 Oct 2026 18:02:11 +0700
Message-ID: <20261017110213.46199-4-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define MEMSTRESS_MEM_SLOT_INDEX using TEST_MEM_SLOT_BASE so
memstress and its users follow the library's reserved-slot
convention.

The tests affected but require no change are:
	dirty_log_perf_test.c
	demand_paging_test.c
	access_tracking_perf_test.c
	memslot_modification_stress_test.c
	x86/dirty_log_page_splitting_test.c

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/include/memstress.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 0d1d6230cc05..4da03541e805 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -17,7 +17,7 @@
 
 #define DEFAULT_PER_VCPU_MEM_SIZE	(1 << 30) /* 1G */
 
-#define MEMSTRESS_MEM_SLOT_INDEX	1
+#define MEMSTRESS_MEM_SLOT_INDEX	TEST_MEM_SLOT_BASE
 
 struct memstress_vcpu_args {
 	gpa_t gpa;
-- 
2.53.0

