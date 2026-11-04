Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826580;
	b=t4VCUdVTWY6vjl2VZQfi/tYU3f8iXCSi3er1u5Jji66JP0oFN+S38Ka7PJbaPNBZRLls
	 P/gR594QrzGT13lUHoTMec7NMLTj0R98mOg8k4CAoXTR1AddGZrcHgvh464tfPn0ciUaJ
	 mzgYdWYaGXl9fzrrdDYsxW12UuVTu88nhH+nFVMobeanJNDSbv5NitWie/MNeonxF06bP
	 1K8GW0Q66+GFd0JagyuBGAKhih13nRBqEnWMM53kCgMZ86WDaTJbZB3Zio3W0BF9RkmM6
	 RpCnNbbHyWguTzroUeqRnJe3sgKttE2I0pOhmEiOqsu3KDQsUEzVXzIdOQ9poKYcxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
	b=jRUZsQ9yu6q/e9fRYRR1Yl3pc53VHpFoqXSZdfxk3Jul5ALCDba1SscqN6hvjKn25xrB
	 dFesubEaFqQsAkMb9UdGwfot9bGVAg/Wl2Vit/wP0e8ZjHE2L77Xf21rx2FCWjJS1zuwD
	 664rAOK3AIhFhMiWt6uEJFaSjNZz4ep+cjVABEkTdNw/+L1aTMK87fUFEtEYCX0Hxrail
	 jnQmrMIKxVhpC4GEL2Ibc3adS6IL6TiHrUclF6gisSQ0/JIRhcX8JT2dSM2+GZ+xWiDXv
	 JFIn/Fej5ktaiY5lrMpNA/I4RD/cDPOdzA344EkQh7/zdVhg09G9e0YcVOS9EnSs1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXFAr6hb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F138607F2AE
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F138607F2AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXFAr6hb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e4831c028so1103491f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826578; x=1794431378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
        b=nXFAr6hbJNZyEpoDanjCPM43/J7m0ZqQCSqGipufmLsCZZ6TvVZm6EJEwQ8nJUIA01
         7RybbeCmUtHjEm9Buh5mJuvj7vpQSGwbjWfGEzLn83QIRLmdv6Z2zJuErj9VK/vDjrsJ
         E4pLs/k3VZbZE6Q3jpGN+8CoQdZGKJLXnZ+sNJo3320QX9k1WjDEQZZgZE2X6nJ+7Fno
         YoR5UZycfuWGtjqAfJAtIQtFhwdWYbrkAIsAGoKPPP3I334URM/Cu8BrP/X/StRGi1jy
         95dlPE5d9Oyw8OYyA6hXzTcYyuLw0cY1o6gZ9cYPZmHIy5Xtc25SPKiEA3EaOSwdyn7J
         O5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826578; x=1794431378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
        b=gM9osCA7MorwB19n6VroQS+3bT/U5kv25eY7RB9sRvUjWUE+pLnoMVBsAOuvq9R7xS
         7mjSvgPQd2jsSQwX1tNeVCHQFrlyMU0AfeS1TN+iFn89MhVK7cExMHnRTqbD0DdGtlZb
         SL8XhMFqJpzYcIDbcd+0+CN/M7i2tEdbjZ0d3WbNdjLzoyt6wILzM7ss3zL7KRYMKOxl
         +z5f5nUIAOB75ULSgsqCjNXLCOVItbpK/jXZT+WAr+FUcgClhjqIcVlcHF6Mshad6qZB
         yqwxxBaGvp4agkaviFO+TNhTLzAotHg7DOkMMjdAa7PQQ0aLEvdF0gmJX8SKWS1+HBfr
         5DMw==
X-Forwarded-Encrypted: i=1; AKwUvBwMhob/j7axwA74ndO/OsVxi+64sAKK6OQZOzDuypfCtq7oHPpI28UXlt9uaZfD6CZS8d2s4V/fP3DWZZXaoIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RqzMDYXViVr4b6CZqrdf+KztF2ZmVO+b5Pq5vyOaI9D9kdMNx
	ZHonXSGptQUj7luLsT4Yz9635pdG9/gvS+gCBJQDkOE/V+rxVaursgbq
X-Gm-Gg: AYBFou0U6UDbw30XL0BSkJay8zZexoifJ4exLE3q5678fy6VNtSZwHx03iAXpTygK2u
	ze8m8aB8gdP5vPo4fYqEJh4zKdbndoBIZ0Ts8wd3vU/CJy8x9Sdoda90DC43mvktKuai6rieWHD
	tzCxvn+aXCudZnemtQR8IWMCOraekxgFbKGT57Bl+Fo0Ki/9Ayr4WpepJEA9dGEpjKs5JGBAbhI
	Udp0b+exuAqaEWfWM8IZ/mcXwWspZ4kKYwiuJPuhZ4Ew7Iv1ZJfE5ZKQkwIy3lBby1EY9tKewDh
	NLyUHrTkBICaBK/ChdJpe3Ggics+NfO9vuIcYO2yISw/jBvv7mgH/AM9QyRHzTeH9hWc2xyJKSI
	B+yZBTs4e8Zzcp35s7LLK/2+In5RSZjyJjCH+AJZrzyIoHtLqUcC+SHa73RwnJyFPmo/J0r7w9x
	IKTZbP0Rt04V+lm/jdrt1CD48HDXlBerwhUUqMcXlDzOH9WGWbx7+oJAoSg/YrTme9zPyvz3i+h
	qcOARfrdjs2MP35BbHoeyveYURQRjQcpt/CqIG6vsV4MNbX+REvWuwVv5wJrBFJxLQnwETLb95T
	3DkWtXxUaSmCb73O491a/TMicszgFKZDxWn73pTEFR7udxAZvfoRIw==
X-Received: by 2002:a05:6000:420c:b0:48e:5acf:48f8 with SMTP id ffacd0b85a97d-48e6e302726mr38283835f8f.16.1793826578564;
        Wed, 04 Nov 2026 13:09:38 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm5726190f8f.14.2026.11.04.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:38 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:05 +0100
Subject: [PATCH v2 19/27] selftests/landlock: Fix off-by-one in
 regex_escape()
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
Message-Id: <20261104-selftests-refactor-v2-19-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The final check in regex_escape() was off by one byte
and should require one byte less to put the NUL byte.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index dcfdcfecde86..0df8ae88d4fa 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -307,7 +307,7 @@ static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
 			*d++ = *s;
 		}
 	}
-	if (d >= dst + dst_size - 1)
+	if (d >= dst + dst_size)
 		goto err_nomem;
 
 	*d = '\0';

-- 
2.56.0

