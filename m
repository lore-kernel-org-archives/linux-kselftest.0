Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28DB23D7F4
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064509; cv=none; b=hsWGBr5LmWNW8iqKr+sZKs8m6a7juqK8BEVjFp5pjMEeoZvPKVA3GwMI9LtdWiH1ZbdXoo5fazm/Po6u1xqSU0cKKWdEJKZgaxIupYUedE9G4ZGhwqMPu7O/oz6JbqFbXwBAGS4w0qjQIGJOIxRAyC5JG2nalw6oDToqyV7sijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064509; c=relaxed/simple;
	bh=ijoFRb8I4+XfGKhziEfySAslvbu5Jp7Eu4JILnrr21g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cwDO5KWzFyIQQMe168gZDWCTX5WLcl63WVfmzv9qpd9uDuQe1ITJsFblnGDWzYf9hqpCnRL0PjA07I79bb/zi9WwzpdBsUOtelryW53db92NDbMVI/5LgKjzWiZTsgMoTFm5WE2lr3wYq77/Nl+R9Tyni5jUkVzYhtn3HxWVueA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa6hllnu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa6hllnu"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf52d15d88so26901125ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786064507; x=1786669307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MLGlXfDDWhpZIsWPnXZToOCK71F6INAB2KuWQUQm6mQ=;
        b=Xa6hllnuADsAHxIhn+8S84ftMtguMQmWt7NNTSqaNH4uBRjYCs6vBSSLnTQV5id6rE
         YdDXNqlvzpHYDlr2oQPXt/SxEjVVLv9oGFAJt9qb7lQavYcgmdCoGjeoiAJXlnVm420P
         IYEy8pAm8hqiCgurLVC6O2j4gqg0sdx6fJ+7F6jplqHn3ULK09+yd9ZHoFiJKqbL9QIg
         tQDtaoU1no9RIUNZCYeTvMQpQ0iSzbkJI34ZM0qf7wa5q7gZrDGiak7WczO4U5lfSKAn
         C87a+d6iOq4fptcEKfDoTQ5TpgH8+UZr8ez13XL2z2VqMRpFSLJ3YBN3XsMyHSOXMyp2
         myMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786064507; x=1786669307;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MLGlXfDDWhpZIsWPnXZToOCK71F6INAB2KuWQUQm6mQ=;
        b=skoLONAfO0q+SqBs29KlL9lMm6bSPkaNAJFjd7IkYhNxQpb6o4wbiuiYKV2Gx5yAis
         4plocdzEbayt6BIw4U6h/+bo4mlIcn3I5VXGzBlCY4bLbZqouZOfzdbgIsFxCfPN8PMX
         1fE5IuxPPQPBMb2VWgnAVJId9yUnTdRI9236UKcAOdBXEU0zYqD/4nUcT4fiEkhX213g
         6Yg409IDDo5QlX7svrQ56p0gTk7H5J5KsKhM0ei7CjPLglHt0ZpBciyvzPb5x/Am3zHx
         3ccRu6RNkgUac6nRsJCNwKsuESFM6rE6Vq6vW5rnk4DmMksFjHh/qYmBaWhllF1jUj2N
         9etA==
X-Forwarded-Encrypted: i=1; AHgh+RosTZjUod3v4vbD2WtDmonfmqh+QG6XgH8Ds0HyMmXgjVefD6b+s051+EXzSo+Vye3gWwAdUs2tpOnfi6aylBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuiTz2MRJ5zLfJDfOKdu3yMiECkKMcsWCqZuFgR+R3WySiB9AH
	+tFBWL6r4lnFsmRoOT99gNIFza3MRK15kPSXk2Gis79aSlX2MklR4hVP
X-Gm-Gg: AR+sD10xCkKZ9U3JazF3/yatnRBOT1Fh2AF9O9aSxT64TRwcQoT3SInWQyRbt+4qtSV
	Aq2PQpBXKgeCJXNBjWGeMn2Es9h7Pn4Ca1Kd2/rgYEY3FZsSJsxcj6g2yybdyzSpHWuS7eO3Lvp
	4T0UN71iXlvGx3m+PjA1ZpT2Bo0VDLFtF6pI0lmHjBYM0K8PfWY7vZHELBK55prohvVIjyF1bmj
	5cGznv9y+UhpAltOKW5EDhA13uvQm8juIRFM+VTMAyszOjQkDO2ikgNBHh3bp577Klgtm/G+w7I
	UbVfe1Jh1Za8WIerOaiT70gt8muiLkWEvg9sXZSQufNI75SdJ+8YP/XK/VyUOTqaBXnqM+ruWtC
	sGlKoyXwlRsiGe/jKPhJhmdNt/Z5sZ3Jkr+i6B5huVm1ewdHu7vu30uIVSzIKk9obWJA070kdn5
	8hRo9Sy/MeOyEAA6Yq9DwvbhAgU4sa4UJE5+MHvccdDmwTLKCpCo69TtRaFKbk4V4n16KRDSdq9
	7SDE+r5syi6VUHA2UWkBMWx1PmGxE6SsjA=
