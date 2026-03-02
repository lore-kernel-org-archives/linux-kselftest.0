Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E45390205
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484726; cv=none; b=q1lsSw2FAyBZFL3gW/E4thj4BS33BvrpqRB+/v+kszCieO2ITZUzTUj6jbsWu90EZbEyt8Zs+zhG7da574NMgY/rBFI1flPYI/E5pAKpG9Y6gY7gPgU/taUcR1I4/AbdprXdzIfnC7omDAqprCMMXzkERxoFoQIznU1QWtXg/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484726; c=relaxed/simple;
	bh=YfGdZv0BYcJ0fGzfQ0hp+nngzF4RNGVHPtz3lm0ClMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udQ3vqYbvhVBArcIUMlowraoDoayY/Ul+/9SvXZWwmzHM+Zk4+AGfYyCF7tFmxY/6u96OUzT5iD5cJOVNoA9tX213Dz6WMyDqRfihLiBozYiB1WXDih8/g+s4rl4mx8PjT4Qrx2pLTVC0csWkiwzfr3dFv4oBlNXboFfSbvHsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q12JfWtT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q12JfWtT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso43710305e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 12:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484723; x=1773089523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33QT3kr+fmJUaDM35+MgGGfp5T88w9F+n+7ZGHvWHSQ=;
        b=Q12JfWtT3v3Wy2F5W0U5RE6BSUGceaWbLZAp2rAYKoKyVuf9uNlIwT1J4lHNHYoKGV
         Km6nE2sG/gt+26CwQHhl3NGF6TMXQs/xCSD6NvMNw2qNDx4g7NMKGVNGxbFklTdBI94F
         2lOtFluJ5IMYW8KeBrbwZVOvNQ30xQsJHAnvIJuUZgIKFGzwRBAtAxGjTGE0atyLOD1d
         ZLBfJpYkL0zIw4JyvPWcSPVwlMa+sTNtSNJRhyNArlsvLscgNaja3Diyes7aj0LyueTv
         tS9vZhmllMWbBzWLk3NeAEwLFXtZiGUEj7Ss1eyjJ7utgXGXtpFrd08aRrG/Wzq1BZ+6
         qcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484723; x=1773089523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33QT3kr+fmJUaDM35+MgGGfp5T88w9F+n+7ZGHvWHSQ=;
        b=isgj2OHC5qN5POpT0Nf0N1QtzCqXyYWQdbaQURi25H1T0u1Ut9dRnE750lW74VPH3i
         11S8RNOEecd/UHoAT+Y1q78xWuMn8cZpdsm6MifzwO7U7a4TSAyhJvYsuDWs9cg/Wrr9
         i1B/InXhOB375uvWrjMfu0fgAPu5R0ZviRi7k7s/FMqwmL5roausW8DIgA0w5J37yYk4
         QqGvhRx7CxYeTc4MM4SkZ6Zi2UomqJOrzQ+pmtVT995WvxZSXizQmLPYEHYVxOsFWxNE
         sUloin0UpgBV5da3gqrUP82vKC1D4turR6EZbWrA4TQCPA/jBE4E05srMoibnKG0BP8H
         ZopQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNbhF/ufYTK4XnTdSo84krdtp5yqecz2PT7+j5DqV4E3nPmoohoY3Bzlaki8twHpyNWpFwp2g7S4z0O2JfRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhSYmDKz2QPr/TyqUF8cYfPTDVQTeqAOrRUhthOPj7mwbYJrP
	x99zfzdbTrXmFt2GuKh8Ju7muZ0PuK2ZekXEKkeM3rHBovKKpiIE9L88
X-Gm-Gg: ATEYQzy3gmtygRdtDuqZWDhGHrfM/HD9DqSK/Y7phj7VXbkUswh2CqO7ey9Bx0wr88u
	QTjJUV9e3YODb9rU+GuxKziysXUVIIqNREhYV0TJO6CfaQMVAHbBiFjaOOVJbGHk+yh+Dx335Cm
	lOduDOb/sYolGG45LcbGBy3qCrEpqBZVWQYiHiYMIjCKS8y3FcR05BaQoEfdadD/MApwkKkCJEL
	7QEoByjz/ankoEvOgv0sEP28bL+k/xIlR/5fQUNpS08bHpGv5EYXYQrpDChs0uzU87ngWNM9/eB
	O0N2NqgOZlbkqpPNzmEin2xUhngXkeGhEV8uRGA107k6kxyfciMzkYG4ofLCyi3/tRG8aVMxcvr
	OOQK57MU8dC0T2nRyKwkXu8HTlQ+nE0QwVaHSxlyymwXLt6REIvqZtLFZ9GjGCu6ix2ABUja6O8
	rO2w5l6RMUGFa9AjxhxqQfvMiD91CoO/4=
X-Received: by 2002:a05:600c:3b22:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483c9c2d29amr219756735e9.30.1772484723262;
        Mon, 02 Mar 2026 12:52:03 -0800 (PST)
Received: from [127.0.1.1] ([2a01:4b00:f03c:ba00:3081:348a:50c4:2d80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126705e5sm898705e9.5.2026.03.02.12.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 12:52:02 -0800 (PST)
From: Jamie Hill-Daniel <clubby789@gmail.com>
X-Google-Original-From: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Date: Mon, 02 Mar 2026 20:51:52 +0000
Subject: [PATCH 2/2] selftest: seccomp: Adjust test for using both `STRICT`
 and `FILTER`
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-seccomp-combined-v1-2-c0cb7acb0f97@hill-daniel.co.uk>
References: <20260302-seccomp-combined-v1-0-c0cb7acb0f97@hill-daniel.co.uk>
In-Reply-To: <20260302-seccomp-combined-v1-0-c0cb7acb0f97@hill-daniel.co.uk>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772484719; l=1026;
 i=jamie@hill-daniel.co.uk; s=20260302; h=from:subject:message-id;
 bh=YfGdZv0BYcJ0fGzfQ0hp+nngzF4RNGVHPtz3lm0ClMI=;
 b=1VtSq+i+Ji39cqfhNb37ik+b9kgFWrxGOhMQinjaw2UiJ15WX+qwAGSFORSZYYme2KCGW7kjg
 Lj8s5IVIimODE4g3jrzC7UnqzIpxiz+e4ZOSH29iceRRtT2QbgDMBGz
X-Developer-Key: i=jamie@hill-daniel.co.uk; a=ed25519;
 pk=ovqCXSlFUjrT82WuRtIuXB13U5n1yfxM6o0M5O5J2tA=

This test previously tested that applying `STRICT` after `FILTER` is
impossible - update it to test that it is now possible.

Signed-off-by: Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 874f17763536..ba042828dcbd 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -516,7 +516,7 @@ TEST(filter_chain_limits)
 	}
 }
 
-TEST(mode_filter_cannot_move_to_strict)
+TEST(mode_filter_combined)
 {
 	struct sock_filter filter[] = {
 		BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_ALLOW),
@@ -534,8 +534,7 @@ TEST(mode_filter_cannot_move_to_strict)
 	ASSERT_EQ(0, ret);
 
 	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_STRICT, NULL, 0, 0);
-	EXPECT_EQ(-1, ret);
-	EXPECT_EQ(EINVAL, errno);
+	ASSERT_EQ(0, ret);
 }
 
 

-- 
2.53.0

