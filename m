Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816136;
	b=Fhzn8mPrTHuTlMojlyEuPU6fEv3u6B9//GTKcdNS3rGEswHzuYlg6IS8dYgGwjRJ+B6F
	 UPRwy9W+o5jLRmRbJMDEIKm0gOgEn0pV3ERfED+gT4f29pwfAAduL6u79VDM4J0/Nq6XF
	 Z/qxg48SC8jJtSHZmRMZl5CvnzzU/L66Vxs5fzRW4xm2Z+XKv+ngygxuCQ2MhrMz+wZvB
	 XrJ2kT+SVVbFI5b1moiqpfOrK9C6LSjnbXfxnr32hMAlhOgg3gAsafgkJQywYdXyuMNDl
	 cjj2cTapQyuTg53vlDE2Ca/lsNfj3HK06zlStygBeX5E3zsSq9upuJglDd0NzA+Ar9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=X/xGzzXoL3VHtvyBsepPfRm8HNUFLVwTnvUiWCuy0oIBNN79tA0JlmuEEak2rZL5R17T
	 QK9zIqCNF3PI3ySBho8CZAQNCiP2U5SdlJ2YFCTpUOX4rszQ66mC4D2ufSSQT6NkL+nAT
	 wNmwIdkNKBZcajyPjeq8twsv5viDVu6nIIFpq7H4DR4RBU/7keDc6dLQIN8LemTz70Vma
	 BFWYnRZtubvomL2qwf0E3Dn+D0KzOd1kTZb0E9E8VjulBGdtcXq5ykbeZpZlR9pWxrp3M
	 KDM5uZ0sDiggvUyqbgwXlEJpln2cDt6F5lVWR3V71InUW+fBLKnkD4/lpHN4XQiI2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljwpme0L;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA5D606A33D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA5D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljwpme0L
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so637187eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816136; x=1795420936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=ljwpme0LQVKXeV3vl8q5H9ZscOlG+KxJ5e9vY8+nkJB4ivdBNlbTM366T9nOWo9/42
         jUi+q32tUIp5/HrR9lLe/28SOQe2SO+p8LWgPaELukXX2MA5lX3iyqrlJ9oQACY4E0Zl
         3dAOy/Ylb2i8HGGfAhQ3dkbj3Rz/oXni8NHExqvw+kLXHzVsEhJRwuucg/v9Xg9fTszx
         isGemQmELXHtTCtVazPEaLTowh7pzAxR7HIT3WRkrTIst7c79EaRRPSzKyPAcD4KHW5m
         ZY9GaowWCwFz4bBQpcirowYM1TzwIPHeG7FjvkLKi8O7y3b8GUmtTYc0tsmuFTcdLd5a
         gt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816136; x=1795420936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=ts3s2MnWud+ZsMlGJLWS7/Ar+9AVQ/l9WsX82Vf0Z5APMRUBGlX74u8ftlpWGkmPwE
         tK8wMjLgopi2MBPW3fCrHn1Cepp03p9YL5tPtZ72YIqc76OU9r+LRTfKxo/2tuexI5qL
         Kxs40sAvNEMKh/L+bwyhnk6Nc7a8XPyjPW7h1yLiGMFruQ08/BWpXpIk6ODg2WLkAtVx
         U1HmBOlicgE/6S6sFDtWW2NoecJyCPAgi9Rz/R5N2m28vlezgLBrqF7QV8c7oUXqN1Ff
         XzRm4lmuwtEndM7EBdA5nPIoTGyA+kRdEr9zC3PWHZu2B7oyAFKQ0gD1658WbjjPGxwT
         fDyA==
X-Forwarded-Encrypted: i=1; AL+hErE8jOK5Kes9XRd560LmNxnn8ITMrUstXuSuUIaaCodAJvBb0MmydQHgYrWGIQk1zaofJe6gEw2lZZpYhKHCJ8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ulhyAdBQBQsXyOH4N//sRK0nnKq4ng3k6ReyVIbwOMPtwPvMW
	sWj/VSAY7clGDWeqotk1asrIw2BE/6G55mspHicUB/XZqRRaXYNAQwIH
X-Gm-Gg: AYBFou3jYlkJsqPwfmOeszKjO8xjODIzz2kTIlBxv8N4tJqWvuejus2qPMj55Pz/1n4
	APFzPMTnCetM7PtaPQoFImxCAIMDv7vFDUtAshkB3BxEtkw/VWwxR/rDkF5J9k/htm69qU3dXcf
	za1vEaaq6tSEtP7wN+eZL7QQmIDkfC6gkGUw2Z6DC+I7EuzsrK6Zuvys+z9lbg1WrJekfrTxJpX
	MKE7hW6NHUljyqq0z6B8qz8gPN/jmyNmmy9BSWTv+u7P3Uzkqr4AFpkDoeDbQVSk9ACXVfqWVFa
	0EO2Qz+jHYzk9K7pCvEI8WJpB5Kx8AM1Vyfa2QzrTtkFkvx6xNrnY4fjzQJUTMHkS+X5W0g/SpP
	Vnr01sYN+5DMyuaoLrHtaMZCaqKDFtZE2U6e8u+AS8gRLCrOcUi2MZvUwV4kQZO7AA25LzMARhD
	e3QNG3l8hZnF1KXGJV3XW0SFTrTynMbc3Rt4rrxoR98tit4dJ4KmqhiD+32WKxobu8xwV3Q9g9P
	rU5VCneR8VDWMK0zj0x+3/AWlYyR/thIssQtbhEzUvlCXttrf06YqOfC52QCh57VzIFqLgPD5bh
	erymR7H5MlPvvw3ibxvXI6VKupScKhetJuwijFyRe4yh7aIB3f9nbbvXv8cmUOySWfl6FSMzGHM
	RjSyPzu6ltjEE6JAXMiZXkUQ3wOFJMJ0eQh/amA==
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3798df3d361mr9286131eec.13.1794816135593;
        Mon, 16 Nov 2026 00:02:15 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:15 -0800 (PST)
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
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v3 2/2] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Mon, 16 Nov 2026 08:01:51 +0000
Message-ID: <20261116080151.44860-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116080151.44860-1-dennylin0707@gmail.com>
References: <20261116080151.44860-1-dennylin0707@gmail.com>
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

