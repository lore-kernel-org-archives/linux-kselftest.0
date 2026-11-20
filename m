Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182101;
	b=mjHa8+hijCpdlKTGf/tXhJMuAZNxTT12mESWmaIwftVTS+62nXxYMserf+QpZ85mAQiu
	 4sVGf8Z09N2Sv43OBSTe+NW3Afk9mEn5ZcKxHWmOYhziOtwwXWkYX8DYnmE0o7d1uamuJ
	 F+3GqENAX8tyg0mTcKKKp2SIamLUYG9yc7jzBIEoF5KC+mKuhCjay/7xWNysgpilfpP7B
	 ottquSvoVIcgLLCKDjNVyrG7PEZPqUt8v1vGDKgjsMq7i+zERoHBmrP+D3rtxcoxk1Mie
	 aEw0aUzJ0gSI176O59GTIwJ7WNwE3iGtCTxhwatcuhUOV3ygXxymdGit3y1wophoo+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
	b=kXzIYt0AyU1ETyUS8HVg0bteV+csMQ8cdGfXHGfP36NrMRjgzkLcvSIbnoy7buJi8BAO
	 7DwaLD4ocPpFWXW0cr/x8gg8jT5JW6yfd8BaoEiy5MBT9sSoOLi55rx0EecuIXmUaBwkU
	 CR41q/ab4YCBQhqKbxwRPE9kuSNB3jusQtBC4RvAsf+zRMrwULylxoPqg2BokAsZjlTxY
	 +w2vJNROt9UYA0bmtp7aKld00GKbGTz+xdjyRwNalFeXJTaLFMjQ6Sa1AyhQA0SUhE4Fz
	 6QbRmVDgN2m4FuKDTZRPso7inisPYy6U9PifrOMnGKeVkXTCPsCpWpQJZZmoSJ4qZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7tAhQf7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE860A260E
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57CE860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7tAhQf7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so4865695e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182099; x=1795786899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=d7tAhQf7QMlnUJOdtTPvwLiq66HI7OQ0A8PNsxbBu/euzqha75rPVRIvSvWUdGu580
         UoqNwhsUZuOrej98Xd/mCrM7iJ8KzmUOQD2/VFLzMnBKgnfxpzlQx2hgmLqEt/bZMRpV
         SeolZxTCgycYP69WDsrnvMYk5ixy6V86BGWylprizMvlT+rr4z058VaVl73VWJcQiYBG
         sTqahv0aB49BwskZ9HkIewAQz+9BabPDqsHZY87L3xNURHm1MEJGHzYH7SYzS4uNA1Lt
         iltdA1a9t9Lp94x/qGfUoYxPAYxd2Tc7N74T5QWuF6uOiYmIGlGVN2OxBGvr/BV2k+lx
         2qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182099; x=1795786899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=tnG2oA98DXdHCBfans/R2HRLSrvg/nEVYHlTdQzAT0xKucCydTovt1NTtqZ/aZzwGo
         y/3kckYnGrfplKFbcpKuHfLCiXefEHv3lXiDx1N1hegfYHTgiYbKZQUC9R+lWrfKdze4
         6K0eeO34jbnW0yWpE3SziEvUxpAFV9OLcIw3WUew1TnH2WiyAFjQRVzOlOdsqX/dyA9R
         N2sDWqu7hdcPhF/FgeVlNiyJJQwjAosvfxIgWiF929CCUpEOumnjcdKoarfiqFZl0XIL
         Bfeb33c/Orc68+yT9/TtAZMMmzIVKfbTY5mkNwyo34QNk7g0d6i0wbg7WXEZs3LP3bS+
         2R8w==
X-Forwarded-Encrypted: i=1; AL+hErE4OJq7Lbst2fzDeifG1v/RkzW8ZR9n/2I8FDx+PNCDxGs46qTC0n7dh5bp5+BaOlO6SvQYK1/gS3MPzMJWwVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rLwvin3YnOvOdpF7osD+uDsGhYNsq1WuOjduE5eDAye+SiypQ
	XxKcU0Z+cSSpHx+0YPi/k8XPw5tP2CzE0ri/qpKYkPL7g8yy6OeTEKQ=
X-Gm-Gg: AYBFou1rSJETgI817m8/zcOSOnk3rq9svPi+dBqmgwS9cestV/y4n6FrJj0h2gMxOET
	M9+D9fqf0D1+n0qjfyr9nGVPBRYCXnW99DTPjDFH/qPEZ0DJMdrhIZPH73rsg5g+S7g1yktsgef
	y6I1EpHhhBkDTEnmfXbeRaWY9pMjIaTNwQ7oommedO8un9L7umpIX8ATSbokEbfG1S+u3TEvw2u
	bXVVuq17nxuFirAsAtD4xfnYclRKAqhwy2WZeJvzsBYvGVL1WQ7MP07hoA+p4QbghPCjit2XGYm
	MijF/soMVOhKBaJJNpHkHglHE3Ys+EAgmQaqf/4L5ag5WA+RkgjRNU7jkOZBczfuUyEbwQObWG9
	FbAA2HkwSudfm4vN1eEiLj/mYGFVhTTGUsgxNZrN1aam2u+gBuI05AvrckapExSoapp60eUsSCR
	n6V4NR5V7/JSNjchzDGizbwpv+ztDJQx9W1LiYY9wn1lzNVhLR/5r7ZTx/WR6OaNRZD5f3JDKgG
	uMBozOLzW19ou2NpUc3zrwYs8bITbAi1TK/LtOu82KtG1zPI51JAWWusZEN4hInSsJHNy8/w2ja
	HMF0KxwDO5h2tBeJKgSTOOfCp623KQtdSwCj+No6gJhfHCIEHu76Ri43eyYdL1UHoetKrUuu4iF
	9th8w4NH096BprSXOs+/Y0XCKdeNjm8LH5SRKSNpJmOWmjlZauu7PTHRStxnl8lHTE1q24M4VF9
	s1aUtdXNYq+Ug6bK16+Niljcd2RvXGYbrHpDmg4foodRV09Aj/W/JxL2MQjmBlkAOHaxmWGlMry
	ch7
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr69150435e9.22.1795182098659;
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
Received: from archtop.localdomain (92-242-248-67.broadband.mtnet.hr. [92.242.248.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm186430835e9.4.2026.11.20.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] selftests/x86: sigframe_fpu_portability: fix TAP plan mismatches
Date: Fri, 20 Nov 2026 14:40:06 +0100
Message-ID: <20261120134006.4819-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.56.1
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

 The plan set to 2 with ksft_set_plan(), but check_avx_support()
 may call ksft_exit_skip() which leads to a TAP plan mismatch.
 Move the ksft_set_plan() call after the check is done.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 tools/testing/selftests/x86/sigframe_fpu_portability.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/testing/selftests/x86/sigframe_fpu_portability.c
index 8377de052032..f738895e5159 100644
--- a/tools/testing/selftests/x86/sigframe_fpu_portability.c
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -221,12 +221,13 @@ static void test_invalid_shrunk_xstate_size(void)
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	self_pid = getpid();
 
 	check_avx_support();
 
+	ksft_set_plan(2);
+
 	test_valid_shrunk_xstate_size();
 	test_invalid_shrunk_xstate_size();
 
-- 
2.56.1

