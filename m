Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630499;
	b=PSKZzcK/zk1oye2ok4j4KIaVn6yHt+IyqaA3Sf4FKYEZ1jqsqkIrnZD5c0hBtMrab5Ar
	 AFQyWxdXKghupTTLOtku13dHpwXIunPt8Z0G+RA/5I4T3JFILTkcaRaikEYKIKI2Csd2J
	 DsSMJm/sPzT91Wt97QXlEjkrx+hRMXPAT9GGziixevBBfvYZgp5iNVDobe1deOrjnC5Xn
	 /gkYclSLNm8/rG9w12J+t1iZIdKDAycV0y6PlKLgwNw2J6/C5VRjhfmNRjyZeMJGBjaxs
	 Y06B8z+XiEsoobp+wibJw1AgOc4Y1BT/ZWhyndJHvYmdDqHvQmzlEwegMbpkZKo/6ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
	b=N8eJA7OUZQcXU4dI8JFV9CYCaNbY/MUkKVFzxL4faij8eXKELlynqDfQpy0ZVJDrRtqJ
	 9TD5kTiX8xpl6rHBmaCRU9HDgOlN8Nj8LKvAX8QRf5TAtnxYxUei9MT+o425hkrcPm5T/
	 znIVIlwEtRV+OExJfk5tpw4j3niAdyBgzOTElyj4W5mTCyzFgiujgq8r+p4ljZJfjXLPA
	 pdvJLWLpSZ/Dk8V0LXZ7ef2gISN58yr3S604zF8xm/D9snb5rJf2zEoBjlXEhWYeI3Ssu
	 xvu7THN9chGQc7lHo8Of4HHz+B96V0+LnOIZpGJf+6cawBaoswRpjy4KFWzTraBGmgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvJHwPc+;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1C606A69E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA1C606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvJHwPc+
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4e2ec4b42so33246057b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630497; x=1796235297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
        b=RvJHwPc+GCKu0ylWVa983aWeTWX+6cXVnqfDIDTW3mNKE2Z97Ie6Q+FZzpa7hjz3eA
         gbwHrgikeBeA+KFr3Nh+Km0vaQUPK0R8jz2uFMGL+ctLvwUPFoes44BmlO2wqRoI3SfU
         yhw+IX+O9r1lZ1QHlu6LOdDgNoZ7d6FdOaDXCLw+RYhAL/UXLZzSUO9Cm45BCDs8hQuB
         Uv9MlVJuE8dy4Rx4VoxuNjGnD8NQZp2I3x30xVDQQe+2is1e4dshgRqsLh0/jQeO5d7t
         NNFkYietUWUQH0z0RfPbGl0FAKM+1Epp0ASe6AXhvYABmp7p5WG6doyGjDWZXU4HPqcF
         X6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630497; x=1796235297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
        b=JFAmormriLeLHHIQcV4LVlIhVXahXmQ6jlM5jR0TpBPTPI360yxjgfpQ1yl8dq/R3G
         ah00FE9yKruLwSAioUTpeyqITG11C1Z4WmI6POZgy5oOcsVOt70IdKUa+JhxbDaGeKie
         J8DUwSR81yX1BA8AkLtDMaKEHYyrub/rIPLIpCtXBwJnYuzei6rbYqidmGWVMg9i5gNx
         9KzCaBQ2gJt73gFFHrUjDoTnNP9KhhT0OEaBuakVWbXTyA1YQg5Jwul2z90dvOShZ83I
         ZJxZNJo2gm4Jskr4ZJDkhoDfqLFUKPZ4LfcKCQwiBPV0zXupp3Kyb6TS3ICX/hf11xA/
         jVJQ==
X-Forwarded-Encrypted: i=1; AL+hErHJyDT3qnrGue7Jt4nqJ8K66U0pyKkm4k9jHIB5AxzrfCJvdDZQ56CWA8FFG5A3QcLonslOi+S1YxnVGDai6Mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LNkVgkZFb8yhjx1cmgqa0r2fQQ9wpwnDAwzYsZUQExKZ/Gsm5
	YUNNN9iq0DDGC6bcdgiysjGdWrAAdiAsMOssGITs4HhjhoBymMXbSAY=
