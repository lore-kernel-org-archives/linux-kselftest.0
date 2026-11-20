Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212227;
	b=qv9QPLsHkgRFaLOII5d4PPoobjpYeBponviZGwIP7VQ7XyVoU9/t9eM7L0sSTo/2eKFC
	 ytTh4dQjwiaNM8aiNOqOhm6q1jSEbYZZnyNBrMDqxQ4FL4juRNo3Kc1W2BPzq3d6edVcU
	 Do4fY4w7T3oHlwcfJOlABGUfrD5KoHpTLW+rmRFcD8xXqh+Gi3xGfUKDMTmpq8yDGJjfn
	 q5bCdYktM/vGBX6jx6CIuZP4Z117pO5QZGpamdR0kSwYuOlBfiEuMTiY8NtChnQDqgGTl
	 TmyNa86mru70A0X1wzguq4XSACl6s6zSyzzQDm7Su1Y0ar9nzifQ71/zizXWFbpTHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=;
	b=FHd8kbf/c/wRjuwaJIUcWRakuHhRPC3vnua8/WKHMCBNobFWfDIYVVmArrH4KsHntrNn
	 YWbrM8G5/pimySWvpt8pnqGhHzRYX9rpuvvnlKc06h700DGjkgmpKigRwr49j0lpxkPIv
	 a9hxCd/TdV8Q6Vbo7Qps+CHmuhAPdBNzihrg7tCO/hvZYNC+kfnjSv8r1Ei5GShNJTYWL
	 T2RwoJDPsjpa3kt+giw0vu/jz6MTfB4GNYayQlkzERDXpEYOqE4J8N0KGWrMU+iyRH54K
	 4B9QCVNPOGmWRUkT69wEIZPPHSuup+xFMc36Wft2oKg5de7wX6EpiDRCvCYLQMp3J5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycsH7AuE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B93606A6A1
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 22:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B93606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycsH7AuE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13186275e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212220; x=1795817020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=;
        b=ycsH7AuEwi/PG5y/j3/+nKuyPibue+HdCEuLWy1JtDiD1DR8F35ujuFKyeuDodYdU1
         efDxqM7PZfq0ObpZuX+GRe7pH/8QDXd746FnF3tBu5Qqnu74a0ywuz6JOp/IKqcpnyfs
         BZEecralbSxUvc25sdjAmrWaCNv8tEtoiOyqPoow7HLYdDhOOBkrc8CNq34klDkTjt5d
         7Gl6eAStcFMl5h5BDH2qzNke+cN/1HGyVWwc/0nWy8GQgxcS6JYpIUTUOXwwlF9IYXan
         W+h4utjdM6e+a18hfqQqoqsHPE4oXOU1U8rvvOusitKoe5FRxzkLmTAEvQiiWS5M/H59
         dLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212220; x=1795817020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYgilbWDAFhzqBX4pr5QCnT909akeptX2wNGaYFkpnY=;
        b=Tvzf57PmQ08aMMiUyoWfAKgcW8g2ays9M6V/nD7VhOusKeVehdXTFgCWst6UIcxptd
         0rjYEpt/jdP0S/i0CY+vwO6ev60kvPuEVN+E8ZMp5a9AUP4++aJvub+pOGyNeyZs+q/H
         nxYD6sAAESrXjJD2gMXgmdGQnT6sEbeJrABBxk7Feicc2LmXXSpBIbFKLWlZMYss2pQt
         RindF1KRDfRkc3WvkzIEqPUU5KpDxgMNv24cFwKrttDx147HRkK/ycnvUaoGUK8vqgyG
         COPXIfzZ6/exX8RF2jC31Neq7+8FvhJxcOjLJUJVXnI9dsxGOOfGtElWSR4flrJFBp9C
         Tg/Q==
X-Forwarded-Encrypted: i=1; AL+hErEN50M7dyzIrkEJ7zsB6HVVVXTOI/SbyVhQFRVYoYIpD9ldqZ0SC31n7veXOFeGzRIAjP+ClqYPtM63veT5FWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z97RcIqcC/yyJMuI0SFRgrJ8ikM4fnAHtDksbgL4fpvm9I3utqz
	Yxrw97r9o7ESnKHtUcyAqo5ozaQcR/EUYB/lNhUpRODIC2xzNOxSMWYRrIY7W81GXjE=
