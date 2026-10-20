Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513197;
	b=VWYdcBlyt31mopf9kUMhXcd35vDGTBStXfMYamqvP4nJinspBv5Db5bmkPLcdHZY0tGp
	 WLOoeqSKLT47aY5tDAR7i516DPoRkD4bWktq2ULkhRIa9BU8l1lWkW2WTfKUWfaqUSuAo
	 VHnZmZPamxHJrA//gI31L+Qg6ZHkQk6aEy5LakOaiqSu+uPex0BwtVhlnI0GIQEitr6Hn
	 euELVqFWbr3S3UUz3MwJKWQxxMpRzd0eg6++d3TN4z2fQfb/10bgMUxjzKd4n4E8BMU8k
	 HksxHcvu7G9BZZ+ztFKejeKkyE9rU0nlb3rXZE3ULRZoGgpq+GLS1S0n97eRyxgDXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513197;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RVoTgcAQXB5rgHPLpjPs/Gm5jX5WIltzh7QLbBPaz5I=;
	b=PbafevnMsvhPxFusZ/jFFKk3SgxWPc4Iw8eTyfaxkDMrFNeyWyJC18HkWBHUkaZczZ1c
	 IAL4ligHHwlwSwH0EqnEoyHoDFih3fqOl+EX2mlBwJjjYkrzOkI3bmo0Q9sH3dtRxhW7M
	 +3BIMW5Mv7xKGRHeHyMg/u1AxlgmVur4Yl32Nfd7VtzhKfHz2rVM3kB2682Mea3vCvL7r
	 6UNZpSw89odtfCmO4SiqVuNQeHvuAreOcp5l8oDHu6ri6gcHsQ1UgfuKb240/w/B37ltN
	 jZMKJSzC1CUvj8oxVmFgcr878KKhQn6o539uXdoPQIeicZ9jMBR+jfBELyPUmg3NZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pRFjvFoN;
	arc=none smtp.remote-ip=95.215.58.192
Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42D60A2634
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B42D60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pRFjvFoN
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LsitunW01SQT/ZcfyOpRkAmAGyeFYZNYS9JvKyOWyS0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513194; v=1; x=1793117994;
 b=pRFjvFoN5AqT/iR06nNqylzFoCX1OigwzW7bwWHpWCIPq/z+fDygfwVQpEapTQfEu6WHoL8u
 frGxeRAIL690Q7cfP0zoTSmsAj36OqV5UjCAkTS/FLqtKlu/i+WMycq6adUbinGyW4/fUD/32w1
 rsvXqXwt1y47G38SIzrcQ1eo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 037769676b8ba4e8;
	Tue, 20 Oct 2026 16:19:54 +0000
X-Mizu-Trace-ID: 037769676b8ba4e8
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
Subject: [PATCH bpf-next v3 05/12] selftests/bpf: Cover the low-32 link for zero-extending movs
Date: Tue, 20 Oct 2026 09:19:00 -0700
Message-ID: <20261020161907.2115379-6-vineet.gupta@linux.dev>
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

Twelve programs, one per decision the previous patch makes:

 - zext_mov_narrow_src: narrowing the source reaches the destination
 - zext_sync_makes_member_const: and over all 64 bits, since the member
   is the zero-extension
 - zext_narrow_dst_keeps_base: the reverse must not happen
 - zext_u32_src_is_full_link: a provably-u32 source still propagates
 - zext_self_mov_no_link: a self-mov mints no id
 - zext_chain_drops_link: a second 32-bit mov drops the link
 - zext_no_sync_between_mixed_kinds: differing kinds do not reach each
   other, in either direction
 - zext_no_sync_from_subreg_base: nor does a member reach a base whose
   high half it knows nothing about
 - zext_sync_between_two_subregs: two low-32 links on one base do
 - zext_unlinked_path_stays_reachable: one unlinked path keeps the
   guarded div reachable
 - zext_mov_breaks_linked_src: forming the link drops the source's own
 - zext_sync_keeps_narrower_member: narrowing the base does not widen a
   member that already proved itself tighter
 - zext_contradiction_keeps_range_sane: a contradiction leaves no empty
   range behind, under BPF_F_TEST_REG_INVARIANTS so the violation is a
   load failure rather than something only dmesg sees

