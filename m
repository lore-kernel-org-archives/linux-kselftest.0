Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF512DCC01
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365148; cv=none; b=UMwDDs7TY9ckoYbLXVX1BDvO165vazBSmwB/0dwoZgBcLSmNQis6y3yTrS9YMseYGICf+P++KRPvsYMXLMB+/GvX96XXAWqqKsQlDMqAJT2ozTgZc8XwfZaPsz0YJUo3R4pQRqeUhApDbr5KJKysd43i/6mivGMZMqtGp5x11ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365148; c=relaxed/simple;
	bh=7m9TSkIprBQnO5SnKEMtRqur5OBCaZU7a+82O7NNe8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DtpzaKjLeP25b3J5Smk0u/yH7CNr3vVxAG6iXwUzcz2vQ9NU689HFJPWAhtjOcu3+bA19qmdJbQNtcijVQbzwiEY1FJkKbUe0OKwi1DR+zpQ5OO0acUf5dySMRmyRQOAmvmmkqw1KOBlyHlRyXEZdjshse/h9/8enUvQiOqBn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI16++ZH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI16++ZH"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-676fec7e946so9127950a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777365144; x=1777969944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+jLeOsk7xNnSzOzCqVVJFK8K7hUB/KB4pNNUZN70BM=;
        b=DI16++ZHqDSVFE7ldw6cfr/ixcDGYqvKWZClvJJLu70ZZXmbywp6VK1QRHJVm9FDv6
         XNjTS8WRLhEh6U1ZQo9tw9H5DaUhALpb/xfqKbC1rDZ87SuAPMj2dxPoXGc2TimlroFG
         6DAmCc9zb0awDrKiYMftkLNJXMyzkndF8o6F2HdbWapY92ZqWdYndloXBqA3jckfXKlE
         ccjRRgURYx9PI17CLRO7B/+L8hsQy5Sd+fswYcZVwsn4Ph9LVOI+zOMSshoKJR3fNa2g
         RcazcAqjl/TiH0m45R+IURwOimZJ4e016wPtJ6lKF0CZJ5i+jXl7zBwUtxlQ9rrYWYPe
         ko1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365144; x=1777969944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+jLeOsk7xNnSzOzCqVVJFK8K7hUB/KB4pNNUZN70BM=;
        b=GQRU93TNmHk5YFtWlyoQ/hv8FARcqi/WWS9ppTfm+vZ6zHRVTmTGiaRuH9UB6N+cTF
         y5XtYokEncUa38PKh//Twd66/x+sdomIpvrzj6+61WjL/cAovAHpqArreuxhYcNGE8Kp
         tk5Pu8psxhTyKcCdjf48/uTiXpFxjMZIp3dzHBpK6sesi1JblarlawjSsC/dvoAPp52W
         j+FpmvVVbmbNeYdYL5oz7GEttAeUO7PCi5vUtdd/47DQH9L88UDS63lyyUF3HagWnix3
         ekFith2S19fcisn9j582BASYstu020ZibJijAtA4QBydqV2OyDblXCOTUNJklVpmW0AD
         BHdw==
X-Forwarded-Encrypted: i=1; AFNElJ84wFPXz3bs6IfXx1OmDEWXWjkLhvcGtmp20/OEMmM6KyDxgsZ+xiKzm6XJ1MKuhGn4SyJhhZoV0LCjTcnfO74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPS3p+bn86/WYrSUyc3FISfmp20ynC7gCNetnDndRPbrpz9G3Z
	jvgIaayMf3WgZAsv5Y/pETid8N4nAA6g3nKLoTwqNGxwMTyknLoP336p
X-Gm-Gg: AeBDieth5EU3S0SJW2e5BUHI76capPm6lInnloDcMf3P8EwSJzEWtDuNcoKwyK4cU+J
	Nq04oBUE9min2NTFfBrfjJQK4Ssp4dv/BBs+7Vu+mpHg/JeKgxofUFXPHgbFpZdUfqBmMGv4gDq
	RNwpEz5Z12ye5cPjNKgeAN98S5b+XPGzMxEAs0ANZYWa0Ksd3yLQAb26LTB6khEAVnQXM8kOc6J
	WF95VBu88P7BUhQjNd6Bz+EcWsHEO/d9Bo38EP+3ij1U/BM14zNCVgm1TIeDjsQrV6n6I/j8AbM
	J6CsfAdpjPgIqA74deixUDUkmhUSzjPnrQYi4MjhtlDPB/Z6eKTY9Pw1QIHpAaXpYXj285glKqR
	1XsLVeXSDexsKHypMT/YxaE2dge/A2IHHOrrjqaySQTcGnqAxnq763ICFNJx4VjKqmonnDsvBPX
	VtXlFZoAd/5/xDyx6z+NFkVydmEXOz5hYCyyxB1JuAoWHnDnQ+b52vF03wdHRdQU29blRzYi0ml
	23e94pQYq9dof8egn8UNB734/RYNh4B36FjDg==
X-Received: by 2002:a05:6402:1f46:b0:674:5b2c:d42c with SMTP id 4fb4d7f45d1cf-679bb04c1aemr866693a12.3.1777365143488;
        Tue, 28 Apr 2026 01:32:23 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67ccdc8sm456152a12.4.2026.04.28.01.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:32:22 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: shuah@kernel.org,
	vkuznets@redhat.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: Fix typo in comment in hyperv_features.c
Date: Tue, 28 Apr 2026 10:30:37 +0200
Message-ID: <20260428083037.1926902-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a comment: 'vailable' -> 'available'.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
index 130b9ce7e5dd..f943c748f9ff 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_features.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
@@ -457,7 +457,7 @@ static void guest_test_msrs_access(void)
 			msr->fault_expected = true;
 			break;
 		case 45:
-			/* MSR is vailable when CPUID feature bit is set */
+			/* MSR is available when CPUID feature bit is set */
 			if (!has_invtsc)
 				goto next_stage;
 			vcpu_set_cpuid_feature(vcpu, HV_ACCESS_TSC_INVARIANT);
-- 
2.53.0

