Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826587;
	b=iaSb/C6qrCThmSK3M+lfSto3RuJix9WXnLOhB/SH/Tf0rGrPs4lZf8z3bt0AKPTlXHYU
	 7VdE9SxRV09N6k700LwsAeP3cUD5PIAS1Ift39li47HEOcSK9bqsAAx7trnrMv4MO3DRC
	 Fswy6IH8PC+5ZGdDOsYM3sjNCbz7i1pX3Q7WrAa8N7bDlkCsHuiX6H6drlrjoNXp2xT1i
	 JIw7BfYI3hNVeCH/RECawOmWfLxNSXUS6GFf65k/5CHPQvwi99s0Ek/vTewtydybdC9n4
	 7fUWhLrcpBzoeioxW90XtB60JXbC4N6acmVfUiHJ1eA+f0hB9aWw2+yysul3AfOvPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
	b=twgWvFORsrNCbBhJkUMqwm6695H74o+bEQhp5XInTXaQi5iUc9RV6ZaZ6/rPbtCBAqC9
	 WqROgahxmB9KnnYYCnN7VndvZbPSN1hxbIwpPpkP6fTFougf3g1qihmyEI073kX/XZval
	 4HEIh19T5C1ErHWaSP9JZ9y63Eb/gcy56/2ZXrKne9klyFUXBzVIhiOD8+34KGDT1skHZ
	 9n6cj7IkwOL/sJxBKQoyvD8V9R/57Nu349/4cvxTKOTe3u3CMVKLT3vzvGypf+X6cRulB
	 3T1NOiSqLJNWHkqGjESrrTrPxuxRmDTJ9mwJyte/jttCKdpWw7Di2tEmkaRisUQUjtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7oLqT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2F607B9FD
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D2F607B9FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7oLqT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so947499f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826585; x=1794431385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
        b=L6n7oLqTe/+BXJyAs0QY8eUk3qcZ4vKBgAjjrsHHtPP/KqSep0aWbQAdocebtNn3WP
         IAxqjH3uJOeAgLuVz4fvWK55RpMdzhOiSfgCxFoIujsO6QTdMtcCugGgb/8oSwrbE+bM
         /IBGAIAUOj+1sML6BJblUv7SK7TG1mY6pGdcKx5K7StjZUy/yeTLNTIXO+zIrUlfgvZG
         ChtgMSQCZKIM55YIcwZ4W7Ynb+IzBELdo+l2rtFhX78VTxYiNoioHADyjn9w7/0R3ZMl
         j5OVp+MyVkOFlLHrnxPQLDQeJcQg/yS2+Wm7WWD17+8jZ+5d3t6XiXjHnrBkxnBLAF0l
         PvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826585; x=1794431385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
        b=Bcao67pJqYd4xrRDj5ZmWkKgFdPuYP8uahi4ld/nDViQOQD+XD3J7Jjtpa7/4FXnt9
         w1KdZlVc4864gbp2Xj/4+hVkeMrgKL6oNz3imBgePfURc/GatRyMTCHJG25aAaRveNwe
         cLZaXmMvG9w7EIW2wjCjbAeVv7n/x+ZjuquOskqWKoAaHoYt+vWiTdG95EetwvptZNbw
         AYANRgnbCJeGoVX3+fjy6RjWXMLNIgF/4Yn8WMDuq6hOsW9PkKeRCOYGQCAOIwDafMw7
         2PKKzWcDOjKRoIpNgZh6QTOGF4NW19YagONh5z7PxAo4R2NxSm8X8ouPRmO1KsfN4ESc
         BKJg==
X-Forwarded-Encrypted: i=1; AKwUvBxYx6xeUZfcy5on+oEh5uLOYX2NR4RnJASP9OslNz4jWcjQLn984TrnrWdhZYMej6/Ou1yVQYBbv8UwBVIQi5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z//zPrs31ssjW2jj1HGnoYqoRbidV4Lp0+sgm7dxEFA5DIcObPM
	s98EjcA5vFZNTOlYRkzJTBLE49bbo9D9De2HXWUKVq0xUJh8vIpnPE7V
