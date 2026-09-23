Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F0531629
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174996; cv=none; b=tAPfYYOsnGpuCsva62u+eTwF60hjT5fv2wNrVgOtkM6pmDL+FvXH/FdURV8ZYX2dvoIG94za+ZCa1bd4QR9O59NsLmMH4qMA8HeABeOLcjivYRKWiMn11j3N+bHug70V4/DaX6mMRJ5VR7gVnFyy1syMmP+dlRjsen7Gkykl6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174996; c=relaxed/simple;
	bh=xJdKepmRpAoz1zQFvIxmXfvUfRSmnb1JsW+eRmMFwSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UehtYpWXioh0bwct7KR36W+XkvWGlnYeyUjBCpVMDhVQRdrTwF0Me330aURHXn9fG6g7IzfLgHj7PULyiKWXw6tN6a4LlrcCoHcKJLQxAxHMfRztZ6+Pz/YBNxO+Xgbx9CQ28BvsxOX3J/YNNl3gcNYXu2qRh63v0xaQlP1QWGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqs008B0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqs008B0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so433933a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174994; x=1790779794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjR07HVq5pYhUmwpsgEGWXdyXHF+ofIQx2iCJm+Z1l0=;
        b=mqs008B0oH2utC7g7dz1vj31Sy10v3bGiB5F/Nae2ELECmkplwwjwPT18NVenOGiMd
         k9aXFDeMzE1kYyt/f/HTtmrogGk4zjBLXG/8t8KbVlyyyoOZoykV1Y8uZ2W7g83xfQgp
         f2pUtD8foSxoSbHv+wTBRxXlcenPGVp85gf5MXiCC4xAQkxZsv3VbwDQffwYLlZTl0+Y
         DqNT/m/DmZcskmDAQT19duZZe3HO0jDkmMjCslsZJbwZtkr4nsl83L1p7cfpBWYb48ID
         of/+0FJXgJlgkY227EoRFoBBpRM9JSn9ZcuucprkymTgEszzEl6nm7arJYEFkdOuFUz5
         oQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174994; x=1790779794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjR07HVq5pYhUmwpsgEGWXdyXHF+ofIQx2iCJm+Z1l0=;
        b=J8gN8EXLQhoFwgP+NbRytk+SrQzMVPQGSRfANx/sMRB1HvuR6WnWg+7b5mxY+2Usy7
         DFW2X0d/FPpBp6zFcqTw2GIaR370stlFtHoLXq/S/2b9Q+dmm7aRqa7YLI4DIurQHj4e
         XncgRLgXra/e86I7i2Fe7KxH5xWkz4i1Tjn1hGLWXGbTBKn/Oue14C1KsuLvaCBg3Fo+
         oWOxPbEQFRk/1HhGUKqwVEZh8Y5zRbbWBB2jQsHVVJ5DwP71andYWJ52YNj2YrvNeSFe
         FjZ6Z8ybZ+E23U2O3pqeqNgDh+rcXlzfDanbNd2Qaorx6tE1qcCWLWeI2AS4fNuz003G
         7TbA==
X-Forwarded-Encrypted: i=1; AKwUvByFQzrg/SbZT00eyNlfWk9F3K2FztAviUBIbOEaCq9ob31hEM9gTcuoYFPVKFta/J4eoXi3RHGIHmkzSnuCoZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mGqDWHcFyDgGuxJ0Dn0OLgR4Je1GrSZky6BJTFifvlMgJpLQGk
	NwPM4YwkRZHw16+kvayouKXx5rPPGVRpuAwDqfR9KSIflyCVStbgfp9W
