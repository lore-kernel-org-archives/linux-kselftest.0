Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655555;
	b=mNbtttkFtPgY4+sO8e+tDHieT32473YWLYxV8vu0acrjduXfMKCD3HmMj977+l9J8CsQ
	 yyo9q0hzOY9pxznwENpWoMVQOQOdLZnK7Ofg7ADSRkN8KW3DZDnhOm4kN3bWA5pa7GkCc
	 hkPDms4N5BXmXHtxqge6mpREVjpjp50tOjEz5pTi6+Po3IfZEvl+T5EObD/MKu0+xV309
	 Zw5r+nYJ4dkwncQ2z+yJG96dPowdRVWs5Ff/qKc9CN1Ucy3v0hdZ2zumujSvN7EVmS0Aw
	 Y2erBW+QqSXxeDrBozBmXn6mCHeCKdHCt9AyHwgeWRvE9G0kPm5180MqrkFrTxukp9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oWWt+JRsU8dIht0Xx5BJG7ychdP34VOm0uiu+1YVjSI=;
	b=A8P7fdGs++hjDa2WaDDVLUiw+QvfIbm0TKtDsb6oKK/Qam2kD5nqHn+QFwu8A0nCLmJK
	 mKCIFa71Cc6cet8iAuIsrTFiI/bFtDaYEPPtUBS6OcBoG6a2+mhi3QPagD00d38rany7x
	 A5De3QPn4Lc1TKihF7JYMWAnhjdNzi0P/eGjaj9PfV5uI8vo7Lhq1QnBnOiNEnlxspMsT
	 PcbHnYbWVfG4Edi560pNUZ2k4VE/6FWr5zZA1AmXSEErF4XFlHS1vCxj7IAqxCtTrRCbU
	 nTg1fXxL36p9Hoz2Ai7OqUvOHJ+uhhAmC577wLzShAx3aJ1voWxtOLag5GHVhSPmsow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JR9cGXSW;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6B606A690
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A6B606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JR9cGXSW
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2318390eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655554; x=1796260354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWWt+JRsU8dIht0Xx5BJG7ychdP34VOm0uiu+1YVjSI=;
        b=JR9cGXSW7EleW+6lAnwBcid8RuQrYByV3CQDb8a/cQ5vpMt2C9Zl723R/aKN6sgAy3
         pxC/ikjBiy30XemW31DZzjCRCZhc96TZ57kDXPjgGPVUVYSgPUvvrqTDcaBIzBpoyoVr
         EmbrTdV0n2D7y7H3bLD+7qK9yZGvpSFpf1InLS7Yie2krGW/3f2ma8l0iZU7QMi2qk+B
         Jr70eYTW6auu5NytO7a5+dyxSFtbwMdci2VgDqzty/6In3/pyBEVLzOIM/VhYro0y430
         DMWrCX/oH1Yg1w4QZDkN/goJyzRjO7clrnIgaWgGgXSqWmEilm3c2m1+EtF+scZxj/mv
         OoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655554; x=1796260354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWWt+JRsU8dIht0Xx5BJG7ychdP34VOm0uiu+1YVjSI=;
        b=V7tGUQx2Z9fPHPYezAyeNPMMxn+17o0i1NbMHm9iRPX7ukf+vdrDDFZauS8q1hE4Ec
         cAffymcngIGNRA7DVcMiSE0yiTiHddLmslm+KroPEs+HBYBySlQIGNCYNoPy2zEXDVHS
         Nhrqmkk4AQ+h+tnWqcq+TWHuJLyZBVhTs7FUtSh2CvizlVPQ7VG36jJUNt22Fz2o5N7A
         gUgifrCUfqsT/Zjuu1r2U06wzlRmUDj0Qx2XaWHleAvtHZNRMmbGHVbZAUDPY2Wx9iV6
         Xcbn+f8GYA6QHT1Tah7tqVnNZcklGuwVf7c+RVH1ardrFlHEsASh6XpfIAGkukvjZ6PP
         TtbA==
X-Forwarded-Encrypted: i=1; AL+hErGAz4eV/EdNfUrjg3OCiDBjlhYRS0UzpiZhCJFGT2xHaq/apJWKfxvJTu9ZP/FCIUM0X3cW+E3hP4oVn4AuPf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0jwBI1tzbeho44Yvg+7qVPUFjU06EUKZN/9mIvc0sR7LNRiMR
	M+IAFiwWmX7o/dwshY0KxNSe9hS/LI/CEl/vXLz8h/shAYN3z+BE+t+M
