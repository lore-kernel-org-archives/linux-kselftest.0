Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361116;
	b=xXYlveNI3Rk6Yl4vZt72pCcW3DvBIusM9KA14amQsAlkzd4PfeOqCnlz3qVgkCsajGTP
	 nLl8cAS/XahFfEVBSdBHhjm+OrCJRqYxCi4gzLga94dVfNt9hHFEHaHRhy4I4H3jgIJOe
	 iS38v8wletJawfvthnFyyzfoxxXBYZPpeGfIPgp3JoMY2k49S7RMp4+sLIFOkfHut0uS2
	 u4ZRXIbS1LvCYW+1g9LwGRWyeshridmFifEwie4wh+RVeVZcENJzKvN72gBCBiWmx6M+m
	 +lHM4yxiE6fIZOkj2zZsm9wOCpdwV7ga/EiYfUrlw/ErtvYwSyI2auzHz1WQ9JA179w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=n9kcoaXq9ZX8rpwr/RlmQNWBtCpFTUM1yYrrw2E3eQY=;
	b=4bNM3NmlUzekxGmEW8qhZbRQuZi5D5MxhywMsXwL9CB0dCeL8lYh6LcYhrglyFYziM5/
	 LWiTfzz5Qmj586ObQrXBTlUvMzA1UltDCXPxCfh5VReV0ZAAZtWjEGkBla0d4IBVmN1co
	 DrVOlfcEVr9ZtfjcgeGPLNCTOfpDzrk/V7Ll/22g228VjYCUTtIsoQID5iaMdv6zA0XRW
	 nGfHC0r86qdaTir27O2OHpjfSdTidR1JNapPcWpIItxJCi/udrpRKqWpxCh5qmvYjg5T7
	 LvHXNlYuRdyQfh08AA9bLe24/aZSDWJk1e4xaajIEAXHlkh00h4cibTeNCWdlWlPQJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HevXf8d8;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0C606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE0C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HevXf8d8
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15943c9c005so1059776c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361116; x=1793965916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n9kcoaXq9ZX8rpwr/RlmQNWBtCpFTUM1yYrrw2E3eQY=;
        b=HevXf8d8OLPlf55rrpk2CJ2RYu0Pok6eNVW1u67C3MLD1VKcGuWmoeGKx9unYYZB3d
         vbN5SD9iZgXFEV5BUMja5rI2DrtE3/dqfAMtnqzY5QDiLS6PcoJHEDg+uWG09nmyDREY
         BKHrDnEYxA8wxEDyr+EFwMdffM7oKdRG1LJGE0HvaMNiOpgn/ucUPXjqpRH/GS5RRCEs
         ZICuZMN8emg3UF6hGfCqNymAUxO7f07LU9kmH+96QyTLV92MJjZfofrfFwEKYhaiQkN1
         nMO5dXFXOSyQ6YnU9Vb13vIYVurOOjbHcSYYVaMhXkKQb9flw6LQLq7kaig0GWUTmd7l
         DuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361116; x=1793965916;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n9kcoaXq9ZX8rpwr/RlmQNWBtCpFTUM1yYrrw2E3eQY=;
        b=R4gbLQNZlzmdS4ujubWWQhBj/ahDcqQ9dd0BEqiUH3bQc0SFEDhwukeUT6S67TzgcB
         x0M6MwEk/ql4zxY0wRnya6SRfIXn8QhP6xIErUm0o3LxNOd969HMhQOQrG19j3cYn5wl
         TdAhFb6K0o79J0cDMONamGL+KrRDkXSRKIcUKqyt97FzfwLKnA3vWCPM/6A6fKs+th7p
         aTC1Bb12eXczitSHiZ1kGXzosLHe8Iu1V/ziQ/JpBH5K7167l0PtlLMNv6Xhzw2bmXjw
         YFBVMzG4726bXb+HE95J2E9RMnnn8nPskPb/0/DmBjnMXGsszdyQ0Vk8gYvTAXXdEFns
         Ox0g==
X-Forwarded-Encrypted: i=1; AKwUvBzWhUT/qV4Mu9rqXHNDa8r1l7koYvGWjKofVxWqhMAxYjYenM5Ld436YbxUTU6P7lrdtlSDnsKTtIqWhkdNYEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvU0x4ilelhgtceIPWdDSDiP18QhVNRMupLUYuDyTXtbYuJftj
	Cc48YsMxgY5kWH4U0MlUdO6UnL8+4cw9+ukFNOt0ZOsvkQvOexziR1C1
