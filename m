Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513256;
	b=klbvOX627CUuFy1iAThygjJutcmTyW46itOwG0RHMr885Zc5J47zoPV11aDCe+2QZrpv
	 8PkcstN2EfUIdi4wiBhBTrIkLclcVruV4SFz+Sf2d34pnS7sUrrWwhaBb4yySML9T0UYe
	 AhMagy1IPP52YVeBJ/SG/aIqh5Cg94CeWzAmKuXtZMZOiOevaoub4+TdRiaTAbbaAZKp7
	 RaJjJcj4aD1yra71mvqMnQzAJY5o9ga5OJUrwHQBhpxaY+0dqgMFg9SZOjSgMjSOqOLUs
	 Sv13/rvD7DE1etHehiczk0mdRueLgO+YoHhgB2dZzaeB/VFzi5kLOa+XquS/yIJRowg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513256;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hrU0r9uDIs9Pd22NaQQcI8Yi0Ld/nqW4OLqdhS8pNrI=;
	b=Algip17XzK1MiaZ+URyM9yyZZ4p6cb49Skm6lWW1YL0w1aVKSEWw7np0eVS+JGKBaa3J
	 DqWhlxJC+QRJSNStoGvjYId007v0SD+iDRXKZJReiI5dO2mYIpeSHJdlbqvcNLicKnA2J
	 cCq7ydaVeuWSRhvzIHKxYlM7y9cI0ICt+rKJrbRo+hDNtZ7AK7bbGnI9+r24wXsnHZlH4
	 NRceSQ0IXkogexhvYnn+Hjz0/g7uN3iqVFEQhL3trGiUcByByYbe6d0+IDKYSH0jSevKV
	 U0H3i2iaKnZirZt8rTSGqxeBnpoSevTYOEE/ueA0XVicPdx9ARcomoVUgcIG9KbypcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DdSjhmh4;
	arc=none smtp.remote-ip=91.218.175.236
Received: from mta0.migadu.com (out-236.mta0.migadu.com [91.218.175.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8F4606A33F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8F4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DdSjhmh4
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NbWUSQWwUXooZIyxNLSex7QYUtdoTqWvzVJqXTgn82c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513254; v=1; x=1793118054;
 b=DdSjhmh4MWu3D3DfmX7AKIi9g6mERQmU6G+jeRd4kFbYCSrHHm8E3orwkqcUcCfCY3YJ2WPI
 i+aMwtCvz57MkjjEZoVMXrYD7HIfnGysxxClgTP8QWYASdDvlLH7JYj1GW6qHLrctehdPg84Fr3
 15RqnSM3D9gIERG+L76VZoPk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1348edbf7a2f3df;
	Tue, 20 Oct 2026 16:20:54 +0000
X-Mizu-Trace-ID: a1348edbf7a2f3df
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v3 12/12] [do not merge] selftests/bpf: Cover the low-32 link for narrowing stack spills
Date: Tue, 20 Oct 2026 09:19:07 -0700
Message-ID: <20261020161907.2115379-13-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020161907.2115379-1-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
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

Six programs:

 - zext_narrowing_spill_reaches_fill: narrowing while the value is still
   on the stack narrows the slot, and the fill copies an already narrowed
   value. This is the order the link is for
 - zext_narrowing_spill_drops_link: the other order does not pay, since
   the fill is a mov and a mov drops a zero-extending link
 - zext_narrowing_spill_truncates_slot: the slot must be truncated before
   the kind goes on it, or the first sync empties it. Asserted on the
   dump, since nothing downstream rejects an empty slot --
   BPF_F_TEST_REG_INVARIANTS does not walk them
 - zext_narrowing_spill_byte_no_link: a sub-word spill is below the model
 - sext_delta_survives_narrowing_spill: a source carrying a delta hands
   it to the slot
 - sext_fill_of_narrowing_spill_drops_zext: a sign-extending fill of such
   a slot must not come away with its zero-extending link

Posted with the patch above, which is not proposed for merge; these go or
stay with it.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
v3: was v2 13/13, now tagged [do not merge] with the patch above.
 - zext_narrowing_spill_keeps_link becomes
   zext_narrowing_spill_drops_link: a fill is a mov, and a mov drops
   the link (patch 4)
 - new: zext_narrowing_spill_reaches_fill, the first positive test for
   the spill link, narrowing before the fill
 - new: zext_narrowing_spill_truncates_slot,
   sext_delta_survives_narrowing_spill and
   sext_fill_of_narrowing_spill_drops_zext

 .../bpf/progs/verifier_linked_scalars.c       | 181 ++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
index ab78285153fb..8ade4836e1b2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
+++ b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
@@ -1217,6 +1217,128 @@ __naked void zext_fill_byte_forms_no_link(void)
 	: __clobber_all);
 }
 
