Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017256;
	b=bcuYtxUhOkDQW5pdB7O9qalGYd/v/wDlNUCogToEsnohWbsQsAxA2MyAfT0b13zDn/6C
	 AFZgL19OU1dE8zoZUa4Yb/2oUPQW4dlNBWfhG5A2BN/0WeCdcYshYWvS0KYxdjX+BxehB
	 WYTKedYF7YuvtyI0oNv8s5WXl8WkQKr4KunchGbcZNlZ6s6jPs9e+JhuLzL/IvST+sFpc
	 gmd+qd5RCzw4ksekbARn1drBgs0mv+u802dvG7b2ormUt+P3kr+0+G+aa4pnmBDUOoU96
	 BggLpnNYjkEVY3sZu2CHny1KdhkHaI2dX0MyZU4b0ut1yT6GEkBPgfaMbH/xWQbrFoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
	b=VkWdOVj5xZUU7dku3k7E4L8Y5rZ5liVje3Jr0GRErJUE7EM7Vhia7GdyyTaoYY85iTgJ
	 Eheb/C+244R5lZQqNKfU9N7p25GgeVhxLFNryP8L0FQ4FyT3Ri3rPx4G6Egdd+okD8ttz
	 qNyvex1rRMzMizE9kpJ1e10IlAn3EVo3HQYaFcDby8UkaMGswMOpE+8EmDUbTqABTXQ2e
	 NX5S+YLYEdiyotP7pSCN9R8Y4aRgq9y6XNkTTt2qp5xtAw49iIIRtgaebEns7nKnHpz6k
	 74bz/md5pfrFt3qXGu+Mg49bCCl4u1xd7CreLkPoPemLbEr4OSiZGvjTZRKeVSIgN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbLGNDZt;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93110606A33E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93110606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbLGNDZt
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso223155c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017256; x=1794622056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
        b=TbLGNDZtVU7LVHrq4j6stu29IcLKbMv+plX08ZPQ3InY1/vq7m6W/HaWNtJoZMDZzU
         G6HLIx7nQ/gyTiGA6sg2z925N+pN2qC1zLm1cJOJB77igLw77VQHotNrmCBawfbBDI4W
         vAVm27rT/VoDieT20VKetRT6NYXz7GBWgSAqb3zcdxwmZnaQ+619h+19JyIe794n0Uvu
         Is/l0Wr7vPV6bmP42WIi0L0WKXnEOvhe+vhl6e1wT/BbXjn9VttFqjQDVnyBQNk8fcT2
         a9sYoacznRQLQmIYJjwuzP4T3/tu90CUQ4aR4Sm8kvgQFJoKjOMLTALHQuHEf61M72e2
         rnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017256; x=1794622056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvQm2BwFx3voJ/6Hs8R+Bsn0Le0ol9eYlfwfURLYyx0=;
        b=tNKFx+Ludxrq6sMmAVL/0oyIN6H7fDeuoezW/+FFy42EA0rxmvPGfcUTGzZQgYE4/5
         DPy+FsPNrVC+VRFug0KD9E1fOmaZfNWmEM1Dam5o5gSunQLe0CCOKefFMlIeus8l+oym
         5oend6BxGXzDZ8hTHmNtquoMK1faHiwdMOCt/OORRfpb7FcH/WtU0FOKeS9ZzboJk2Kw
         Fu7LXpon6htGEKa7JyC7FXLCvSpmA5LphtejBF+CIOH3V9kg9uxoOXRKPpzc8jaiDrMs
         D8wb6O0C73G9YVpvSvRN4xptHUukAchDdjWSZckJLNl9DNZ2id7elPVeKOZVmJpr9OMl
         gxxg==
X-Forwarded-Encrypted: i=1; AKwUvByDpVLZBFx6ZPKMQF2Z6NbdOf7LYA9p9og0MSYQF9tJvgAMvq8FsNfm00DAm6m9H/82HkGPzLfKPxT8PVWZt1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4VURGaWWp/nTxI5ioundh8s1imN14vw+Kh7WeyEdIV16Q44ZE
	EXy7ZPHE4OVT+NE7KfKbZE2TT657IKK0oFYotd7GNEk2u75UB4+6DqdJ