X-Gm-Gg: AYBFou3lgACcpAW61WfMis2EwH1BbMbyIk5YNEPm2wHA8vJQGGtj6ThL0at+UfQh8mn
	koHJAkYxNg0mBszF8D0VEbkjfcNfZt9CkJohbhSQmo4ERBz6GFCAPLGtyKuTXV1Djcgfb5YL60B
	YiNPo7RaGQyHGKEznpM0ei54e85mIYwz37p2kWx2kcRi+23y1EwBv+7YF6OvCHmCWEkHuBaIKH+
	WtW02li934kXDgIIaQq3Qn0wpqNfh8zom3ITNhQan4IPIlx+7IGRMqw+rPiHGhv8LgpGu8tYyRE
	RFbw/MKkDVm9jd8/3q3aWmFQJ+6EylTUQoa79B7kTcSVKtwKiM4VR3QYk6LS2/FSAUJhnd8Eo/v
	VMv1a/RGfwLoWboOwiTvd/3TfqASuywrpJJP6Jylb/0SNU869ElpjPf0mqvlZTLiu0AIXz/JJQf
	mHO+7a1CtMiR7AJuTUXXXsvEsUt0NAFUBx8CyKUNj9EQnzhttLLQLEae4RM9vA1+UvQmo1HWMRS
	SvrbMiwaXIyxuHjqLTDH7zaCx1MQVCJYAlDbmC9Q+fhhf9qgBFe4Ey43TQKN8i/FoFbaPUhB5lD
	lOtG6zSY114/yKrIzn9Cz9nG
X-Received: by 2002:a05:7022:b90d:b0:163:a197:722d with SMTP id a92af1059eb24-1ac55777052mr2693722c88.4.1793361115315;
        Fri, 30 Oct 2026 04:51:55 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:51:54 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v2 00/22] bpf: Replace bpf_patch_insn_data() with
 a list of deferred patches
Date: Fri, 30 Oct 2026 07:51:45 -0400
Message-Id: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKE5GoC/4WNQQqDMBBFryKz7pRJKtZ25T2Ki6gTHagaEgkW8
 e5Nc4FuPjw+7/8DAnvhAM/iAM9RgqxLAn0poJ/MMjLKkBg06UoRKeycxZgcK+zRma2fsMupy1J
 TTVzf7gMk3Xm2sufpF/yshfcN2tRMErbVf/JnVLn/Px8VEhqlB1sbeqiKmnE28r726wzteZ5fS
 tp2v8oAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_patch_insn_data() and bpf_patch_insn_single() apply a patch right
away: they move the tail of the instruction and aux data arrays and walk
the whole program to fix up branches and every table that names
instructions. Removing instructions works the same way.

A pass that patches M instructions of an N instruction program does
O(N * M) work. Eduard pointed out that this takes a large share of the
time to load pyperf180 [1], and with bpf_jit_harden=2 or many nops to
remove it gets to minutes.

Replace them with a list that a pass fills with patches and commits
once in O(N + inserted instructions). Following the layout of Jiong's
RFC [2], the list goes to core.c and the verifier side to fixups.c,
then each pass moves over and the last patch removes the old code. As
Andrii suggested there, map every old index to a new one once and
relocate all jumps through that map. Since passes queue patches in
increasing order of the instruction they replace, keep the list in a
sorted array instead of a linked list.

  1-3   the patch list in core.c and in the verifier
  4-6   bpf_do_misc_fixups(), gotol for a backward may_goto
  7-9   removal of instructions, dead code and nops
  10    zext
  11-13 patching an instruction twice, inserting in front of one
  14-17 ctx accesses, may_goto counter setup, hidden subprog, bpf_loop()
  18-19 commit without a verifier env, constant blinding
  20    removal of the old code
  21-22 selftests

