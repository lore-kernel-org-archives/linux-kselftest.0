Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732577;
	b=RccsA05ucogTZ5IefKNxQLXOOssKp9G3aDr7XXCcbMcf7gqv/jNwwkBbjN759GjlXhZe
	 pbGAUjgCtexdgMKxmweYQokzWLAb8VGKfdLG42AhBRdH/i9FgogIXWMoVi2a/MmjjBsRp
	 SG6Wpfkg8mD3Tvp4CCY9UGxZXtInbfYb9ylmXuAr5Mc1r6ekaKIK7ptGa47Sp94zyr4CU
	 4gF1d3jKZXq0axN4zNXYnq8GvSNsIAC00KRyalr2oWbk6fBO+VJ76TTbOvqCgSYmlzfpy
	 6Z3GH3lWBO0oI3CViLJPDayjn03VsdAl2xZL6vMR34hn/4QLQoVAdlIEikUKfM6iXcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=AwKEGtJFDMwjaOZ1EZkaHMhPWGu0KrRVppZGgr+hihkWDGMcFslC8riEh3x6Lupjs9JS
	 6OcWk/IW+TQghSMc8LyotYJuBonSYzIbrnUgTgjUXPohUDQE3QmXeLsNdimPMs3Xzsrsa
	 3X4EITN3CpP7xdOz9s72qXU6BDjSomZdRHZBJOykUvos5l3CUYsdIU5iWB+F1WM7eJKSb
	 YK3mAsmU+wZayYGZY2CfG1SJBsO77AgGjpKNSvON3ECmWAtyVgQ9AHdq+ELy6azbUVVNA
	 D4j8nus8pyp5slXpO6O3G6K9tOe+NiMC/MaYBeudTGLO2PgXu9iEvNZD2yQYIBl8h6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VupFcbpI;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3098606A88C
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3098606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VupFcbpI
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so614119c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732576; x=1795337376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=VupFcbpIug+OPHMYtzxL6kyFSS9B6l9i8X8oidvMJyU3vNpzJC3sMrqmykRqHR8Gbj
         WR60m58rvUM6RNaNwyiJ3IspyOizxODUadi9ud6Q+LPhPcd+pgQMiogHZ4xR9P8PC0KJ
         KKklGkdZbdb1HgXY70f9+etFWcSFfwNaV//8ncdXdvvEl8+Xj9xY5PZtqzq05CIEDNab
         Kd5PGh9Cb7YowEf476VyU4XRcdNLyAPMTt7wJQwR85SkcGM6tv9apDlaAATOYFPp0J88
         H+UJbystko3F3sSqoS3jRcbortHYzKHYJjwTJxvE9ca2WF1Nyb8UCa+IVyb8ezGFO9F5
         +Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732576; x=1795337376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=D3gihk8JQ5/npJPbzx/e2QAqppOta1DjwwtxLZDzNtvuEK2rmhO4xOJM9mw7SBDUbA
         mJFCD0eIB2k3+EifQyhyieXld3xc3agVrkV86ef5aBIAdrRRbSdfIZuby50H9skGEafS
         A1BDeSVnzvP9PuQ4xXlQLw9XBRSi4Qhn2a5LFdsqviGY7DJsxwfdMQLP1qX0UD12/gri
         HDxYDvqLrk9DZORE/DHCoOgFiDhe+NHwf7e4o/2dYIorjmNDffKBD/mLMVUqlANZnFwB
         9ambQ+tf+kVQF3kzolP41x3XdvOrMVRvJkR2VXmQuODjqu0iT2PxkTC1sGgd5Lc5gOxH
         2zVw==
X-Forwarded-Encrypted: i=1; AL+hErHOx+91/KtrqM01oUJFN4+ihNJmioqYPVVXP3ZVfG1m5YcNG4pZNRcCj2WIoJ6NLr9AhJ/aLhKJ3HKn0AT6OW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QemXBJbZQM1kB4MCWqJoRkuUaP/sODpN8UX98GN78ut1P+yqL
	d+egFXRSRkPYHvKDQfzujXKtYzvo5ul4vSKVCJLOFmlEKbtfZJQ0utLi
X-Gm-Gg: AYBFou3FeufXBsJ2E26SyJEEzYAi5K8zGd5lNEYq12+KxhT9crYKymRQfnE+pyROpv7
	94pjJHsDosnstv+KlFX5K2pdFJaCZ9/lJM6Q4J/dOQlCA01YMWaqAZWjND1f018HhHFlri6AP9+
	243MjZaB/apk1ZQS0JqT/1sE2cJ+6whTvZAE6bXvp5rTb88qY4ngmJ6tnsfcSlh9qFCM8wbjG/A
	8ivqKIfeIoZL7cQgSDP4E4hOiNjE1fqDPhglG3zsN2Qj6qSCP1SRJU0X3wl4KP7v/RtmiBcxIZl
	R6uPJP+FpUEn0lubpl0/o6Zfb09QtKHj772VML2IJBGwQcLW1dQ7eOk9hMZdtN090rEELjJaf2V
	0PPXV/FFN22Y927HE6txQ84QyEFJVK22adHNNDWBl0EEdfOpDBSBMkR84TMJ/eisKntu4rALijF
	1tzNYq7LW+OZ6Ca/w2UOQ+s60cUDEfJq8+rhbKbTm0L1LWcaXOEpxyTjSwyXPJaHtNu+fAS8yuj
	8mTcWMie44SoGZfI/UheJl8UvA8vPbVs5gl6YO8pqqnk++Bm7BYsMGg++b/BUqC/OlqIjTd1zM4
	Io6lFv0+6SIOY/3KQpuNiQwGlESi2esQYVzOsdvK+52fz8Md2eY8o5txlPSlkn6Emfyg9MrQxmu
	n0DxGZXPuN1nuXDSSLczBMLSuNwfEJgTrnqpaRw==
X-Received: by 2002:a05:7301:7108:b0:376:b957:bfb with SMTP id 5a478bee46e88-3796628d619mr6973061eec.17.1794732575687;
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:35 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Sun, 15 Nov 2026 08:49:23 +0000
Message-ID: <20261115084923.53182-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115084923.53182-1-dennylin0707@gmail.com>
References: <20261115084923.53182-1-dennylin0707@gmail.com>
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

Dump the signed enum value from an unaligned address in the enum data
test. Also dump a zeroed struct fs_context without emit_zeroes in the
struct data test, which covers phase, an enum bitfield 3 bytes before
the end of the struct.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index b5c90f729339..d6fd9933ff25 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -945,7 +945,7 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
 	__u32 high = 0x80000000;
-	__s32 neg = -1;
+	__s32 neg[2] = { -1, -1 };
 
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
@@ -994,6 +994,8 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
 	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
 				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, (void *)neg + 1, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump unaligned enum");
 	btf_dump__free(d);
 }
 
@@ -1182,6 +1184,12 @@ static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 		type_sz = btf__resolve_size(btf, type_id);
 		str[0] = '\0';
 
+		/* 'phase' is an enum bitfield 3 bytes before the end */
+		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
+		ASSERT_EQ(ret, type_sz,
+			  "unexpected return value dumping zeroed fs_context");
+
+		str[0] = '\0';
 		opts.emit_zeroes = true;
 		ret = btf_dump__dump_type_data(d, type_id, zero_data, type_sz, &opts);
 		ASSERT_EQ(ret, type_sz,
-- 
2.43.0

