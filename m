Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017261;
	b=II0Mb+DrhGqVd6jc3KdLbETaZ8Oqu5QvSDAedCybiKO+b2GH3Jru5cozNItesDbvmgnX
	 58TOcOrV0o+1fBUMQ/ER6uIo6Xp8ySNhHkdRUcgwLlFYny59Ras0krlZnz3wEEWdmFPMX
	 4+87eGSIDkTVKahaUV6jGadNSrNhtnI5iQbOOIZ6y05LHB8l4oVdUmbYmfD45L44MNKUo
	 dFKaIJA65satlti9HdjkAlZInIoAYbld7v5S8Y0+uQmtDATzfMdwr5smasKolrrYvBX/R
	 C03x90JXTZcNe60wotLyl7UERTnqn2GiGe/3avB9/DoZdVOMjBl3dIXh7kAJgEo9LxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
	b=KRCeuLWl9YzKZDj+o1MBUQnJJ8gzaQp44v7W4UyUYdRT/T1w7YJHgI/bqe4FzlPDK6jz
	 m2MVZSTDTBmsPqxRANK03FAhb8BFxDklsdtsPPRGFfg7BXYmKIM6sC9TYBsvO4wK5fEB5
	 Sa/9q5XPfXVjOa28+vEQAfoCnYzwt2n+90FzAKg9iWXnZoMKuQbaDbfeuBeQuU+1ajDfY
	 nq7pEIWZnVMgMpv/WnCu6C95KNQXaNP64uvycANmIdgQ+uoXBOV4kbWTOGmI9iCMSecJ9
	 Jk7bZ5/rjxWsBYQL6mNjt5IcjSwr5ZhV7Zvb44BZ1gvTCJQzRM4LcqKb8QRSBYeujFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpfecCtS;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E8606A335
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpfecCtS
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1519856eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017255; x=1794622055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
        b=BpfecCtSDVjmiLe9zkEbkzm6VdmcxgPSse1IwEMGRMsEjQMdPYtthaX4/MyA+qKWwT
         M7tj+0bng2BwVrdRV6RpvSTupEZl+wTRhbkgG0PKEMV2QmiM0fXOMRM6QKKZJknR9CL3
         H5JumNa13GsIK5Wuhn8ZldNTmgZ54gac0w03AY3TPNH+S51EDG5u/wOmT3lDeJrdfQQp
         J6pDodqdXoCmKEcjMBM30MWe9Hi3ImDE7Ftnwj+JAfc1DbjsDpdj8TzvurU3/zIJLMiY
         Q8LdwBt1gX6RO1Usf9T3uwzz1mY7gGNzpFVS2fshDs5mGXy1vGUA0nQNjuqiUkKmUlHw
         Bmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017255; x=1794622055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nm1koDck7vzbeNbMewmGKmgBZQOKfI/JO390sHTU+p8=;
        b=bIf/3kNidEEAurrYuRFleoYFaJ9gaQda6BmrjGJn49usryQQ0GnMu0ylAfD/NUwuYY
         OEXZIcrTni7ZO6T0YWdq+fy0Ucl151otLFm6OD9PNKNJh7ixEeRAcFLlNuW9n+oI28WT
         CNgI8TjeS7LYHchvnnKIFVm0Cw2E+C+HfQDtL69kTYSRgR+vrqr+fQ6DjlcZM/iP8ufF
         TMzXhQVfZKL6r5LAY1ap0RrbgFYjnzbbt4b8H5rNJQ2+dEOqsm+GDuDCkwg8HoxL3e9f
         1ArciMXJF+048Z+gXEgOX5G1gdgyUXRj8pgMHLdGzHeaXInvRkWPjC/HqjWzeMiClzh3
         D7Hg==
X-Forwarded-Encrypted: i=1; AKwUvBynFtABzg69SU941oHy4fwlDAoyAX0DnipLlETSO4LdjyVru4VgytFDjPVC4Oq3dap9ZvzP5BChKzjJtynRIb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gfXo1+IybeqVc4p1CFxyW3ZjuaeWYqyW57nHmXxti+CF/Wmvn
	3YHabSY0LCK7YW1xzsVenX+/D/S5zvuE4pQeLl6BaEL22wZwROMtHC+/