X-Gm-Gg: AZFdTZfx+OBnNb2Zm2M3HBIXvOpr60b/Ql6+PtpXVTCR3VJWucJVLCVoPRgbkonkwkL
	HliYhAnkDe13Cg0l6VuvqlWHMHScgETHDfDNfbDNitpYx5LOJdzkU7eJi6YagJINANpb/SOdOu4
	ZwRTZlKOcqbUxIxxf2Lfb/sS6NHhrayN1WOPDP0TRBIkH3f7vpxyAV21tshz+oU39qN/2WuPr9s
	XPH9lHGWHGcofMP39FMW3kFPaC6DFh7u7+TWaslE8BmqStGmygwqL+rl9HjvCQcFFpFlbwAJ4Fx
	KZ1wje23+bmEpHFj5PKyaz8oZyriPSdRLO9qHHyXW/6e1R5JZjjf+eE4diSjfqe+XZif0Kb2evT
	zocAD9UcKP3vzvP1TeO9HFoExEr8zbDwTCkb1btbqV2zF5qWP1k5b1PJgSQbv0qI4rky9mmdauc
	hlO0KTikO+nvxpIcmYYfHkZ4GtjSTPofowQD0pWC8Z8OSBIIhIwXGgXxNiPzCJLANzvYqLqkoAA
	tHlT1oHo18To6pMiEEoW1QofP0HLtHjeqOheaSyRsTOAG2QM1QE+raS4NAz1tRPd9pR0gZwVf5o
	eg7ff4zxRUOkIA==
X-Received: by 2002:a05:690c:4a05:b0:8b4:f721:fd62 with SMTP id 00721157ae682-8b5204e1c88mr74043277b3.48.1795630496886;
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] tools/nolibc: make atoi() and atol() skip whitespace and accept '+'
Date: Wed, 25 Nov 2026 12:14:53 -0600
Message-ID: <20261125181453.814976-4-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125181453.814976-1-svav2021@gmail.com>
References: <20261125181453.814976-1-svav2021@gmail.com>
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

The C standard defines atoi() and atol() as strtol() with a fixed base
of 10, which skips leading whitespace and accepts an optional '+' or
'-' sign. nolibc only handles '-', so atoi(" 12") and atoi("+5") both
return 0.

Skip leading whitespace, accept '+' and add test cases.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/stdlib.h                | 5 +++++
 tools/testing/selftests/nolibc/nolibc-test.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1c5a914c0f231..cccb8922bde7c 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -66,9 +66,14 @@ long atol(const char *s)
 	unsigned long d;
 	int neg = 0;
 
+	while (isspace(*s))
+		s++;
+
 	if (*s == '-') {
 		neg = 1;
 		s++;
+	} else if (*s == '+') {
+		s++;
 	}
 
 	while (1) {
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 971a7f48e016d..3062af07304a6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2097,6 +2097,12 @@ int run_stdlib(int min, int max)
 		CASE_TEST(limit_ptrdiff_min);       EXPECT_EQ(1, PTRDIFF_MIN, sizeof(long) == 8 ? (ptrdiff_t) 0x8000000000000000LL  : (ptrdiff_t) 0x80000000); break;
 		CASE_TEST(limit_ptrdiff_max);       EXPECT_EQ(1, PTRDIFF_MAX, sizeof(long) == 8 ? (ptrdiff_t) 0x7fffffffffffffffLL  : (ptrdiff_t) 0x7fffffff); break;
 		CASE_TEST(limit_size_max);          EXPECT_EQ(1, SIZE_MAX,    sizeof(long) == 8 ? (size_t)    0xffffffffffffffffULL : (size_t)    0xffffffffU); break;
+		CASE_TEST(atoi_simple);             EXPECT_EQ(1, atoi("35"), 35); break;
+		CASE_TEST(atoi_negative);           EXPECT_EQ(1, atoi("-35"), -35); break;
+		CASE_TEST(atoi_positive);           EXPECT_EQ(1, atoi("+35"), 35); break;
+		CASE_TEST(atoi_space);              EXPECT_EQ(1, atoi(" \t\n35"), 35); break;
+		CASE_TEST(atoi_space_negative);     EXPECT_EQ(1, atoi(" -35"), -35); break;
+		CASE_TEST(atol_space_positive);     EXPECT_EQ(1, atol(" +35"), 35L); break;
 		CASE_TEST(strtol_simple);           EXPECT_STRTOX(1, strtol, "35", 10, 35, -1, 0); break;
 		CASE_TEST(strtol_positive);         EXPECT_STRTOX(1, strtol, "+35", 10, 35, -1, 0); break;
 		CASE_TEST(strtol_negative);         EXPECT_STRTOX(1, strtol, "-35", 10, -35, -1, 0); break;
-- 
2.47.3

