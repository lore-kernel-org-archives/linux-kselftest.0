Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655553;
	b=IiPaUKZ9QQzrDdVIdnM5b/KoowWn9LmA9XMUZca0LblHBmlBp29xREcru+39IZUW1xnf
	 qBaptu4MFiWRBrZXIvw+l5CLmGxDvx5nsV9BXt0z3zdYHj49UiXaShu2jVnsss2twiPX+
	 PqbsS/BBiKpenfgtVinan4YSUMIfYeISTQQqDa/VN+NZ/wcVDfC2xzupsuncGJhr+9B7k
	 UUGyBCACYsPpF6uUHLJnDduXGjds9je1pXixQOtlkFR8dP+pVayDCFabaXOVXvPVF2iAw
	 herX4bVSHBVPZLOHnPv1gxBmIaXR+JBOi0VPsAZaiSkJdQdYNbr1VFZdWKGLLdcY80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
	b=MMCIQkCI4/j6Ud4DUlIu1IOfROMf7cyqod4LTWAkaaCZ81/njnLhSLr7s8Y6yCxkUdkc
	 NbQ9CbwWpPb+s4kiTN0T5s58Acmvl9BxmNefputLPtpDMNNQi7I1KlAlv8gpx6KoiNpOf
	 zUZXxtOvMYJOQKWZaCjILssHeMM8YvtxGXOgJG/rqfMUqXP+tIkPPA/HHJ3XSdh7pMSEW
	 GaZVPICTEYV89GJiHlV/U+LW3XMpVP9tizBaYJBV3vGdzbtnwv5yunonc3H6oPy130DNH
	 KUSvj/6Cn/hApz3tBIl6TVBxUuV7SZfgjaiIJZrutGkQiQikuR+SmxKyj/l1yupL62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MK3QUops;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CC606A339
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792CC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MK3QUops
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso5128323c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655552; x=1796260352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
        b=MK3QUopsaaw6CcNV6fOtRW68+gQVBX78U/spdYzSoF0aQrffCDrjeSSKbBtIpNHmlH
         rM+ioH8/FugzkwxZeuBQQ9xetS0XqKY1zNaOBi3f97vvJLQAIP+Rp3Aye/r0N/YIdeQ8
         ksnEQ7cLMaHnDQKcG8IsaYlLRJ/Hr6FCtOcjQTCumfrmSHEOTWk3pidV+BYHpMBITefP
         PNkuafPAr2uhVPNwe/gPfyStEo1OGA7h6KPpEJD8Lu64AZOLnsg/gPG0So5yA+INcRdd
         H+dXaOubw/dNOdkSVtQcPfVbMi1pP853ddL8GHu0KdZPbrxFt4dkSZzZWAP5NgxkwOTO
         6RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655552; x=1796260352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
        b=L2e0t0MjPaF69xWCkWfp3R9uYT6e9vYShgENWQObKDu2KQa6OThs5foX/vNGyVkpLI
         2+gmRqJAqf8L8/dozidPJUPOwsLhfZjxbAmE4AxHWQFlFlUEPrB6TSbZEY3xzoF/AxSF
         Jz+VqV9c+B14LvVBxwx0otW7o3UGLzCeF2Y6mdBLlf1RLhS45elU7zt/R12nzdUqI1QJ
         b6lTjuMBaEN8C8ZvTuhOoBJF1OKYpI2UgIO3vHJwT4ICCgwjTEzO/CaOQEaHNgAZiEZR
         AYZTVmXVYUsGvnj6JARyeKOy45WvbnyBAEbyTeZ7FH7WoYO2s0Es28ItGKH6wyKUZE63
         Lhyw==
X-Forwarded-Encrypted: i=1; AL+hErF3A5JrRochXsjcxhUAeKa5wnbRu2xzxntuthqLr4S3hsiDuUvRbKq21qKeGzK86njzLZm4aCY97gqPwCbD7Fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DbSqjOoq/BPK0idV6FJ2P3Sx4odyRHO3v7MD2Cyv5iLZgilbB
	kYnpAot7nttxitVlqZxzKYHW/wG/kFj2B0gQlvvmbnkjecbuqYntLvTC
X-Gm-Gg: AZFdTZfkyWNTtTaBwSx66mXXplnJrpnyKq377OcV9dWXBp0Ns8F+JJULoNld1zsxiHN
	iuBjsswHAHZ5gnhgpNUeq6pImDcW0Ig/XYtkzzxaSWwmjIaUcwfSOd6QEnG1dRnxnfgVoxWzKUS
	+oZ3Obq8JiQZYhU/aoOIXr+E/ujegpG5YtiZ13twJ/r5BbYsw/jTB8cfGeArepSyH3mFdD9lyt7
	ILligaRvNgNvcpk5fFSW1YFMfWCPiEjfZoFiqRAk/S4AHeZ0oMX09eW14SPqco1BeEc/bAZn5Ml
	68NxjSD0pNjxil/cAHKwdESbYCUBc6uG3a0NoXCaq/+nnvCxNEcIzv75AO0qmFxC8mPEF3vpOIJ
	rMnqjYAlf2tfufybkD+/9lZHCysX5QgvBrcaGLT19omkPGbCjcP5KMUcAb/+XoVOK5SkDOFDvpO
	2W4/mTZEXwsV4fo6Z6z78HgxY6J0U/EmEVayz89ozaXauu1hXsLTm5c09hh8ZeJaV6x1LKd0dWQ
	VknQyp25Vi57GIH1FkgI545pmRQj8hYCu0LfTKPPVdMPeG0TDHQXlxcwMILVqV6gR9By19urJRy
	coe1+mSIXbdkyUWg8P091bTLQUB42BvZVeNbshP237AByv99JjVwyRUfpyB2nBnJN62sWwonaUi
	i1q2l7+SfLQURVayyNl1bwiwwOWBDokQkq3/WHwiG
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr10834543eec.40.1795655552534;
        Wed, 25 Nov 2026 17:12:32 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:32 -0800 (PST)
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
Subject: [PATCH bpf-next v4 1/3] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Thu, 26 Nov 2026 01:12:20 +0000
Message-ID: <20261126011222.92180-2-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size. That makes
right_shift_bits 64 in

	*value = (num << left_shift_bits) >> right_shift_bits;

which is undefined behavior for a __u64 on both endians. The path also
bypasses the signed loads used for aligned data, so a negative value of
a signed enum can lose its enumerator name when the data is unaligned.

Fix this by copying unaligned enum data into an aligned buffer, as
btf_dump_int_data() does, and reading it with the same loads as aligned
data.

Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index 08a4bbbf4ffd..85a30b373788 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2329,16 +2329,11 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
 				   __s64 *value)
 {
 	bool is_signed = btf_kflag(t);
+	char buf[8] __attribute__((aligned(8)));
 
-	if (!ptr_is_aligned(d->btf, id, data)) {
-		__u64 val;
-		int err;
-
-		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
-		if (err)
-			return err;
-		*value = (__s64)val;
-		return 0;
+	if (!ptr_is_aligned(d->btf, id, data) && t->size <= sizeof(buf)) {
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {
-- 
2.43.0

