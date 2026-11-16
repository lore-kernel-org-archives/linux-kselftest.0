Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816136;
	b=MAC1D0whCQzvoWpmMV5h1VM5+rlRZqtRh87hJcpcwBorh1yVVz4Qrsgbn/UEejgKsZ7b
	 QsYej+tO+J78tMSkARHpKpVtudVaTM1fOaqFRUJ6YtV9pUfdWPzaCYbz/3dJOUGcVyANJ
	 tofuujcis5aAByzTKRGx8LQFEex0Pd82cWNB8buuuolSJsmdiooMl16JRLSdyQgIaH1LA
	 ZDcJZLNokfZzgMsHF6wRr5CMOLKbSETkx9ODptF3Yry+hFQeubbOEZSx2M/DpO4Vvc3r3
	 VhMnsgUhSTJBYZRN0dFHuxbcV/ieSkuki9mLeudPv25xkb4IUHc54ifhdh9rNbwGEaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
	b=uNAtQVmwx5QWthqloHi4YyRgHrPfmLEG3CZxP1WEWmAP5WQli3G+OJoqRDo+6iaCe2Wq
	 Gv3RfrPkk9UFofJm2Z7Y05i1Vg7jmF3wSUjffmwfVnD9H9BcU3ONrEt2rCLF1L4GydSiK
	 giVX77Ob7tL3dJeuBsKZ9t787Oycx0DB2p/6jwZBVe39gwA4EJ/hlqtJSKTxGBTJ8jREq
	 YlgkJ80aO+MLbfTo+IntF4BHWfPUc/Erc9bpxnlBJMGIhZ9VWQcTlICOckx9Bh9h0uy8J
	 Xtgmw/AHr+O8/C406GKH/GXXIhidEXGZR7LlPkFt6gCX2FlvW8SeNf//ABiA0b6+pgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KMhx/y2T";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB45606A33A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB45606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMhx/y2T
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1356909eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794816134; x=1795420934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
        b=KMhx/y2TI08m7/WuX0zvsxpuIz/n1FVNmqxo1m/44QouDZU/7IkYgeXP2aa1ro7XWB
         NYVpjzOjvF098jJAtQY+j4GtoPeD1EgRv1KP5Lay7r5qdoECqTHXoBEozVxkPzECneWs
         qiSmAWfbu+v8DH08l4uRZG0X7wHui6pFv1/1XhoKMiierI9vDRXZsEhZSTJ1kshLPWn0
         9g2QgsZbpBVV9PV561ux77z08sQYxIz0lglL8+ZPvOyfTpHpRK6cAWfeOAEk3Pnbjq0t
         6X8C173C6uCyjOB3ULUGYZGlSUK3EYOqgeA/NADr/jdoWMJHwLobgU3ysoS721QbfL6h
         GtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816134; x=1795420934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVmP8n1fZ6dTUrYQ1pJb8BUanjFDIC8PD4fAF71ivjU=;
        b=UL7j54Fyeh/CsDIONJQH/zL+ojasRP8RfG+6/pIc05nVYD1d8EoUkfeWm5HP8R7IzQ
         WIQDfw4ceJyDQ1Id4BJPJtzmVW0XrzJm+9FZJKLY44gNnay1+qqQ9FYY8Ib0ImqGORrD
         Q7YdQ0B/vAWNOhOuUDlgcV6+NXGkZI0Peszneiwdw3TrlcHvIJB9e1VyTcTV0XhYI9sy
         JpqYwmvTeUayX0KR2tInFJYH2CjyNqZAlxaLWhC+Hcu8H2eH5x3gD2YdibxYXT5JK3OO
         cpi6yGMVAZONBK7bqnsPbCb0HaPQfQtmSzcjkI778zm2lPAZl43DQYaKgcMIO20KWaGE
         hIAA==
X-Forwarded-Encrypted: i=1; AL+hErGHUoRJLSch/GWzJLd0ySqFydaIBOIYtUBX2mO9nZOMQigc6gywhtYSRn8eNp6eQICeyPb/VQ3X8cNCJ47ZXDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9wwOQwWKjac8K3xrg+8+v1oAR+SU6ZSQ3vsTR7OcI/3dki1RY
	vsja9ZWZmc20dNrwhiEXxaTbngrAr9cypYoXKnU1oxUKsSJevISVN3mi
X-Gm-Gg: AYBFou2N35QCbEDpDvlCNIg1a32hjtZQnXwZHxiVa77haPForC4B7gNUZVdP5qX6qVo
	SID/nCftFszlRiWx+zK5MoZE4vpF2BnbUqHPhCKol3OK+pnIz/y+9FH7DdaE92eYn9B2Od70EVx
	sDKJw7XKIiF51/U2rhwksdzJFLlGCvyeDjuNaukoZg1CqumyO3UkuflCJiDntfbWd00Ybjl9E7T
	HigTOK/RjOKl+lWSPEtRU1VvNP9+QoM61s6f3SHDuVtb3+AnZnpzos2rppLPAuldCBi4AuO/DRm
	xmfbCGexh3tGbgqnzF+CH5JSi8O0K8THaQxihn6NKtR3T/zQAMOpxTkiiWcwelIWEI1jh5OZBIg
	q/tmKSre+zM+pfPBBNSWluxuwYOuh6UZCu51aCkMsZa9er7Cc73lNQhu8ZanXFk/grjBSW03w+W
	rHuyJu8EYgTDfo0xEBBsv/rta5VaiZXNwAZTt0M1tPI4T+HuFjXV3QOUuTqihPcYZVvYp7d/bIw
	gFwfBfr9gtlk4iPYZe6MlChVKlpd723ziGo8oqqdeRrT6LUlzvwDVNaLdpJzK6APBoGO34dk3Pi
	f1obPtE9zXhnTFPohyWhX0411ralZCAwnJX6WKuMld1SLMJnZOIquyTKxfZ903YQxsJ32Wb4o3k
	ltDRTqCLSvqvlp8AYMRrDs6k43KtMW5tWQIw+7Q==
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr15104220eec.33.1794816134232;
        Mon, 16 Nov 2026 00:02:14 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm31128558eec.17.2026.11.16.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:02:13 -0800 (PST)
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
Subject: [PATCH bpf-next v3 1/2] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Mon, 16 Nov 2026 08:01:50 +0000
Message-ID: <20261116080151.44860-2-dennylin0707@gmail.com>
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
index bbe86928b3ec..050a5fbb9533 100644
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