X-Gm-Gg: AYBFou3nX33g9hUeIR3dxEAX22Um86LkOK+Zza91Pm2z+T9i/4frNka7+dN6oAAg57g
	TUufBwGNQDxrJr0Dk0CLCvAodQ7gWCQwTvjGbFOf7QjQzmqFW/sbs0yuU/SCVAhoxZ0zGl9ROxD
	DqzAtggXnNFlhSpvinH4EpJj5lZkwmiw7qo4HPVvzdjLjHTrU5gkE/cKG+SskGWiGV+32vCPMq+
	AY3LcgrxVW1IZnljnO30Sq4WhQX8zOSyTgpSjyl2y3i+zxcHjJufijo1G9dBWji/bSB76HpwLxV
	DDWoR86u5W3TKvoSwKwzrcNJhULctqyIPo7X4Pf9Q6zgrhzvHkuY8g0mIVHQENyuZZAwd5wH1om
	XHC6WucBeM+Q4gfZE9bc6ysgjvSKLahTTRtS/tMHZjeCnt+vmj4+CkMKXyzoSDpEZQrQgPGLH8S
	UoyMJB7pdH0LFtoO0eD38nLZpbXPBOUWz1PuUsdFjDjWND/HklZy80WYpSVP7NgbK3lkYUVt30j
	QIHMWGXW024w2BoieAY8w==
X-Received: by 2002:a17:90a:f947:b0:39e:6c68:fd93 with SMTP id 98e67ed59e1d1-3a07e6195e3mr1763305a91.40.1790174993687;
        Wed, 23 Sep 2026 07:49:53 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc4109dsm6469824a91.14.2026.09.23.07.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:53 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests: sysctl: Check the sign of a negative jiffies read
Date: Wed, 23 Sep 2026 22:49:37 +0800
Message-ID: <20260923144940.3712965-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923144940.3712965-1-zhanxusheng@xiaomi.com>
References: <20260923144940.3712965-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proc_int_k2u_conv_kop() returns the sign through *negp and the magnitude
through *u_ptr.  For a negative value it used to convert the
sign-extended int and negate afterwards, so the magnitude came back as a
wrapped 64-bit number.  Nothing noticed, because no test wrote a
negative value to a jiffies sysctl.

Write one to each of the three int converters and require the value to
read back unchanged.  Each value is chosen to convert exactly at every
CONFIG_HZ, so the test does not depend on it:

	converter		write	jiffies stored	reads back
	jiffies			-1	-HZ		-1
	ms_jiffies		-1000	-HZ		-1000
	userhz_jiffies		-100	-HZ		-100

On a kernel without the fix, at CONFIG_HZ=250:

  # int_jiffies: got '-18372957097414713411', want '-1'
  # int_ms_jiffies: got '-18446744069414585320', want '-1000'
  # int_userhz_jiffies: got '-18446742229035144346', want '-100'
  not ok 1 test_int_jiffies_negative

(paths shortened; the runner prints them under /proc/sys/debug/test_sysctl)

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index ceb5cfa0cfd4..ad1ee0fccd7c 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -328,6 +328,29 @@ test_int_plain()
 	assert_int_range "$t" "$baseline" || RET=$KSFT_FAIL
 }
 
+# The jiffies converters report the sign separately from the magnitude, so a
+# negative value must survive the round trip through the converter.  Each
+# value below is chosen to convert exactly at every CONFIG_HZ.
+test_int_jiffies_negative()
+{
+	local t="${SYSCTL}/int_jiffies"
+	local m="${SYSCTL}/int_ms_jiffies"
+	local u="${SYSCTL}/int_userhz_jiffies"
+
+	[[ -f "$t" && -f "$m" && -f "$u" ]] || { RET=$KSFT_SKIP; return; }
+
+	printf '%s' "-1" > "$t"
+	assert_content "$t" "-1" || RET=$KSFT_FAIL
+	printf '%s' "-1000" > "$m"
+	assert_content "$m" "-1000" || RET=$KSFT_FAIL
+	printf '%s' "-100" > "$u"
+	assert_content "$u" "-100" || RET=$KSFT_FAIL
+
+	# The positive path was never broken; keep it covered.
+	printf '%s' "1" > "$t"
+	assert_content "$t" "1" || RET=$KSFT_FAIL
+}
+
 test_uint_plain()
 {
 	local t="${SYSCTL}/uint_0001"
-- 
2.43.0

