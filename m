Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513232;
	b=0a+yKjspELGMDA5B+wV8g2gb6X6VyHR1bJS+GNUr0MyofHXYOj1e5ML+Oq5bOueOcfow
	 3j3IrE/g6vqABqRVsDFhJcmP5D8NBCbRE6ey6GwieyR7E4laUWDuRwQrMHnLu4b+3QLam
	 liobRQvW6TKcuGzy6m0Su2CfP4VYk1ggCRSqElLRHynLz46HCUJrMne3l5X1jAY6Cm/NR
	 fetXusGzLNPdFG9kagAsNfb4V8dK/Q/BZXhJdP3jj1d865dvGjg26zzuaJZf8Cmb9b20t
	 3otITIoYTiCxbTJagf6gAP8dexsQKNXDV+w7lVmwHqOsVkvXjq7P6EdopUHczRqwfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513232;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sw0Rt7vqhhhHXuR/kqMIOEmCx8YstN+oG6LNxRkcBg0=;
	b=ElGOt4IMODqnu2NSFK8dKPfXG/zsMR8kd36tInhvNfSXqkqMu6Mr04bx4u1dzkj1BTN5
	 BcXsBkHfI8cQVKxOKAu3j0WmzUcYIblAViQxv3KI1kplGcdyIVE7cdR7aeVXIccTg9JIi
	 LnBWSnrrF2KhvKFDZ+FaWmWF11HOJcKuDu4qMepxa7xu1Z8Eli4dBNuTD8nL11ANoy2Zq
	 0Nzn6xVOcyGoop2F0Z/vRCfLgb2PhUgzKRGRjJyjo5jI2si75sXnlDkflYzOwhPDaNdA6
	 yM0rKcpHVRU7EecAE8ka2xYjxCJTrJQkSImD2Mxy7zvPW+peMbuVumn0N7C8Qgaa6HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="NQGjzoy/";
	arc=none smtp.remote-ip=91.218.175.214
