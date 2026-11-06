Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996410;
	b=glv3zAfk4gB3dNQbFnaRp1GA//XpmV77kx6L7RNkL0BnU7MmQbH/JnvgDPvFerd0UIZr
	 jjpLCC2HypJ/szr0SSoKoFENNCi+ldsnIJnuD/KWOw6miYzpvpfqti0i53hYCvgz8Mfor
	 eKlGTpHSHmYRFyGah9dlWOgMdTcLURRkhz3qSNs8Uc4KQRRM8narN4/HxQ5t8Oo0Ht8wD
	 GHjTA2x33nbTv1fKflNXGJm+dt3RQXd2UKpY1s+b+qyFqyCygxk25lKk0R+yqXbwtoF6c
	 I9eVHrdY5gx3QLnxUsSwGx2t/UGq1z/j3Indn6a3682LJ4bw0Vf2QJR6buPCNdeSo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
	b=ac5bYirz26EtiQUo/JLDW8McxQlqsO/0hDSCpTx5T7Bh3Ezyc3gYP3hqrVXOU9yyTrqT
	 Gww9gPK6lNO7NqrGUzkCCl40RYfnUWFukuTAqyj1g/a94toDnjQ83qkLekqIWSAtduz5W
	 oei5TeYDvbbV+ciAFb5cRB1nowLXQMl7Wr+bEoFKKq20+leXSwz7n+hM2QZ6ivQljdMdX
	 y3XDNQ1EOImQakBpMUXJ/HOF9ClzMhxXSV0mJPnZUIhOcR1uDFqeOUrXD/N8MiHvGb+WI
	 aHtr8sioKjvg9Xc85EJc0x/Oc4eXqF6KaMFd5SDSQ0X/xWG0Sh8r+5o2kBl72WD9g+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQqnp485;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAAB606A32E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 20:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAAB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oQqnp485
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1058279b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793996409; x=1794601209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
        b=oQqnp48505ul8fce1kiykiCLp2RBCB0id+7wMmH30erQLzA8JQmunrOmBs4cSNdOnp
         2iNKZqJWYUFQZ47unpZxxxX0f/iH/7ULrKTrrYMEEjQsDlWVORyHPyVBhvS8rCmZ/fhN
         o7jT9adJGO14Qrl6r6L2xIM8t5Xg5yR/AaxTHGoKVbTTau2on1yr7YC6/P2TG8xvPXoC
         FEMJZeADDOVyBg6XKdFgSjHTGG3FBAt4N4dQGuCI2/yuf2umK2hUZCoKNeGRw0pPFTnS
         bcVkwTCIxGxdl78z4+gT0PSaYM3vIYomHZeF4LisCxXaNA4K5aqLiA0ut714gukBKsye
         MUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996409; x=1794601209;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YbFKs9nRA6MfgMEJuRTCHwLHgaje7B0LRpZLEgpNVg=;
        b=A6R+VrwR73/7yYfQ/OpxK9PurCZp+xJyyp/baRLHOXtsUnWVIs8ec4H/csZ4bp+34g
         DyDMkaKm4jkRFFqLyMzRht+lwqJ7yKxCvUA6njpIucY9Xwktq0qVWSMJMxWArOXCo+8M
         nFI5XOrMfLADit4IOaf5AOU59nB6Tyurtvjml+niYS2jregHy+GH+at5wbN81fSEVlDO
         G7RhUj0soz7zRu7RqKqwJTm9Kj+PHOVPyep+C+CdNDMtdonvq5EJwsO/q3D7nEJ2Dbu7
         p8BdqZxS/P1uQfhtb6hNR/2Pjbvz35yzO1/FdOsgIxXFhNs4epX6dAx6IUsHEaFSo1MT
         aSIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSW2NOWbO1j1YoSoaJerXLmKsGvTH1bylp8I9CIdm0UsM1ZODJ+Z3h/oRu9PLdsWRr5nj2B7Tq59Uof0sDFxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KESOMBlNfZbRaKl9IPh3iVF4xVmzMd1yl4ddQS0GTqaNA9iBq
	ETgeUK4aKAs264TQXf9a4pDxA9sisjE5MwMDvOCe6ybqKKaEXT045Mi/5/6sSCcWeCMmgKKG92a
	6dWN4ULYA8AjwVLNiRw==
