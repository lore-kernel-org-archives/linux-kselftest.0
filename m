Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D83876B5
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524331; cv=none; b=sM58S+hWmnVm6558lzP+rG4nsPRzsEflfbFwKdcCQfVVrfSSurFizL2hGBqqI4VuWiawJH78Qzm6SfZnSbXHtaWvr1Du2Yq+l37T0hX9pwE/e8dmQgbN/w2sQfs7RoQ2GDatmzv51aIjndIBdUPMkBQXBp+hIArgIyBC7ITnXFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524331; c=relaxed/simple;
	bh=xg9KEybftToIhyeKvi3LSZ8BdXiuPOyUQjSLweID3Q8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G3PtcRMsJ+vPBBYclL4fgufc2Kk3CBOj6cuWDKC19Ze1Qoni8im2woYcXwSocZpz4JYUK+RwIoPmkVshOu4D+xnlQUH8y1x0OEuZgPSokqgHRZPkVYJzXvHzVGwSrW9MRwbApowR9JGQ57zVNcVDmL7gD4tRPfA/aTSZvAe0E5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G7sdNnQ7; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G7sdNnQ7"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-128ba70cc99so520236c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774524329; x=1775129129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ay8G1oJZ1K8BN/IzLR5Hr0MTltSuhb2JjZXdZm6J5LQ=;
        b=G7sdNnQ7PPRKiCxYgh50WtjrxRaZxXRmQWV0/4yjP5wGA5FT0BG+kRMBqKTHGOFezN
         aj1rttuqcAKz8nTnqXldE/bQ+YHNMc9faPXa2AthAtwNKbRWprwbaIFFQ7IuQSBQfKPb
         8vJUu9dgY7oct9HZUZuu8C+QqcH3GYYeP8SZigmmu1HYB3LDPyB6GZJ1lSn2imB5Lpd9
         AeGpjDdVulJnPgm9ki8ryU6WlKT8CsaQTohjGV2Auk9U9fNvPSK3WPV11qnlHVe5IaZK
         4VKhlvpo79jXP7oGHH1sArAqktE8PgguDcEIpfDECErSUJCp17qdnfTqtIRSL2ppl4yW
         kUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524329; x=1775129129;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay8G1oJZ1K8BN/IzLR5Hr0MTltSuhb2JjZXdZm6J5LQ=;
        b=fQpZu5o78to0Rdk6dXNiHZW2eLikbfloGoa5owNnB4dEipx4qiAycwzKHzI3a9Uian
         /O9sBUCkPin+NYggxrBhgcVHmBJ4XteUqQdeUxjoVFuZyRkaLQ0poL+Ielnn9MDOBjZN
         x3/DGz/8uCkCMiS2GwbzGGi+VhkzsLh8ki5IO44QGdO51fjscArOVvJh5uBke7KIG0Ab
         Zmxw6oiYYvLvj/UUJPYQKnc5eT4nZdZTIbcdXyEPh0yr+FIp4T7eKNdPd4mAttxtUS91
         QfTgzW+w4N1Oi8/S7f9VjOHaow6f2c3TD+JBn1iOHDBQxm3SnKqneUDG5+MYad9wBQJw
         jqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZLA7yCnFqXYWXJAoU2yrblbyCX+zD6jo58STHfyGulWfBTRzhc7OInIAw2VyN39CphlqXJFXJwF7cG2P/Bjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1O44M7NdFaDJU+jmpZ3/g5rsepN42VoFMFNH0SpM79Qkv2z5n
	W7DUFrmXWRJTzxs/IO1UpOBhD5wCN2gGn+tVlVg16aCIa/y4BVEEZVi+iG6no9hPskjTz503PZt
	t655P5JQKhQ7O3g==
X-Received: from dlec13-n1.prod.google.com ([2002:a05:701b:428d:10b0:127:89b6:8d2a])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:125:b0:128:d084:e921 with SMTP id a92af1059eb24-12a96e5d6famr3734825c88.14.1774524328974;
 Thu, 26 Mar 2026 04:25:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 04:25:18 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326112521.2827500-1-wusamuel@google.com>
Subject: [PATCH v2 0/2] Support BPF traversal of wakeup sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: memxor@gmail.com, Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patchset adds requisite kfuncs for BPF programs to safely traverse
wakeup_sources, and puts a config flag around the sysfs interface.

Currently, a traversal of wakeup sources require going through
/sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
wakeup source also having multiple attributes. debugfs is unstable and
insecure.

Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
traverse the wakeup sources list. The head address of wakeup_sources can
safely be resolved through BPF helper functions or variable attributes.

On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
speedup (sampled 75 times in table below). For a device under load, the
speedup is greater.
+-------+----+----------+----------+
|       | n  | AVG (ms) | STD (ms) |
+-------+----+----------+----------+
| sysfs | 75 | 44.9     | 12.6     |
+-------+----+----------+----------+
| BPF   | 75 | 1.3      | 0.7      |
+-------+----+----------+----------+

The initial attempts for BPF traversal of wakeup_sources was with BPF
iterators [1]. However, BPF already allows for traversing of a simple list
with bpf_for(), and this current patchset has the added benefit of being
~2-3x more performant than BPF iterators.

[1]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.com/

Changes in v2:
- Dropped CONFIG_PM_WAKEUP_STATS_SYSFS patch for future patchset
- Added declarations for kfuncs to .h to fix sparse and checkpatch warnings
- Added kfunc to get address of wakeup_source's head
- Added example bpf prog selftest for traversal of wakeup sources per Kumar
- Added *_fail.c selftest per Kumar
- More concise commit message in patch 1/2
- v1 link: https://lore.kernel.org/all/20260320160055.4114055-1-wusamuel@google.com/

Samuel Wu (2):
  PM: wakeup: Add kfuncs to traverse over wakeup_sources
  selftests/bpf: Add tests for wakeup_sources kfuncs

 drivers/base/power/power.h                    |   7 ++
 drivers/base/power/wakeup.c                   |  72 +++++++++++-
 tools/testing/selftests/bpf/config            |   3 +-
 .../selftests/bpf/prog_tests/wakeup_source.c  | 101 +++++++++++++++++
 .../selftests/bpf/progs/test_wakeup_source.c  | 107 ++++++++++++++++++
 .../selftests/bpf/progs/wakeup_source.h       |  22 ++++
 .../selftests/bpf/progs/wakeup_source_fail.c  |  63 +++++++++++
 7 files changed, 372 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source.h
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_fail.c

-- 
2.53.0.1018.g2bb0e51243-goog

