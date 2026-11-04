Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826537;
	b=BljlzB8kPYrZcW6i7BCbRX7TBRBa0k22vbGpgjpLbKopuDqTkwkYxfmvkLDT7QiGhGAa
	 EqgDpVO2ySX7nZlRkwtsF4gisRFbAgOmGP3l6tjesgufzAjkNhWYRW2obcqw+wuUsgJNU
	 qdjJ6H3Vz8Sut+xZbaeoKhk6K/XR8HZfN0a1nXUyXB9tPZmMejr47+iLk1cCyJYGQFCyi
	 zj/opnXbr4Sj38HmQOyRcdAttkpZpOPa45YCCHiXYC4PAICzco2srJ2eqWXaaIJMwcSEj
	 MmosT1rswHZVQ3lTg1oQrVoaRaYsx/+NTCfJZQZzKFV+wyB4SMPmfIfjGw3Eq56owMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
	b=bjMQU2c+beryl/UX22j29T7l8wYCNVU2YoT5KqudvEXKtsduPzPrjDtmyI7v5mjY7rF+
	 WLHOXcKqjpe8iBQH4wgUYgLq7Azp2abKjgLXHcBxEyVzxa1Nf7w69i2UF8+9BuFyOTfBN
	 lkSUw9NJxr36FR0F0MYfkshBfXxZFHnxDdlfuuDcWMrM/WidslVxYdDywsV2sNIeb2K9k
	 KqTBUgsWj8OlOE8t0lBCqyfE1Uejslq4DOiKk0eBJ0XzdaJD9TmuWAFjbCNsFIlhmnE0e
	 IVzuNyD11pnbdOEuT+SdlH8l1AIDkf8eFK1mnNJ5WAYrcISKTEmPnsRA+qvcZ5T+NMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCK+qSh7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C1607C0A0
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56C1607C0A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCK+qSh7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8127925e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826535; x=1794431335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
        b=tCK+qSh7U0Ie38Ckd0J8m8GPgrkpDTds3ChR6Mv8zezfM5a5WNdKJTl3RXMkps0TEY
         MpmFiAYXr5RBgooFn0Tkq94gK8tV3I1ZBWv6SpXovoAlFVyjez2M0wjaVHa9ixeK6Lmq
         bx3++ublClyuTJTPsutgG5iFtyU1kV+XBKJAtsv7enmH5vYNwNbCykZtWLyQhd1PzjFh
         yzXiOkDKx1v8UyUzuHpJ0iJhwAXm+K6r3lcDk0/bhuvOBqZq7zjgLIWCFW4R2NymR2ey
         Z4oFw+TaPoal+ruZ+FQqUHSAkMsxYTewGcVezdXu8TWNHZXKEawpTt5SQtOf2g6Y6oDp
         CI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826535; x=1794431335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
        b=f3AbgcRW4PdrNCyysrhh/j0uqdISMg1MyBkurX1xnKeYGGPp0yUkNrUGJLmNDEwRzB
         /e8AcXhbFrQoiL1KMyTRA0ToCkufhE6RP5ms0qg0vQBtVfjq86aN67GNI0+U8F5iaMDR
         bS3ks9FF4TI2WPZrCQLjQYRo0GkFhAc0CeZy2aC8zkkU7dRNjCT9ObTQED4k9DgdVYW0
         C772dS8cAEQNz8AHlr5nF0wYu7EXGPZN7GSGyyxB9Iurl7v5bo3pr17JFH649BP4WlQc
         h44/gpiYn7mEfhMmzHwDukjTi4ZD0iqAQPwsQ9NNKT//SoW2V39DpyUkLHtKYX2k6Ea7
         cWGw==
X-Forwarded-Encrypted: i=1; AKwUvByzS3WdIZ0dpCxLpzhYm3x8EKUiP+Ho8L6w0UF0x3YuBwE42CXeZhPtFuMONL2n6TkkW01V+jPxLzc8F9F4QJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Tp0+MJSMUDByMUjEdVfK4+MwwFyBClBYyv4I7k0zHPwtE78M
	c1twb5IlcsBlK4T7/tRaX/1rAGdAdGG16NQzsGli5xaV8tW+f58HDISJ
X-Gm-Gg: AYBFou17o7f8fv2pM6PfDuj4CA6oEN+qU8HCbLKgt5Wyo6FjgQAtTZL3bMSt1VYrrkr
	ByuR7fRYk51ejugucMxCspJKps2a+4wyfRUYfXJCv7d+6o/t61Qo6PCjPxGlXX58wjkdOP/Iewb
	BhoMYWmUN3Sqc8bz23Pl14GxXVflJ2Gh1XCjTwu4fJy/ryrVjW5SB7Mhcnj3PIgZk9jC8F1rHDU
	FbbA+Jn2vnEV9yjeSGhX9IlL6pyt/ezGsQPhJATWrOm3qdNRKQ3XCaprpcxhqF0Fi9ZwPHZRG5u
	t1ZorvAxVaE28sSoVBtXANXgF+xW2rIkwsSj8ChOEm7fiPWowHXWpfthCpgzH8TNkwhTyqvqWRl
	zyqi+2PyUWK1pQIKU663Aw8SkO/s/8SIoxfZi0t0YuedY5dmtBgKImm8JoWiztf0R2ITe/hoaP2
	q51dMQpVWoKbP1IeFEkoPu7Zh86fPOl8Po28JVrFH5CQeHKv0sWsN5Wxh5e3hyi5sE9IMk/aFdT
	K+L4NAK41BP6d0sSzR4n2WdgLCAVVNeY7VHN2aKLVTR9qpiISigM8+eiOzxmRdGRuZWxWG6glcH
	a2S5U/QxS4oODfdiM9WYDZ7PBj3QGeNZlXsgJTGIaNWPL3OAVQBh2g==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr414738865e9.6.1793826535182;
        Wed, 04 Nov 2026 13:08:55 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452cd020csm81378775e9.4.2026.11.04.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:54 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:47 +0100
Subject: [PATCH v2 01/27] selftests/landlock: Propagate grandchild failures
 in unix_scoping
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
Message-Id: <20261104-selftests-refactor-v2-1-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

scoped_vs_unscoped.unix_scoping starts a child process and a
grandchild process.  Add the missing check for the grandchild's exit
status and propagate it upwards.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5dc0debacb2a..e006dba61652 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -608,6 +608,11 @@ TEST_F(scoped_vs_unscoped, unix_scoping)
 		ASSERT_EQ(grand_child, waitpid(grand_child, &status, 0));
 		EXPECT_EQ(0, close(stream_server_child));
 		EXPECT_EQ(0, close(dgram_server_child));
+
+		if (WIFSIGNALED(status) || !WIFEXITED(status) ||
+		    WEXITSTATUS(status) != EXIT_SUCCESS)
+			_metadata->exit_code = KSFT_FAIL;
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));

-- 
2.56.0

