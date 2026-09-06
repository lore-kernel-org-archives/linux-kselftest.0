Received: from out-93wp-a21.jellyfish.systems (out-93wp-a21.jellyfish.systems [104.207.68.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9223B63E
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714464; cv=none; b=MPS8a9Ms9G2oRynML+yNCxRB9MACkK196NkajY6KFv3Gy1CmspuIk2iok9mR6V2eI8B3TfwimsLon/bHrG2NhKEl6UxInyuzgXmE4eSrLOOsdX1fehTXzaFV0bNdwwvqLqu0fNhiezlop/Fxq8rD7fhdlGxRMQ5BkwkmKH1DIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714464; c=relaxed/simple;
	bh=ejLu3YDmsq77R+2+aSSehFp698s0ja77iB/c7fwJHAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR+Fxdsuh71tMVEjtCBj0la6Rw2M2P/YICUC/6iZMltkItjuEfThfof7PJB5TFCEhZElt4QSFo5oB2GsLPkRurI3BMeDkA97pR5VXijbO9alL5/3wn+4qkYiEc/oiJKMQpX6aDhzgCjWEOamV4KIkYams1RasqQZXsNRrdNJav0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=mNDlvpJo; arc=none smtp.client-ip=104.207.68.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="mNDlvpJo"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdGpj1Vyvz2xBh;
	Sun, 06 Sep 2026 17:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788714451;
	bh=2h37Gt1NOLAYGpHhk2SiHy8334j+vxJY2/iMQDW6lnE=;
	h=From:To:Cc:Subject:Date:From;
	b=mNDlvpJofYDa4DhlQO9DK35UC35yvjJP/6DRO3cuMdm52DNdEuCaUqdxyuzFssMEe
	 PcZN+fKmp0hE9TU7SwoeLGHQYU+4FWqDn9Qu0pfHgBAKi+MBZMYtjTTIrz0e7DxeGt
	 n6Y36kthTAKt9EEKm6XHVvFIL7hZoUDMFBn14P5xL9lrHVjyCmQTHXj/rWtXmqQte/
	 zCDLBFyYuOu7yt4bNlZLltCSDqvwENzdy2iAvBVNpNlyOjpKJVqHJnzAa6sXPSppT8
	 T6bLLfsFcgGsNQsMvIzdO72yGhWihk0cS4czazaTlnPtqVX75kMTUXTwodOfMYkXja
	 S1FvrLWj5AzGA==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 0/2] bpftool: Support symbolic map creation flags
Date: Mon,  7 Sep 2026 01:07:13 +0800
Message-ID: <20260906170715.1212085-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

This series adds comma-separated BPF_F_* names to map create flags,
while retaining base-0 numeric input. It also documents the syntax,
completes names within lists, and tests the resulting kernel map flags
and invalid-input diagnostics.

This addresses the map creation part of:
https://github.com/libbpf/bpftool/issues/57

The series is based on bpf-next and is independent of the ring buffer
and batch-dump series sent alongside it.

Validation:
- Full bpftool build and focused BPF selftests build with LLVM 20.
- All 29 bpftool_map_flags subtests passed in an x86-64 KVM guest
  running Linux 7.3.0-rc1, using a bpftool built with only this series.
- Bash syntax and actual completion candidates checked with and without
  comma in COMP_WORDBREAKS; bpftool-map man page generated successfully.

Only focused BPF tests were run; this does not claim a full BPF selftest
suite run. Strict checkpatch has no errors or checks; its new-file
warning is covered by the existing BPF/selftests MAINTAINERS patterns.


Integration check: these three independent series also applied and built
together with my previously posted recursive map-dump v2 series. The
combined 64 subtests passed with no skips or failures in the same guest.

Tianyi Chen (2):
  bpftool: Accept symbolic map creation flags
  selftests/bpf: Cover symbolic bpftool map creation flags

 .../bpf/bpftool/Documentation/bpftool-map.rst | 13 ++-
 tools/bpf/bpftool/bash-completion/bpftool     | 25 ++++-
 tools/bpf/bpftool/map.c                       | 77 ++++++++++++++-
 .../bpf/prog_tests/bpftool_map_flags.c        | 99 +++++++++++++++++++
 4 files changed, 208 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_flags.c

-- 
2.55.0

