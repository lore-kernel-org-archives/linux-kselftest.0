Received: from mail-dy2-f15.google.com (mail-dy2-f15.google.com [74.125.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7B23EAB0
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847343; cv=none; b=t9HAGLzyUTbhbtXjsfoD8SatJ+Qz2qnLQv8D3JJA7vI/0xEicMfUBVlopHUhVIX1G+Y8r3sTQhsMFFOhzNo8epWGsMa6htQj3JwNjBqUMBTo+bsN4o2jszI0NGzwTC/fcFxZ3LPfziOuVwNFsE79atNKvfQEcY9F7PLtpIBDMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847343; c=relaxed/simple;
	bh=TAy7SXvodxwIVUeYRCkkRqmpU/1T4vMLfRFjM5CPyIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cj7PdN/Nb73dqaZWWXkzSiyqunfkPXFv3r0rCjufZFC7+nrGixn3WsTaXJaPg4DX+2bA7eQLGfxuB8kiJfWcTHMxojNOzqPZRCNKqbA1glC/J7MlbMEdxowLQ4cddP7JxDRGSZ9bGAZ1VXE01lVX6vmqzyhA3Hsj2JpZJ4KUmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqm180Pb; arc=none smtp.client-ip=74.125.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqm180Pb"
Received: by mail-dy2-f15.google.com with SMTP id 5a478bee46e88-34b223602d7so2158880eec.2
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847340; x=1791452140; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LGX/SBLSJlBXSD7ryPBEbi/Uhkcr21PESamwaTOcG4E=;
        b=kqm180PbmrGS4GnfTdq6usSOjR//PeE7YQJz6u2KzbV2pOZ4X9DeuvPrjj5Q5RvOWy
         PXbVEgyc67GpgWX2pe0HpwtJL5NLEk5Y/oDM5gd/RlEv2tokNMwDtkj9OAumN+AE1DZW
         Jvs8tAmJTK+yCKq9fBS2J9DN5n1Nlxxpa61yTBFTXvWx3qjCeYVVdqh4fv2K/aZGQjXt
         +2TL33XrUX9LcQ9H09aISEyrIhYc4q4ZjCSu4ISGxziQmCbn5OcR//WCjDTknghrHbOB
         FoiEZDYTK9fj231f1cIyA6v9+no7V7R3J1517FuYm6TlNUzAWiRBoq2FJyy5cXtkJgDC
         agQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847340; x=1791452140;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LGX/SBLSJlBXSD7ryPBEbi/Uhkcr21PESamwaTOcG4E=;
        b=u98df4AUeyjP1AuYZqjMQ2Ma1mDvaaAm5nVSJANpIYEShwiEfKADtewXZdwnDPRUb7
         lhmmY7W24Tc12BNsYcPSppmWqsr4v9cg/xQ1lBcEMs6t1pHxJHsivWclx0dUY2jEXNgT
         aDjwIlAGNykRnGTp9c5R8IY4SUcwLdLBYbJNYX+0YNupmew/oUPYuKQSQ7jVM7EaKgrQ
         SVeqv2qYYOaKWpTm8VOLsgdA4Our07Z/CEk2h6hOmcj0bLYQFTCxMrEvN17j3tSicEtX
         lrq++xBkE0v6efOYrtgOK4kwwNZqR8Hk/JziIgqAPnBpCik9D3cPj+8c9qFYJdfCnQet
         z+sw==
X-Forwarded-Encrypted: i=1; AKwUvBxttLkSvbXQUe+NaoUKn2StMnWkeWsTYLFsL98S+SplK5UYm9ACXzwN3xtUYwEqyUaLd+TPNbCVGzzQou6fTkk=@vger.kernel.org
X-Gm-Message-State: AFuF++nPoRVmvRghjDMCvPCZ62rPkpoQfJ9pZanMCsyJGDx5sIJEXzhf
	2cfnZl7adSFDuN/HtKfA6A9xelxT0C6rNQncwfW5eKqffSc5DQZbQ/Fd
X-Gm-Gg: AYBFou217z/thdIhT2AwOVPmZiMR9u9CtM4htSJ6KWp0FfRGCxnF6mp6QRv1nQj2ocW
	85raVJDva5Crq5b85s/rVe6D1NxJrEr0lFunQST2dQRRUsPhHmdJrnrEW371WybWf7Ld/NiQwJJ
	7cC7EBbBsTqsp3475AlLN6olWKkIJsWlYZNTZ11gtJC3S5/FmnJSHfeOfCmjYuF2Zx2lLzfDV1P
	9GddlYtsKfNwlc65lgC1VwScV5DT0E9WwlLSr8b4xdS+ZzW5ZyZF8IZg1Gj6+OLx/vUC75ZgI5k
	MrHGhzsK/gbjpOz4SerdC9Aum25FUYxQtM5aqgDw09yJHWu9KBJxnJAafGvj71cE+HgBhD78G+A
	uo5pYMKV35Msihie8g9rktRVBXjJYB/P66tVJqZPYhLs45GGUCllXmLegMWUW2MehQ6q6LotxEy
	cjis679A5bR0ERkAQH/HlkFpgdpZVqJ4WcyJkQv3dYX4fuhichmrf540aVZjEv2E5M5g==
X-Received: by 2002:a05:7301:1928:b0:33b:9540:89c6 with SMTP id 5a478bee46e88-34cdb5f9107mr4257043eec.6.1790847339814;
        Thu, 01 Oct 2026 02:35:39 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db37507a7sm6003982eec.13.2026.10.01.02.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:39 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/4] bpf: Apply the rewrites of
 bpf_do_misc_fixups() at once
Date: Thu, 01 Oct 2026 17:35:31 +0800
Message-Id: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMpvmoC/x3MQQqAIBCF4avErBsYTSq6SrSwGms2JhoRRHfP3
 Dz4F997IHEUTjBUD0S+JMnhc6i6gmW3fmOUNTdo0q0iUjgHh1c2TjhisOey41xWG6OpJ+6bboX
 MQ2Qnd7ke4Vee7xOm9/0AhMWZrXQAAAA=
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

Eduard pointed out that bpf_patch_insn_data() takes a large share of the
time to load pyperf180 [1]. Every patch moves the tail of the
instruction and aux data arrays and walks the whole program to fix up
branches, so a pass that patches M instructions of an N instruction
program does O(N * M) work. Kumar's commit 261b61d3735b ("bpf: Make
post-verification instruction rewrites killable") made that work
preemptible, but its cost is still quadratic.

On current bpf-next nearly all of it comes from one place in pyperf:
bpf_do_misc_fixups() inlines each bpf_map_lookup_elem() on a hash map
into 3 instructions, 930 times in a ~24k instruction program for
pyperf180 and 1530 times in ~42k instructions for pyperf600.

Patch 1 adds a list of patches that a pass queues and then applies in
one O(N + inserted instructions) step. It keeps the semantics of
bpf_patch_insn_data(): a patched instruction is named by the first
instruction of its patch, and jumps from a patch out of it are relative
to the patch in place. Branches, aux data, subprog starts, line info,
instruction arrays, function pointers and poke descriptors are
remapped together. Patch 2 moves the main loop of bpf_do_misc_fixups()
to it, patch 3 drops the delta that is now always 0, and patch 4 adds
xlated tests for jumps around patches.

The other passes still use bpf_patch_insn_data() and can move over to
the list one at a time in follow-up series.

perf stat -B --all-kernel -r30 -- veristat -q <obj>, mean of two rounds,
x86_64 VM with 32 vCPUs:

                      base      patched
  pyperf180          0.575 s    0.458 s   -20.4%
  pyperf600          1.491 s    1.041 s   -30.2%
  strobemeta         0.531 s    0.532 s
  test_verif_scale2  0.561 s    0.562 s

For the 1042 objects of the selftests, the 2863 programs that load have
the same xlated code on both kernels, with the immediates that hold
kernel addresses or BTF ids masked. test_verifier passes on both. Of
test_progs, only missed/tp_recursion failed once on the patched kernel
in a parallel run, it passes when run alone.

On a side note, the largest part of the time to load pyperf180 is the
arg tracking analysis: analyze_subprog() takes about half of it on base,
__arg_track_join() alone about 30%.

[1] https://lore.kernel.org/bpf/a714ee96d0ad96bbc9d51037616e5c4e2790a8ec.camel@gmail.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (4):
      bpf: Add a list of deferred instruction patches
      bpf: Queue the rewrites of bpf_do_misc_fixups() and apply them at once
      bpf: Drop the constant delta from bpf_do_misc_fixups()
      selftests/bpf: Test jumps around patches of bpf_do_misc_fixups()

 include/linux/bpf.h                                |   1 +
 include/linux/bpf_verifier.h                       |  26 +
 kernel/bpf/bpf_insn_array.c                        |  18 +
 kernel/bpf/fixups.c                                | 545 ++++++++++++++-------
 kernel/bpf/verifier.c                              |   1 +
 tools/testing/selftests/bpf/prog_tests/verifier.c  |   2 +
 .../selftests/bpf/progs/verifier_patch_list.c      | 120 +++++
 7 files changed, 546 insertions(+), 167 deletions(-)
---
base-commit: 6a75c73eebd4d497ded7d08b47894f9ddbebb5a9
change-id: 20261001-bpf-verifier-patch-batch-2442080e837d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

