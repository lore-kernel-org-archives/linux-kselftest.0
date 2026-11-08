Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106621;
	b=mlaKzJ77psz4rjMXy1s5U/yLi/oDQtbLf5gRNZ525Jn6EmjsK3mI89kdeHKJHCy28GpW
	 UWwyzyNAkUAs1sDtncTu06hwOzApOdSnPxV3l6wxJSmbaXhT4bcggsujgjndDdkiM+brv
	 VPMu1sbtgokZ6//eDGoq1Vl+x1QjLtKhx490POuBseCfEAzYG8Cl7E9V00u5S5356Zhvf
	 9HshclIxq1hjgz7XZsigXpNHvMe+RjvDi7hSz/D6ZTC6PhRNvIAx214mIxVPUvQDUpxSO
	 cMCdy3CDjd+Xe9LeuZ6aG4e6ZViNptWgQ0YmfkEFmeAreJwJgkdZvsfzxXk53otmhqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
	b=X/Zhd5GnqCu4eaofA9mZRdc/dSAISOrK18ARXs22gduYKUoWjrx9ldo3+obPRvKQvYNV
	 r/sOsFWPFX8Fj8b8VtZL95Yw5p8Zd/ECPV8/lJW6ifm/AKF8cpYaXIKjA2uHAOnoQdGwj
	 5lv/mAZCPM6TUtSd88jBonIrmdqVwFTWNBHqFXi5mrl8sYjb9O3S8AaeO6im0TUXnUEfL
	 3fE8OMjOfM1E3JxCIcunuEtWkukzU3jcVPrAb9eIQvw7zVHIZ7ZdgKt+aAXHh4HBrhNlC
	 va0JLojciTBSyizFyYgoEIyH0540ZzwQeC4kkgqOMUIkD7GWG//R6vkTm+aVBK3sLug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZGS8xjZ;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47575606A33C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 02:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47575606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZGS8xjZ
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f645c688fso81412eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 18:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106620; x=1794711420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
        b=aZGS8xjZJksfJYKzfZs4giH+2hZiPcHfLatACHE0VeFsbi72N5654l/TzjxjuF1IuW
         jT4boYASs/6eFcQ4drsiXGbcTeM51/hAA7JbwGAbIcAn9HzZwLwtdkz5qLszK/I84IwZ
         tvN9b3lboPm2RwG1i8d9BSTPcUmh3b3F/OX3ovK8jBFUMdSMiqQoRGJPY/r+lKKLK4cU
         sukynaT3VDLtEuBwlXWKHTDc0APElDlqhBuIqBHO7xyKPmQ2rKYhRB8IO49ICF0XBsiM
         7C2kMpkV8I37G4xTB0GCbCOpBF2Ah2OeGVWX/3tbO5NmYevkoD0dbQLjHyvvrt4rZ3un
         gu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106620; x=1794711420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvSsXHgLF6kuuQ4pQY0Lp4DI1Bm9QjjpbUjDZ0uTeZo=;
        b=GUpMIOl6vTr9Ymm5xFmuCQ5gssnk+5pf6VAu2cZmCQjDAUDA4XmBQLkHiJoLExO/vv
         ZbWHTUbDIIiDfNP926q376B4W7u5iqIfYKLfBYZng1eVOJzdfzaVzTVGDoh06gpN23vN
         0akxEiGeTXT9HINq8nzkjTukzJeL3T5k8Sqbalgp4ad6BXZ20f3sE6prfYPBW4P6GogC
         6jLQ+5kR2TVMe96bl0tjosQ+wdowZg9VkucY4/MBs6sg9D0PV0R4co+FJGtxkT5rL6mt
         7U81canDYicseP3pHFleg/3yK0BUiugh4s99B6+N/VQ38qTB4G2Y8PT5dKXTW4rlA0/o
         hflw==
X-Forwarded-Encrypted: i=1; AKwUvBzdOdPlSflOtQoFk3KuySDmTrlfPGBTymtlwrA0lMR/qCRfqA/w297WVKmTncYarDtzq/j12M8jfF/237DGYAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8epeUR7UvyLGnp2fbFLIDZEnw3WS7KC7ursVyaz9sr++NEeuWZ
	GqRTFv9UbmFab/0B3gbiNjDnVo9G90oew3TW5hfDzbTnyAeOc/27CPPr
X-Gm-Gg: AYBFou1Ro++2pW4BtrO7en05nURGhZMtJRxAchm+8Zew2j+2M3u33d9cFdQPr3E7bz7
	qKrk3sxWlBvawTyQCVGYaNs/Stk8nWbRWNB9u5ogRA/Ls67e+hrS8jb3wg7CQi4ECpbFMWXJjcO
	33W+VpB+2Oq0gdrOjczi4hF41a9XJkjwprvV3cLj38XAtGAmUVzdU6djuSp3js1LVBIaDysiqVz
	AISatG26z9HqVtqomDby2J86WsplzbUGJUlKr/8Nj5dGZEhTQOT0HRToYlvAHmNvGbujCPfZXJ/
	37H6+RQYy7XaN5RufajexEPwmUHVF85fN6q9AHlJYrg4vUArKIfLMlMhUQ3xTCJbbqvUB3G0U3x
	FAtRMlvYB7FpDE7d4hcdNZayk7Kf+C9aA3FM3+GZwlczYY0vT8xSeWjPzFfGoPRfXVCOVXfPCe4
	WWjo2gkru27Bh1OJ851ylwQ3AXqnSGImLwgOX40qTFnLHCr934j/Xi4Ldz5Zy1Q+liDeePgVOqz
	jU5cL+/+uvo1hXthqbUcjQJeummZ0KSqD+9CDEjquBOXwDc5xpnhCnI2+FHhT3MMEB90v8kfJp/
	A11rrdweuTtAvibfiLK0Tza6VPaA47rQf6UMCDHx22X23P1JEI1HGTqaA+7Tgrvj5fuVZu4rt1I
	Kr0HPEPCwjfxaPQjJ6cSn4yxoKF69eS1y6kE06A==
X-Received: by 2002:a05:7022:140e:b0:15a:4155:3d9a with SMTP id a92af1059eb24-1b39fedf712mr599512c88.47.1794106620308;
        Sat, 07 Nov 2026 18:57:00 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3773ea50asm2241202c88.23.2026.11.07.18.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:56:59 -0800 (PST)
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
Subject: [PATCH bpf-next v5 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sun,  8 Nov 2026 02:56:31 +0000
Message-ID: <20261108025632.10799-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108025632.10799-1-dennylin0707@gmail.com>
References: <20261108025632.10799-1-dennylin0707@gmail.com>
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

