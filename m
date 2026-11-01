Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529174;
	b=I1cxav14C76DGVBrVztEIVV41LFVwWjLMP26niZlXwG6MRWZiosPt1QagMCHFTgPUAK9
	 P2Pa2Wjwo7rl+eo5/z93WoyV1RLzJ1C1YD1LLm2AFv1Mp85We73354zrzAEJabFdzoJaq
	 UoylTDeCL7LkWwUgD1KHZVPMnwHOE3/8ib0Q3US6LuWdNsU3yIYgTrRywKcAAw/JxGhOt
	 qasT7SfLM47ODiocBfddFTQMDfZmbfTT+Y0Nq/KLS3YZHQXx9QpyQxoeYKDKp/AEopgpH
	 HJOxhe7gxisoL1Sy6uua4MiQCI91jFmJI3kgVcf2qH1uaJQkBkpj8P5r0TUx1aApqPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
	b=MuBJlmx7oRADxVarGx8rijoWr3t40mb5u18jSSKRwFAAdiqUzvyLbCBm8s6PernFXU71
	 F6dGNcyRb1eEVElhTXVmtsQZrjOh2bZJKq479uk2tYtWPLI2bW9ASvOSP4mNVcjLYsRcp
	 k7qyHj7dGNrlYySXWY7puNm+knSV05T3uDPcplrx1PE58cnJ2GYohK1JMsc2RAsYYouii
	 ip3W+sjYbX3lpHxpsQY/arEoGsmNPdG8LziNgJUfrzI+fLRXC/8gI5iTqR9etpEbQaoV1
	 391Iyljr4csbiEH+nXT8xQbP6E/TREFdaBk/n8nScPx5NAmeTW96PQeOjaZMfu9ATvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlK5FzPs;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C7606A32D
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 10:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7C7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlK5FzPs
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so1359349eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 02:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529160; x=1794133960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
        b=IlK5FzPsixSL1Byca9cU74Jo7bZ13QHBvu94n4troRBKOi+zd6mAy1WvG91PIHtTY1
         853qGyjb1FedxyVqC2CEBq+iVTKO6mcT0QfNScXTKVs1G49DUhcHmxXaydmGyCoJFEr7
         XwQ8deS7fCd/zKD+pJCgnzOnFrsjf98Z9BVoNJ1yrIGcjhudMuvWFqBTDK7Vn5WNU583
         bZyPxwVqZI9t9Z0nMmQzzj2lPVdUOV/crbyOLuVw9g0n5SAGiVwQEVUr42Ws4HHYiZb1
         XGe85GajBmbSO7/aMwzj3tQvMvbXNAGLI/IpfNqtr4IX+fVtqAFcNtBCtOFnNpfoiWSw
         c1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529160; x=1794133960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kAjnp/vmDsZxQUJrdxKe9E85NB+pqCNBKSp0Z5xRdI=;
        b=rqdNNK/hVrnj5mJwD++h1XRV2R0kF3ODGLl7Gn3d4RW6PYRy3cg2j1baCV1+yx5X2J
         dPAemkcpVw3uHmm/le4v/o9ICEr8mS3KhKZFyicKJmXimIdD84BxQuq/oIHUVfvCXZP/
         CY+SLgNxEweGslc84hm/nfiIVPcr6H9jzOWKTGEAeWugnXB9aLc7KOfaNYUnh05IHshQ
         ZjK+lf+CvkKBeVXYDivg4ZBvMrIA/659ogaWfa6ZUCk+hDhEsmcZ5UDqAkJ6WTaHiyYQ
         6MTCKWb/hGKdU3e5jZu4ZYBcv3DegsC1CpaFeWL2KxrBaDlRDZ6nNwHeowe7xGReNT7d
         AeSA==
X-Forwarded-Encrypted: i=1; AKwUvByUDEgY+P8YT9jQLiMCByTeCIWC2ZX0m8sDb6nsgaIjjyQan8OqlGRV43dR5CptzkZT+JjQFtiJBqQ/lT29p38=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SgUCsG4IIL6Q4Y3riSTqN8vg4DyZhtmxIxGv/Nb7uIjsmYCt7
	xReIgOCqgIcnz8ropUrQJRHvqoTxJYWx/3TYe+mX+2EfvdsozbraT/ej
