Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913134;
	b=0kyElK91vVM8aU0LpI+gsdgVCVSdhjoTNDLyGpabFyRzfuRsmw7P2OWzD4GZRYobBo/r
	 8S9D2D9o4bm7mTEVCKDYP3duLfHMDKsR4LBuz5LsKtUqFEf2WQFha3byfWWraJYplCdYV
	 zrMtLW1jGijh0JTIilGKHe2orjBJz9VAwomTJ7pqtVczc3/K9rNYhyqRZ6CmV9ye4eqRR
	 RtMVlL0cG10lRLbdyjJImM0f068OrgbMRsMkR86Bwu1v4Djdh5BnemJWs7yZ33oNCy+Dd
	 C7vvY8rTsLiz84OW+tjNA/Zokw1QstQ/qAzEL48Nw4Yb7hKLgEOMm+tP06VGuFSqvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
	b=wbwQeKry3s/1kLgPkQxUFItcr7qQ1QRdE8LI5n+biPUETifQMJ0y0TB6nRZFF1bIWy14
	 vPkzkHk2ItE5WjtPNMJGIaoT6VL8NJoaRjgidHV8+QEhMQyxYyycDuslvhipD7BAVkWt+
	 kO+/AO1sWdWV4UBT6yQo7OTrpKh4LZ9HGFJOJkEbpLzU1qIdcRh0K5H0ragVIRQ34NWjx
	 SSQvk5ebLePn44f5oA71ERjflnTjLn9Rl+XelGkHragnX6XyjZ5eoHjIW23esy24NXHjM
	 Cr58Mi5bTUqh2tp8NITp2G+61vk3nW34NUHBRx2/lCNqq+P50mRj+y0krafkvpzBFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4JDxf5L;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C23606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 21:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4JDxf5L
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4923176309dso11240f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 13:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913132; x=1794517932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
        b=q4JDxf5L2LWswqnHpLm48eiDUPJNMr/N0W/sKzOggrPXzmqsWZuyGk8M4vXlBZiTG+
         folBIb6R9Cd+pczRgv8NWmer+NbzJqFXAZJ/5C0u4dyU9LLeosGLfHsPqjfY6eOCL3fz
         0pbCqzD/8dZa1P4mmZtCtasFx4i9XKNDC0c0N+BBgrwm4ePD3fqlNPF8zmUZhVVYzpiy
         KODGnoEjdHyVZYhBV4SDSpTXI5X0oZjTEQ6bIb4IcsxdupDGOOBWVNg2Aa6uMtXuPtZN
         WdETnZx/QKZeMrDJix+h9WWpweOMPRgVKJAedT4D1dGJoRjPwI/9drf3gwwXH8x8qKZp
         ROzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913132; x=1794517932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el8UefO7rpr/wOf0GvsC+VQdx4hFeG+XXR6vxfOLdeE=;
        b=mhUF+okh1I0NEZGA2gP1GvcyNKCcYoZm3grUIBq/exOJ7LdE/S/t12x2c3XsC/m0no
         QC3vLLby2uDjkQOdvqBdx4UggI2UEY9WofGq5QKyM67ymidiaFULUlnE4n0gPROqQK2P
         UnRg9Ey2O7xbiKT8WlkkxJLlmMpEmIvpjIqj6Tn8KQNP7y1KI516m1VU9Svkt1YYwqBk
         1NEYBvmDZkl8yGSYgkrjKfPTKQgbAJ6ZTRROqxA2ian0NJGf0zk9CeeE4zfs98tu2zeH
         k1e5vwAArqybuEq6bw8LnOe7coIBPdi+4BdpyMp1Tc4pDOVX7bGGxEEoJqVefrS+rrL7
         gfwg==
X-Forwarded-Encrypted: i=1; AKwUvBy59QhbROHSpQkLlGugtbjMrIUsmxjZfFwnoBofl55wn1RXC2pRl4T934iQIZ+Mo81S31qwHHl7KAOagNyOSFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+roikmi+qMIot5SevGbUglBjmsaG9M0F5ino/XeQIjlBazSpE
	Nh8biPNsd8tuyGc4qJdZQ28SBWfKX8OMQXx0nAlq6VkW2+3b1Ez4tta1
