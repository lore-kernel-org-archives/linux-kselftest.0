Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650445;
	b=yYhlxSXBCwrays4nFeEI3gD7IIJdt7Dcw4mB/iBkxha5pHiJUZfJZzvEiiZlhkxo/mAE
	 bV/rDmKmtmsM+UJ/fpHnm2vuB67b5lkQKyXvAf+peI65Sdl0kfrj2HtGwpuP1X+/kI2vG
	 jUe2JXiddHYomnmLSi2dS06ciyP65Ic+7RVRS8eF7zxuyHudqjhCZYKVs4fXqQS3qzHy1
	 BvyZu0CDk+7Wgu+OsFicrrDQ7+BTDH2j85A6OtM2yxMc+K4nOs6oQzmNuxnHmrQaDq6No
	 dxE4xiQs4u2PjxqluhBV26nsGv25el4zKcY18R67zklL69tiQnyCUwwZRQHXH+e5Q7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
	b=egXu8IVK6fsNI3B6fbW1h1SaY70j/0kIdk1FuvR0/8Y107P/Gb90kvoEdyyDVQzVkZPW
	 YV6nO/91soDs6ZkWi5882Nsgvz+L63u2ZJoN71oqnJW9cLXcPz35rqAfAPsORGgPnVo/7
	 HAwqhR5Ef+1khjK9t8qCbPpwwxaCi0ihfAXsx6x+Cj2r+ey4VSeF4Z9EUVQt5bxatq+QN
	 LUItS4aZmuEaNofI47oPYQGYzcJRIv4UeZvSef7o1uG07WPaEXEzEvERtmVqV5Wyia10X
	 IY7oqswhx05Vz5cX4DHcfNTYjLLLnQAhi5gfIHZ8+hQp+fADjaE3KV1CZJX7C8D+Lzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx8587wx;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2B606A333
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C2B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx8587wx
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1666133f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650443; x=1794255243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=Qx8587wxxbR22BoOvIwqG8mbTtcPopxfea//1XQLP4IJcVMnHNo5IfbPTzhs/JRkt/
         Qb9b0N1mMt3ctF7j/LteVwQqMUgbMnpFJUUoBnrW9+N8c6pd9KEdB1CKlk7FH7fBffnI
         yOFdNrnInbc5nGWNZq6NPmHX3XN/FTZNnJG2EQzFrPDs45KFrKjJFM9F4uqG33fIJ4Gl
         qRbu88baVzNcrNBTDz9de2+wmIfqLbNqWxtimMAYBLx8EYt/afzmuqytEjFXjg7t7oRo
         FoqsbEq107BBV1xiob+8M29o2OjzRSEqIOOQiLlyoLO8wc2GhPRGl4qfp93c9lWnbBdq
         4E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650443; x=1794255243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlxGrO4qVY13JT+narJGH0GFq85Jy87gUAILKXGl+Ms=;
        b=wXLcHe6pTBbMsqtVUqqTTjQreMCJEVPi3Ss6CFbs9/5VNVHRcKCmyRX6bkhsGFsZT+
         JVDVZZBmlXmUbCLPoG15HOZDV9gxTaOxOD0RTJs2uA7EQz9rIygEVJyt0OuuVAkFd7xK
         IihlndV1UEzKjBuMcadE2VdmFDDM8Zo5cLkaL6YTIbmxCAH/EgYr+zWb4XiYXkoXD2lz
         SenOfNGJkeuHVStSiLq3lNMFc9U3wWSSFQdyMCmkciGYfA3UuGkIcE4eppfpgt8xEsfh
         OmKXMlYg0qnGoGTJyKpnj/duUOlWjsYhQUjeHOStFMm7FKzv3ybI+IfQWbyspr3lwrA8
         wbbw==
X-Forwarded-Encrypted: i=1; AKwUvByrpKDuj75EnvqjanBMvDoE2XsFGGb3nPzJ25lq5Hs04JTjbaxOSoAUPTHivMTRittaJTr2OBLl+EkgzdE0Phg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M/q++4QInjES/sLU5rHKDbPQSdJnbqrmxLRhY6IFfbuu7TkCz
	3d7ouK/LZRQRMzPfsjqz/1f/Hl79XWkwBtwFm+lKw0XQzb+DRFyj58fa
