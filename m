Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655556;
	b=p/TRC0eAyGBXfZvSO5uojlDc3PUTgjLxSJ5cMoR0tkD93Dpjw4hh6ZwaW2DI+lVgCOqr
	 8ORisVre+uxOi9svCRBAOBZR5cIQ6cTZKhTr5LVlDzHZp21doTBm8tzhsi4eonlnbiSwA
	 QSVgCs/jDfJYXWcOR49JcqsfRlpGAdoPAjEu71HnZujMhN+Sr2c8+rD5qY1JFVqkuPEk2
	 bIeb6T722CjC2Mo1M0M2eweL8jwY+r8ilnf54ZO3R19v+pndBRyQw8phBoMlycz4v3PKw
	 jZRINL1B+96ef5BeSxDAqLyrMvmev9rcv8h1QiVcwPZn0br1XlcIbpSK8Pgv/M+5TdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
	b=w5IxHoSja+SaZscr6+uZIcqinO291UjGutx5aWbC/o+FkWLZY0aM1Bu3ULWap6Xdkuiy
	 3OU5rTKrFfcAFrasRAQyvejuy6UlB7pTRI+vw2ZOMU8tUYk3ImiKToCRQQPU8Gfiennnl
	 Kq+G/J5fOCey2fNN03Q2WBO8R+46aDBwH9T/qSqzFIJS/J+0AL6+1QZYQ5RF6XdYqN0co
	 61tS8Fbr6FMgUndHiagxfeGDi326OmS6DbiylA/lmHeCpHhGrfNAkQJPCxHrrBujQoxTf
	 OJnqfQDAlALiy8zzuJMuTjNXxOCEhvTCg9uymqK13mlzrJLWsCpng5nfiY6EhFKkkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="N85n/KuQ";
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A483606A6B0
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A483606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N85n/KuQ
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso5048906eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655555; x=1796260355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=N85n/KuQnifDRI2YkEYLejB87Z6k0qrWRhF4Qz7XgmIhZmvTmF807YZe1yov5bGwX6
         oIuulHIcrWCbGQ6/eyb/Vzt/nwfyp3oUydZ7PicwMkebJ6fZ/NgjsT6o834ErBvgOLKw
         c3uBQ5LXY6wCtzI7tt8holDAgEgJnb1Ym51nQJSjVvE6PLd05GkVF6HEANYtob3adR0y
         j/pP3R2BXI3qaq20JTLFs/hnLz34BLgyS9FO+QrvK2HQxunyh2fL/lDkBfSjtXCCPfkf
         PaIg5qX29ViD1s12M2im5pamIDXPqgfju4bagGTlb6ugkUUwojOOokOECcnxhnkOeN3h
         4SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655555; x=1796260355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdN/GENABW5fwEr+WhhCPVo7gKVgeXJgjWEeJkwASG8=;
        b=EqgTN6e5H1Z1MIwkR4YKGrJ5+K/fYCkU3aV7x8GV/LUddCNnCRXQXKxCF5duhvLmuF
         B0MpZOYZamyRpEAJheO6QwEEXL8icL7Q5/vtowUhwTrF3mXXdKOW6BaapGuv48KCWlGJ
         MY1fU25r/xuIwssBNnHXlhQPxF6FaT9QWEFgO9XVhJpfLwhocyxasD8w/6KjdvULqIZz
         GOP+A7d5WPhfYw0R/99RzVS5VNw90rVnytbHB2tLX0SzhxWbDyGjzS+VUZM+tvuesYA/
         I9X3GT/1Zc4LQFzgIZKAGIA0VhOckHVBwhP0ampX+9Q3Fktm6oBmk3iPn5RKLln217qp
         agCQ==
X-Forwarded-Encrypted: i=1; AL+hErHQsYZq7URk0ps0FcR/jD68l2Dj0stBq777QwAfV7TNhybH1OpHvKKU4BCd3noMz/9L60lpghzaJU6jJtZYyQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82dQvgr57W+/VkVEmWuMX2bEAQ7lV/w2oLnzHw/UfxDn4KRr9D
	6sGTyZVu3ViQ//l+iU+y40hePP3PCJwh2ZhP3oh/1xEZ9y709eXgots5
X-Gm-Gg: AZFdTZe1oWB2aTnTgiyxXZW0TxvtDGAeu6U6vSeXtBNqvmbvOYPf67tXr3LU4yxA1Qa
	ZDVTVWZWW4EVTqydQ3vcavGapjkY5oJMPpA9SDfAajo23P/u+RupXaIqlSAs4XUzduPYd/uPBlH
	PUKdsq9QCZ4q+LMDV0tzdgrok1bwlUlm81CM/yERwklw8lX18qth9tMIdLCDbCkeEsbDXYq97+2
	AGoQLgJlJQJLqRxpcBOTB0RxWPwNs5Qu7PEVSKdH9Ra+1FLNXzuNCbtFIgu23pMsrxllVqQPSnJ
	DpcK5YcWl9KK/ebwMzszXhGvCOwLOnK8W17lE8OfXvPKlTCLIXrPEBfOI01wbov2x4BiDhMug8f
	v7VZbTbCdoeCP59DPDqoS5LGNDbYzDSLb/PFo9TEP3gSD3Yru2DKde0IN1pZ8Ix2DA59ccQ3G/C
	hDUZhCFQh9xEUF6pkdEak3ID8myvBHCAmoSsrDaWdxU0KDR1vy/OTrPIzOn997j1+S5yR/ccHjz
	DEZuIJuyaeWecvHDSqa1yfjtNpgmeRHGnLJNhsSKI7RSUYSf/qYXAv2oLd1JrrWXvuBrlsbTHHI
	oS0pB7oDUW6fkZbgq3Z93TVkvyVpo5aWyG1jXQP8gh1LSHNeKyOBTCo5TOOiR4+rWUeUB6ZMLUV
	m+kcwgePz+Zw9Ua5oqkE96axYfHllZNtsSf18aSefFxzzQzievpoFzr1Tt5IkMw==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr17277852eec.20.1795655554634;
        Wed, 25 Nov 2026 17:12:34 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:34 -0800 (PST)
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
Subject: [PATCH bpf-next v4 3/3] selftests/bpf: Dump unaligned enums and a zeroed fs_context
Date: Thu, 26 Nov 2026 01:12:22 +0000
Message-ID: <20261126011222.92180-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126011222.92180-1-dennylin0707@gmail.com>
References: <20261126011222.92180-1-dennylin0707@gmail.com>
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

