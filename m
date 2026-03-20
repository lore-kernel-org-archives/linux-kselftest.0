Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D83E8C7B
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031375; cv=none; b=geuvSGNHzsYLTgdHCQXJm7EVT5U+pBS80I6vAXgblkoUN+z9WnWbhiWeDXNuAZSBADfq5XkikdLBsHz2u9VjwG/TX6R8OUgWX76j62qbDcVC5WYvXIDqItnQGNuip+CSAmzjBlxjeXYb02DZxQMDvbzzhy1erJ4SbGVwhxJopXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031375; c=relaxed/simple;
	bh=tXWGkwhgquIn57bRcfY0zSa2j1/v2U/tdifPvDKMAc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6erejA3Z7WrmL0HeRDi23q0pFwnUFZJwQdTngIDKHFL63F53Za1S/La656cosu1zXOQzdJXHZN9+4m4eh/zMLb3fE1UHrjKglI1X6gPVwZXaeNTz3FspNdxSsUv9IpniskJCHD+a40bSiKNkoLBHgM7jyvYncwyLnJb5WLyb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UT2nVkIk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UT2nVkIk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso7504825e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031372; x=1774636172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC90UT3UXKX/61fwzTSQoR9d3mFYuKw4rQp4Oi/BaDw=;
        b=UT2nVkIkgaXmjzOpkqX4brTfJSeXpy3y2TCkrioy26r0bd9CSWgbgR+Z0qtsHtjw3Z
         jLL3lB0I2N5CzixKg8GvnVgv9p9TmNvJyOYGZGoVDYaiR7AypJu7XXtdtXLnKv34Zqz+
         ykqHTf3kIYeDbt+ulIx4JAbGXNFR8zaRD52shdAJqVshULpwp97FpX6gMtAHyt8A6N73
         MJjhdzqxUNoT/fbjKTecQ+TRN7ue0bRx1PeT733vV27tWuxKWrULuWUjE6cGmdZMwLyo
         VjXjRQtooAXXKU+k9pmOv45HF/9F97BuMHahhafADNC/YATVk/G8lHHHjVTrOwrLKYC4
         W3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031372; x=1774636172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HC90UT3UXKX/61fwzTSQoR9d3mFYuKw4rQp4Oi/BaDw=;
        b=E9YROVG4kzuW3f61OaOZxLD7763zpOk0wwOOoDBUtEFxsua6vRnOpcr6O9LZinch0K
         Wgv6sPgypFb18hP9Ifnkl6TzGKob6dCXcOqjW4XClun9sRg5uNyzBjjArTMragLGp+Ph
         1i/dsEmOCQpXaj0fx0VmPBpJx6ydpeHo1gEQ+x/Yi2vK+AZL+yfIlPHf7DKscKW37Y38
         qUpI4R7jdTxnIbE0QdgxL2npu11TKzHIcyCKNdcYUGrvUkf4t1qcySktkPj+/NuAnCEf
         ZIXyqmetwM06GSwaYCrMipYsb4jn7ChxWLxl2R7j+QJZR2S6nu2OaGp/AVZ0Sz3vPKUi
         UhIA==
X-Gm-Message-State: AOJu0YwShkj5fqg3KDjBGvHkMXv3kHPXWY1Ea3Q3W0eCRidDOJkkyjPd
	vlIdsmQ+EsnSpaUDoUu0e64SAlyABQ62aPz9D4eNGE5drnm4KZdvErM8M2ZBEQn8dIDXWfgq8Fn
	xvgVb
X-Gm-Gg: ATEYQzwExvn2gevn8A54K6miATURLSlH79Lox/BDKpWyCWsKrveUNI2uckP38cTxW85
	Xakt2nDTSE0yo96WP0lAvX04g2gDa3iVDvIIFNeUL4DUpBex1n81DqNeLOl3bKb2VvCSjfwIV3P
	MUbbOzVmoIN2BOpHYGQXlkroVk7PrMgko0XgiNTds7XY26dmL+pgTVLTKf/KkGyYIUL+Ld+xWBr
	rXOlACo7LSrEQnidZnvljo/V6BNXCirp8rUaqHXRchQZKwlEJtHJw4jkn82Ejyh3v7J62sSOy1k
	GhGgSAGY3xp5ufVzxOZcrouAaYxlC4edEXk+dv46tX+kowGpGfc0V+DXW3PbwbvS4L9mY0548jg
	HKbahpURqWEUv1bj9oDBjX//W/p2MUWiNLZ7fJzupOxJmnx6ubY7uxYDUA0HkQGrnG/fpYh8238
	x/j6mWPhfFqw==
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr55939155e9.12.1774031372170;
        Fri, 20 Mar 2026 11:29:32 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm19938947b3.12.2026.03.20.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:17 -0300
Subject: [PATCH 2/6] selftests/run_kselftest.sh: Add missing quotes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-2-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1640;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=tXWGkwhgquIn57bRcfY0zSa2j1/v2U/tdifPvDKMAc4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMgR/nHHbQqPFV50lY6EDBugs2wrA3LVFot5EV/HSj5tR/v2RlXzJt0URKaYUFq59vfUl8BeZvn
 wmkuL9/6U0ws=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Fix the following shellcheck warning:

Double quote to prevent globbing and word splitting. [SC2086]

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 9abea79018d7..b782b025d002 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -11,7 +11,7 @@ else
         BASE_DIR=$(readlink -f $(dirname $0))
 fi
 
-cd $BASE_DIR
+cd "$BASE_DIR"
 TESTS="$BASE_DIR"/kselftest-list.txt
 if [ ! -r "$TESTS" ] ; then
 	echo "$0: Could not find list of tests to run ($TESTS)" >&2
@@ -38,7 +38,7 @@ Usage: $0 [OPTIONS]
   -h | --help			Show this usage info
   -o | --override-timeout	Number of seconds after which we timeout
 EOF
-	exit $1
+	exit "$1"
 }
 
 COLLECTIONS=""
@@ -51,7 +51,7 @@ while true; do
 	case "$1" in
 		-s | --summary)
 			logfile="$BASE_DIR"/output.log
-			cat /dev/null > $logfile
+			cat /dev/null > "$logfile"
 			shift ;;
 		-p | --per-test-log)
 			per_test_logging=1
@@ -127,7 +127,7 @@ collections=$(echo "$available" | cut -d: -f1 | sort | uniq)
 for collection in $collections ; do
 	[ -w /dev/kmsg ] && echo "kselftest: Running tests in $collection" >> /dev/kmsg
 	tests=$(echo "$available" | grep "^$collection:" | cut -d: -f2)
-	($dryrun cd "$collection" && $dryrun run_many $tests)
+	($dryrun cd "$collection" && $dryrun run_many "$tests")
 done
 
 failures="$(cat "$kselftest_failures_file")"

-- 
2.53.0