Received: from mta0.migadu.com (out-214.mta0.migadu.com [91.218.175.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918E606A324
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 16:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3918E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NQGjzoy/
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Q302pfkEjtg0bjYhHItjsXd7uy9gzx2wXtjDeZSnxc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513230; v=1; x=1793118030;
 b=NQGjzoy/jn1OCwKFvpCdSg3XcNS0NUFQ5tXPMhww/YURl/yvB1vgxURM07ydAnYAEbFq5d1f
 d9EY5srzIFK9vp2KarqLJN5t1cqVezoFvQlrhwEtIgoravIwsxiyr7jQbdfIrMQYVFlsIGkIBB0
 XO+iWbeC5linlxomxIpeg418=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09312a5580f3931b;
	Tue, 20 Oct 2026 16:20:23 +0000
X-Mizu-Trace-ID: 09312a5580f3931b
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
Subject: [PATCH bpf-next v3 09/12] bpf: Track low-32 scalar equality across narrowing stack fills
Date: Tue, 20 Oct 2026 09:19:04 -0700
Message-ID: <20261020161907.2115379-10-vineet.gupta@linux.dev>
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

A 32-bit fill from a wider spilled scalar has the same shape as a 32-bit
mov from a wider source, and the relation was dropped rather than
recorded:

  r6 = ...                  /* full 64-bit unknown */
  *(u64 *)(r10 - 8) = r6;   /* slot linked to r6 */
  r2 = *(u32 *)(r10 - 8);   /* narrowing fill */
  if w6 != 0 goto ...       /* not taken: r6's low 32 bits are 0 */
  if r2 == 0 goto ...       /* not deduced today */

Record a low-32 link as the mov arm does. Stack slots are already
first-class members of an ->id set, so sync_linked_regs() and the
reconstruction helpers apply unchanged. A fill narrower than 32 bits has
no expressible relation and still drops it.

Which extension rebuilds the high half depends on the load, so
check_stack_read() takes is_ldsx and sets BPF_REG_LINK_SEXT where that
is known. check_mem_access() then keeps a sign-extending link across a
4-byte sign-extending load only: BPF_REG_LINK_SEXT means (s32)(base +
delta) specifically, so an 8- or 16-bit ldsx is a relation the kind
cannot express, the same way the ALU arm's subreg_link is gated on
(insn->off >> 3) == 4.

Costs. A bisect lands one clang regression here -- big_alloc2 2956 -> 3095
insns, 157 -> 165 states -- but it is not this patch alone: it takes both
this and the preceding reverse-direction patch, and neither moves
big_alloc2 by itself. The external corpus does move for this patch alone,
no verdict changes, six programs verifying in more instructions:

  +1812    2470 ->  4282  test_file_open    bpfjailer-lib-tests open
  +1765   59556 -> 61321  twfw_connect4     tupperware-agent twfw_sock
  +1765   59556 -> 61321  twfw_sendmsg4     same object
   +752    5874 ->  6626  layered_enqueue   scx_layered 1.0.11.1
   +252    2512 ->  2764  bpfj_exec_execve  exec_enforce
   +252    2512 ->  2764  bpfj_exec_execveat  same object

+6598 over 25.2M, or +0.026%, and +218 states. The shape is the familiar
one: a more precise recorded state has a smaller equivalence class and
prunes against fewer predecessors.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
v3: was v2 9/13.
 - renamed to the new encoding, and the fill inherits the slot's delta
   rather than resetting it, matching patch 6
 - a sign-extending load keeps a link only if it is a 4-byte
   BPF_REG_LINK_SEXT. BPF_REG_LINK_ZEXT says the opposite of what the
   load just did, and an 8- or 16-bit ldsx is a relation the kind cannot
   express.
 - measured cost, which v2 did not report: six external programs verify
   in more instructions, +6598 aggregate (+0.026%), worst +1812 on
   test_file_open. No verdict changes. Attributed to this patch by
   building the patch-7 and patch-8 kernels separately.

 kernel/bpf/verifier.c | 60 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 6b26487d4549..feefa5733fd7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4223,7 +4223,8 @@ static void bpf_diag_stack_read_invalid(struct bpf_verifier_env *env, int off, i
 static int check_stack_read_fixed_off(struct bpf_verifier_env *env,
 				      /* func where src register points to */
 				      struct bpf_func_state *reg_state,
-				      int off, int size, int dst_regno)
+				      int off, int size, int dst_regno,
+				      bool is_ldsx)
 {
 	struct bpf_verifier_state *vstate = env->cur_state;
 	struct bpf_func_state *state = vstate->frame[vstate->curframe];
@@ -4258,22 +4259,52 @@ static int check_stack_read_fixed_off(struct bpf_verifier_env *env,
 
 			if (size <= spill_size &&
 			    bpf_stack_narrow_access_ok(off, size, spill_size)) {
+				bool narrowing = get_reg_width(reg) > size * BITS_PER_BYTE;
+				/*
+				 * A narrowing fill keeps only the slot's low 32 bits,
+				 * so record a low-32 link rather than dropping the
+				 * relation, as a 32-bit mov from a wide source does.
+				 * Which link kind depends on how the load fills the high
+				 * half, hence is_ldsx.
+				 */
+				bool subreg_link = narrowing && size == 4;
+
 				if (dst_regno < 0)
 					return 0;
 
-				if (env->bpf_capable && size == 4 && spill_size == 4 &&
-				    get_reg_width(reg) <= 32)
+				if (env->bpf_capable && size == 4 &&
+				    (subreg_link || (spill_size == 4 && !narrowing)))
 					/* Ensure stack slot has an ID to build a relation
 					 * with the destination register on fill.
 					 */
 					assign_scalar_id_before_mov(env, reg);
 				state->regs[dst_regno] = *reg;
 
-				/* Break the relation on a narrowing fill.
-				 * coerce_reg_to_size will adjust the boundaries.
+				/*
+				 * A fill that is not narrowing copies the slot's link
+				 * kind verbatim, which a sign-extending load can
+				 * contradict. check_mem_access() runs after this and
+				 * drops any kind but BPF_REG_LINK_SEXT once it knows
+				 * the extension was not a no-op.
 				 */
-				if (get_reg_width(reg) > size * BITS_PER_BYTE)
+				if (subreg_link && reg->id) {
+					/*
+					 * Keep the slot's delta: both
+					 * (u32)(base + d) and (s32)(base + d)
+					 * have low half base + d, so the fill
+					 * inherits it rather than resetting it.
+					 */
+					state->regs[dst_regno].link_kind =
+						is_ldsx ? BPF_REG_LINK_SEXT : BPF_REG_LINK_ZEXT;
+				} else if (narrowing) {
+					/*
+					 * Nothing to relate: either the slot has
+					 * no id to share, or the fill is narrower
+					 * than the 32 bits a link can describe.
+					 * coerce_reg_to_size adjusts the bounds.
+					 */
 					bpf_clear_scalar_id(&state->regs[dst_regno]);
+				}
 			} else {
 				int spill_cnt = 0, zero_cnt = 0;
 
@@ -4439,7 +4470,7 @@ static int check_stack_read_var_off(struct bpf_verifier_env *env, struct bpf_reg
  */
 static int check_stack_read(struct bpf_verifier_env *env,
 			    struct bpf_reg_state *reg, argno_t ptr_argno, int off, int size,
-			    int dst_regno)
+			    int dst_regno, bool is_ldsx)
 {
 	struct bpf_func_state *state = bpf_func(env, reg);
 	int err;
@@ -4478,7 +4509,7 @@ static int check_stack_read(struct bpf_verifier_env *env,
 	if (!var_off) {
 		off += reg->var_off.value;
 		err = check_stack_read_fixed_off(env, state, off, size,
-						 dst_regno);
+						 dst_regno, is_ldsx);
 	} else {
 		/* Variable offset stack reads need more conservative handling
 		 * than fixed offset ones. Note that dst_regno >= 0 on this
@@ -7295,7 +7326,7 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 
 		if (t == BPF_READ)
 			err = check_stack_read(env, reg, argno, off, size,
-					       value_regno);
+					       value_regno, is_ldsx);
 		else
 			err = check_stack_write(env, reg, off, size,
 						value_regno, insn_idx);
@@ -7392,13 +7423,20 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 			 * Sign-extension can change the register value relative
 			 * to a scalar it is linked with by id (e.g. a zero-
 			 * extending fill of the same spilled stack slot), thus
-			 * drop the shared id in that case.
+			 * drop the shared id in that case. Only a 4-byte
+			 * BPF_REG_LINK_SEXT link survives: it says the high
+			 * half is this very sign-extension. BPF_REG_LINK_ZEXT
+			 * says the opposite and would be a lie about the value
+			 * just produced, and an 8- or 16-bit sign extension is
+			 * a relation BPF_REG_LINK_SEXT cannot express at all --
+			 * it means (s32)(base + delta) specifically.
 			 */
 			bool no_sext = reg_umax(&regs[value_regno]) <
 					(1ULL << (size * BITS_PER_BYTE - 1));
 
 			coerce_reg_to_size_sx(&regs[value_regno], size);
-			if (!no_sext)
+			if (!no_sext &&
+			    !(size == 4 && regs[value_regno].link_kind == BPF_REG_LINK_SEXT))
 				bpf_clear_scalar_id(&regs[value_regno]);
 		}
 	}
-- 
2.53.0-Meta