+/*
+ * The link does reach a fill, provided the narrowing happens while the value
+ * is still on the stack: sync_linked_regs() walks spilled slots, so narrowing
+ * r6 narrows the slot and the fill copies an already narrowed value. This is
+ * the order the narrowing-spill link is for; the other order is below.
+ */
+SEC("socket")
+__success
+__naked void zext_narrowing_spill_reaches_fill(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	r0 <<= 32;						\
+	r6 |= r0;		/* r6 = full 64-bit unknown */	\
+	*(u32 *)(r10 - 8) = r6;	/* narrowing spill, forms the link */ \
+	if w6 != 0 goto 1f;	/* narrow r6 while it is on the stack */ \
+	r2 = *(u32 *)(r10 - 8);	/* fill gets the narrowed value */ \
+	if r2 == 0 goto 1f;					\
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * A narrowing spill stores only the source's low 32 bits, so the slot is their
+ * zero-extension. Filling it back is a mov, though, and that drops the link
+ * for the same reason zext_chain_drops_link does, so a later narrowing of the
+ * source does not reach the filled register.
+ */
+SEC("socket")
+__failure
+__msg("div by zero")
+__naked void zext_narrowing_spill_drops_link(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	r0 <<= 32;						\
+	r6 |= r0;		/* r6 = full 64-bit unknown */	\
+	*(u32 *)(r10 - 8) = r6;	/* narrowing spill, forms the link */ \
+	r2 = *(u32 *)(r10 - 8);	/* fill it back */		\
+	if w6 != 0 goto 1f;	/* narrows r6, propagates to r2 */ \
+	if r2 == 0 goto 1f;					\
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * save_register_state() copies the source register whole, so the slot of a
+ * narrowing spill arrives holding bounds for bits the store never wrote.
+ * Recording BPF_REG_LINK_ZEXT on top of those is a contradiction, and the first
+ * sync_linked_regs() runs straight into it: it rebuilds the slot's low half
+ * correctly and then intersects it against the stale wide bounds, which are
+ * disjoint from it, leaving the slot with an empty range. Nothing downstream
+ * notices -- not even BPF_F_TEST_REG_INVARIANTS, which does not walk stack
+ * slots -- so assert on the dump.
+ */
+SEC("socket")
+__success __log_level(2)
+/* untruncated, the slot kept r6's umin=0x100000000 and went empty on sync */
+__msg("*(u32 *)(r10 -8) = r6 {{.*}} fp-8={{.*}}smin=0,smax=umax=0xffffffff")
+__naked void zext_narrowing_spill_truncates_slot(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	r7 = 1;							\
+	r7 <<= 32;						\
+	r6 |= r7;		/* r6 >= 2^32, so the spill narrows */ \
+	*(u32 *)(r10 - 8) = r6;	/* slot is (u32)r6 */		\
+	r8 = 1;							\
+	r8 <<= 32;						\
+	r8 += 5;						\
+	if r6 > r8 goto 1f;	/* narrows r6, syncs the slot */ \
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * A sub-word spill is below the low-32 model, so no link is formed there.
+ * The fill is a byte load too, so this pins the spill-side and fill-side
+ * size gates together rather than either on its own.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void zext_narrowing_spill_byte_no_link(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	r0 <<= 32;						\
+	r6 |= r0;						\
+	*(u8 *)(r10 - 8) = r6;	/* 1-byte spill: no link */	\
+	r2 = *(u8 *)(r10 - 8);					\
+	if w6 != 0 goto 1f;					\
+	if r2 == 0 goto 1f;	/* not deduced */		\
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 #ifdef CAN_USE_MOVSX
 
 /*
@@ -1628,6 +1750,36 @@ __naked void sext_delta_survives_narrowing_fill(void)
 	: __clobber_all);
 }
 
+/*
+ * And for a narrowing spill: the slot holds (u32)(r6 + 5). Recording delta 0
+ * there put the slot, and anything filled from it, 5 away from the truth.
+ */
+SEC("socket")
+__success
+__naked void sext_delta_survives_narrowing_spill(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	r6 <<= 32;						\
+	call %[bpf_get_prandom_u32];				\
+	r6 |= r0;		/* r6 = full 64-bit unknown */	\
+	w7 = w6;		/* BPF_REG_LINK_ZEXT, delta 0 */	\
+	w7 += 5;		/* BPF_REG_LINK_ZEXT, delta 5 */	\
+	r8 = (s32)r7;		/* BPF_REG_LINK_SEXT, delta 5 */	\
+	*(u32 *)(r10 - 8) = r8;	/* narrowing spill keeps delta */ \
+	if r6 != 0 goto 1f;	/* narrow before the fill */	\
+	r2 = *(u32 *)(r10 - 8);	/* r2 == 5, not 0 */		\
+	if r2 == 5 goto 1f;	/* always taken: r2 is 5 */					\
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 #endif /* CAN_USE_MOVSX */
 
 #ifdef CAN_USE_LDSX
@@ -1800,6 +1952,35 @@ __naked void sext_byte_fill_drops_sext_link(void)
 }
 #endif /* CAN_USE_MOVSX */
 
+/*
+ * The same, with the zero-extending link coming from a narrowing spill rather
+ * than a mov. The spill truncated the slot to 32 bits, so the fill is not
+ * narrowing and assigns no link kind of its own; the slot's zero-extending
+ * one must not survive the sign-extending load.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void sext_fill_of_narrowing_spill_drops_zext(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	r0 <<= 32;						\
+	r6 |= r0;		/* r6 = full 64-bit unknown */	\
+	*(u32 *)(r10 - 8) = r6;	/* narrowing spill: slot is ZEXT */ \
+	r2 = *(s32 *)(r10 - 8);	/* sign-extending, not narrowing */ \
+	if w6 != -1 goto 1f;	/* slot low 32 bits are all ones */ \
+	if r2 s>= 0 goto 1f;	/* taken only if r2 was rebuilt zext */ \
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 #endif /* CAN_USE_LDSX */
 
 char _license[] SEC("license") = "GPL";
-- 
2.53.0-Meta