X-Gm-Gg: AYBFou0j3sIm5/6Gs9RGeI1JLWiN7z8DsNjwvsLEYII8Ln98l3X/r1EnZW+GJ/cjHXI
	rjbvxHdQVf5FDGBXYyKZcWVta85XKgQ3GAVZsQLNAPVw/ydFbk+tg7IX1y2DoFKjTDV58Ujw+H/
	KBsBJTqvOBOJUDjVlzmgr7IM2WcgrmwWdmNda09UISABQI0RCLtPNnNsDlgbT4VwvYrMRzF4xFg
	sA/9hYpVe/w0ZXjh98ecFH1SIB7EvgyXUG3HfST6+Wt7OgVG37jyO75euicxop1unz3mYt5Mb8Y
	jiR5YJY3QahNtbz2KzQ9BskEksopsZL37ihsdgRBIjPYe6ztQ7IFd5cCskJvVdpRo/4WHCpMxR+
	z6L28S+U+ljNY/kJLbQb/7t18fWDagzMJz6DsTJIPJlslIISu4/QUTzstjAsBqQmY4lytHngWpC
	DQZuLclMFGdLjT2Rfz1cKosjar8Jm3qs5WR/Fc8d93+aewizAEQIX0h+QUQCesU5Owo2uMTPICn
	wRCvnnBl0hnRcdpE/S0LCxYGCSk2XC/Xemcbp7RE5qg8/DRqGaHz2QOh2n+8ha05jOGVwb8qDM3
	lQE+pDU8Sr68/gOCMXqXrxjM/OF/lauKcVFtzmHChv1Egl/HpNNZQuq6xuYr/kC9zB+WZtwliIH
	lGCGcJwax
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr105794155e9.29.1795212220053;
        Fri, 20 Nov 2026 14:03:40 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:38 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:23 +0100
Message-ID: <20261120220330.1067165-2-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120220330.1067165-1-demyansh@gmail.com>
References: <20261120220330.1067165-1-demyansh@gmail.com>
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

arm64 falls back to the generic csum_partial_copy_nocheck(), which does
two passes (memcpy() + csum_partial()) and hits software GSO paths
(e.g. TCP over WireGuard) and UDP/ICMP replies.

Implement a single-pass csum_partial_copy_nocheck() in
arch/arm64/lib/csum.c using a 64-byte carry-tree primitive unrolled 4x
to 256 bytes (~21 instructions per 64B, pure leaf function with zero
spills on GCC 15 and Clang 21) and 16-byte @src alignment for
len >= 272. Each summed word is read once into GPRs before storing and
summing, so the checksum always matches @dst under concurrent @src
modification.

In-kernel KUnit benchmark on ARM Neoverse-V2 (3.0 GHz,
CONFIG_CHECKSUM_KUNIT_BENCHMARK=y, GCC 15.2 / Clang 21.1, median of 3):

  case (src/dst)    memcpy+csum_partial  fused (GCC / Clang)    speedup
  ----------------  -------------------  -------------------  -----------
  16B    (+0 / +0)     4.0 /  3.7 GB/s      6.9 /  5.9 GB/s   1.73x/1.61x
  64B    (+0 / +0)     9.4 / 10.5 GB/s     19.1 / 22.0 GB/s   2.04x/2.08x
  256B   (+0 / +0)    16.3 / 18.4 GB/s     33.2 / 35.2 GB/s   2.04x/1.92x
  512B   (+0 / +0)    19.4 / 21.0 GB/s     36.5 / 39.3 GB/s   1.88x/1.87x
  1368B  (+0 / +0)    21.7 / 22.2 GB/s     39.5 / 41.2 GB/s   1.82x/1.85x
  1448B  (+0 / +0)    21.8 / 22.2 GB/s     39.2 / 41.1 GB/s   1.79x/1.86x
  4096B  (+0 / +0)    23.4 / 23.5 GB/s     42.5 / 43.9 GB/s   1.82x/1.87x
  16384B (+0 / +0)    23.8 / 24.0 GB/s     43.3 / 45.1 GB/s   1.82x/1.87x
  16B    (+1 / +3)     1.5 /  2.6 GB/s      6.9 /  5.9 GB/s   4.44x/2.25x
  128B   (+1 / +3)     6.4 / 10.5 GB/s     24.3 / 27.2 GB/s   3.78x/2.60x
  1448B  (+1 / +3)    17.8 / 18.0 GB/s     38.0 / 39.0 GB/s   2.14x/2.16x
  1500B  (+1 / +3)    17.9 / 18.2 GB/s     36.5 / 39.6 GB/s   2.04x/2.18x
  4096B  (+1 / +3)    19.1 / 19.5 GB/s     40.6 / 42.0 GB/s   2.12x/2.15x
  16384B (+1 / +3)    19.4 / 19.6 GB/s     42.3 / 43.8 GB/s   2.18x/2.24x

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Demian Shulhan <demyansh@gmail.com>
---
 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 ++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)

