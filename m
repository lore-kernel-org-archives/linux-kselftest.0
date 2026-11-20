Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135886;
	b=3h7I5rDPHJXqmgjyOaEoZJcsZgnwo2/BtTp89NuQDckHcQ0M5zVZhGE3CunBqbS/1vxw
	 PbLvYiR3Gf+lAZEFXaF6ZiwO+PiS2RCDjKRgtop/m1m7JgAH+4gJ+K9RkNpRk4FSiIpLF
	 VRUkcgdPUXouEZs4i0xH9mLT4KmkpubmiKfWExldM39CKAHCcojdqWJdHx7bGYRAPblBC
	 YACa1Z4ELg3AggqLYYnuLiAgNrESwNhV7CB9FymeN2ygM2UStt5exxNaYKv1+dZl/EGoj
	 hgDu3igZS2NIlqLaig9ykAinOyow2ItwgBn2MmEIAdhBgk0Jdkpfd2IGtYTwA14aWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
	b=ak/uRPgG5a0AWDRwlXt7M5ewrrAdwpsAn8du96d1RpMKzlPifPVYeeMh0TkAwfOc1P+S
	 GL6OWNEoxs4MI7QCO8ZHyE16hDg61keUARGk07LyxQwDd5a0ecCiybNo0a93QeCFd54cZ
	 jHyu958O2ZHycLUUd3PFBem+QOfTWEUUXorT+LYZ3OUJJoB5X2cmE7Np+UCi+YYwKeN3E
	 EX9wkk4o3TLcmT/3Vobu6VMkyIaEg+nfhUfOdgV5VVki3cI2/mXmRoGvo4zKfDZQrnONR
	 fLXRUdfp/pO7xycIcMvFloKv6fncuEwH4QsUMy+GXp28Xs8X4mqkVyd3Gbp3rNFJrSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730D606A330
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1730D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQdkukrh
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so3572f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135884; x=1795740684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=TQdkukrhBBkFfoTiiiGJGY0UEZ4/oft8+p1wL+VxvK5DACg9U7lVDzr+Ce6lOSv1pb
         TuL7gj5RjQnzw+wFNjQW5WARPqC/lKaRQOuyUh4T3NJHJsT8Bo9KBHLJW9BxeC5SZhJH
         BG4UhRJBmDRKLfKRb3cPYz3NHbqBv9yCukpO4/6L2L4HAr9b8Ny59pH5q3EZF2dnnpml
         mrnplb17wZXRZjec42lZ13qhKQVOL4BmSpnIBiRAr3ilLfRYKrPLzI+brj8Ack6cZRSz
         ZWIqm4sGSGLEkK7NR49xzqPeZhq5ZBMJUsGaNvE7tGeoWpS5t/l4VWQVlwtpnq9BZ0Ck
         uLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135884; x=1795740684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8O/N1Mv6d2abG52ExtYvgGkqCuCECcr9aNaSVENX6E=;
        b=YP28jGRE3odT8UrrGdvI6m/f/T8wT+h3dnDAI6BoP/kFMrw0ftJsnCkuX4kXbYLEjp
         H/7bqW/4WmWTgjdKbq8eNxos9J9XA2Rddf7FV+dLpHqSg9F6sCDdFkeiRN4gZDgoca/v
         JO8tgHuPqYqFEr8jHLrGUClCoT3OsY8tKPHjprizkwGcZdgAwxQ9Ddc90MoPFboJLBTZ
         rhyJYceFWGGtiLv7ZVIBti0+/Q87Mhob3w41MXoZL68uUrwLuf9OO3UdoCdzKoPfm5ou
         o3c0PJbmbfsIrLVWpfwgmtvcCUPXlUjzXZRE1k/0HCbMREUcyZDA30eAhOrjEwofTeJw
         o/Xg==
X-Forwarded-Encrypted: i=1; AL+hErHw/xACrS9ytsypRdCo6nSmutKlFtMefhDkrelhUEwDyYVLTH8tCQhKHF+SDMVkRZgjrhKpRZ+qwnNjygpUtM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b8ZPTR33lARF3iHSm0ZPD58+gT5j/xMZoRvkNU2bKuvgJL2Pw
	t1VNPGaDUq2qoXT//J1eEvXvat+4HC7wOFGvq1gFbWYoan5vjPUq1Ml94pprNVbqFmP9fA==
X-Gm-Gg: AZFdTZernbEYXJknlPbQ3xsP2jhjaNl9dhm10pdZXZekkVzwFFYCJ21L7AsyBafWXvL
	hIskSnIgE2jBxTfWGg6UQnEcGttBlN4Ueo3y2yQUUJqepYapRH4ooacm3og7c+Mc8auTYCqMuo5
	8SQ5RwzwX6CmAoVkeOued9ocPHG/TsUQXAwfSUI3pi4CvO49hZRcJ8pIoCYGXNOQt9ldk1F/Idq
	2Fl5G0xjFpUzz7mwX43i1KMTjsxX8eQnpeZBCjGSQWm99hzU+Os/Jkpyoh1oX5e9ONy6U5iJFGQ
	7N7/T2JjCuI4ftmrhw/pwEhPzJagWERLunxf/n1nU8FRoBFCyj6GVdwHBDQ3Rm0hZZ6lK/eNWx5
	pOfZ23I18owrLqtZULwftcUFDJysszFtydTO4RG1d9PfAsWoAaZqXEwqz7KUr1VDeOMjYpywD9e
	HVIqZ1lHvja54ufxuXDvSIve9VFrt47VWbnKFnDmx0Z90BarJwDmuOFaXxDzbocGxFFJhvo4IkJ
	lUG0GoJUFf7ol4PMA/BH3hJ4DE87/LDcmq1Vrg5u42J0G/NB3dY2d35SPJ4O9mkf32dq+m6r5eQ
	c4SxlmaBt0aoQjYOJW5sWYuVuBfjpWwXXv5/aOxl5vY+mi5H6W5DRV9gtJERz6FnZ0Q/2zs52w=
	=
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr2128827f8f.4.1795135884298;
        Thu, 19 Nov 2026 16:51:24 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.222.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm2269315f8f.20.2026.11.19.16.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:51:23 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next] selftests: net: socket: fix inverted failure diagnostic
Date: Fri, 20 Nov 2026 01:51:02 +0100
Message-ID: <20261120005102.18132-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When socket() succeeds but the test case expected failure, the error
branch prints "expected success got err" with strerror(errno), both
backwards (reality is "expected err, got success") and stale (errno is
meaningless after a successful call). Mirror the sibling fd<0 branch:
name the expected errno via strerror(-s->expect).

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/socket.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/socket.c b/tools/testing/selftests/net/socket.c
index 9e270548dad80..7f075acc0b19c 100644
--- a/tools/testing/selftests/net/socket.c
+++ b/tools/testing/selftests/net/socket.c
@@ -71,10 +71,11 @@ static int run_tests(void)
 			close(fd);
 
 			if (s->expect < 0) {
-				msg1 = strerror_r(errno, err_string1, ERR_STRING_SZ);
+				msg1 = strerror_r(-s->expect, err_string1,
+						  ERR_STRING_SZ);
 
 				fprintf(stderr, "socket(%d, %d, %d) expected "
-					"success got err (%s)\n",
+					"err (%s) got success\n",
 					s->domain, s->type, s->protocol,
 					msg1);
 
-- 
2.43.0

