Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529158;
	b=Nq+kTZMYCT3ByNt3MDsI4LcsHXVZs03K/fbPnzDEERmnPt/ysSliP+FqWD8c3IlqFMTb
	 S6EJDXIhfYmPGdWvQ30J5Ml21EJFV4XV/mSvDsvb6r6oe+HvHRl9v3Mnhs7wcTVSc7itb
	 ZuLAgMs71Ix5povxEL3vDiu/fWGVBz2W759oh61ivv5cOkaTmn0xdLDjK6cUfRqAmmYl1
	 EfV8TaI7Dyl3Nq+BYZMLo+FCr2qtfC8mMmv9Kq92jyoVWsuxAeUyfh4+B6eK0YbEAtjJN
	 vlpHRi3MU2W2PfwESMDknNaeE/G8l1nTiM5a2cHUEKoxQ9xXPg/6HzoTEAy2q4PLkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7idC5jXJA5zuKx9XSKl0bY7AYg4yh09bXWbxriqp4fs=;
	b=ZF7iY2o1n+XE4Ybkemprf6bpOUuHiUV7zhNirlqgiU4ilr8NFC7O1hka+fAhxcAuNvY1
	 v0YuWf910wnUdDOdLxybj0W5v/26WomSl5Q/IC12zguAr+iz778CSO+Jip8j1IBY057Zc
	 gtk4RLPo8I3bcBnMy8ucMT6msWBcufLN8ZjMVqwM26xptryhTtAuOd7Z3wGkxCoztYSjn
	 CpnD8GTsiYN6Nu/vz3tSp2pdbVKJ82CUeYoZ0Otj2urNRXz6s5LEYK9XUeKTt8Oc050kA
	 f67BJn8p2GEOVjc7UKYx//B1kg0KFB8C9/uXP5rCEBwYixZRkfEkxv19fUlFFHg9hHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNVbTM2W;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FAF606A335
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Nov 2026 10:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FAF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNVbTM2W
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so654865eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 02:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793529158; x=1794133958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7idC5jXJA5zuKx9XSKl0bY7AYg4yh09bXWbxriqp4fs=;
        b=GNVbTM2W0Z86IBRKkWpp3WDWlg0YOyfeAgw/vDuz7Vfq+z//0hwbeedgRq+KWK3gm4
         JH6c4K1ukoDGWc6UjU+oCSuHV26bkFE+8Ko27MnrCNWzBWEFj1L6Hj17+vp6hQQeglc2
         wf7xgLrGnuWinTIQSkpbGx3cVTtkOlBd0NvfEX7yrc2vlDgG5jCcRCcLwhIYDFE2joaH
         MWfXK1frK6V/1XuEDYbfUlC/ZkQweTtvsBBslxXC6qq54A3e3CzqcuHStMg3DQd+Xo4a
         EArfJsEiWF+jwqvc4U5pYkLWtCt4qW+D5mpm4NXDHRzzZxVvtaNYzdJpXhlm+p5kHA1H
         Wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793529158; x=1794133958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7idC5jXJA5zuKx9XSKl0bY7AYg4yh09bXWbxriqp4fs=;
        b=cXCul6CGN2diUmhzFGE8TZsFhl8//6+wCSIWFokSbWaqpsSdD50CGLYEVTejiGof/k
         pZZRaDTCwHtBwoG3zOErC46mLiRoBCiRzn15CI9rF80MkgncIQwDFIt2QiAldHtYyrGk
         4wzhMkyhSQ0nVk9TMe5Df8uJckbT/92gg51FRQba9iA1gCEwaICjZV6sUW42CjYLw6Us
         8yksJLRAqcgromFyxIOxksot+Wv62eZ3aFlbIEmq9ZAQTwGRuhfp+izL41b+FvvFbKUo
         0Zm1xOjIdPncdUvPJm6eg/E2U8+2v+Mc6xSx+Khuu0I+QDv7RHudc1kYQdkoWpMjt061
         eGsg==
X-Forwarded-Encrypted: i=1; AKwUvByPb5Mp+JaAZXuZ+mhEAgXN/HEJQ7CoR9EFUWH7QqY6f2QQVvbTo5J/H2GmVHno0LwoXIZQYdBIO/qZDmRyGcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb3cyzMir+d4xmri5rnIgrDiSgSj7SaHDyZFAlH9XaivkP8rm5
	vJ6ldL/rKGVu5ahUDBfx9FhpwU+thTbAjf2Wa0uQeaLiA0ZN6YFtmtRk