X-Gm-Gg: AYBFou1XybRPYJph2ak0cFsdn+ijboIOcLdbQPJ/KhA/YrBILMcfENG1wh1OAuWXS0k
	DBXM/kqZX4wxDpapQitNkhRcMT4sd50UPpYlr/oXsUuRwE5wFD2mTYDfHHBctbR7R+GjGTCxvAd
	2hjbFtIt6VanOisU2n2oh3rrckjeGeEQr44uj/XKtOW7iWjoTL0t+OqE8t5gilfWiJJVe9dVoIj
	xBa0C+7Og6fb5V3inb1x5uHXSGgAisi5fiQiILOdwRHQXWuEsZ7uJjgANvx3A321vQL++U3zJGO
	DxyPkSEVh8QeoE8nXvkcSA7B4gR4GosPvMq9RDFUwZO/dMxa74C+svyyM2ZfoG/yy6J7bgqxMgG
	DvTUG06BDHf4HzF+EbMn21n8t1ES0lBuCBxjvKn8t9RinqCD88qcegVUTin/RNOK/UlzCRb9DYo
	1pFnIshdUJrmnE6PfYtsnGOrmQfzwc3vjFcTSNXjcCF3plTdLlCNx9xTP+Rl2nZqS4+2D2cBgop
	x4kWpnEH/Lpam2mWj/5VyFAA0pWRHB3MPEYYHXqkVK+NnkOK2jBQCDJqExWsvw6wzTceMiHHwsU
	NsT9kO8TgTSLI67rqj0sjmOdAl9Z38BIQ8nXzffcx2fMF9v8Y/o2wSidHNBxx4VSd0LhXAIaqQv
	bvmTCEr/wAxwp6MllHe1vsFgerlA/Zx1Mp3B8Hg==
X-Received: by 2002:a05:701b:2318:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b25d359e6cmr6341135c88.41.1794017255593;
        Fri, 06 Nov 2026 18:07:35 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:35 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v4 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sat,  7 Nov 2026 02:07:24 +0000
Message-ID: <20261107020725.36675-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107020725.36675-1-dennylin0707@gmail.com>
References: <20261107020725.36675-1-dennylin0707@gmail.com>
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

btf_dumper_enum() loads ordinary enum data as signed and uses signed
numeric output. Unsigned values with the high bit set can therefore be
printed as negative numbers. Narrow unsigned values also fail to match
their enumerators: an eight-bit 0xff is loaded as -1, while its named
value is stored as 255.

btf_dumper_enum64() likewise uses signed numeric output for unmatched
values. For example, 0x8000000000000001 is printed as
-9223372036854775807 instead of 9223372036854775809.

Load ordinary enum data according to kflag and use btf_enum_value() for
name matching. Select the numeric writer according to kflag for both
enum kinds, casting the value to __s64 for signed output.

Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Keep the normalized value unsigned; cast explicitly for signed output.
- Remove the signed-width compatibility comparison and match-priority
  logic, as requested by Andrii.

 tools/bpf/bpftool/btf_dumper.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..a7171622ce57 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -149,28 +149,29 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const void *data)
 {
 	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	bool is_signed = btf_kflag(t);
+	__u64 value;
 	__u32 i;
 
 	switch (t->size) {
 	case 8:
-		value = *(__s64 *)data;
+		value = *(__u64 *)data;
 		break;
 	case 4:
-		value = *(__s32 *)data;
+		value = is_signed ? (__s64)*(__s32 *)data : *(__u32 *)data;
 		break;
 	case 2:
-		value = *(__s16 *)data;
+		value = is_signed ? *(__s16 *)data : *(__u16 *)data;
 		break;
 	case 1:
-		value = *(__s8 *)data;
+		value = is_signed ? *(__s8 *)data : *(__u8 *)data;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	for (i = 0; i < btf_vlen(t); i++) {
-		if (value == enums[i].val) {
+		if (value == btf_enum_value(t, &enums[i])) {
 			jsonw_string(d->jw,
 				     btf__name_by_offset(d->btf,
 							 enums[i].name_off));
@@ -178,7 +179,10 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, (__s64)value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
@@ -204,7 +208,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, (__s64)value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
-- 
2.43.0