X-Received: by 2002:a17:902:e541:b0:2c9:f44e:9942 with SMTP id d9443c01a7336-2d0ca7fa95dmr202648585ad.13.1786064506751;
        Thu, 06 Aug 2026 18:01:46 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14d7684f8sm1527725ad.33.2026.08.06.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 18:01:46 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: [PATCH 0/3] audit: Measure and reduce syscall filtering overhead
Date: Thu, 06 Aug 2026 18:01:18 -0700
Message-Id: <20260806-audit-v1-0-ddd0d94ff0b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4udWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMz3cTSlMwSXUuzRMNUc8MUY4skQyWg2oKi1LTMCrA50bG1tQCcBI0
 lVwAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, 
 Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, 
 Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 audit@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786064505; l=3293;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ijoFRb8I4+XfGKhziEfySAslvbu5Jp7Eu4JILnrr21g=;
 b=/me/Wzzt3Q0JL3nWbvqc3DH08vOV+4pgXG8UcSC6ui6xM8FXaEkyc9K7WiicOYR9uN+oyVgM7
 p18cS5xN0f9Bi72Mcz7ssoQkRFDroSmck6dr9zx3x+VZb7isJcuO5FI
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

This series adds a repeatable microbenchmark for audit's fixed syscall
overhead and uses it to address two cases where audit continues doing work
which cannot produce a record.

Patch 1 adds audit_bench, a manually run getpid(2) microbenchmark under
tools/testing/selftests/audit.  It leaves policy management to the caller
so the same workload can measure different rule configurations without
silently changing the system policy.

Patch 2 fixes audit_n_rules and audit_signals accounting when rules are
removed automatically with a watch or tree, or after an LSM rule update
fails.  These paths could leave the counters nonzero after the last
applicable rule had disappeared, causing every subsequent syscall to
allocate a non-dummy audit context.  It also centralizes rule accounting
so all rule removal paths share the same bookkeeping.

The median getpid latency in the same unpinned VM was:

                                  no rules   stale state   fixed
  automatically removed watch       38 ns       55 ns      38 ns
  automatically removed tree        38 ns       59 ns      38 ns

Patch 3 builds on those lifecycle helpers.  It maintains an aggregate mask
of the syscall numbers present in exit rules and checks that mask before
walking the exit filter list.  The mask is architecture-independent and
therefore conservative: overlapping syscall numbers may cause an
unnecessary scan, but cannot suppress a match.

For an unrelated getpid workload, the median latency scaled as follows:

  exit rules                         1       32      128      256
  before                            55 ns    71 ns   428 ns   791 ns
  after                             55 ns    55 ns    55 ns    55 ns

The aggregate mask is updated through the centralized accounting helpers.
Insertion sets the relevant bits before publishing the rule with
list_add_rcu(); removal unlinks the rule before clearing them.  This keeps
the lockless rejection test conservative during concurrent rule changes.

The series does not change the audit userspace ABI or rule matching
semantics.  The benchmark and complete reproduction procedures are
documented in the individual patches.

---
Stanislav Kinsburskii (3):
      selftests/audit: Add syscall overhead benchmark
      audit: Fix filter rule accounting after automatic removal
      audit: Skip exit filtering for syscalls without rules

 MAINTAINERS                                 |   1 +
 kernel/audit.h                              |   7 +
 kernel/audit_tree.c                         |   1 +
 kernel/audit_watch.c                        |   2 +
 kernel/auditfilter.c                        | 140 +++++++++++------
 kernel/auditsc.c                            |  13 ++
 tools/testing/selftests/Makefile            |   1 +
 tools/testing/selftests/audit/.gitignore    |   2 +
 tools/testing/selftests/audit/Makefile      |   9 ++
 tools/testing/selftests/audit/README        |  30 ++++
 tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
 11 files changed, 389 insertions(+), 44 deletions(-)
---
base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
change-id: 20260806-audit-96a1e71d38b1

Best regards,
-- 
Stanislav Kinsburskii <skinsburskii@gmail.com>