X-Gm-Gg: AYBFou1+H4SrmbUs/ZIyv2i7yKQSGM0Et3uHIMsO1ZUOx5qEVzvr/T3FdRM+6c2jEsz
	To+4gR7Je9bJEv2ti3EnjTGzhtA+dIlbuuq12YLv90eygzgmdtc9mXSPYrraYEquw7Abz6LPkwa
	DwssZzA65Xktl4wtceWSaQ/Cp+zoFg3R0w2PgcRhmhhCA3mxjEfJI5mVCQINmYZmZ5ReYRJXB7Z
	H+itmsEaG78w9a7drprkzEM8caItuX5xOHEmqr0Hy6pc8NOH8Y/mRdPnvbIJdwo4HpeefFZ08Sd
	KMiKUgXGsZJ27Sqg95yCJ1W8P81WLpzOn1wVcaPn16ZnTpshMEUeRerd5KegrVxcc/CByRs2L08
	C9P/7fKBdfAg6EwtUruxwdOIqp38G+PpmRbuQJHPzwMV75VJRyCePEHhra+ncGUb3gFLoqyXNUK
	jsQVQdHNRIKCBOrg2Ea2Yt0fmuprS/j+IyXrx2aBMaUhxxlCniRwl1f03x1dbbea1xNvhKFEIK6
	wjQdPM3zrGtnM8h148btiyQ0DoeoxKMOQsaDgNjPgpYuFJ4GBVZIi1hzlqIuxgVhX1Do8urhABV
	jH3Mwpb28dYVUWcb1fi8Lhe++UUON1b9pA0bSq/sn5yZaIgDunFi8g0o
X-Received: by 2002:a05:7301:52ca:b0:369:fc38:6821 with SMTP id 5a478bee46e88-36a423938f2mr10214355eec.12.1793529157617;
        Sun, 01 Nov 2026 02:32:37 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm25242506eec.6.2026.11.01.02.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:32:35 -0800 (PST)
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
Subject: [PATCH bpf-next v3 1/3] libbpf: Normalize enum values according to signedness
Date: Sun,  1 Nov 2026 10:32:19 +0000
Message-ID: <20261101103221.51534-2-dennylin0707@gmail.com>
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

BTF_KIND_ENUM stores enumerators in a signed 32-bit field even for
unsigned enums. btf_dump_enum_data() compares unsigned data against that
signed field, so values with bit 31 set fail to match their names.
get_map_field_long() also sign-extends the field: for example,
__ulong(map_extra, 0x80000000) becomes 0xffffffff80000000 instead of the
requested arena mapping address.

Add btf_enum_value() to extend an enumerator according to kflag and use
it in both places.

For data dumps, keep the original comparison as well. Older BTF producers
did not record enum signedness; an eight-byte BTF_KIND_ENUM can contain
signed data such as -1 with kflag clear. Using only the helper would lose
an existing name match. This compatibility comparison does not truncate
the data value or change the numeric fallback.

For an eight-byte BTF_KIND_ENUM with kflag clear, a negative stored
enumerator can therefore match both its sign- and zero-extended values.
The record cannot distinguish legacy signed metadata from unsigned
metadata with the same bits.

Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
Fixes: d147357e2e59 ("libbpf: Allow specifying 64-bit integers in map BTF.")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf.h      | 6 ++++++
 tools/lib/bpf/btf_dump.c | 3 ++-
 tools/lib/bpf/libbpf.c   | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
index 57f12630c5d1..eeb4984d6c57 100644
--- a/tools/lib/bpf/btf.h
+++ b/tools/lib/bpf/btf.h
@@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct btf_type *t)
 	return (struct btf_enum *)(t + 1);
 }
 
+/* btf_enum->val is signed even for unsigned enums; kflag records the sign. */
+static inline __s64 btf_enum_value(const struct btf_type *t, const struct btf_enum *e)
+{
+	return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
+}
+
 struct btf_enum64;
 
 static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index ea9a34db4c00..b636dc4185a0 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2373,7 +2373,8 @@ static int btf_dump_enum_data(struct btf_dump *d,
 		const struct btf_enum *e;
 
 		for (i = 0, e = btf_enum(t); i < btf_vlen(t); i++, e++) {
-			if (value != e->val)
+			/* Keep names from legacy signed enums without kflag. */
+			if (value != e->val && value != btf_enum_value(t, e))
 				continue;
 			btf_dump_type_values(d, "%s", btf_name_of(d, e->name_off));
 			return 0;
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 02e75b183ed0..cecd6b5f27de 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2627,7 +2627,7 @@ static bool get_map_field_long(const char *map_name, const struct btf *btf,
 	if (btf_is_enum(t)) {
 		const struct btf_enum *e = btf_enum(t);
 
-		*res = e->val;
+		*res = btf_enum_value(t, e);
 	} else {
 		const struct btf_enum64 *e = btf_enum64(t);
 
-- 
2.43.0

