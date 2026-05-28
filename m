Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6663FB7DC
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982818; cv=none; b=q1Iktrkn7t8CTVOj8zh1W61RYf3z9xOWYu9r3FvWefMOlfRWdpBT9eDTA/m+cZrL8R/VWKcz/W/wXrjKuJm0TeTLDDc64GWFQPXXE61TuiOt07QktokcEms5b6/6wy9yNqpjYLv19yrdAwFkEFWdETfpXAyu9I9rpoTlFakmenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982818; c=relaxed/simple;
	bh=40hTyHTWmWVmnUmkNo8LP8bjo25L69ajUABKztAUmTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSdhYYUCsrp6+n4HeJeJ4r+z9OThqCQ/wpue7SQTvmQrQ3pKab/0YFK6zB5T25enObzypvC/kNrJbcSb6WvbazWcjT0ZdolOl1OzoUZgrA6dWWC+AR2o7QpdA42c76KkFY9vbXmV0SRZJ87Ml3jygsJc7jhLicqxFp+POrPh8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RznfZj3c; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RznfZj3c"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso2233243066b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779982815; x=1780587615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C03LW7quzGbsenmPANy3Ar0KIVx7KQzxzMMVRcyqs4Y=;
        b=RznfZj3c0K3lD2J00TBCF0OtUm6fcHDIwtuw+xVbF2FeuVLQyuJziax/4o0UgANjl7
         3UYokrosAVH6NGNrL8fiCkzzvWjvVHk5TfwCOndcxH7NucaawWFFL5nzRY3dPkSshAnV
         behOh0UNSyTBDbT4Er+k20t3vyrOXKLNfK2KLjUWiLns7H66jNUNMq5NjzNPx7zmFNz0
         D8xICqz99geRoCYYyJkjZ6x7FV12OP2PJHz+aH8zKY+BP4rTUY2MATdAUpPP+03y7a1A
         7i57hR62VmQJ7jBsBZ2ZjMt5IjNA2XCZ99fGTTKg9l9KxShe9gmn36zS1EV+YEBKiXq8
         eUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982815; x=1780587615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C03LW7quzGbsenmPANy3Ar0KIVx7KQzxzMMVRcyqs4Y=;
        b=aT2OrWsjNG6hURApN/WeVJimQDcWcF9gGyVe3w2vcchMHxZ6ZjRSCk8cXg+2wy4V91
         53fiyiObGHWL2b9AA5rQXK9Jnzh8gvtjqm19770B3i0UKFiFfoU4ufb6aTgbdsmk2mkQ
         ttMZ+w7xD1lHFcGi9uuWzwFsoA3FoSpZQx7vEZig7b/Lrzb9v3289Lr00/OttBQrFaSS
         LeslAoudRvaEmH/SYG8tUp9BGcGLlVc26wIqjcM+wvxywA1W0rZpZC5Ic1G2J+d8/Y8K
         mL8f6Eez0BpuEVCo95w0pxMszwtSh6Zx6wKcZZ9OEnOZriCokmDwKh3X5VL1UAnN9WYH
         cn5w==
X-Forwarded-Encrypted: i=1; AFNElJ9QBsNiLhv3Pp01M1k5htVa9kBQr41JnIjFKTC7J5UqclfqtqcjMYKBmy3yPw+9kUTpA/O5ySZNBEI3F7jg59M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAV11OMObNqVsAfKu1Pk3stsWTaMdoEPg65UKW2nV+d+zSnwM5
	YFrwM2JNct1I1ehdK5LA03ASdg7uuXKsgPgKdD+3V8BAaS2Jelv9Hje+
X-Gm-Gg: Acq92OH3MHEIqTc41gWqOXiqGkg2AlwHztaZaajgfLgQQxj2oD4NnOKiOBu31cb2Vdd
	2X+xmLMjbrqlSxsb/m9ojzPPKN6gVaSbtozc66mTzEprPtwc9PngIN1gtSxyze/3WAL2roPT3TP
	rJeEJijXZG465y05RE9gh1YPOh0HhMfPkj/7Q+AnXU3L7mD2SKlaxes+Pa9wqsXo5hPJmBvRwtX
	QLC+Cu1KKw+KYjKkAsISZTYlO83Ka0ekxLjdM0hmiXaYfDXqugx+dXUB2c+2khdTa79ADl5n6TV
	qyKIfIxjP7RvNMfDiF4ZKsJG7iYN4fn17oJTImS0gVrr9+BO2gMXGCL6extkA/+AM3ffbZmFs1I
	I/nsjnm6W1hGZ7D0rzoi4yTbz/mTeG1S/LJk9GAap5PWky0DEjPCrtVfpJXTDmAf2IZ+beMysbn
	Zs1joyc7p1UZlO1g3ebzzlMVnF7/RogigxKIBj04LWtNSQ5eFi6tROSA/AmxafKbSJi/ZBfgHd3
	EpyrKCS5isIZn7p7HHM8EzD9eWY4UmPgrn33w==
X-Received: by 2002:a17:907:b14:b0:bd8:1c88:cfef with SMTP id a640c23a62f3a-bdd2293182amr1257782766b.5.1779982814886;
        Thu, 28 May 2026 08:40:14 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc69d716dsm736438766b.62.2026.05.28.08.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:40:14 -0700 (PDT)
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
Date: Thu, 28 May 2026 17:35:25 +0200
Message-ID: <20260528154003.3594107-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ahg_bNoktd0XOKV8@google.com>
References: <ahg_bNoktd0XOKV8@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the open-coded swap with the swap() macro.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
tools/include/linux/kernel.h breaks perf — swap is used there as a
function pointer call. Using tools/testing/selftests/kselftest.h instead.

 tools/testing/selftests/kselftest.h                | 4 ++++
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 60838b61a2da..7f53751523d8 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -64,6 +64,10 @@
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 #endif
 
+#ifndef swap
+#define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+#endif
+
 #if defined(__i386__) || defined(__x86_64__) /* arch */
 /*
  * gcc cpuid.h provides __cpuid_count() since v4.4.
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

