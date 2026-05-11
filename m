Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B44611FF
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521808; cv=none; b=WY3G5L5gRoz7THQIr77xCJKxMC1rMPZ8cTv5nuEqw0PwazjK965CfIgBMcxpFLdfh5Bsx27v32RVmODqCnrjdJZmNCMA6MSIMmvKCTGtA69IYupAo/T1tNGpanyWM5gUm3S4WlwaongjLIRreYVWnWXgCp3UzUFc37iMHJPqlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521808; c=relaxed/simple;
	bh=g1G/+PoWZdAvQmXojSHIDbtBFrtB6n8uPkg6HEziu0I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=F6nl3G1QhxS78mF3zt5RkgoUUTJAw5/y53fSJNhNh8ytEaCavPrNUZogG5I7F85CHNanWOkkDcb+p09q9ajh6+UqFG3U+ef5Vr5kvgG2isshc0NFwWbEMzjALUobAj1f1SRle7xeSjz2btxWKqEvu3pGFDXk/sqDq1Y+bH+h/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kIqaiWGx; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kIqaiWGx"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bda35eab74so3756352eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778521806; x=1779126606; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F3SSM/7OmGT1DQhDHuFPYpuDPGpRg8FSNXFpqlLPkoo=;
        b=kIqaiWGxKOO7oWCzxoFExdNFiAyNByVu10WkSFa1NKXfJB9/INbDL6bEc+S+U31QXl
         +Ta4nrD6wO6AYJ12+vF3UBd+p9icigS30VuxMRAxMewQov78hqXmzs87011S1Ok/Ijvv
         M4Gje/ZTWLxxzlvyI0YJIScdujdq+E7KozRn+F1HY4KSQ4zmWLBxwdCh3X15lSlMZFC+
         cDMTzgTFuJqVhhAtQIeuqctcKYgrnp2YYsdgNhnBB5W7azj0a2eKSftHbH2pwuNQ9obf
         VcCeuhV+TqiYydNtScBnJ7oyaIynUMMzGllew+GRMbJ5Gvy45w5BrhRMf9CuArqSw3cf
         mKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521806; x=1779126606;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3SSM/7OmGT1DQhDHuFPYpuDPGpRg8FSNXFpqlLPkoo=;
        b=d12XvRODfkvJPNiaM4q0q4phlp1BPF2Ie3eQnt+Tonweh00WGSwzPVrXsSD5/tKzhw
         kBhMh1W/OHLSNo/H0BHVNGkhHiMQIYorePdqmZjgHRECQLwepa5zlxLme7YsMs0clU+A
         jXCbmPsKuEcd31HYV9S/vT4u+Sh7elEKi3drb35Si0QBMrR1vPd7LZCco60IgxjLwQPn
         XE8dn3B286C8xu36TTi7zo0qK6Rd6urMaUTA8wj1IKUEL1gJPOtcQXG9miUF86yDBvxJ
         cE/KIWl3aKGob/5gnyNDHf3ohzDrFrXFQYFL+ULoS0mrMGufHCFodNtWjF21GlU9ngHr
         DTIA==
X-Forwarded-Encrypted: i=1; AFNElJ8NG2yg1/v1fqc/CNSraFYz9Td/z8AKPAohSFzxIzmf+CO93zjP3VBgCyr1oEVX56Vbgt6MyBE54lhgbSKmRAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzmtUodi3AAm8Js0ubtMb/25T3Juvd2wp9XiBGf0ijud8H0hp0
	mHgp0Odm4PRPQy/2sC2fIfxakPo7VPWppwopb4zX4ah/sAP9Y47P8WRzmFh9J3mXm4eq4cZuCS0
	PnjgPdRqtsQ1KyQ==
X-Received: from dybdf6.prod.google.com ([2002:a05:7300:b586:b0:2da:4e8f:1752])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:5807:b0:2f0:ee2:f6c6 with SMTP id 5a478bee46e88-2ff95e5e234mr269219eec.19.1778521806295;
 Mon, 11 May 2026 10:50:06 -0700 (PDT)
Date: Mon, 11 May 2026 10:45:55 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511174559.659782-1-wusamuel@google.com>
Subject: [PATCH v4 0/2] Support BPF traversal of wakeup sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
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
traverse the wakeup sources list, and a kfunc to get head of wakeup
sources list is needed to start traversing the list.

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

Changes in v4:
- Removed `.owner = THIS_MODULE` for btf_kfunc_id_set per Greg
- Add a graceful exit in selftest if bpf_wakeup_sources_get_head() is not
  present due to kernel configs without CONFIG_PM_SLEEP (e.g. s390)
- Relaxed substr match in wakeup_source_unlock_null() selftest
- v3 link: https://lore.kernel.org/all/20260331153413.2469218-1-wusamuel@google.com/

Changes in v3:
- Changed return type of bpf_wakeup_sources_get_head() to `void *` per Alexei
- Added failure test for direct dereference of wakeup source head
- Use bpf_core_cast() instead of macros in BPF program per Kumar
- v2 link: https://lore.kernel.org/all/20260326112521.2827500-1-wusamuel@google.com/

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
 drivers/base/power/wakeup.c                   |  71 ++++++++++-
 tools/testing/selftests/bpf/config            |   3 +-
 .../selftests/bpf/prog_tests/wakeup_source.c  | 118 ++++++++++++++++++
 .../selftests/bpf/progs/test_wakeup_source.c  |  92 ++++++++++++++
 .../selftests/bpf/progs/wakeup_source.h       |  22 ++++
 .../selftests/bpf/progs/wakeup_source_fail.c  |  76 +++++++++++
 7 files changed, 386 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_wakeup_source.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source.h
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_fail.c

-- 
2.54.0.563.g4f69b47b94-goog

