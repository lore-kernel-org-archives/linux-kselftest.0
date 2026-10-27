Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101410;
	b=YRMczBjtSHaCS698GJ8mR2n0yuX5ciG2qO8vJUUQWdWBSROTKNAUcBihLDfbcn8Dubow
	 DG/StVU97eyLJZcmmKwR0WvAkdd7RNlUYhfU3hkQlG/VZk25j77xr7s4H/khOGHkcfVpp
	 oGLXnDtsjY2fN6sKfTynD9ADSENqB+ErukajaOEFukCwhdpLVAVQ/30plWqyGoqqT9u58
	 U3z8h7+2uwmZ9uqix5m+vYX/6brqZDEUoN2pYHqAVou2NGtPzmrc72p6NylyHfoHE7M8Q
	 mQCHkI1nTwEiY7/sKSCx4KpAcVKowj3b0shoLfdFBLj6GRHrH8Wfq+lKXcbR7nkQJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
	b=T+FvNC00d63vflq6N6jzBygyNtbIsUB64xH0Tm5xXshUGPaDEeKHAIdXxaKDz81JqTR6
	 HE6iaKLIWr+Rh88tTPCQUMdjw94uFJGEyLY6DctUm8ZmjhjQz7+RlATMOX9xdBYmB1VnM
	 432spiteJ3++dwNQEHPfY0yITtx22+OVBQeydUPH69/rlYjmNxJcZMs5J+8hVlexV5XvA
	 JEcfrzf4DVPdVI9TcmTzGlbvKnOZd10G/SuTs1Nd0tdOEJNzvJH0kY88ORy8R1ubstzYC
	 2Gt6WPs/B/7XM+ipp2H7bAuRx+z4W+zWkX6BZyIgha6sNuWKYAPV9GfDkqrNB7ppHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="iBOg8BS/";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AB606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 11:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iBOg8BS/
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e940d5d2beso15486085ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101409; x=1793706209; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=iBOg8BS/AfD0VOTVMWP3REB+11vPV7w0ToTM56EJrWZAxVXDxPmG2MqW8hvNvUbI+l
         YLBtKH1cr2sx6cgkWNqYFi3Vz8TZKPEM4+mP4lXO1mL58LsaQeFs/aZsyjGzeSlcZ0Lb
         r9YN/CYxzdAX9OSGZqJcz9kVZHtlPumWOo/gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101409; x=1793706209;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=1jufcrJrVCQEIkxX4a1/Kl2PIBVi+Lzn6d/RpjUMirofslTRqgXpBWVnzOZM42Btlk
         EXdkNeTFE8xmvpyLdf3S0zqtzGXqT4waWt8a0LqgC4IWOm7XMgxrZFwSth0Ea71N/cCH
         vPRS3NgdauG/EWp1oXbOvJIho2tagD21Xq4R7LjLJAxyMdEBUXvD0X6LH8neD6+yEq3K
         ywLeMLMFuWg9NxaCgf7Q42c5mcTdeHq+oq5Fr5wBku2JkYanQGFviX9tKGp+ZT8DUw4k
         VEzNeNh/2m2rzOFmCre/o8RAOiYw7pGjtEoaEECn7Ed1FRPyEVsdmMAMwXPmFwsxKbh0
         y1pA==
X-Forwarded-Encrypted: i=1; AKwUvBxy5YKi4y7wegMEOPnG/tKziALZX81Dh9sPojvmkwLV336B1LDyuDZ3VohFLP7fP9a4zCwoBQydWzCPZnL+8sE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZF8mcXe1oD/LGfSFtSlzgQiCUjOI9ifXWWOChmgvqMGgIZo2e
	MsrfzRCoAFbIoCymgD9/0RgMLjzPv9elKsndf1KOyBMVT0JiShcEKEZd+sOarVEPdQM=
X-Gm-Gg: AYBFou2aSYlKXkFNSAPNCBHMfM79Xqo/BuBYSv+cOs8CX2L3v676hwQy0rCnRWxodzt
	SXIUa00Zrrunb2G4WOwFxuG2+MNBZJKXpPF06HfM4zAe2r33vcylFD9qXg0glaL5+dKndbHiu20
	zCEC/Nta2zLMqUUId+U5+eObS8HwrANhhiPSxRy2OurbzmHl6BEExfwSCfkvhH+qy5v3PFsQ/W2
	UenlXzauIFuMa75A91LbRpIclf8afWQS+a+K/IsSkuUFUB2hGXB1jm4mhwvJBuZayi5frS9ox8l
	x/L2JWkscGp+49wUuliC+QhdTbqiJDTYk4O4xUbkAGSW/qrqg2qQ7dt4YnxpxZT5X46Sk8Fk7Q8
	hjbB6Q5XQpSASy08bkGSbTVdYv43LIR3IoKetKICQ2pvChbsodIrOa0qEUpWLSh8FioXjgNijtN
	zAjzrLxjPlD/y4Y1StiCOEuzTwgVh03Ix3MmjUNjB+WmtPhlsP+YzmUFopz7wFsmn8hzIoz4mtS
	DgHdzhlEN8IgTQaOd40pTgHgnDC5+dLNgT6pkyCcr3oL0wrqDuM+mMM+udYak1OzGPlsz+aFyQp
	0IS7WUGenNolPpPxnL04eSzER+vcppRRWZvRp29cl+yPAC7iiYEB9LriWx/YTSONzLPM0caxXga
	+5sGcWlVHzPPTPIOCBhj630I=
X-Received: by 2002:a17:90b:35c5:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3adeafb079amr6566975a91.34.1793101409391;
        Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adf8f3f22csm7120822a91.3.2026.10.27.04.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:43:28 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:43:25 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
index ea75ad537620..83b4fadfbfe7 100644
--- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/mman.h>
 #include <sys/utsname.h>
 #include <zlib.h>
 
@@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
 	EXPECT_EQ(expected, sealed);
 };
 
+static bool find_vdso(unsigned long *start, unsigned long *end)
+{
+	char line[MAX_LINE_LEN];
+	bool found = false;
+	FILE *maps;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps)
+		return false;
+
+	while (fgets(line, sizeof(line), maps)) {
+		if (strstr(line, "[vdso]") &&
+		    sscanf(line, "%lx-%lx", start, end) == 2) {
+			found = true;
+			break;
+		}
+	}
+
+	fclose(maps);
+	return found;
+}
+
+static int vdso_is_sealed(void)
+{
+	int sealed = -1;
+	FILE *maps;
+
+	maps = fopen("/proc/self/smaps", "r");
+	if (!maps)
+		return -1;
+	if (has_mapping("[vdso]", maps))
+		sealed = mapping_is_sealed(maps);
+	fclose(maps);
+	return sealed;
+}
+
+/*
+ * Unmapping or moving [vdso] must fail with EPERM when it is sealed. When it
+ * is not sealed, it succeeds and leaves glibc with a stale vdso pointer, which
+ * is fine because each test runs in its own forked child.
+ */
+TEST(vdso_munmap)
+{
+	int sealed;
+	unsigned long start, end;
+	int ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+
+	ret = munmap((void *)start, end - start);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vdso(&start, &end));
+}
+
+TEST(vdso_mremap)
+{
+	int sealed;
+	unsigned long start, end, size, new_start;
+	void *dst, *ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+	size = end - start;
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap((void *)start, size, size, MREMAP_MAYMOVE | MREMAP_FIXED,
+		     dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	ASSERT_TRUE(find_vdso(&new_start, &end));
+	EXPECT_EQ(sealed ? start : (unsigned long)dst, new_start);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