Load times on an x86_64 VM with 32 vCPUs, the base commit below with
and without the series, measured in one round: perf stat -r30 --
veristat -q <obj> averaged over two runs, -r10 for BPF_F_TEST_RND_HI32
and bpf_jit_harden=2, three runs of loading 131072 "ja 0":

                                   base       patched
  pyperf180                       0.512 s    0.350 s
  pyperf600                       1.407 s    0.885 s
  strobemeta                      0.591 s    0.588 s
  test_verif_scale2               0.643 s    0.646 s
  pyperf180, BPF_F_TEST_RND_HI32  1.708 s    0.360 s
  pyperf600, BPF_F_TEST_RND_HI32  5.161 s    0.891 s
  pyperf180, bpf_jit_harden=2     3.185 s    0.362 s
  pyperf600, bpf_jit_harden=2     9.879 s    0.899 s
  131072 "ja 0" removed          53.146 s    0.769 s

With bpf_jit_harden=2, test_verifier's "ld_dw: xor semi-random 64 bit
imms, test 5" doesn't load within 900 s on base and loads in 5 s with
the series.

For the 1052 objects of the selftests, every program that loads has the
same xlated code, line info and func info on both kernels, by default,
with BPF_F_TEST_RND_HI32 and with bpf_jit_harden=2, masking the
immediates that hold addresses, BTF ids and blinding constants.
test_verifier passes on both, test_bpf fails the same 53 tests on both
when hardened, and test_progs only shows failures that are flaky in
parallel runs.

[1] https://lore.kernel.org/bpf/a714ee96d0ad96bbc9d51037616e5c4e2790a8ec.camel@gmail.com/
[2] https://lore.kernel.org/bpf/1562275611-31790-1-git-send-email-jiong.wang@netronome.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Convert every pass and remove the old patching code (Alexei)
- Build the new image in core.c, so that blinding without a verifier env
  uses the list too
- Let the list remove instructions, insert in front of one and patch one
  twice
- Pick JEQ or gotol for a backward may_goto from its offset grown by the
  patches in between, v1 picked JEQ when that offset was -32768 (CI bot)
- Test a backward may_goto expanded to gotol
- Test a jump that the patches push out of its 16-bit range, and a gotox
  to a patched insn
- Rebase onto current bpf-next, which adds the arena_scalar rewrite

v1: https://lore.kernel.org/r/20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com

---
Qiliang Yuan (22):
      bpf: Add a list of deferred instruction patches
      bpf: Remap the verifier state through the patch list
      bpf: Apply single-instruction patches of the verifier in place
      bpf: Queue the rewrites of bpf_do_misc_fixups()
      bpf: Expand a backward may_goto to gotol when patches push it out of range
      bpf: Drop the constant delta from bpf_do_misc_fixups()
      bpf: Let the patch list remove instructions
      bpf: Remove dead code through the patch list
      bpf: Strip nops through the patch list
      bpf: Batch the patches of bpf_opt_subreg_zext_lo32_rnd_hi32()
      bpf: Allow patching an instruction twice through the patch list
      bpf: Teach the patch list to insert in front of an instruction
      bpf: Allow inserting in front of a queued patch
      bpf: Move bpf_convert_ctx_accesses() to the patch list
      bpf: Insert the may_goto counter setup through the patch list
      bpf: Append the hidden subprog through the patch list
      bpf: Inline bpf_loop() calls through the patch list
      bpf: Apply the patch list without a verifier env
      bpf: Blind constants through the patch list
      bpf: Remove the old instruction patching code
      selftests/bpf: Test jumps around patches of bpf_do_misc_fixups()
      selftests/bpf: Cover a backward may_goto pushed out of range by patches

 include/linux/bpf.h                                |    4 +-
 include/linux/bpf_verifier.h                       |   87 +-
 include/linux/filter.h                             |   16 -
 kernel/bpf/bpf_insn_array.c                        |   35 +-
 kernel/bpf/core.c                                  |  552 ++++++---
 kernel/bpf/fixups.c                                | 1285 +++++++++-----------
 kernel/bpf/verifier.c                              |   46 +-
 tools/testing/selftests/bpf/prog_tests/verifier.c  |    2 +
 .../selftests/bpf/progs/verifier_patch_list.c      |  210 ++++
 9 files changed, 1240 insertions(+), 997 deletions(-)
---
base-commit: 7101b10cf281f629ac58c99697ca6f6d082b99a7
change-id: 20261001-bpf-verifier-patch-batch-2442080e837d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