X-Gm-Gg: AYBFou07b06WCWOEXBmcF2+JOJccj09C4y+JmxtlJC8ZR/rBoNelSWqX3c+BFZuiYqf
	xGdq4SIQNfRSCUw99a39hDGjjk6X6gVpynD321fPAdAFItuihKs0/InVv6XwlriFYUfvhVtgrhw
	s/nRytUSJ9wGhmhDP6PX5gzbEYccExz1ZR7U8KhubYNHELC6GVZW8E1OgdfXEF3JdMkc/0gVs+q
	dLYRgCWAruvQwoh1HhG7Fp7fx809wyd02iiH0NbKutsyHAH1qyNcKmkNcE2rwAarOZsn9ki2L22
	2O8CLLnSbDcawvw8Er7dHGewedbdtcf59zr9/+eHNErKKoIpmLiFt6IpcmAzmLmPGBi362Sgxyt
	7ZbJQwBaMwIyM1AbbWYm3eJrzjlWmkI0So6FOeJrB6+x0DpCpyl/SHKWnYYHz47NqI3PccHYOL9
	vvMVmeOma55EwHtWD27LSdPXkwJGts+X9zvA/CZ6DP6jBitWD2zucUVVVaL2cvOxasld1FbD4e8
	92foQCE1fyIdpqJVHLASB6wmO8LHS7cf4yPk4HhdluRyXXKuPBM3IthfbajPGmpA9p6YSh3wG4e
	YRKVNf/JPGlJSETFWQPpH60AcvjOMQIHUTaYKYe3WMzYGaXHJB8Vhw==
X-Received: by 2002:a05:6000:2c01:b0:48e:7e15:406d with SMTP id ffacd0b85a97d-48e7e15413emr30075956f8f.11.1793826585471;
        Wed, 04 Nov 2026 13:09:45 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feea5d4e4sm5738727f8f.57.2026.11.04.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:45 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:09 +0100
Subject: [PATCH v2 23/27] selftests/landlock: Fix stale comments in
 common.h and audit.h
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
Message-Id: <20261104-selftests-refactor-v2-23-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

* _init_caps() lists more than three capabilities.
* A 64-bit hexadecimal domain ID has at most 16 digits, not 17.  Size
  the buffer accordingly and drop a redundant domain_id check in
  audit_match_record().

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h  | 7 +++----
 tools/testing/selftests/landlock/common.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index 173dcd1088db..d23bb2ad3a30 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -274,15 +274,14 @@ static int audit_match_record(int audit_fd, const __u16 type,
 		*domain_id = 0;
 		if (matches[1].rm_so != -1) {
 			int match_len = matches[1].rm_eo - matches[1].rm_so;
-			/* The maximal characters of a 2^64 hexadecimal number is 17. */
-			char dom_id[18];
+			/* A 64-bit hexadecimal number has at most 16 digits. */
+			char dom_id[17];
 
 			if (match_len > 0 && match_len < sizeof(dom_id)) {
 				memcpy(dom_id, msg.data + matches[1].rm_so,
 				       match_len);
 				dom_id[match_len] = '\0';
-				if (domain_id)
-					*domain_id = strtoull(dom_id, NULL, 16);
+				*domain_id = strtoull(dom_id, NULL, 16);
 			}
 		}
 	}
diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 0df8ae88d4fa..66d68a92c6cd 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -36,7 +36,7 @@ static const char bin_wait_pipe_sandbox[] = "./wait-pipe-sandbox";
 static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
 {
 	cap_t cap_p;
-	/* Only these three capabilities are useful for the tests. */
+	/* Only these capabilities are useful for the tests. */
 	const cap_value_t caps[] = {
 		/* clang-format off */
 		CAP_AUDIT_CONTROL,

-- 
2.56.0