X-Gm-Gg: AYBFou19p/QGgdJRQugw0SsorzV+7tvOXDnAkxeBkcB481I6M8xRnVZDIX6yS9rFq9r
	uEFg/jlyPPldZpAHiV7LE+ocxJke21otPDl0V+VtHDLX21i5f+p4lR3f7in17+ySxRXj5W6SCnF
	XU+xqV6ylUJf9mcwA1v0DS2qDN5onYZDb4CHEk6dw3wS9pqo0K6k36EBh7Rx+A8l2CyDHY2fl39
	5pul51TozMBwJXE/3HiN7kKFTQj9BSxADebXeHnY+m66tfdN6TkKnAntdUgQSVaDplhnP5qF4KS
	bjTDh+D7rcUMO/uGkbQHRioqOJoepPk/QPuYlLoMM9DI2AWoZXiARAFfYUMZrkl33PeJEPQNkax
	LsjCrSLWUHLjaRcbfmVmj7VJd66pp3ieLwGS/WwjfkVNc4usiHDoJTjQzqzxGx5JCWxVD5QFuco
	fBuGtA8FcO8Tj5+ggfxsy9nRjKLkCJ2SRXrH+SsD3rrIBrODRqPyAAph/MZPo81tlbdP61PxHKk
	05JkY/QTUX2ClHQ8tzkGqPooWaYS6wFuJeSNU8FGyWLnUJoG9Gd5M+l2kJTVrg38kJWyrD5xw8w
	UZybHBCq2u/o9M0/CDnXSpsVFEqJhYJMGUgAarU=
X-Received: by 2002:a05:6000:184e:b0:490:5327:7670 with SMTP id ffacd0b85a97d-49274bc834bmr1865777f8f.10.1793913131990;
        Thu, 05 Nov 2026 13:12:11 -0800 (PST)
Received: from fedora ([109.76.85.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm12408979f8f.40.2026.11.05.13.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:12:11 -0800 (PST)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: kees@kernel.org,
	shuah@kernel.org
Cc: x86@kernel.org,
	eyal.birger@gmail.com,
	jolsa@kernel.org,
	mhiramat@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Dolan <paul.dolan.dev@gmail.com>
Subject: [PATCH] selftests: reject malformed uprobe sysfs values
Date: Thu,  5 Nov 2026 21:11:50 +0000
Message-ID: <20261105211150.9964-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The uprobe helpers in the seccomp and x86 selftests parse integer values
from sysfs with fscanf(). A matching failure returns zero and does not
necessarily set errno, so malformed input can be returned as a valid
zero value.

Both callers treat non-negative values as successful parses, allowing
the failure to propagate as valid uprobe configuration.

Return -EINVAL for matching failures while preserving the existing
handling for successful parses and EOF.

Fixes: c2debdb8544f ("selftests/seccomp: validate uretprobe syscall passes through seccomp")
Fixes: 29edd8b003db ("selftests/x86: Add return uprobe shadow stack test")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c   | 3 +++
 tools/testing/selftests/x86/test_shadow_stack.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66bb53bad93b..5671890f0b13 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -5752,6 +5752,9 @@ static int parse_uint_from_file(const char *file, const char *fmt)
 	if (f) {
 		err = fscanf(f, fmt, &ret);
 		fclose(f);
+
+		if (!err)
+			err = -EINVAL;
 	}
 	return err == 1 ? ret : err;
 }
diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..ab1232fbe523 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -748,7 +748,7 @@ static int parse_uint_from_file(const char *file, const char *fmt)
 	}
 	err = fscanf(f, fmt, &ret);
 	if (err != 1) {
-		err = err == EOF ? -EIO : -errno;
+		err = err == EOF ? -EIO : -EINVAL;
 		printf("failed to parse '%s': %d\n", file, err);
 		fclose(f);
 		return err;
-- 
2.56.0