X-Gm-Gg: AYBFou2Ue7pnYMYr8QXqq7NonNWGCQEHYgpoo4y7vvqfE+goAZe0iJV+OeLH6rh5eFG
	2wtdxiX1886FAWYynhgWWevFZupU1KGhMKpKj1HSLrHGrrfybwrlortlTk8WABMtxD3eKA3g0Kp
	WMTQtCUq7N2nUVM2p8O2ALorSbUn4583hfccmH343zRcC6yJJbT2VQkUvRoBAIDGb1y18VnBgKB
	zAgTOgVK1dpGimZiRgUhmXrIkJbhvBoNJFuCPu88M7W6hRw2HEKCFe78TrDt70FFQ3X8R4ZqygG
	bi2TpA7UDIHPsQC4k2VmMEsIEvJwjaQOavF4e4YZpRMHrO5gvE4W7l/IBc4yAtIaFMy8CRkVpqq
	HI/Out2O0r7Mn23vcFs/2whAIT9O/8HpbGzHxjUXXQ7lpnonixevXzre5P7//mSD1ERLLgjq3Kk
	UVBf109qh1imdp3T2yn9y1etecq8SkD/ZJYCg0EcrE3Br33r57IFCZDpy/ca+EByDy9GDJVh4zO
	jE8w8YYH3dtzEOOLfFsb+tfP/nosVvUhWHSoco4tgoFEpfDWtV4BPhK9hmbSjj9ZT72ZfMpIWqM
	YJBNN3cQfz3FfOoKTyFeAnY1lQFs05gibe87ZxIhrt5y9r+WBHQbn+za
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr16281293eec.22.1793529159911;
        Sun, 01 Nov 2026 02:32:39 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm25242506eec.6.2026.11.01.02.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:32:38 -0800 (PST)
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
Subject: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in data dumps
Date: Sun,  1 Nov 2026 10:32:20 +0000
Message-ID: <20261101103221.51534-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101103221.51534-1-dennylin0707@gmail.com>
References: <20261101103221.51534-1-dennylin0707@gmail.com>
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

Load the data according to the enum's signedness, use btf_enum_value()
for name matching, and select the numeric writer according to kflag.

Retain the original signed-width comparison and give it priority over
new matches. This preserves names from older BTF without signedness,
including eight-byte ordinary enums, and keeps the selected name when
multiple enumerators could match. Remember the first normalized match
while looking for an original match so only one scan is needed.

For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
enumerator can therefore match both its sign- and zero-extended values.
The record cannot distinguish legacy signed metadata from unsigned
metadata with the same bits.

Unmatched values are printed as unsigned when kflag is clear. This
includes BTF read back from kernels without enum64 support, where libbpf
clears kflag before loading. The original signedness cannot be recovered
from that flag.

Fixes: ca7e6e45d108 ("bpftool: Print the enum's name instead of value")
Fixes: 58a53978fdf6 ("bpftool: Add btf enum64 support")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/bpf/bpftool/btf_dumper.c | 42 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/tools/bpf/bpftool/btf_dumper.c b/tools/bpf/bpftool/btf_dumper.c
index 3267163119dc..792e210cb503 100644
--- a/tools/bpf/bpftool/btf_dumper.c
+++ b/tools/bpf/bpftool/btf_dumper.c
@@ -148,37 +148,50 @@ static int btf_dumper_enum(const struct btf_dumper *d,
 			    const struct btf_type *t,
 			    const void *data)
 {
-	const struct btf_enum *enums = btf_enum(t);
-	__s64 value;
+	const struct btf_enum *enums = btf_enum(t), *match = NULL;
+	bool is_signed = btf_kflag(t);
+	__s64 value, legacy_value;
 	__u32 i;
 
 	switch (t->size) {
 	case 8:
-		value = *(__s64 *)data;
+		legacy_value = *(__s64 *)data;
+		value = legacy_value;
 		break;
 	case 4:
-		value = *(__s32 *)data;
+		legacy_value = *(__s32 *)data;
+		value = is_signed ? legacy_value : *(__u32 *)data;
 		break;
 	case 2:
-		value = *(__s16 *)data;
+		legacy_value = *(__s16 *)data;
+		value = is_signed ? legacy_value : *(__u16 *)data;
 		break;
 	case 1:
-		value = *(__s8 *)data;
+		legacy_value = *(__s8 *)data;
+		value = is_signed ? legacy_value : *(__u8 *)data;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/* Prefer existing name matches, including signed enums without kflag. */
 	for (i = 0; i < btf_vlen(t); i++) {
-		if (value == enums[i].val) {
-			jsonw_string(d->jw,
-				     btf__name_by_offset(d->btf,
-							 enums[i].name_off));
-			return 0;
+		if (legacy_value == enums[i].val) {
+			match = &enums[i];
+			break;
 		}
+		if (!match && value == btf_enum_value(t, &enums[i]))
+			match = &enums[i];
+	}
+	if (match) {
+		jsonw_string(d->jw, btf__name_by_offset(d->btf, match->name_off));
+		return 0;
 	}
 
-	jsonw_int(d->jw, value);
+	if (is_signed)
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
@@ -204,7 +217,10 @@ static int btf_dumper_enum64(const struct btf_dumper *d,
 		}
 	}
 
-	jsonw_int(d->jw, value);
+	if (btf_kflag(t))
+		jsonw_int(d->jw, value);
+	else
+		jsonw_uint(d->jw, value);
 	return 0;
 }
 
-- 
2.43.0