X-Gm-Gg: AZFdTZcbqf31+eBlcuR4cIr0uo3CKLxtJ8rlbohloS3T5y9q2X2v9Lkb2k6owmgwulE
	91qCENoCHZb91V5ZAr0yw0TD6xb8dizAh2jy5+VNKniOlVhAIvPUwFMuL9jt0Z2fONocqvXVt2c
	YFj/jfer/38ZC/kbM+1HfCClgA9kI9bgA/zuOZnFgBmbwnqgrW14pB0SnRvlsC9b8V6mBbHPCva
	Ku7GbkVxOmG9LG+thA3Z3QbTary6xFa9kzuNy8c9/G+qXz7pUD75viV7a86f9OAAtGR1JcPuuIm
	jOrJyi9+1jr5iHUcm8Ud3x3eCJBcwMe7UTNvk01Q1RLnptUJqDA3SEBaS0i24BkPsfYKXnR1R1n
	0rVu0SXPOOHFPJ7Cu6f5DQY+HlbC93vcKDH7iWzKwT/e3RQjEsX0hi4dSP5Kcg2+xSL/a9Crml0
	W8kq/TWV+X2VM6NdMGslb2hTIx99slEWv8sOYrcCPpu80GacnnPkQZST5fP6a8NvSSBY9tTR/1Q
	/kLPoznKKQi+57vI4fjkMRCcc8HG93OCdRdO1Z4k7roVaHLVmT//ZMhrtwJSrvEYv9MMQT6WvgT
	Hc4fogUVU0RTKXwD+qU++RIiJDIOPfkgITK+j0ycGRxd0kPVgciJikLOJN50wyD29NiCW4gPlbu
	teiMTXlwbwcEofK5oNYi0RM7mA4LQK0aNdFZccxQ4lA==
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr19101315eec.24.1795655553614;
        Wed, 25 Nov 2026 17:12:33 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:33 -0800 (PST)
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
Subject: [PATCH bpf-next v4 2/3] libbpf: Fix zero detection of enum bitfields in BTF dumper
Date: Thu, 26 Nov 2026 01:12:21 +0000
Message-ID: <20261126011222.92180-3-dennylin0707@gmail.com>
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

btf_dump_type_data_check_zero() ignores bit_sz for enums and reads the
whole enum through btf_dump_get_enum_value(). For an enum bitfield that
value includes the bitfields next to it. In struct fs_context,
purpose:8 and phase:8 are followed by need_free:1, so with need_free
set the dump prints both enums as 0 without emit_zeroes. phase starts 3
bytes before the end of the struct, so its 4-byte read also goes 1 byte
past the data.

Check enum bitfields with btf_dump_bitfield_check_zero(), as is already
done for int bitfields. btf_dump_get_bitfield_value() bounds-checks only
the bytes that hold the bitfield but then reads t->size bytes, so read
only those bytes.

Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Link: https://lore.kernel.org/bpf/DN40PKFY2KUF.13KK78H8OW2J9@gmail.com/
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index 85a30b373788..3387ceb2a3d3 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -1879,7 +1879,7 @@ static int btf_dump_get_bitfield_value(struct btf_dump *d,
 		return -E2BIG;
 
 	/* Maximum supported bitfield size is 64 bits */
-	if (t->size > 8) {
+	if (t->size > 8 || nr_bytes > 8) {
 		pr_warn("unexpected bitfield size %u\n", t->size);
 		return -EINVAL;
 	}
@@ -1888,13 +1888,13 @@ static int btf_dump_get_bitfield_value(struct btf_dump *d,
 	 * stored in num, then we left/right shift num to eliminate irrelevant bits.
 	 */
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-	for (i = t->size - 1; i >= 0; i--)
+	for (i = nr_bytes - 1; i >= 0; i--)
 		num = num * 256 + bytes[i];
 	nr_copy_bits = bit_sz + bits_offset;
 #elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-	for (i = 0; i < t->size; i++)
+	for (i = 0; i < nr_bytes; i++)
 		num = num * 256 + bytes[i];
-	nr_copy_bits = t->size * 8 - bits_offset;
+	nr_copy_bits = nr_bytes * 8 - bits_offset;
 #else
 # error "Unrecognized __BYTE_ORDER__"
 #endif
@@ -2574,6 +2574,8 @@ static int btf_dump_type_data_check_zero(struct btf_dump *d,
 	}
 	case BTF_KIND_ENUM:
 	case BTF_KIND_ENUM64:
+		if (bit_sz)
+			return btf_dump_bitfield_check_zero(d, t, data, bits_offset, bit_sz);
 		err = btf_dump_get_enum_value(d, t, data, id, &value);
 		if (err)
 			return err;
-- 
2.43.0

