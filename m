Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826557;
	b=1YeykdjZc7cppOGF4NCmxFrdBVas9oM7qzXsxxcC+i7yehI8AZPS+TLK5ql6XeyfIoBC
	 MNc7ZNvV89+ucr3b3F2lXwmQmuWeYs9RN6WAdroVUU/GltWpAqThywEcevh/f3Fi+4JCw
	 tlc5xPknzxG16S6ynjTt/MAg88nbkcsJjur2kpXquGFGBrEV0c6A0Lay6DWCfBy4z7xmD
	 jDwLXOrPVx1Z7phpRtTJ28uka6O60i1GDT7nf3HubX7vb1W39alCoJMqJB6qff3FJ4ULC
	 ZNCJCWrDA6NuZSmx8qSOyXe5WILJm+B8G0VZOaSJ1Qygbp2RbDIpMplzA2V7YfVc5VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
	b=NyrM/9PBThiTIFbJZyUjkufkIVUUUMT+js5tNjnBUTWvTFLjNrnqsEnGD/rIxGXQbV/g
	 HNKsU7Dki1e4djUWjXaHwXLE1iLY9Xx7zDCPju3+UnRWK68sTGa/1i9inbM648cZaFzXz
	 U8WQxWyJlCUzDHRvvnLZmCsAqyEnLqVAvIhOpgf/yPA86z9jKP4ly/NGuw1/rszbOYAHV
	 9/hngJyzK2A+XbBoRbx9dh51dFQB3ByEGrxEXk/APSB0KVZvAhup/w5YEP4JCIGzQIK1Q
	 eM34m9lEvK1HqbMmZlFWjQlCcWVhmQrmdhsOO9sx4twUzM3d5sf9HAk04AwemxdSn5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oX++8FJC;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F1E60A6792
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F1E60A6792
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oX++8FJC
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df54150dfso815129f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826556; x=1794431356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
        b=oX++8FJCCxku5U+GQGQw67eK8Chub/aAMqjWqSwhZpapRvc6a9EhHorokWblRDuge4
         t4GFnaPogsTp0+y40uf7V2jma56d7Xs0gWQU9vWXT6wn8V2kLxnCnzrUDc2T3Lwrc3/M
         a6fq+xBg/NWgVzVFt4iwMl2q7/jH9ObyoogHUZb68+auN5UKzXczZ+UWVawnVLQnbRMI
         JDbGnLZhQsOxBTfiyquSmf1Iit/haHWA52577F/hZCVJbKeFcqjFL0rrXpbgP5rBQP54
         q7BdXyuzgctp+4V4sLJJeR96bPRG+YZ2w9gWAJ9DI4Fbx7uwSX8ZCSai4doqpvTsxgYU
         +qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826556; x=1794431356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CsohqMXEeTvUvBbDJ6gCtmQRpYFrO8ACh2vQp2x8hk=;
        b=w4UkDA35IdAmjV0Bw1rqhfX++DSTe5wcypxPJ8vN2TgLNyvtGOzKBtN9WfapSGrfz/
         M+h1tivnhM9Tf+K9HaX8XiPvXz6akrUXuear92YiAPortviZvFrCKHSSeKNDip2zNALp
         Cna6nuR4QzJsXQoRTZvKZoUhqB2v4icCFsPCdZ/XFUJ4rCjZNXcQPFB26aZSBfaLHhCe
         niIzaOj1lE0TTKmZN0EqT4jOf+KEG7/pYM/nhhz6pm9jHPPjlgrrgbS3KRRaG4SA4Sze
         bIkdI62M7H0P4EAM2EHLUSmTyOGcb/Ps0unmIM3R8N5h4xZBdd2VyHkES3vFXTNYMPCW
         VhKw==
X-Forwarded-Encrypted: i=1; AKwUvBzEZ3wCohtZ41/3aKWdKvrTsIcv2PmvddIeO8IxM3UgD126iATL84t1HXdxFMfn2iiY6PR0r0VUutpLSnqIXs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p5822BGR91N6pLNWiiKM7QtVsSp7rAhzwOS7y8PlzTFORr1Ul
	W58oM68pyCONJN92ak6GZhosSXBawBMoE/W3xbyCr6rX18++IE6+881L
X-Gm-Gg: AYBFou13VE1Ob+PgEl+SURhr++OErKGrK4Q2lhnLzPPpTwG3TOmbqRcWjhyY14OsQEO
	z8KbrN5qzgBxpMusQsumVf1F3IFWs1ijsiJKrhqdxzFcailP5Z7EUnmgLTeYMpAHWvQngfFRIw+
	voUgMytQU+sursYJcvzsWkT9/+++7fQx1ov4sSykaTMrfNFBAA2tQlbRfrqXPzdGyYg5Id1DYNZ
	btHlVL+z50fwLJGMiDdr8KxgZWpp/TZY/Y+C/KCzSuklfylpT+c8npzY2l67JOKCXWjwiBr0uzF
	KlrXpiKbf2YgJ9Qp8eXuWZvdhQor9auPSZKrKucPB26bvCf5M9N7OPMK/vTMlBkewdSqd1Vm+Wx
	xZj4lYXdB+Q1e5TpyQruVpbz4v97zesR6pLbtXc/aRdXXMWY/TfJfxoxx0qOVpb45xeZgEiTx1B
	jnQQ3VqUcHlCKbUKm7ZN+1DYuD5ZdPHT7y/ypB915Kr3IsfpYWV2qtV4duuedhbfBR6O+P0NeAt
	d5k2C6956QgW/EX9kynP7DtoSGpUBjkZ4r4+R7KJo6KhzD7ssQFpiteX6QPL/lH6wMAnScZeCti
	WJ1syG03ic4f7c6dSZrr1NiDjzpoVDtt9X7ViOH60g6W5U1s50y6fw==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr42004728f8f.46.1793826555914;
        Wed, 04 Nov 2026 13:09:15 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm5654092f8f.10.2026.11.04.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:15 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:59 +0100
Subject: [PATCH v2 13/27] selftests/landlock: Fix memory leak in
 audit_init_filter_exe()
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
Message-Id: <20261104-selftests-refactor-v2-13-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

audit_init_filter_exe() does not free the buffer returned by realpath(3)
when the path is too long.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index d428ce802f49..1e533b4e26db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -507,8 +507,10 @@ static int audit_init_filter_exe(struct audit_filter *filter, const char *path)
 
 	/* No need for the terminating NULL byte. */
 	filter->exe_len = strlen(absolute_path);
-	if (filter->exe_len > sizeof(filter->exe))
+	if (filter->exe_len > sizeof(filter->exe)) {
+		free(absolute_path);
 		return -E2BIG;
+	}
 
 	memcpy(filter->exe, absolute_path, filter->exe_len);
 	free(absolute_path);

-- 
2.56.0

