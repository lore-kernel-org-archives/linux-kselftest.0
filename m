Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826559;
	b=FUTP2quv8zCd18JjeAkpQUjqd0Qnfv/GjmzR146R3GAgvmDQr2/JILj9CSDK/2CRX6V6
	 +lHVLRSwoZ8RHawSOWeXExgc8UHd+B/xXqRK31IG4ozXch4zMgdcqpKEu5lJVhofddtA2
	 Of9rt7j/WtWfDsXgxlhkQZLYAfytcMHnGxQBA0KEcIADz5/aUoK4HVhQbEY+io91uAyZq
	 CvNVY7h6zhsEByU4E9Tm7GqcsD+dYeQhODB+jI4A93XQx9IYs8r+vOvp5ycSP7Rb2eJct
	 RYfElWmrYD4dEircUOiMz2lE0Ewe7GIduqppeuk4k6/2wZXfriUpgSRRXfrnQ7GrEuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
	b=5V09xfK6Zd4pjiOEQE+HxvQRfy8aElCit8q173vA/t6qNF4g8aRCD6KudSP0CVzTe7dS
	 aPWxpJKvQGbN+UujK+Zget9CPBHQIB7x1xwph5szoqpT+GABE5STh9auNiZB1B89W4C4i
	 LNTfcWaQs2AEgMdboJ4wib2XJ9heFsIUSbgsEkuYu4snNfZAOHIphd5zvuocMCPSCvT28
	 tVx9iwSXGhLc17Q465zZnxp6A1vyx/JVtYIUzmmdkwZRf+F27NG1bbQgZ6p+yFfkwIv/Y
	 IRXIdN1O7XeFi9j2yKCQ4rXH4gyObzgdwD8wRqYh77wFUGOsNv77p3ZdQGTWBGMeE6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmPUDHJn;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAF60A67A9
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAAF60A67A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmPUDHJn
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c1d337d8so414162f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826558; x=1794431358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
        b=xmPUDHJnkAI2JpFOCpLn7lbCItH22ZZ1DeIqLMRulnAOuDv4bnFCWi0nCkut1kpz+t
         Q8lcYX71cv2THd452ojIMF7hyqTlxoPhhF9UsnBQU00ZiqVsW+uItNBQ99Up6NWjzMZY
         rbV4d2NaZWDCEHJumFJXbbSYP6GfzQFxMoTnl+SIv68thPTInzWVLzig8X386MGJpTNU
         pwhdPqBI3zD1ewhdNW2j/QRKMi3dAp35SYkNwBNazXqK8tAXtYmnh0kiSSo4NwBFI4vd
         kMnk7V+k2B9lqBiChIwp9pW4JxMG2G1jf2J3g8S+n+NOzVxoS00Mhc04WDeXnFXki7v3
         F4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826558; x=1794431358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
        b=cAVnlfvY/wYRWuRzz9g3IhAtuAoX25RAJIKcXQidb5OGE7eaSjCFHk6zTLyaTXbJFl
         d7444a5Lhq2vkKfALdQ5qjOTzhzNwGuTRu3gnvDYw4GVS4iuJAuMRusxPbYDyIBZTGnW
         6hBXeEFlfj8xR2TOYCGUVqBJw4aE05G+XbANI6Sf/3f/Hmy3O9F470BA+N7hQTRsgbxa
         5ayHtSAtujzkBere+sDKVh90ecgsWWhrYfoUDWkJUIP5cb+L4ppF4KhL5HegbCrFM7RM
         Wjq8yPXTWeCMzEX6+ZnEeiVyAJYfMReXQ7XGNUvXmNYFt5i98OdlyFxifgqNb3VwEv42
         S2sQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8RsR/3zgnRw/JanF8IxfWU0/jVCv+Kv+n0LLEsq79jLgVwSbrppl9KOD39HHI4A1B3Z42R9zXEW50MmCWc3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ij9RC0bCf7XlUBxfE0XQkkz+yDvhnjF6ZoS9j0lzvCOBy4/s1
	IUr2GcYPLaw84bhAY/nUepVYXM96hjcc6ioE9AVtS2G2T56oHtsY1ge2
X-Gm-Gg: AYBFou0A/qGjiufChcfm10hNk654iVtBT0OHlp+MP9Jv+K/ngcONVF95+LKYMoIVU/e
	gXj/fw7wjDgXbUPkZqBJZoIu0Hc1Vnje3uw9CsOaUwPeRZdu8A38/0qDBrJMdeN1KLhTCQkPA7+
	IstlTFGJRkfFngIuof2txv0EbOiRLgxjJWxzNZGsu6qD0b9LJ53epCU8JwZt8I3Xeb3hhhCVdKa
	+2VoNkZSU0kP93oPBf6IkxnmviWHtYEJ45Fpy3L9dYq4XzUIrDgnMp372eV9SBmKtWo1c8faFPM
	/4NR/yFJSomUGR1quOUaYthV1bwwZTGFSlLLmEosX300+V+SyH26IkyHs7k9DebdPDnyFRtM/D0
	Gc/TUDiucaEn8xebq0LyDcQYtBhN7SO9TkuawALXFfUImUJam6ykqWxnpGasraMd+Ld929qq/CE
	ADE2qhOS5Q8y225pjrK7JhDX9OlkcKj3qPt0YFXt/ZZGfrC1U/fhSsQgnq4z8zy63qT13kUTNk6
	cYHVvKwZvFIpIoD6wCK4wVLKc8oYE1z+PQwo5dh5ZaCrosR47Er/DY1h6hcgZbcXIRK72YjwKUr
	/h4AJG5BWbSSSa0fZJdnBgLeW+ZFFMD1Xt4vhlDSv0vZmjss1ROPucM=
X-Received: by 2002:a05:6000:420d:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-490a4817c00mr3361546f8f.29.1793826557552;
        Wed, 04 Nov 2026 13:09:17 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm6643541f8f.45.2026.11.04.13.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:17 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:00 +0100
Subject: [PATCH v2 14/27] selftests/landlock: Make audit_message large
 enough for any exe filter
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-14-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

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

