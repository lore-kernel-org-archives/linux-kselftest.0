Received: from cvsmtppost03.nmdf.navercorp.com (cvsmtppost03.nmdf.navercorp.com [114.111.35.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA25437757A
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114442; cv=none; b=uEOwJa3D9RPjhqx6Vt9+aFYgcFRMAGHIHe8bOg8UhGiyrO/j3cVmMjwm/emmT7PSaZyq/SKQqooqS+O957+ej5lv9M4oMPJzFl5i+eSJvz0FA6KxkNeaELMfKWHNVDh4DSHUkg99fa96nlhB3jxiyNnLzsZ7paA1Af5pxB/T6yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114442; c=relaxed/simple;
	bh=mgG06uHu7Fc1UJwBdL2lLO5NAXZLkPDI3rIiZdaG5T0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mpcuROUNNHkiFLaWPYN7fu/7GbBo90dydgR8uLbMwy4ESj1xyVoU6w3K5cGga117SIo0Y4NHn+3hIa4aLA1Qp2NliprA/CY0Veu4uXzTgaO/dDFnDFqcJMroy6uvebLktd91dd3AX+x2tsaNddTrm7OV5hsuUYIQtU7lHgBK5/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com; spf=pass smtp.mailfrom=navercorp.com; dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b=U/xNW/gT; arc=none smtp.client-ip=114.111.35.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=navercorp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b="U/xNW/gT"
Received: from kr0s-real-1 ([10.180.30.112])
  by cvsmtppost03.nmdf.navercorp.com with ESMTP id Nv33iHUJSlC5cQgEajfaLw
  for <linux-kselftest@vger.kernel.org>;
  Mon, 22 Jun 2026 07:16:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=navercorp.com;
	s=s20171120; t=1782112614;
	bh=mgG06uHu7Fc1UJwBdL2lLO5NAXZLkPDI3rIiZdaG5T0=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=U/xNW/gT3uhCA9c9xfFh2dajkrotfo8A2ujMKai6ClPycQYunGEaYyTW80yoQv8ys
	 MczRm3/R3DDQ03hIRdxhBO5cVP0u8RKg81HCyPDWevSd5l0dQ3pc++Ah3EFvXdluuc
	 St+Wd6ubJCjLhWMdaENsZSkEJVCyiHSIwjwkYpcci5VXGXBA0wqs64aZDhuX5yIcfs
	 bfNyILWtUP/Ik//YX1VITDaGQlBZeSBaj7OYHlnx8tqITrCiRStGJT2Rk1y2m7h6by
	 0mDk9Gk9uCvGJIY9NECS9Tbbh9qBH7pNg6M8hKXCrEMVSAGjqx2LqwtxhReLRNilmF
	 okkEKVcIpmH+w==
X-Session-ID: UKh50JfSSKWRPhFHm7TnJA
X-Works-Send-Opt: T9YwjAumKAumKAbZjAgmKqKXKoJYFHmwFBwYjHmm
X-Works-Smtp-Source: Pmb/KAU/FqJZ+HmZKxUm+6E=
Received: from localhost.localdomain ([10.25.121.184])
  by cvnsmtp02.nmdf.navercorp.com with ESMTP id UKh50JfSSKWRPhFHm7TnJA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256);
  Mon, 22 Jun 2026 07:16:52 -0000
From: Gyutae Bae <gyutae.opensource@navercorp.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minsu Jeon <minsu.jeon@navercorp.com>,
	Siwan Kim <siwan.kim@navercorp.com>,
	Jonghyeon Kim <jong-hyeon.kim@navercorp.com>,
	Gyutae Bae <gyutae.bae@navercorp.com>
Subject: [RFC bpf-next 0/3] bpf: compare-and-delete (BPF_F_COMPARE) for hash maps
Date: Mon, 22 Jun 2026 16:16:46 +0900
Message-Id: <20260622071649.31541-1-gyutae.opensource@navercorp.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gyutae Bae <gyutae.bae@navercorp.com>

This series adds an atomic compare-and-delete primitive to BPF hash
maps, motivated by a TOCTOU race in Cilium's conntrack GC [1]: the
batched GC snapshots CT entries, decides which expired, then deletes
them by key in a later syscall; between snapshot and delete the
datapath can refresh the same entry, so a live entry is deleted. A
userspace re-check before delete can't close it (lookup and delete are
separate, individually bucket-locked calls).

BPF_F_COMPARE lets userspace delete a key only if a chosen value region
is unchanged, with the compare and the delete done atomically under the
hash bucket lock:

    attr.flags |= BPF_F_COMPARE;
    attr.compare = <expected>;
    attr.compare_offset = <off>;
    attr.compare_size = <len>;

mismatch -> -EBUSY, absent -> -ENOENT, unsupported map -> -EOPNOTSUPP.
The compare* fields without the flag are rejected (-EINVAL) so a dropped
flag can't silently become an unconditional delete; maps whose value
carries BTF-managed fields (spin_lock/timer/kptr/...) are rejected
(-EOPNOTSUPP) since those bytes are sanitised on lookup.

Atomicity boundary (please scrutinise): the compare is atomic vs every
bucket-lock holder, but NOT vs a BPF program writing the value in place
via the pointer from bpf_map_lookup_elem() (no bucket lock). It
collapses the race window from the whole GC batch to one bucket-locked
critical section; full closure wants the compared region treated as a
synchronization variable (e.g. a monotonic revision). The selftest
models this.

Scope of this RFC: per-element compare-and-delete on BPF_MAP_TYPE_HASH
only. Deferred (will follow once the approach is agreed): batch delete +
its attr fields, a libbpf wrapper, LRU-hash and other map types, a
compare-and-swap *update*.

Open questions:
  - flag name: BPF_F_COMPARE vs something else?
  - mismatch errno: -EBUSY vs -EAGAIN?
  - new ->map_delete_elem_cmp() op vs extending ->map_delete_elem?

[1] https://github.com/cilium/cilium/issues/46298

Gyutae Bae (3):
  bpf: add BPF_F_COMPARE flag and compare fields to map elem UAPI
  bpf: implement compare-and-delete (BPF_F_COMPARE) for
    BPF_MAP_TYPE_HASH
  selftests/bpf: test BPF_F_COMPARE compare-and-delete

 include/linux/bpf.h                           |   2 +
 include/uapi/linux/bpf.h                      |   6 +-
 kernel/bpf/hashtab.c                          |  39 +++++++
 kernel/bpf/syscall.c                          |  54 ++++++++-
 tools/include/uapi/linux/bpf.h                |   6 +-
 .../selftests/bpf/prog_tests/map_cmp_delete.c | 106 ++++++++++++++++++
 6 files changed, 208 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_cmp_delete.c


base-commit: a975094bf98ca97be9146f9d3b5681a6f9cf5ce3
-- 
2.39.5 (Apple Git-154)

