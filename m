Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC738E13F
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469642; cv=none; b=QqhJ97gUIWLQKcuL41IdMTv1gd3TdiHi4Q6MidS+CDDMP9aym62h/xgYbCxSR3kCE9F6N57EWOAuRczVm1meOaR/ULmkdDPy+qiqfTXeLpj/YSPitDpGgcXN3r55oHTIfYy6/bmIsFc/Sus5bZxHzrt0n5yAz/QY6lbwK8dHL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469642; c=relaxed/simple;
	bh=n275S+OuVLkos1DUHNi1EQKOQFtolKWeIjbbDIOX8g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ld/wrgJkUbj4jdYc1zuNWZo8rLImBX4mxs2HvGBqVfwicpqxjFZY4lA4xO5u10tnqCP4i6H8dwPZ/Cwi9r2e60Z4a3Z8yepLKvshl1v363Y4y3EN2zqz3beLZwPRjeU50R/2n2Wmm4vftoWALHJKHJtMpbq/bqC+10hPO1aDGNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO0jL8Rd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO0jL8Rd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so19282655e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469638; x=1792074438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIdXfHWm+XcWclaowIlCf3zzp2UMJw9UWgeDM7YLbIw=;
        b=EO0jL8Rd58l4LT4J+5/cqo3MLo0ClMO8CNcLHRxFcqV01gCSXhP9APCXBj05C3A3Sj
         1mBxY4qGWNqfYEv/sZrPYO/brMDyKu3iMJgRYXcOPzWGRa+l4HcjVJLYChcFX23MEBzV
         D/IZ+RJSd93ISMSQ2B58eZwF0NO5xqFVvrJFGj8e1k8jrdK85Bo7WbXy8Iy2r15vpBDl
         Mt8dVGX1344PQXaWOTIdNRpGoQRlJ3rf4c/fZ60CynMFoxZyqsREpXJ9jbr+7R6A8+z4
         TGIVyJ9rlrphdalfEJIjHoH4ymgXyKRFdDYJ2cS0ET102dBtxIANTubBtXEZk5zsNkon
         wp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469638; x=1792074438;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIdXfHWm+XcWclaowIlCf3zzp2UMJw9UWgeDM7YLbIw=;
        b=KUgBwxAMDCC68eJCFTio36hZ6OvS3hecF6YFsRLUWGhl5rQb4U7zLDTSbzxb7tnasr
         UDtczlqWaAkU0uD08rLJt10QVyehSvRjJWHZXVhuKEcRSSQUbDcNU7KhblqdYElEkH/B
         4zR/PEqnTWXu3TuKT3nSsQHKf3h4+ATGFuNq6AVIFzRQXEmD813sf3VRXMbLCYvVCmkr
         5M/s/fyZnN6qV1FziQf2tEGS2aUIlhQp7TOHusMnfz6v7jNIdsCUXIn5dKcZ+ZEttmPc
         dZeZmT2ZSSDmJWSTU8+d3Em3uM0UUj6RWBDETOaZeYWm2aSM239RtogZo3Qy/H36cZG1
         jdCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhIQt50d4U8ziC/0YUle6H+stQusKjvcU76HvLrKC46C6JG5Kf+aOrknT7bUvKtp+YEiqN6K0s0u5C1sL9zVk=@vger.kernel.org
X-Gm-Message-State: AFuF++n+TDUzWKVh61D18AvGbKH8d1mmMUuLHohdFi4Pvt2RFplbpjaF
	mkctJqR6RzN4Bqu4a5sE7HgC0PGLfDAQpb4IkN68v/pjNgjYc1GwxeDo
X-Gm-Gg: AYBFou2C4qEgpbkeIfcAZDBVdjz5eiMRi97q1i+Jc6eCh2X6AdR8U2BWi+STa13WYfT
	Jy4e3p9RFznBdeOT4JJ75w7O5AwedQp4AsnK1uee8q3xYeWgU4zye9ZrSm4xl4lOU2PGfNn6mZw
	7G3N4oXkuAbFFA2xtzePbgdiuv0hxyoVLr2EZNWfZi2IbDNcoVfdjX5IyLo3lbA6rLVhhds1e1a
	3+cfrmENfOJEqZd4iIWOr0y2GdAj9VYVpqW006ijOQ0QujN2ADOyb3ISWT9alnHZJJ0jVNTfUVC
	MGGBvCimrfcThtA8gPuMSjn94jko7h9i1nPfx4dOnWUSF85NkHnkYbwpLq5z23ICxIhpnJZ3cUl
	W20+D5Y4SSg3ncDLbY3g2I/nnF4YUCmIlArS9kOCBaLPwufgH1SEik1q0hzMcPh4jjclLSfjZJm
	hDUPmlkAvwL5QQme+tZerWa9GzGfGqP/UQPd1dkrsigKlR9/9Yumt+SgBxOgFZV/jRDxoKtIZve
	CzBc8bI/aWJQskFUzxJS38=
X-Received: by 2002:a05:600c:5250:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a1800d3944mr95506635e9.4.1791469637826;
        Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1e9c2sm10963344f8f.30.2026.10.08.07.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/27] selftests/landlock: Make audit_message large enough for any exe filter
Date: Thu,  8 Oct 2026 16:25:43 +0200
Message-ID: <20261008142604.39107-16-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_filter_exe() copies the filtered executable path after the
audit_rule_data header in struct audit_message.  The message buffer was
sized as PATH_MAX + 200 bytes with received records in mind, but
struct audit_rule_data alone takes 1040 bytes.  That leaves only 3256
bytes for the path, while the kernel accepts up to PATH_MAX bytes, so a
long path overflows the message.

Size the buffer for an audit_rule_data followed by a PATH_MAX string.
This only makes the buffer larger, so received records still fit.

Also check that the request fits in the message and return -E2BIG
otherwise, in case exe_len does not match the filter's buffer.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index 1e533b4e26db..173dcd1088db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -41,7 +41,11 @@ struct audit_message {
 		struct audit_features features;
 		struct audit_rule_data rule;
 		struct nlmsgerr err;
-		char data[PATH_MAX + 200];
+		/*
+		 * Large enough for an audit_rule_data followed by a PATH_MAX
+		 * string (see audit_filter_exe()), and for received records.
+		 */
+		char data[sizeof(struct audit_rule_data) + PATH_MAX];
 	};
 };
 
@@ -171,6 +175,9 @@ static int audit_filter_exe(const int audit_fd,
 	if (filter->record_type != AUDIT_EXE)
 		return -EINVAL;
 
+	if (msg.header.nlmsg_len > sizeof(msg))
+		return -E2BIG;
+
 	memcpy(msg.rule.buf, filter->exe, filter->exe_len);
 	return audit_request(audit_fd, &msg, NULL);
 }
-- 
2.56.0