X-Gm-Gg: AYBFou0KEgH1TQjbNaOBrNZIZ0WuNG2a8hlTgXyQ5B3UaGO8Km6IBgU564RJY/v4R+A
	mMoqkrlFmv+ic7FSNMefhodDVZ5i8zkzZWgRERdAkqesIibKQxPvobOwmw0jMoIbT/MUsfwq5Ih
	UuN6O6DTxfRZjAzTqSK+ZrcfmQE2sbfsgA9ALc8t0VaU0Om8jlxOahNPxdlWVD2kw2oYO1/ry1R
	Qv5tYpkPSyLjNNpq5x7/LpK+QCv3ZQ8gUVt0m4IKxgedOk+5k6DlLfijzHbD2IBifWy+7/C4vuC
	1eic12xr1Xt76T81dqv/l4DBDU0Spx4GnYFTAtMXGuq3Hwbk/+cCuY1nMHwk2SbRKsVkfx3BojX
	Dav+at9n7Q+3D2MTJrAzv5ZSX1TLCCYtiFGMKQeIC0rHPRo+INSDtVawlKGemSvvudFiTmvswOp
	JnSHXczCdetLBXBc6szCiOI99khtTWE/cjTrtitbcqCDGUgc0vH3WCanaqDZ1j0UzXmhU7Tph/Y
	X6RTBr7L37+VLf0PR4SL+2/fbuXZK+EuJ3Qwe7yCwEZAiGO653H8pXyKTmUVRzcAj+KBhl6T3Vk
	9xt1eMAxixoJV9Gsj7GB57ltxzkjmCFS2iEu/yGBhMVgmdkPO5vpjUcEBJOfi2qfBNsALCWeVTD
	ZNs+0gSRlc9Loq7HLqJUSF3dZoyChWkip580cp6LhG21EnljSwSMufdROxzs=
X-Received: by 2002:a05:701b:270d:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b25d30b02dmr5788693c88.9.1794017254824;
        Fri, 06 Nov 2026 18:07:34 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:34 -0800 (PST)
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
Subject: [PATCH bpf-next v4 1/3] libbpf: Normalize enum values according to signedness
Date: Sat,  7 Nov 2026 02:07:23 +0000
Message-ID: <20261107020725.36675-2-dennylin0707@gmail.com>
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

BTF_KIND_ENUM stores enumerators in a signed 32-bit field even for
unsigned enums. btf_dump_enum_data() compares unsigned data against that
signed field, so values with bit 31 set fail to match their names.
get_map_field_long() also sign-extends the field: for example,
__ulong(map_extra, 0x80000000) becomes 0xffffffff80000000 instead of the
requested arena mapping address.

Add btf_enum_value() to extend an enumerator according to kflag and use
it for data-name matching and enum-backed map fields. Return __u64,
consistent with btf_enum64_value(), while sign-extending signed values.

Fixes: d90ec262b35b ("libbpf: Add enum64 support for btf_dump")
Fixes: d147357e2e59 ("libbpf: Allow specifying 64-bit integers in map BTF.")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DMJG1R2YIJRK.16CZLV9S5U7Z7@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Return __u64 from the shared helper and compare normalized values.
- Drop the legacy comparison and rely on kflag, as requested by Andrii.

 tools/lib/bpf/btf.h      | 6 ++++++
 tools/lib/bpf/btf_dump.c | 2 +-
 tools/lib/bpf/libbpf.c   | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/btf.h b/tools/lib/bpf/btf.h
index 57f12630c5d1..d74c92056f0f 100644
--- a/tools/lib/bpf/btf.h
+++ b/tools/lib/bpf/btf.h
@@ -636,6 +636,12 @@ static inline struct btf_enum *btf_enum(const struct btf_type *t)
 	return (struct btf_enum *)(t + 1);
 }
 
+/* btf_enum->val is signed even for unsigned enums; kflag records the sign. */
+static inline __u64 btf_enum_value(const struct btf_type *t, const struct btf_enum *e)
+{
+	return btf_kflag(t) ? (__s64)e->val : (__u32)e->val;
+}
+
 struct btf_enum64;
 
 static inline struct btf_enum64 *btf_enum64(const struct btf_type *t)
diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index fcd97aa90589..602664a6adef 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2378,7 +2378,7 @@ static int btf_dump_enum_data(struct btf_dump *d,
 		const struct btf_enum *e;
 
 		for (i = 0, e = btf_enum(t); i < btf_vlen(t); i++, e++) {
-			if (value != e->val)
+			if ((__u64)value != btf_enum_value(t, e))
 				continue;
 			btf_dump_type_values(d, "%s", btf_name_of(d, e->name_off));
 			return 0;
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 0e2a93a42908..44134421bd7d 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -2650,7 +2650,7 @@ static bool get_map_field_long(const char *map_name, const struct btf *btf,
 	if (btf_is_enum(t)) {
 		const struct btf_enum *e = btf_enum(t);
 
-		*res = e->val;
+		*res = btf_enum_value(t, e);
 	} else {
 		const struct btf_enum64 *e = btf_enum64(t);
 
-- 
2.43.0

