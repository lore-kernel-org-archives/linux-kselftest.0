Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646571;
	b=XwzykIpO6v1GbTGMZabn2164HR9bNKFIS74g7ERoMOmxJS6KCJ7064RCUGF0+x/tj1UN
	 Sk24jNWRT6zzTR1c6Hx4zBjnAc2HnkMI2FPzgTMF161XaHDmYA4S2W84cCBX/V7rnlEPD
	 NNAJGzNZbrXjK/BelIo10kEESjoAQ096Txv8TQZPfgYKwoGqcI1xxHRTBM957yWLf+3N5
	 hJl/uKtMHnM4N1yh0Tq2na44GMLkBg5Z44QhB6SCzzMethGZCynQR3tLQOFJtU3+65p66
	 Q8ATQDyRQo8ENCflEbIU83VrO+viSa/FxNp31FtqOMy8CfTHQYKcGkl9VVxs1DCAupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=i0ib49ykkVTIXodpiuOe5mlbictVGMpVlOsQqgxbR10=;
	b=lqNAM6KMlG8kml7f5GiDSLtNhbgTjpLIXtQDujeE3Uc1onTzu2WfYvx09FUlgn9XkKSW
	 g52oGFyV9cKfnBMKJzlRKUtdlz9HfcDsk+HAfu4i0CI2g24l9nC4HPUB/oRzX+UKseC/b
	 c+mZqa3eKZFAO6BoOrETOhgxorUWTIsfI3OkTwcSbEFtx/8nb8zVPgDNpqLm2CcjVqcO/
	 0wQ7E807e+9ptdMj0YILP53M2d+OTtGwJDNE/ddbKPg857wKASRA+ALsA5J9Wbff6sy+9
	 mpEny8IpwPIFnb8RWRRhbuFp81ZXSBoLZP2BWzd+xksCwHV1WxV5L22FjswPg0r9PQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rM7fLbxE;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AD606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chihsheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rM7fLbxE
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso1058168b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 22:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792646569; x=1793251369; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0ib49ykkVTIXodpiuOe5mlbictVGMpVlOsQqgxbR10=;
        b=rM7fLbxEmxtqe2XJH1ckPcC/HR+nt8Dd4dtFlo7ZfuauTjoo8LBPk7DWoCc0/T6azY
         LuATYY3nULYR2Pgqc0FtNZuzTZYgUrotN30vkn+Sd3jq4fQ8zzcXziUCYcECp+RxVvjY
         P2WZyj5iatmlIlFph2BMkt2BfewIw7LrGyPHqWdRMyKXnP1Jhq1MeLbyPiMpRUYUKJZk
         ftKIPeL1MQ29kyleADBfHaNJyxbntfwffdwd+PbJaANkENTMH3si7SSaLQO6vdRVdWRN
         2qq0FmwkVFDhXbSext4RGrSBHXVtg1tQhSneW0IUk8rtfNN6Srk2KL0CZzSIkY3mR8XR
         PrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646569; x=1793251369;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0ib49ykkVTIXodpiuOe5mlbictVGMpVlOsQqgxbR10=;
        b=Aegh+On/WsBsV8g28FfPNIBBVBI3IinDXsBuJU90BBiMH9Vp48DM7RTuKxB+eYRTfA
         bf+2J5VHsgx8KuUwLTgsYatsc13h8JPCjiz9KE63G3FepPV9x1bKAPkJ2fTMZbMV3c50
         r6Jd26xNyhZQ4wl2JsR8xLBxMDdAXK36cMmiWd5knHRuAJMskH9Ri5ssWMom9Nqkv5eK
         3tgpZIDdPRqHYfOmbCnHjlGFu6WAr8282l+x+wrlgg0m/gYaioZtSSEEqag9o/as7dng
         XCXPqyQz8XXayu2MJ3f6z6BzW2BzbCIklVvEK6AlB8AiuuhnT+rog+6JhdHjxexuj7Gd
         mmZw==
X-Gm-Message-State: AFq9FYLRrPDVVOLVwFvGQvA1Lp3d0bHWzybTo+zOcqGsEyGjXPfvQ8Qp
	U3rv0Rvp+/w9fe2jA4bq5Xsebcp1qfQG/4jft2bQytfOW+KdjwdLjiW4bKPRpcCJUi6ovExs+5/
	2wMp5SWIQXwO5GOeSFw==
X-Received: from pfwo8.prod.google.com ([2002:a05:6a00:1bc8:b0:8a2:1bc3:8884])
 (user=chihsheng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:349a:b0:881:4b47:f31a with SMTP id d2e1a72fcca58-8a089cdf1a4mr3211775b3a.11.1792646569217;
 Wed, 21 Oct 2026 22:22:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:22:44 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022052245.1138709-1-chihsheng@google.com>
Subject: [PATCH 1/2] selftests/cpu-hotplug: Use $(id -u) instead of $UID for
 root check
From: Darren Chang <chihsheng@google.com>
To: shuah@kernel.org, david@kernel.org, osalvador@suse.de
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Darren Chang <chihsheng@google.com>
Content-Type: text/plain; charset="UTF-8"

$UID is a bash-specific variable and is not defined in other shells such
as Android's /system/bin/sh (mksh) or POSIX sh. When running this test
on environments without bash (e.g. Android), $UID is unset and
'[ $UID != 0 ]' expands to '[ != 0 ]', causing a syntax error.

Replace $UID with "$(id -u)" so the root privilege check works across
different shells.

Signed-off-by: Darren Chang <chihsheng@google.com>
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 287cfd5809f6..6653507b9348 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -10,7 +10,7 @@ prerequisite()
 {
 	msg="skip all tests:"
 
-	if [ $UID != 0 ]; then
+	if [ "$(id -u)" -ne 0 ]; then
 		echo $msg must be run as root >&2
 		exit $ksft_skip
 	fi
-- 
2.56.0.257.gf7497c7d27-goog

