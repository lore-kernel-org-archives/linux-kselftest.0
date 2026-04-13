Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625D35CB6A
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101193; cv=none; b=Rzi0PBaXFumzFUvWNlzfDIa8QZVumwrVCO79Fy2D9NE0FxI4Q/Pm2vkBOrX4xk/MG5XXK1+NuQQtmfoTl+62n+pxR2NaWHsi4b5xTtomL/2/lUN1PPvTJOOyw+A7PHlrDbg7gWG30ZGx7Rz/di2u40zbKw5ub/MPFm0LieD/gvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101193; c=relaxed/simple;
	bh=m8oJEkUhz0J3w0JnIvC2DIbk+EyHDWrxfKUyFDm6LMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwPQoE0kZFU4pv8UN7ITiWwVFUK2tf+5RzcXjU3Y7ut2Qy5VUJM7Uv/TWW0dqNx+VvxCRtti7PDVvLxfraMvvO+lfnqS0CfRLQuXOCvi3hTu28Yvw4tvNHrCW8Gd9Ez2+MGtw5L/iHA29zkfI7MDvs59C8cEBHwYkYaPIKW2O+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e12BehCn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e12BehCn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488afb0427eso58638095e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101190; x=1776705990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgiVkg9WGgr3F/ZbVGibYK5V16DNFcA2b+vbpj5Bubk=;
        b=e12BehCngtdmSwGPZg9lXSh6leAANYtBv6xxMepu/vWJd4q5+7htzLos/F166qsGnl
         fldnga2GrylaM6UZ9cBQeBAH70QmyRgMxJAv/PfNNJdc/uQ/7CMfdzh74cjwksieAy0b
         CxAfZUgGKPvt04vLIVqT8LuG0Id+HDFaKVj86wvkJnuAo1PkFNWTS4/vplU9pvoV28xM
         4Ui2xoObkGfMcVV/pGo5XaTRDmxlHFhj3/HaIce277AAYgdcQpLVRJg05mAB1rks3oBn
         OfMByVvlNC3+KA9PgaBIYbzOPS0a+GbQ7HxdHfs/k9+6G5Yj2rDFM85x9IhRsKkzr0Yz
         /6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101190; x=1776705990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JgiVkg9WGgr3F/ZbVGibYK5V16DNFcA2b+vbpj5Bubk=;
        b=E6/PFUh79WGWoYJZ8hKGQ4ieq/2zAiqs2jxki/D8YQsFHQcWGR7VZrp/CXznqaNnYZ
         3WPW2EHX3LtJ9VlJE2pvGgh7FGMLTwPm2dtwfkYLQc/HGsP5wH2u07SjyrMAgXERD2Z6
         XYc6B8K839EC2L2iKr9BSUslMX6Bd9vAbvDdMvx/2txZNmb5mpL2z0VgpRpJikATjjGL
         94q28AovDpf6otgsrRrt38+Ni5r3HI9YmTzCAc+Mas1mQTqDmQmuPXZMGdZRV291PJ/0
         qUExks/xitIMWk+RrsVrH4XK2nQBkonuEcbmEIV1I9OfgMsIcCbU4/7PFnOD4z6xPxLK
         hNsA==
X-Forwarded-Encrypted: i=1; AFNElJ8ifcFQ7JSDvg4+7C8+MFPoNM8kU0+D3D5vZqDrEKWlpsmT5Tr0n8g6tmJ5trvHqoONwKIYRNz/UJxDI4Rrk/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeE9LVHKxAUQppChKTXMNeMS2pKL+ZYxmtoeqdhN9XG0tWdRk
	gO/MOh5Snp6KMFGfu/Qc74NabE4U+M/XaiGWrx2xeUhLIchJor2aHSUCh8Myg7xfuQk=
X-Gm-Gg: AeBDieuyZiJ9crK7cNqxEfRnb4cPKpCJXzM0VUwQzik442o8pj7Z6bA1fBQaew98VgS
	4e65mfDARjn5gTbSwRG6PckZ7DtUm/uNFMM9G0fj+Xhy81lA3pti2cG/5gQTuFWLoiI0FUyaYoS
	yZxlMLX+A+e3PPxF/dMJe8jnfbnyzsL7gKcam7QW2Hfuct5lh8KryWirOcT96BXM/xSirZYUjIy
	DChkm79h3qyBAzh0qs+61wbqyeQPYGfIfJCnLy8/e1I0OGGW7d4NItPBCVGi8B6ZGfHU0dCo3Ke
	JpFOIYEcSlkS/4KoLAxLzBEO2i0oeUmbgb1GyNz2egUxvIF+dvnsZGvm9u4YOhu16dBeN5PAq81
	eYYmhrsuc2jPLLh6X7rFKe+2A0yQB39z9BUwE7beaamGCgdQGc4AoydkfgvJ+0jm75aQmUvdRYx
	mpPGafox8PUNnyytZ5zrOPcxRAkWt3wYHAMg==
X-Received: by 2002:a05:600c:3ba1:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488d67c704amr205896245e9.5.1776101190311;
        Mon, 13 Apr 2026 10:26:30 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:30 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:14 -0300
Subject: [PATCH v2 3/6] selftests: livepatch: Introduce does_sysfs_exists
 function
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-3-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=1081;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=m8oJEkUhz0J3w0JnIvC2DIbk+EyHDWrxfKUyFDm6LMU=;
 b=E93oe1YNo+RSYupe5HX5Y5o4BZx0ByITywWIL0YtM5glH0NYRv3YYBExa+tGYCGnkgWIAUF/M
 kQwUY0KIZg3Bm1wyJkF46y7IN2sfWAMjLZ5bdxX85rgQ8Chnwy1dxX5
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Return 1 if the livepatch sysfs attribute exists, and 0 otherwise. This
new function will be used in the next patches.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94..382596eaaf01 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -339,6 +339,16 @@ function check_result {
 	fi
 }
 
+# does_sysfs_exists(modname, attr) - check sysfs attribute existence
+#	modname - livepatch module creating the sysfs interface
+#	attr - attribute name to be checked
+function does_sysfs_exists() {
+	local mod="$1"; shift
+	local attr="$1"; shift
+
+	[[ -f "$SYSFS_KLP_DIR/$mod/$attr" ]]
+}
+
 # check_sysfs_rights(modname, rel_path, expected_rights) - check sysfs
 # path permissions
 #	modname - livepatch module creating the sysfs interface

-- 
2.52.0