diff --git a/arch/arm64/include/asm/checksum.h b/arch/arm64/include/asm/checksum.h
index dc52b733675d..9f766db01152 100644
--- a/arch/arm64/include/asm/checksum.h
+++ b/arch/arm64/include/asm/checksum.h
@@ -44,6 +44,9 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 extern unsigned int do_csum(const unsigned char *buff, int len);
 #define do_csum do_csum
 
+#define _HAVE_ARCH_CSUM_AND_COPY
+__wsum csum_partial_copy_nocheck(const void *src, void *dst, int len);
+
 #include <asm-generic/checksum.h>
 
 #endif	/* __ASM_CHECKSUM_H */
diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
index 75db718e5b6a..2bf2d63cfd42 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (C) 2019-2020 Arm Ltd.
 
+#include <linux/bitops.h>
 #include <linux/compiler.h>
+#include <linux/export.h>
 #include <linux/kasan-checks.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 
 #include <net/checksum.h>
 
@@ -116,6 +119,192 @@ unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
 	return sum >> 16;
 }
 
+static __always_inline __uint128_t get_unaligned128(const u8 *p)
+{
+	u64 lo = get_unaligned((const u64 *)p);
+	u64 hi = get_unaligned((const u64 *)(p + 8));
+
+	return ((__uint128_t)hi << 64) | lo;
+}
+
+static __always_inline void put_unaligned128(__uint128_t val, u8 *p)
+{
+	put_unaligned((u64)val, (u64 *)p);
+	put_unaligned((u64)(val >> 64), (u64 *)(p + 8));
+}
+
+static __always_inline __wsum csum_fold_acc_cy(__uint128_t acc, u64 cy)
+{
+	__uint128_t t;
+	u64 s;
+
+	acc += (acc >> 64) | (acc << 64);
+	t = (__uint128_t)(u64)(acc >> 64) + cy;
+	s = (u64)t + (u64)(t >> 64);
+	s += (s >> 32) | (s << 32);
+	return (__force __wsum)(u32)(s >> 32);
+}
+
+static __always_inline void csum_tree64_ovf(const u8 *s, u8 *d,
+					    __uint128_t *acc, s64 *cy)
+{
+	__uint128_t v0 = get_unaligned128(s);
+	__uint128_t v1 = get_unaligned128(s + 16);
+	__uint128_t v2, v3;
+	s64 o;
+
+	put_unaligned128(v0, d);
+	put_unaligned128(v1, d + 16);
+	o = __builtin_add_overflow(v0, v1, &v0);
+
+	v2 = get_unaligned128(s + 32);
+	v3 = get_unaligned128(s + 48);
+	put_unaligned128(v2, d + 32);
+	put_unaligned128(v3, d + 48);
+	o += __builtin_add_overflow(v2, v3, &v2);
+
+	o += __builtin_add_overflow(v0, v2, &v0);
+	*cy += o + __builtin_add_overflow(*acc, v0, acc);
+}
+
+static __always_inline void csum_align_src16(const u8 **ps, u8 **pd,
+					     unsigned int *pulen,
+					     __uint128_t *pacc, s64 *pc0)
+{
+	uintptr_t off = (uintptr_t)(*ps) & 15;
+
+	if (unlikely(off) && *pulen >= 272U) {
+		unsigned int adv = 16U - (unsigned int)off;
+		u64 lo = get_unaligned((const u64 *)(*ps));
+		u64 hi = get_unaligned((const u64 *)(*ps + 8));
+		u64 odd = (u64)off & 1ULL;
+		u64 m = ~0ULL >> ((off & 7) * 8);
+		u64 h;
+
+		put_unaligned(lo, (u64 *)(*pd));
+		put_unaligned(hi, (u64 *)(*pd + 8));
+		lo = (off & 8) ? (lo & m) : lo;
+		hi = (off & 8) ? 0ULL : (hi & m);
+		h = lo + hi;
+		h += h < lo;
+		*pacc = ror64(h, (unsigned int)(odd * 56ULL));
+		/*
+		 * At len <= INT_MAX, the 256B loop adds <= 16 carries per
+		 * iteration (< 2^27 total before bit 62 is cleared, and c0
+		 * stays < 2^33 overall), so bit 62 of @c0 cannot overflow.
+		 */
+		*pc0 = (s64)(odd << 62);
+		*ps += adv;
+		*pd += adv;
+		*pulen -= adv;
+	}
+}
+
+static __always_inline __wsum csum_fold_final(__uint128_t acc, u64 cy, u64 odd)
+{
+	__wsum res = csum_fold_acc_cy(acc, cy);
+
+	if (unlikely(odd))
+		return (__force __wsum)ror32((__force u32)res, 8);
+	return res;
+}
+
+/*
+ * Single-pass copy and ones' complement sum. Each summed word is read once
+ * into a GPR before storing and summing, so the returned sum always matches
+ * @dst even if @src is concurrently modified.
+ */
+__wsum __no_sanitize_address csum_partial_copy_nocheck(const void *src, void *dst, int len)
+{
+	const u8 *s = src;
+	u8 *d = dst;
+	__uint128_t acc = 0;
+	s64 c0 = 0;
+	u64 odd = 0;
+	unsigned int ulen = (unsigned int)len;
+
+	if (unlikely(len <= 0))
+		return 0;
+
+	kasan_check_read(src, len);
+	kasan_check_write(dst, len);
+
+	if (ulen >= 64U) {
+		if (ulen >= 256U) {
+			csum_align_src16(&s, &d, &ulen, &acc, &c0);
+			ulen -= 256U;
+			do {
+				csum_tree64_ovf(s, d, &acc, &c0);
+				csum_tree64_ovf(s + 64, d + 64, &acc, &c0);
+				csum_tree64_ovf(s + 128, d + 128, &acc, &c0);
+				csum_tree64_ovf(s + 192, d + 192, &acc, &c0);
+				s += 256;
+				d += 256;
+			} while (!__builtin_sub_overflow(ulen, 256U, &ulen));
+			odd = (u64)c0 >> 62;
+			c0 &= (1LL << 62) - 1;
+			ulen &= 255U;
+			if (!ulen)
+				goto fold;
+		}
+		if (ulen >= 64U) {
+			ulen -= 64U;
+			do {
+				csum_tree64_ovf(s, d, &acc, &c0);
+				s += 64;
+				d += 64;
+			} while (!__builtin_sub_overflow(ulen, 64U, &ulen));
+			ulen &= 63U;
+			if (!ulen)
+				goto fold;
+		}
+	}
+	if (likely(ulen >= 16U)) {
+		ulen -= 16U;
+		do {
+			__uint128_t v = get_unaligned128(s);
+
+			put_unaligned128(v, d);
+			s += 16;
+			d += 16;
+			c0 += __builtin_add_overflow(acc, v, &acc);
+		} while (!__builtin_sub_overflow(ulen, 16U, &ulen));
+	}
+	if (likely(ulen & 8U)) {
+		u64 v = get_unaligned((const u64 *)s);
+
+		put_unaligned(v, (u64 *)d);
+		s += 8;
+		d += 8;
+		c0 += __builtin_add_overflow(acc, v, &acc);
+	}
+	if (likely(ulen & 4U)) {
+		u32 v = get_unaligned((const u32 *)s);
+
+		put_unaligned(v, (u32 *)d);
+		s += 4;
+		d += 4;
+		c0 += v;
+	}
+	if (likely(ulen & 2U)) {
+		u16 v = get_unaligned((const u16 *)s);
+
+		put_unaligned(v, (u16 *)d);
+		s += 2;
+		d += 2;
+		c0 += v;
+	}
+	if (ulen & 1U) {
+		u8 v = *s;
+
+		*d = v;
+		c0 += v;
+	}
+fold:
+	return csum_fold_final(acc, (u64)c0, odd);
+}
+EXPORT_SYMBOL(csum_partial_copy_nocheck);
+
 __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			const struct in6_addr *daddr,
 			__u32 len, __u8 proto, __wsum csum)
-- 
2.53.0

