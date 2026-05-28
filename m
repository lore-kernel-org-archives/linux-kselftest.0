Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9791370D6B
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977487; cv=none; b=X427NbedXc0K55qXwoGfHfTWRx3xc/exRzoLFq7dy3ONWz/Sk1U85atH+vcNMrw3Ig3s7YEUL5UbHnb9JfYBLi/RiN636CZjCbQEXjVLC+10t+LDpxsXqAu5q/ThDcS3C6NIlJrfb1jess6ViwXjh+mu7yxSYFlj0FCrE6Yhfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977487; c=relaxed/simple;
	bh=8yW7u0NaUnOs3S0TV95C8l/QQjTZEIeeRcV2PpBhZ/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7sR3I/IKpzwU6M69cQL0+WPvqcdO7ndnVqMQNcoG62Y+VhqRssQzOigfmhOqp15luFo+VFeNly9prbfWR8cqBglVyrlv0LFwUPUJa4js1la9Hey6OvYRNX6qhqEepeTg1k9mYYXrvWmXWn71dQ4flIMATqQP8nDKtob8wZ4Ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk4veXiZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zk4veXiZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcceb394417so1571849766b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779977484; x=1780582284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3aVziPKj5NycIaj4MEaOwtQnoFKY4U5moNnftAA/xU=;
        b=Zk4veXiZYoyECGyJkSiFmW/NGFshP2oGvsUMuUvkcIuhoKLDG5HV81akMj7zZF0UMY
         r6rzeL1fD0ZQj1afW1iP8pc4RirtiaRpcsqDu9n5nh+YucgCs3fdKPWr3FwNcA33zt4P
         O5OABeAw42RXGZbnDusHhSmraqTVJ6uR2hWxF0EgAHHx1ha+6zDHS4g1Ii1uGSyC2Wrv
         Yoi844EemssUQJeUgbv/pM6T3FgC/G9t3xijtxBbULH8RcaVEQbAQWuvhFZ+Cuwlae6O
         k2+d0xOQ1s1BETkUlM8N3RxqrCHuksF5P6bo7r8AIw2sgkSi2432U70AssX+JCtwdI3L
         qBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977484; x=1780582284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3aVziPKj5NycIaj4MEaOwtQnoFKY4U5moNnftAA/xU=;
        b=SaAKfOe2GIgTDAYrILbaAZgr+t9n0kCvlA6ZHmI2DSq93e1MXBhiyu2TMENwjHXkyA
         BozW3pidlULZvRgJfplQ8lv1mlL/x5rs0FhvKWoRX7+r72cgEY88HqxYGLj1Um/pfWNO
         tn2Npk4WDApHQ1QyuOrqxrO/qb+7HLIpsyPf1KehXjO6RQpY+0eBXd8RB1cXeL/RiR3+
         YGtbtfbKrfvLlUDKbJ4eqN3Gpg78Th6ggP12fS7fv+P4JCDvjnXn9YkbMG8DZO/e7G6G
         qGJngKJiGeksAUXQ0UaoiclNo7eN7wFS/POkzE4VH8w8KlR+aF8kaErhfoFry1JX33gN
         EgOA==
X-Forwarded-Encrypted: i=1; AFNElJ/e6K962VskOWYsf7aQdWgtnP9tTRwzHUaOaZAaz9qm7ixJfdf+wkALCsB2+OuIMeA2xy/5a5da7/7e9+StJAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6/Jju2/dXlS89hQ3h4YB6sgBFo1yhAEyOIJpQhJIPMtqpV5H
	9bvhX436FY4Hno9CugpJ0QVzU7PnnCYbm2KPdbKZRPd8AhGY4OB9ey4l
X-Gm-Gg: Acq92OGTMRggK0vVijeQzZtS7jQmyR6nj/TMCt+ggxfhoaswx0cQa2OU4doGgrpfFTT
	M/pB3wBndwHStm05zISSoGbFEnjwfMCWTIltBun0aCerSucK3DNdj8YJ7weuRPR32LpHYrOOoos
	3x2DM8LPjKdr2A5cS2W3Gkr7iYWbhIPhds2z8x1bicTEu9Ac3KRAqo4bQdVIeyYjV426lb7f1Rh
	AXQ5Bc2iKwgNeT09Ysn0QlhgK95CxazSuUNQYMFh10fYpS2jHt50v6stobBjtRtWwfZyMa2tNyo
	a8CvLTJHBW0E61+ddVrN/qJgy+qpJ8jhKPT9yLwvZ/vzjHhwCJgIUXHyYltg+ppe1KIj+zqDGvG
	SGC1m3UxpwI0ki/QhmxOJ55CQ/9I4LGEglb5W1E5Q4o2Va6+Dp96nLxofKnubET8EzNe1ND1OD7
	hjq1n8Q6G/dZb5aZHGHUXTdcjQkcFbBWNj9QZbsYa8P1LQE/7+brsB7GXX+t5ze57n2fY6t0lH9
	pXsIfmg4EEIVXgi0PewxaKpsa1y+SW9R2SuAQ==
X-Received: by 2002:a17:906:845a:b0:bd3:5e5d:f895 with SMTP id a640c23a62f3a-bdd2aada464mr1171338566b.35.1779977483477;
        Thu, 28 May 2026 07:11:23 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc61de4c4sm737796466b.42.2026.05.28.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:11:23 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: shuah@kernel.org,
	dmatlack@google.com,
	vkuznets@redhat.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH v2] KVM: selftests: hyperv_tlb_flush: use swap() to swap PTEs
Date: Thu, 28 May 2026 16:10:59 +0200
Message-ID: <20260528141059.3337431-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ahg_bNoktd0XOKV8@google.com>
References: <ahg_bNoktd0XOKV8@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded swap with the swap() macro.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/include/linux/kernel.h                       | 4 ++++
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/include/linux/kernel.h b/tools/include/linux/kernel.h
index c8c18d3908a9..381e457960dc 100644
--- a/tools/include/linux/kernel.h
+++ b/tools/include/linux/kernel.h
@@ -46,6 +46,10 @@
 #define min_t(type, x, y)	min((type)x, (type)y)
 #define clamp(val, lo, hi)	min((typeof(val))max(val, lo), hi)
 
+#ifndef swap
+#define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+#endif
+
 #ifndef BUG_ON
 #ifdef NDEBUG
 #define BUG_ON(cond) do { if (cond) {} } while (0)
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index 15ee8b7bfc11..514d41f00714 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -131,14 +131,10 @@ static void set_expected_val(void *addr, u64 val, int vcpu_id)
 
 /*
  * Update PTEs swapping two test pages.
- * TODO: use swap()/xchg() when these are provided.
  */
 static void swap_two_test_pages(gpa_t pte_gva1, gpa_t pte_gva2)
 {
-	u64 tmp = *(u64 *)pte_gva1;
-
-	*(u64 *)pte_gva1 = *(u64 *)pte_gva2;
-	*(u64 *)pte_gva2 = tmp;
+	swap(*(u64 *)pte_gva1, *(u64 *)pte_gva2);
 }
 
 /*
-- 
2.54.0

