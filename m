Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732576;
	b=Yh3TPM97uVaLII0pSrnW7ANQPfWRXCWxG3IfLnHDSiBYm19hawMLszsFAgNyqVTLtL45
	 Vivts9IhTT4dWDAgXrPT++EiXnDCLrTV7qtNId9RnQOomESEHTC2gGcsBiJ7ahdcN9FTQ
	 An7fcZE2J76roQEOqTtKRFvrkC8SCcYAFVSWRks7vtHgfwwshYylY6+Yuggh6aI8L0Z8u
	 eWV7Q6GaoG1sXX6IDp8D85vVa6q660Oykq/gJIG4Yqq0CAk95vmd2VX6N3wHCWboE56gN
	 ixRqfTh/L1Z+RM9hekU6w4lM5I2nkrqQsxwS+JnrNaq4bEgu1Jk9MhJW1n8AmOcTi+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
	b=XUzPjWFJPq1yn8Yw6JxGESDox54GywjLJQcoeLdSgHi79pXLjHn5fDHu/q3GrgfXbe/j
	 Oh29lm5drScVUiLw+clmoLCd17aFOqN6Sl+EAB4uxCWrMs8ZQgepGPvK3dkkDKMAjCGhS
	 Fx4offwxD+8J4Jgth40axOIBBXsed2VMly1VIKAV6+wf3tp/5MJwDnzsCitW83zaioocN
	 U3ZzpLqKqkhSPu+bnCXJP+N0+tJJtp9YvgAADFeGIHEVDJLSy9LDhq1RWXZ4r7JbHL6HD
	 wJbHJOjLA0su8lJ3ZBNjR/4MRmHT66JDs6T9Oywj6G0+ZoZ+mBCGkUQCH05/ADVoWFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHwPy5KX;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A118606A32F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A118606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHwPy5KX
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so2811400eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732575; x=1795337375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
        b=eHwPy5KXIJ1E8/MpMkjWHRKMvhAF+WXNBHxnXqSKwiDN5jRtxyNGHhTcQdwOk5tidq
         woW9rzegoNdwLAJTfHKwGWXkRE4WIoY/2wCQ6/xX064ijcLk5hr7hQ0lDJSE26kTArP+
         /ICq2uyzuUSgcJ55fa56HhIwbVs5OX3yrepB2x/J5cIuP17qo9i1tdDitdRcVEIec8/9
         7YHF5fv8Q5UYIwfgARDw0MJQZrZZwPkUqi419Q+Um2Y7wPCZD7CT7Aq6nFIVo5Eowy8m
         1K7gs+ArGuDqpw9IuU8KmzkUIplGSnS4fnukIv3foYRkJIGUmvP6TZaSadekHuQwy+q0
         kwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732575; x=1795337375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Chzegh18gcBEAWx7UANv0tSlVU5fQl0smulwKtfc82U=;
        b=HbRu7RjdfoJn1Dm/EViRfWt1qy28jHlcXyS4XTkfeKtfXoo66QhVyYN20dtQUNmHrZ
         8K3V1e//3jVH3wQ/kryXDLpC0P/2rSLQy70xBWXV6FJYtiwrbgDhqbFfFXlsUM16hIjo
         dSIPajndVmqsqu9XLy3FarYyHkMMgAExzlLqcqZMGd8eM0y90Pe5Y0kw4K5k5Z2G8jqK
         aegdncW9CXmM2rptq734VqQoRtu0qGuMLCGHU7mtHewWKsWfDhrHXek3Wcj4wrFoEuTV
         s0qk46k5yLILdJL3OBKQiWy33qywZ/ww1/oCI5QBxO/uX2yF6jP6x1lVPjbWZ6hIsEzD
         v70A==
X-Forwarded-Encrypted: i=1; AL+hErHBRKWBYqv5/mXomn8fi6sXfuN17f5yclzCi9sGSS9m2blJJ6y3cQMPhzUgnJh/l4rwe/LTGVWLNFwkpRfAk5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eRKtCAKFcb9YDc5NOvXVfqw/VCgIajCx7/saAP67gLQai/lVS
	Mq1u90ecLw4Fk4p3qBziFR6J5cVAlfNLPi2zBRZPr4YmGoaqXK9/LQko
X-Gm-Gg: AYBFou2ocz11eApWfYOIFQDifFtdYgXSr7U6sg4I8yL0E9m/YlCrZW+A5lJkdGtcUUY
	tbax3aXSI7/3kvDtHNzToyQN2f0y3mE83/TCN47jM/ufHLPA4YMxozzaPF2u56yyXHnLoBUudE/
	fYyzgvwvY2GqiczNiIehwI8KbMV2R8nRaTe8s9argLJlgTd0CJHMMKwfgu3TbJvjvlG2ZSRrRve
	VuBiqF6/EW9U/d3PLOc531b3T1bf1htgHWvhgGb2bkdBEHJrmdkk/fouMZHH8kg6Pf1CT/WDjjr
	W2r0584Pue9rUVr5ke/euhok7I3gyeUE/32iv5RADYMF6Hnv9vgaLK/ehKQscEvoBZwx3RcpbmA
	8xdt+0HCZOvX5MoLL3e0Zv3knAi4sjY8/xpPUolMKGBWx+AcnusY5gz7WsAhMo72NNI8ZLPCsGM
	yOb0FKQhQt/HcSmYHECcUMdQlh2BOP7g97ujnoFGvObSeHKmVrW7wtwdL5wXaOkGnUFm5OXzgfI
	U168z0KiACqsgE7mG6OHun6/AlyXi84tutR1lDo/HPqw8zHLBXk9pIr4vtYKEyw1oAcO2gsG6KJ
	UmV5oPjVxw2BygPql/shK93V2c0j3DPZO2w+bXq/S+SdG7dEZEs0I9A4uCqdSnQxUsVP5LBee6U
	sIiOkLweEMISiL4RJzf2rU7tIodl/XJk3AV1kcQ==
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr7610050eec.2.1794732574664;
        Sun, 15 Nov 2026 00:49:34 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:34 -0800 (PST)
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
Subject: [PATCH bpf-next v2 1/2] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Sun, 15 Nov 2026 08:49:22 +0000
Message-ID: <20261115084923.53182-2-dennylin0707@gmail.com>
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
index bbe86928b3ec..a80762a70cd0 100644
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
+	if (t->size <= sizeof(buf) && !ptr_is_aligned(d->btf, id, data)) {
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {
-- 
2.43.0