X-Received: from pfhx2.prod.google.com ([2002:a05:6a00:1882:b0:89f:5522:3f42])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:139c:b0:8a6:58cb:eeaa with SMTP id d2e1a72fcca58-8b37bb5f095mr3365577b3a.36.1793996408786;
 Fri, 06 Nov 2026 12:20:08 -0800 (PST)
Date: Fri, 06 Nov 2026 20:19:47 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGM27moC/x2MQQrCMBAAv1L27MJmLQW9Cn2AV/FQ040uljRko
 xRK/27qcQZmVjDJKgbnZoUsXzWdYwV3aMC/hvgU1LEyMHHnHDFO9pYJreSPLzgnQzrSiVpufRg YapayBF3+yxtc+8vuHilglKXAfdt+OM0/UHMAAAA=
X-Change-Id: 20261102-lskel-struct-ops-03090424cfa2
X-Mailer: b4 0.14.3
Message-ID: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
Subject: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
From: Siddharth Nayyar <sidnayyar@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, "=?utf-8?q?Thi=C3=A9baud_Weksteen?=" <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>, Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="utf-8"

BPF light skeletons (bpftool gen skeleton -L) compile BPF object loading
into a self-contained BPF_PROG_TYPE_SYSCALL loader program (gen_loader)
embedded in a C header, removing any runtime dependency on libbpf or
userspace BTF parsing. Currently, light skeletons do not support
BPF_MAP_TYPE_STRUCT_OPS maps or BPF_PROG_TYPE_STRUCT_OPS programs
because preparing a struct_ops map normally relies on libbpf parsing the
target vmlinux or kernel module BTF in userspace to resolve type IDs,
struct sizes, member byte offsets, and member indices.

This series adds BPF_MAP_TYPE_STRUCT_OPS support for link-based
(SEC(".struct_ops.link")) maps in light skeletons across both vmlinux
and kernel module BTF targets:

- Patch 1 adds a new bpf_btf_get_struct_member_info() helper for
  BPF_PROG_TYPE_SYSCALL programs to query a struct's byte size (when the
  member name is NULL) or a named member's byte offset and member index
  from vmlinux or module BTF at load time.
- Patches 2-5 wire up struct_ops initialization, map creation, program
  loading, and map update in libbpf's gen_loader. At runtime, the loader
  program resolves the kernel wrapper type bpf_struct_ops_<name> and
  target <name> struct BTF IDs (and module BTF FDs) via
  bpf_btf_find_by_name_kind(), queries struct sizes and member
  offsets/indices via bpf_btf_get_struct_member_info(), constructs the
  kernel vdata buffer in the loader data blob, passes the resolved BTF
  metadata to BPF_MAP_CREATE and BPF_PROG_LOAD, and populates the
  callback program FDs before issuing BPF_MAP_UPDATE_ELEM.
- Patch 6 teaches bpftool to generate per-map skel_link_create() attach
  functions and skel__attach() / skel__detach() plumbing for BPF_F_LINK
  struct_ops maps in light skeletons, skips gen_st_ops_shadow() so the
  light skeleton ctx layout is preserved, and rejects non-link
  struct_ops maps.
- Patch 7 adds light skeleton struct_ops selftests covering both vmlinux
  (tcp_congestion_ops) and bpf_testmod (bpf_testmod_ops, including a
  subset struct with reordered members, scalar fields, detach, and
  re-attachment).

Adding a new BPF helper and alternative kfunc approach
======================================================
I am aware that BPF helpers have been frozen for several years in favor
of kfuncs. I propose adding bpf_btf_get_struct_member_info() as a BPF
helper (restricted exclusively to BPF_PROG_TYPE_SYSCALL loader programs,
alongside bpf_btf_find_by_name_kind()) because, to my knowledge, there
is no better way to enable struct_ops support in light skeletons.

