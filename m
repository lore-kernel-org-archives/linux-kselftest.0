Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF756855E
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086647; cv=none; b=hD7u90rLfPYoiy+9SPk5Be6v1jrxGbNovinCwdwuvdnPmSq0kM/5j18QfdVXujibQV74yO28wu6nZ3E7alircM2OAXYBQHrLejc25j+ozlfQ0zhApncPsu+DTatwfVWwnqoneTd4AUoBgTqIW+l/WCJ4WFWJnMMrnBciExweOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086647; c=relaxed/simple;
	bh=Y1ffjjU3TrGKI2kHTODgUpjtuJFHQuy5DoAq4oKEq6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVSGHOnGnukMhwdM/sL3MlLPplbEgJ2ABKJBMq4eZwhUeVh/dXNKHiK3fb7vJqFGUJPYdJ9Xw1T3EdjDhBaJ5g3hDNQb2R6oQR4MbG7xbDW15RiAaJz6pvsxPhiXs/MqJTtw9+F2GV14aZSqL21DgdeI9228cnTqXuWmzoZROO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ2kbsZb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ2kbsZb"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2090519eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792086630; x=1792691430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=grYpFloO+4FhzPg3/7Eg9rJ2UBt3fs+5KW5kcORLJrw=;
        b=WQ2kbsZbKRs/+4mwUcf39+OWJ4iv/UhN+hEbOVAiDDJAYZo99YfJP1IxxRaAxtYn7k
         XQkJHCDawGJCbqgClGb1yz0bSAu1bxtl6HZmIudd9xGt3YuiGii8TrXne1yhnmHsAt4R
         D8mPYpmHPNqdq8CM1IH/3+HGdooIuKjev1LM4hMviwijm2Ctiinvsbqv/evGVzD3zkqJ
         +EmSYd2JoEXQG5VlNSHALJz6xQMLR8+v2VHdekWwX+hQmbOWurqdibe15gMKolcAYriV
         mFgulLYlIaX6iGUmSkRS/amrSvO87fLe1M+DNJ03ucQJ5Xgue3uvoJw8x8KTy1cTrfob
         aUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086630; x=1792691430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grYpFloO+4FhzPg3/7Eg9rJ2UBt3fs+5KW5kcORLJrw=;
        b=y1mTSuPmoJUf79GIOMmSa6xE7doMOuySLlKFfctE1G8dbuGi/UtRdzYh+NBz+1QpFt
         YrVpa1TcrpcBbA4M8nIH4lWeJnEuDROYPoJVm+pgyWTOi2IcqgF8FcLyPW7lP27rlvcz
         yzgH7IfL7Ax92253H344vMdU8DlbEWQRbaD39tIeFKcPT5RQR8tlRH1MGNYZjdlnfi39
         Tm7CKco6t0CYkovMgV12Bmrs+VxF2NzGHscx4f1jqKwpCDj3pZbHhlv/7GAzzdW2cjBh
         71oQYWDldrCswoIbxKYqYVj6HgtRRGN/7dc95R1yXFqtwwiEPJo8a8Uj6DHdxa58EdpW
         si1w==
X-Forwarded-Encrypted: i=1; AKwUvBwuZhVa/Hews79tm+Zgnabzre3MlQw85mPer3c8f+KGq4z84YzwKPWy8C0SRn8KKE7CW6Q6C476+E5iHdhwmHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhcWRyEkd8oKjr/qkkew7q+AfboanlPK3Z1zXzQYNy2uuENqId
	KaQ/FUV/SIPc/+/3MclOLQQqoUS5W1J7MLFsdnb1CLsv3AB7b2kEFiVR
X-Gm-Gg: AYBFou2vl6usqSi9J6qa8C1oa6g+h4DSzSj++gvYAmi243euBITWFJc1kxeaSKoxddN
	v3MRn5G0DLWgra3wlGPR/OErmhxXiUQbmi5fYrQmFUM4LUZ1yvMMcVX8ZEhgPAp58NkkOZ+EkfH
	2SpWhoUYLC7o/rDh9pwP9iTDtq0lpIbIplDLHNs9yuwTYsjGZNkNOs/u3XTyLaGSEBHCybYCxl2
	obh/VdYmVhVShkb1F2X5acy3eYSlznlaJCIuVANhuah/ud3T35KpO9V+WwPYIBaieQO3POnUZ8j
	A9QFwF2Dvc24uOkIA7/g/VXkyDzG3UyW/j+2fZ7uQZSyFqQo3hAj9tGvANKOa6/4cQNoRBpKE/y
	NtPDxvTZ/qMNAHua0KiWnnZoRSJeEQp+sWtcVby+zr5Ro1JKnSh8J382z/QIwOhNszV3N9TMUqQ
	c/mGXNynkVdT0guEfhRX+0RvK30kSiECqb++lggs5eHXJpTG87JHpeSDFw2flL6AQ=
X-Received: by 2002:a05:7022:2211:b0:143:271a:308 with SMTP id a92af1059eb24-16a6222be3fmr39515113c88.46.1792086630287;
        Thu, 15 Oct 2026 10:50:30 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm519697c88.20.2026.10.15.10.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:50:29 -0700 (PDT)
From: pdsj2807@gmail.com
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] selftests/bpf: remove unused duration variable from cgroup_attach_multi
Date: Thu, 15 Oct 2026 23:20:17 +0530
Message-ID: <20261015175022.1370503-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The duration variable is not referenced anywhere in the file.

Remove the unused variable.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
index db0b7bac78d1..9037e98f6f76 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_multi.c
@@ -81,7 +81,6 @@ void serial_test_cgroup_attach_multi(void)
 	DECLARE_LIBBPF_OPTS(bpf_prog_attach_opts, attach_opts);
 	int allow_prog[7] = {-1};
 	unsigned long long value;
-	__u32 duration = 0;
 	int i = 0;
 
 	for (i = 0; i < ARRAY_SIZE(allow_prog); i++) {
-- 
2.43.0