Written in asm so the bytecode is the same whichever compiler built the
suite.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
v3: was v2 4/13.
 - renames and commentary follow patch 4; zext_chain_keeps_link becomes
   zext_chain_drops_link, and two dump expectations change because the
   link now renders as "%+d" rather than v2's ".lo32".
 - new: zext_sync_makes_member_const, for the 64-bit constant a helper
   argument depends on, which no other test asserted
 - new: zext_sync_keeps_narrower_member
 - new: zext_contradiction_keeps_range_sane, guarding patch 4's
   empty-range fix. It discriminates at patches 4-7 and not at the tip,
   where patch 8 prunes the branch; patch 4's message says so.

 .../bpf/progs/verifier_linked_scalars.c       | 348 ++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
index 5a120fc7c1e7..815160e56942 100644
--- a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
+++ b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
@@ -710,4 +710,352 @@ l_exit_%=:							\
 	: __clobber_all);
 }
 
+/*
+ * A 32-bit mov from a wide source shares only the low 32 bits. Narrowing the
+ * source must reach the destination through that link.
+ */
+SEC("socket")
+__success
+__naked void zext_mov_narrow_src(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	if w6 != 0 goto 1f;	/* narrows r6, propagates to r7 */ \
+	if w7 == 0 goto 1f;					\
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
+ * Pinning the base's low 32 bits makes the member a known constant over all
+ * 64, not merely over its low half: the member is the zero-extension, so its
+ * high half is zero by construction. Checked with a 64-bit compare, which
+ * zext_mov_narrow_src above does not do. Code that needs a provable constant
+ * -- a helper argument such as bpf_rdonly_cast()'s btf_id, say -- depends on
+ * this and not on the 32-bit form.
+ */
+SEC("socket")
+__success
+__naked void zext_sync_makes_member_const(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	if w6 != 0 goto 1f;	/* narrows r6's low 32 to 0 */	\
+	if r7 == 0 goto 1f;	/* r7 is 0 over all 64 bits */	\
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
+ * A contradiction between the two sides must not leave an empty range behind.
+ * The branch really is dead -- (u32)7 is not 5 -- but an empty range is a
+ * shape nothing downstream handles.
+ *
+ * The mod by a known-zero divisor validates r7 without recomputing it, so an
+ * empty range would survive into the check; under BPF_F_TEST_REG_INVARIANTS
+ * that is a load failure, which is what __success asserts. A later patch
+ * prunes this branch, so the test pins this patch standing alone.
+ */
+SEC("socket")
+__success
+__flag(BPF_F_TEST_REG_INVARIANTS)
+__naked void zext_contradiction_keeps_range_sane(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	if w7 != 5 goto 1f;	/* r7 == 5 */			\
+	if r6 != 7 goto 1f;	/* r6 is wide, so this is explored */ \
+	r9 = 0;							\
+	r7 %%= r9;		/* validates r7 without touching it */ \
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * The reverse does not hold: narrowing the low-32 link says nothing about the
+ * base's high bits, so r6 must stay unknown and the div stays reachable.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void zext_narrow_dst_keeps_base(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	if r7 != 0 goto 1f;	/* narrows r7, must not propagate to r6 */ \
+	if r6 == 0 goto 1f;	/* taken only if r6 wrongly narrowed */	\
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
+ * A provably-u32 source takes the full-equality path, not the low-32 one:
+ * narrowing the destination must reach the source.
+ */
+SEC("socket")
+__success
+__naked void zext_u32_src_is_full_link(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	w6 = w0;		/* r6 provably u32 */		\
+	w7 = w6;		/* full link, not low-32 */	\
+	if r7 > 10 goto 1f;	/* narrows r7, propagates to r6 */ \
+	if r6 > 10 goto 2f;					\
+	goto 1f;						\
+2:								\
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
+ * A self-mov has nothing to link, so it must not mint an id for r6.
+ */
+SEC("socket")
+__success __log_level(2)
+/* an id would print as R6=scalar(id=N+0,smin=... */
+__msg("(bc) w6 = w6 {{.*}} R6=scalar(smin=0,")
+__naked void zext_self_mov_no_link(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	r6 ^= 0;		/* drop the id */		\
+	w6 = w6;		/* forms no link */		\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * A second 32-bit mov drops the link: assign_scalar_id_before_mov() clears
+ * any link kind on the source, and the zero-extending link is one, so
+ * narrowing the base no longer reaches the end of the chain. Same rule as
+ * scalars_double_add above -- a delta of zero is not special.
+ */
+SEC("socket")
+__failure
+__msg("div by zero")
+__naked void zext_chain_drops_link(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	w8 = w7;		/* the 2nd mov breaks the link */ \
+	if w6 != 0 goto 1f;	/* narrows r6, does not reach r8 */ \
+	if w8 == 0 goto 1f;					\
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
+ * Two members of one id set carrying different link kinds do not propagate
+ * to each other: r7 is (u32)base and r8 is base + 3, and the deltas were
+ * added at different ALU widths, so narrowing r8 says nothing about r7.
+ * sync_linked_regs() declines the pair on the kinds before the deltas are
+ * ever consulted. Note neither register is the base -- that is r6.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void zext_no_sync_between_mixed_kinds(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	r8 = r6;						\
+	r8 += 3;		/* r8 is BPF_REG_LINK_FULL, r7 is BPF_REG_LINK_ZEXT */	\
+	if r8 != 3 goto 1f;	/* must not propagate to r7 */	\
+	if w7 == 0 goto 1f;					\
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
+ * ... and here the low-32 link is the branch register, so the register
+ * carrying the delta must not be narrowed either.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void zext_no_sync_from_subreg_base(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* forms the link */		\
+	r8 = r6;						\
+	r8 += 3;		/* delta on r8 */		\
+	if w7 != 0 goto 1f;	/* must not propagate to r8 */	\
+	if r8 == 3 goto 1f;	/* taken only if r8 wrongly narrowed */	\
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
+ * Two low-32 links on the same base do propagate to each other: both are the
+ * zero-extension of the same low 32 bits.
+ */
+SEC("socket")
+__success
+__naked void zext_sync_between_two_subregs(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	w7 = w6;		/* two links on one base */	\
+	w8 = w6;						\
+	if w7 != 0 goto 1f;	/* narrows r7, propagates to r8 */ \
+	if w8 == 0 goto 1f;					\
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
+ * A narrowing of the base must not widen a member that has already proved
+ * itself tighter. The low-32 link does not propagate back to the base, so the
+ * base can be the wider of the two; rebuilding the member from it has to
+ * refine what the member knows rather than replace it.
+ */
+SEC("socket")
+__success
+__naked void zext_sync_keeps_narrower_member(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	r0 <<= 32;						\
+	r6 |= r0;		/* r6 = full 64-bit unknown */	\
+	w7 = w6;		/* forms the link */		\
+	if w7 > 7 goto 1f;	/* r7 low 32 bits in [0, 7] */	\
+	if r6 > 100 goto 1f;	/* narrows the base, syncs to r7 */ \
+	if r7 <= 7 goto 1f;	/* still provable if r7 kept [0, 7] */ \
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
+ * Only one of the two paths links r7 to r8, so narrowing w8 reaches r7 on one
+ * and not the other, and the div stays reachable. This pins the outcome, not
+ * any one check: the two states differ in several ways, so no single
+ * regsafe() test is load-bearing here.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__flag(BPF_F_TEST_STATE_FREQ)
+__naked void zext_unlinked_path_stays_reachable(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	r6 &= 1;						\
+	if r6 >= 1 goto 2f;					\
+	/* explored first: r7 is a low-32 link of r8 */		\
+	call %[bpf_get_prandom_u32];				\
+	r8 = r0;						\
+	w7 = w8;		/* forms the link */		\
+	goto 1f;						\
+2:								\
+	/* runtime path: r7 unrelated to r8 */			\
+	call %[bpf_get_prandom_u32];				\
+	r8 = r0;						\
+	call %[bpf_get_prandom_u32];				\
+	w7 = w0;		/* no link here */		\
+1:								\
+	if w8 != 0 goto 3f;	/* propagates to r7 only if linked */ \
+	if w7 == 0 goto 3f;					\
+	r0 /= 0;						\
+3:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/*
+ * Forming the link calls assign_scalar_id_before_mov(), which drops whatever
+ * link the source already carries. That is what the narrow-source path has
+ * always done, so a wide source behaves the same: r5 stops tracking r6.
+ */
+SEC("socket")
+__failure __msg("div by zero")
+__naked void zext_mov_breaks_linked_src(void)
+{
+	asm volatile ("						\
+	call %[bpf_get_prandom_u32];				\
+	r6 = r0;						\
+	r5 = r6;		/* r5, r6 linked */		\
+	r5 += 3;		/* r5 = base + 3 */		\
+	w7 = w5;		/* breaks r5's delta link */	\
+	if r6 > 9 goto 1f;	/* r6 in [0, 9] */		\
+	if r5 < 13 goto 1f;	/* taken only if r5 still linked */ \
+	r0 /= 0;						\
+1:								\
+	r0 = 0;							\
+	exit;							\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.53.0-Meta