Before settling on a BPF helper, I explored an alternative approach
using a kfunc, which hit a roadblock. Calling a kfunc directly from the
light skeleton loader program is not possible because kfunc calls
(BPF_PSEUDO_KFUNC_CALL) require the target kfunc's BTF ID in insn->imm
when the loader program itself is loaded, whereas light skeletons ship
pre-generated loader bytecode without userspace BTF resolution. Although
I was able to resolve a kfunc's BTF ID at runtime via
bpf_btf_find_by_name_kind() and patch and load a separate BPF program to
run the kfunc and gather struct_ops member info, running that program
from the light skeleton loader required re-enabling BPF_PROG_TEST_RUN in
bpf_sys_bpf(). Calling BPF_PROG_TEST_RUN from BPF programs was
explicitly disabled in commit 86f44fcec22c ("bpf: Disallow bpf programs
call prog_run command.") because the verifier cannot perform sufficient
validation of the bpf_attr->test.ctx_in pointer.

Non-link struct_ops support
===========================
I have not enabled non-link struct_ops programs/maps (SEC(".struct_ops")
without BPF_F_LINK) in this series, though I intend to enable them in
the future and can extend this series to support them if maintainers
deem it necessary.

I left non-link struct_ops out for now because in light skeletons,
BPF_MAP_UPDATE_ELEM runs inside the loader program during skel__load().
For non-link struct_ops maps, BPF_MAP_UPDATE_ELEM immediately registers
and activates the struct_ops callbacks in the kernel before
skel__attach() is called, prevents re-attaching after detach, and would
leak an active registration if a later step in the loader program fails
(since loader cleanup only closes FDs via bpf_sys_close() rather than
issuing BPF_MAP_DELETE_ELEM). Supporting non-link struct_ops will
require deferring BPF_MAP_UPDATE_ELEM to userspace skel__attach().

AI assistance and testing
=========================
This series (code, selftests, commit messages, and cover letter) was
developed interactively with an AI coding assistant (Google Gemini),
with me guiding the design step by step across each patch and reviewing
all changes.

The series was built with clang/LLVM and tested in a QEMU x86_64 VM
using test_progs (covering the new struct_ops_lskel selftests for both
vmlinux tcp_congestion_ops and bpf_testmod_ops, as well as existing
struct_ops and light skeleton tests), along with manual verification of
loading and inspecting a struct_ops light skeleton via bpftool.

Feedback on the overall approach and on introducing this
BPF_PROG_TYPE_SYSCALL helper is very welcome.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
Siddharth Nayyar (7):
      bpf: Add bpf_btf_get_struct_member_info() helper
      libbpf: Implement bpf_gen__init_kern_struct_ops() for light skeletons
      libbpf: Support BPF_MAP_TYPE_STRUCT_OPS in bpf_gen__map_create()
      libbpf: Support BPF_PROG_TYPE_STRUCT_OPS in bpf_gen__prog_load()
      libbpf: Implement bpf_gen__struct_ops_update_elem() for light skeletons
      bpftool: Generate attach and detach for struct_ops in light skeletons
      selftests/bpf: Add light skeleton struct_ops tests

 include/linux/bpf.h                                |   1 +
 include/uapi/linux/bpf.h                           |  13 +
 kernel/bpf/btf.c                                   |  73 +++++
 kernel/bpf/syscall.c                               |   2 +
 tools/bpf/bpftool/gen.c                            |  71 ++++-
 tools/include/uapi/linux/bpf.h                     |  13 +
 tools/lib/bpf/bpf_gen_internal.h                   |   7 +
 tools/lib/bpf/gen_loader.c                         | 297 ++++++++++++++++++++-
 tools/lib/bpf/libbpf.c                             |  59 ++--
 tools/lib/bpf/libbpf_internal.h                    |  26 ++
 tools/testing/selftests/bpf/Makefile.skel          |   3 +-
 .../selftests/bpf/prog_tests/struct_ops_lskel.c    | 122 +++++++++
 tools/testing/selftests/bpf/progs/struct_ops_mod.c |  51 ++++
 .../selftests/bpf/progs/struct_ops_vmlinux.c       |  42 +++
 14 files changed, 747 insertions(+), 33 deletions(-)
---
base-commit: 3e18218484126afb9da722080659c038cb2256ab
change-id: 20261102-lskel-struct-ops-03090424cfa2

Best regards,
-- 
Siddharth Nayyar <sidnayyar@google.com>

