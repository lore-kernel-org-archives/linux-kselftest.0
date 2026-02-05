Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C043358B1
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770330213; cv=none; b=oRA4BFVzhW6cUKZ8x7Dik9dpPNuLSp+MAhH0PO2TIF82cjaudbKTlBet6aDuFNLFTZPjlTjfbANBZuQSh2JmrHW5VJUZQgPAj3bR6CS4sTWtgqQpDP5ZGcTP96e257d7GBP4Z17YLr9kvdmSBaJd5rVhyWttKMZtmKHQofEFOLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770330213; c=relaxed/simple;
	bh=xSb/cQjgHxjW+s/GE6rfr2r/LhFdyN3xF1P8263e3Ak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TULRITLXp0aeq+vTFzJ+vmXel/xQ6ogaA8NkXngzyembTG9T6UtbTkSyGqTbG0fqHCOIhOlk+OGghrrAM4jDJHHTgqvwS0Y4Z+LZP+Tu51EJWktI4fUuP+E4p+IdyJEOimOfrDNmLbd847Ekrjff3VuGm9EvrOBG+3PWSjLqars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IwiMqO0K; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IwiMqO0K"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b82974bd26so72944eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 14:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770330212; x=1770935012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G5PGmS6R2KdOtcRkYwYkwwECXFYWNB6Un/sFM3sIK7Y=;
        b=IwiMqO0Kk1YECOfGv5ZJ+5vGZNuh0ub1Ck9yEilHY7v8RuZuSZEkQMnOOfCLgs7oXn
         2Ddrp2GaJlmO51SLq+iCGjAXiiPOoo1+VPy38X9P6bx04hieGaVyV44xU8quAn9dT5Jk
         wU8ej3fn+r8hlhoosEf07+FzHlDOtRwtBjxtD8osc0tE2nALLF0YD1+gLi4HyhUV7pm5
         2Jc5oIV8oPvoplTfouCREBaWMlboNBRU8FuIasP9VNrZoc2+7/208HoOHDnMi/RqhVrc
         OF4bRb9cdSL6RxDd2JFToSAeZfjz6gNpsdHwz/Rx66MrsBWD19XPJeQXCqYs1BtNT3kF
         iXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770330212; x=1770935012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5PGmS6R2KdOtcRkYwYkwwECXFYWNB6Un/sFM3sIK7Y=;
        b=qo7+uRdWuOXQ8hQHSmBziZbPWP1FPEGZNoG/E0ieDIQfVZMOhJcj/yH1QEx8hdwPN2
         3atBRtxyf9CxJAM5aSd2exz3dFgWSPg1UFF/X1dGaXEfzUbXAuKEvycYnG/9hwasGRrv
         sHOeFfZxvL8WNkynI6zwUKBaOGFtyS8xx62yxkAv2N5K6KGmSqqCIt7U9+Xtt+DD3ebl
         SBcNKyoxAaNGZAPj3jUHT+Wf7iw982obwHvy7Ogqjpj/7/0xl3ETvY4wVwV3J4Cgm7bo
         uSj83NrhWDigRs4Tugl0EMTLvAFG/mocul/LAYyvlgfB5xobwpY0gOhslviXAQKK2ibw
         IMRw==
X-Forwarded-Encrypted: i=1; AJvYcCX2zhzEaJKwEfgL3TXcm8+y9BVg3jYYhUhVIfC0HEFp4whjqkQrrFgl3Xn1iogaGQyWxAVqqqdv3rMA+KwaWHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZwwTk/Q3mqPu4Kwrpn0GouiW1PteM97nQM5ITqv+bXSRkKI1
	GXKqB0+IBOuQmzgB1CJyAWtrLWZAQH0d05mkvMKbAdt4lOnc1MMbAfRYLnST4lqd+UGpqz9mriP
	Q8vNGcK/Dl0T5XonzqmOugj/buHWdT4Rj/xxZaQ==
X-Received: from dycrq11.prod.google.com ([2002:a05:693c:2c0b:b0:2b7:51c8:b523])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2b0f:b0:2a4:3593:ddf9 with SMTP id 5a478bee46e88-2b856a45ee5mr281136eec.38.1770330212288;
 Thu, 05 Feb 2026 14:23:32 -0800 (PST)
Date: Thu,  5 Feb 2026 22:23:28 +0000
In-Reply-To: <20260205222329.2419035-1-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205222329.2419035-1-jordanrichards@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205222329.2419035-2-jordanrichards@google.com>
Subject: [PATCH v2 1/2] tools/nolibc: add ftruncate()
From: Jordan Richards <jordanrichards@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Jason Miu <jasonmiu@google.com>, David Matlack <dmatlack@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jordan Richards <jordanrichards@google.com>
Content-Type: text/plain; charset="UTF-8"

---
 tools/include/nolibc/unistd.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index bb5e80f3f05d..845d10f48fd0 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -48,6 +48,17 @@ int access(const char *path, int amode)
 	return faccessat(AT_FDCWD, path, amode, 0);
 }
 
+static __attribute__((unused))
+int sys_ftruncate(int fd, off_t length)
+{
+	return my_syscall2(__NR_ftruncate, fd, length);
+}
+
+static __attribute__((unused))
+int ftruncate(int fd, off_t length)
+{
+	return __sysret(sys_ftruncate(fd, length));
+}
 
 static __attribute__((unused))
 int msleep(unsigned int msecs)
-- 
2.53.0.rc2.204.g2597b5adb4-goog

