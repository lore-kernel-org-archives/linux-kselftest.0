Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF72737E3
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 23:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770853867; cv=none; b=sJa5d0AEtjvvi7ZTQZP36IqKS3MUNH5WhPpGzv1oUDb+fLMkdOFd4ucC6/PWVgdFtWmDzbzVQda05yL2oth5Sxe7LX6qaU7T7C8VmmSqs58Hvcau6o+QnnlV+YtAtptf2BDpaSPV9akUGsvU5udbS7CpvLrC1dHrAJLHINVufI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770853867; c=relaxed/simple;
	bh=Yd3DwfxMXoOZp9jUfOSpBEV01GFdv4L7108Lhq7svaY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QXP/eEl+K2A5lrdD6+3YAj6FAFdnHFmWdZFGYEbsd0o/xoI1QUlFfJyt/qs1CabNLTcFXZyEBJkraAhtwabizZkbn4hzhoVYaaK66E/YGkzTVJ4zobpsHq8/5GDEpiYYiNQA1+s00DP4Z+zhod4FF/0F295bmVMkses6TudQZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVqCzdZ0; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVqCzdZ0"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba6ad2ca1fso23436877eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 15:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770853864; x=1771458664; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9nXfvjN4hy5oubiwdJPODm2qIbpmUCGkak7mT/cMbjc=;
        b=XVqCzdZ0GI3AgCr+vbSYgASLlQW+qARQ6YRpSxSahnaXsavciSxuofpRfKildTM8/G
         4PljwVunxa9XJxTQtsXPDJC1P+TJKQAlSjxYgUWnzEurS+vtMsFL8T/HZqpwoa7/+Aj+
         nRrqbtMVDFKC+cU4bfBYpgq+o83i0fwJ2EmQZJWOoK9NdR0psTksixiLsq57K5zHHyHn
         LuyAxUvsVQEv+XpHeQSCN8AN1WMjqSese/vXqNFxulUu+O2rkQm9dP+WbcS+/YNjJcEK
         Qh4PCgPlul0XVx7Z0PoSMZd7vq1wLVTSKvDgjwY97UzFen2OwuIDYrDlNMVA3UoJSTYe
         EB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770853864; x=1771458664;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nXfvjN4hy5oubiwdJPODm2qIbpmUCGkak7mT/cMbjc=;
        b=lrbg2+horgPBszv8r54G7WJHoJCQVV49rFh1rTSJ6gmTa6iEZnAFTYP4qeKiMLWb4L
         fEl/Vx4yZRdb4LhT/y26tnlIt7RfjBLPYs0+bCMR7wDjNyNkGsuE5STpgIrRRujxYjEO
         blvnAnCDe65rvxtdFiFpMf9kl9yvK1oUA9SA1oosUUyHIWR2oJISgeut4Md9HgYl6oU6
         ZtnbOWBsejDhl7useH7dYqrHcagAEWO9XooDhegJepKTngVU8yTc//pFJbQ1nplWnqI1
         wzKi138YRDt7hUieGIQlTgQ1var9WSxWCuiDqkQueZfB93yYPlnod1vB99KTA4ZYaIVE
         LDlA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFv21xoEi+g5+VTsCK/shSHIFUoRJnszgLDtzBg9BFcGm8Xd1+Txi1OMHfLvv8ENYP5Njw+guRQy20Z1x9EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+LhiTXfLLzRdT7omIaWwujvfcA4AaMp4ojfIy+8XKoSfZhOk
	u99TgmOpZncHBGrzMyLzCDpGmgS6Z8dckXxPFzgzppfjrXj4pdDlVkusug/IBjO8Jtz1Tyr8ISZ
	LN9YKfeX+A+0xWA==
X-Received: from dycmq11.prod.google.com ([2002:a05:7301:78b:b0:2ba:9ee8:7ca9])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c15:b0:2ba:a6e5:4ba7 with SMTP id 5a478bee46e88-2baa808cc3dmr436660eec.40.1770853864466;
 Wed, 11 Feb 2026 15:51:04 -0800 (PST)
Date: Wed, 11 Feb 2026 15:50:52 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260211235055.239024-1-wusamuel@google.com>
Subject: [PATCH bpf-next v4 0/2] Add wakeup_source iterators
From: Samuel Wu <wusamuel@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch series introduces BPF iterators for wakeup_source, enabling
BPF programs to efficiently traverse a device's wakeup sources.

Currently, inspecting wakeup sources typically involves reading interfaces
like /sys/class/wakeup/* or debugfs. The repeated syscalls to query the
sysfs nodes is inefficient, as there can be hundreds of wakeup_sources, and
each wakeup source have multiple stats, with one sysfs node per stat.
debugfs is unstable and insecure.

The iterators utilize pre-existing wakeup_sources_walk_* functions to
traverse over the SRCU that backs the list of wakeup_sources.

Changes in v4:
 - Proper init of variables in ws_iter_check_sleep_times() test per bpf-ci
 - Remove PM patch since it's already part of rebase
 - v3 link: https://lore.kernel.org/all/20260124012133.2451708-1-wusamuel@google.com/

Changes in v3:
 - Update wakeup_sources_walk_start() to handle an empty list per bpf-ci
 - Simplify read of a struct's field in BPF program selftest per Andrii
 - Drop open coded iterators for wakeup_sources
 - Fix condition from !get_ws_iter_stream to get_ws_iter_stream in selftest
 - Read event_count instead of wakeup_count in selftest
 - v2 link: https://lore.kernel.org/all/20260108225523.3268383-1-wusamuel@google.com/

Changes in v2:
 - Guard BPF Makefile with CONFIG_PM_SLEEP to fix build errors
 - Update copyright from 2025 to 2026
 - v1 link: https://lore.kernel.org/all/20251204025003.3162056-1-wusamuel@google.com/

Samuel Wu (2):
  bpf: Add wakeup_source iterator
  selftests/bpf: Add tests for wakeup_sources

 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/wakeup_source_iter.c               | 103 +++++++
 tools/testing/selftests/bpf/config            |   1 +
 .../bpf/prog_tests/wakeup_source_iter.c       | 281 ++++++++++++++++++
 .../selftests/bpf/progs/wakeup_source_iter.c  |  60 ++++
 5 files changed, 448 insertions(+)
 create mode 100644 kernel/bpf/wakeup_source_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_iter.c

-- 
2.53.0.273.g2a3d683680-goog