X-Gm-Gg: AYBFou1NEBDzoCa+cbwRhUH+aWvbHrkUlA80rybMnwe61Fi1FI0zkTqgCKomijhiDFN
	eB7VksQugA+tdlq/qq4osq2mMjCjzPs8fG/YhfaFUo01SHea4mlk/TUxpetqzN3Gbw9tZjmkMsx
	mhQkuQiP6NZCxUlDR8+72Tfl2w8yOnzrhnz9aEl8KXrAZFYdNpD9qOe/4Q80fcdCuxCbKp3EOy4
	1K84+ZPwGHfok4jItWcw/9KmHfmsik586FfWnwGr+sHJS1uhFrsRzxaswfOPmfHRQqb9S68QCtW
	yYYikVcpO67MxtYW/7PbmiYnpxpQ5430efRkrO91Yrfbp9jw87LrVia1qbwznfUF9eNFDl+Yqwt
	7un7m7y6U0uzMBrBTiXOA8gW5m8sL8LGGY5RKMCTziag3X/UY/DuRZRdB6VYKnhOXkDIVxjvgmJ
	41vggEW+hai8TFTGZh/UNoKTdfdRUopvfCseH2Fg1PDRUgguCrGxlzJbY7j5v/wmMv/nd7u2P8q
	xUWqXdi8v3ZXKVkuTgT1gTobVC95maeH7qQGXA3/WcMv1AuG4dA5I831n4yLJRUY6CYji955fOc
	1Y4cshqTX7UlpU/ox1CfPyDe4i9Pt7TR6heeZc1Sn0KpSs0Ukp1o5CqdU1v1TSL+lzLm+EqpQHk
	L
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr23474451f8f.51.1793650443196;
        Mon, 02 Nov 2026 12:14:03 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm21471805f8f.43.2026.11.02.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 12:14:02 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 1/5] libbpf: Count entry programs for bpf_gen__init()
Date: Mon,  2 Nov 2026 20:13:52 +0000
Message-ID: <20261102201356.5798-2-mahe.tardy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102201356.5798-1-mahe.tardy@gmail.com>
References: <20261102201356.5798-1-mahe.tardy@gmail.com>
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

Commit '259172bb6514 ("libbpf: Fix gen_loader assumption on number of
programs.")' explicitly mention that we may pass a higher number of
progs because we include subprogs and autoload=false to bpf_gen__init()
generating a bigger cleanup section which is harmless.

This is in preparation for the next commits that will introduce cleanup
of the link_fds to bpf_gen__init(). We don't want to overallocate but
have the correct count of progs in this situation so that the
program-slot count matches the programs exposed by the skeleton.

Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
---
 tools/lib/bpf/libbpf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b183ed0..a7cbe7204043 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -9800,7 +9800,7 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 	 * permit cross-endian creation of "light skeleton".
 	 */
 	if (obj->gen_loader) {
-		int nr_func_ptr_maps = 0, nr_progs = 0, i;
+		int nr_func_ptr_maps = 0, nr_progs = 0, nr_obj_progs = 0, i;
 		bool text_has_callx = false;

 		/*
@@ -9815,13 +9815,16 @@ static int bpf_object_load(struct bpf_object *obj, int extra_log_level, const ch
 			if (prog_is_subprog(obj, &obj->programs[i]) &&
 			    prog_has_callx(&obj->programs[i]))
 				text_has_callx = true;
-		for (i = 0; i < obj->nr_programs; i++)
+		for (i = 0; i < obj->nr_programs; i++) {
+			if (prog_is_subprog(obj, &obj->programs[i]))
+				continue;
+			nr_obj_progs++;
 			if (obj->programs[i].load_strategy != BPF_PROG_LOAD_STRATEGY_DISABLED &&
-			    !prog_is_subprog(obj, &obj->programs[i]) &&
 			    (text_has_callx || prog_has_callx(&obj->programs[i])))
 				nr_progs++;
+		}
 		bpf_gen__init(obj->gen_loader, obj->log_level | extra_log_level,
-			      obj->nr_programs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
+			      nr_obj_progs, obj->nr_maps, nr_func_ptr_maps * nr_progs);
 	} else if (!is_native_endianness(obj)) {
 		pr_warn("object '%s': loading non-native endianness is unsupported\n", obj->name);
 		return libbpf_err(-LIBBPF_ERRNO__ENDIAN);
--
2.43.0

