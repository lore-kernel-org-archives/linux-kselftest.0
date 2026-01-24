Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16871DFE12
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 01:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217718; cv=none; b=jdBO5/3a6EHo3GqJg/elZKs2K4wIxU+7GXrnYnA/6PXLbtPZ/Iim0pTPz4j07+LKBFctL0b/WFcrOThTlvV0H54BI9Xws+TSR5gmvuPjqKgNMyENpxzlwQ8Yr7D7YB62wTIpUWYOYRwybWFe4Av4z5exCAnuM7w/sSEjsQgvCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217718; c=relaxed/simple;
	bh=EIi/GnTlznjPON4PS8pc54m9LlDIbD5aj6rLgRF+Sso=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JCT/ri6JK7l740fXcerz7gHhqcaDlKiipsjz4yXF6ppfFV0Hylv1/84A36+YW/RyLWpqwxem7YaBZ88jfLBekbmwP27RyJHDKMJJ5ZWZTx6fbs3gosG4odM7wQJISXM7DPdVp22wVt2ZhbA0UPP3WKaV5eHXp3GQFlWNZyet7XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc5Qt/Lw; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lc5Qt/Lw"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b708fa4093so10128014eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769217716; x=1769822516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eViLy/8042sT43+AqNLTZ9LY4N5fDHN38VganIaxaTI=;
        b=Lc5Qt/LwU9+12PlMQF0AMHqfguCK6yCsKwAwM1TVdqiVVNbBm5N5uk515eqlTuQJ53
         w2Hy7QdprHKoroVYbjl2d64TjX4HxKqzc5rsKyTk3+Je9ak9LD1gCczes+Kw2K4ZLr4O
         We+h0AJXZykX/AqV6fxknq8cd8s0YNeqLWEV8ItwkTuasGT7KXIfmDW5Sr5jQGq5qCi8
         6aOUASucFFGBd4JXpuOW/ZiiXemNnZuNb2YRuVm+OtxFOqXT7sZofBZpaVC9NVb6w9BC
         GZ2giBBKMf38gzoazhQGe08KBAy7Nw9lMQP6NtaWArx0qq0C4OjhVq15USZUGBLD3rJ1
         zjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769217716; x=1769822516;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eViLy/8042sT43+AqNLTZ9LY4N5fDHN38VganIaxaTI=;
        b=Y4tN7b0/PV5hOQ/LPPu57ZhHhWw5pnTbD+GvS+lAobjNHyMlRb8qIe5ypR03it2wCt
         yc5XLqAFf+lXkeK+FHHd2Q0KOkSiNPATsrkgc8moykVyTP9dv/US3C4p8dydOkkOUX9P
         I6PixyBIhEAb0LzvnwgayU+oE3ycfhii6RVsn4waAkK7ukdC1zNvEp+TvVzhUbFr3uFM
         v7aNIa8bxvOCUGSCceQ1A/lilCKHKsseakB+bHmpsXX/HT6iRaAnnl74iCUmjgWjd6TF
         oa3KNhn5O2g4LJwGDvDcYfNfiWsa18VTbQw7j+7pbqhPChReqfTsqIkyDY3+Zghk9oAr
         j91Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEOChXirYNgpRVMk2mElEYPiXpF1YMcaCnO6hf08+CvEeIfAF5X65Dsu1xJjGmIZtVkRYSYo2NRaqliT0hDHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyawYkfa7pJXnw0z6XUnZ5lQXokXU4bs23ezLHs2Jo5rZbD1AgD
	fgnFvL9c116Y3C4BHkCEGP3q/eHT6DW3JcuUXXeTJrPTu8s5NuYbsRLjqHOrQVwbmpqrc5QJB67
	ZOb1ZVIZAFeepdQ==
X-Received: from dycna11.prod.google.com ([2002:a05:7300:ea8b:b0:2b0:5418:353f])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a984:b0:2b7:3955:f50a with SMTP id 5a478bee46e88-2b739beab86mr2393375eec.41.1769217715760;
 Fri, 23 Jan 2026 17:21:55 -0800 (PST)
Date: Fri, 23 Jan 2026 17:21:28 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260124012133.2451708-1-wusamuel@google.com>
Subject: [PATCH bpf-next v3 0/3] Add wakeup_source iterators
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bpf@vger.kernel.org, 
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

Samuel Wu (3):
  PM: wakeup: Handle empty list in wakeup_sources_walk
  bpf: Add wakeup_source iterator
  selftests/bpf: Add tests for wakeup_sources

 drivers/base/power/wakeup.c                   |   4 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/wakeup_source_iter.c               | 103 +++++++
 tools/testing/selftests/bpf/config            |   1 +
 .../bpf/prog_tests/wakeup_source_iter.c       | 281 ++++++++++++++++++
 .../selftests/bpf/progs/wakeup_source_iter.c  |  60 ++++
 6 files changed, 449 insertions(+), 3 deletions(-)
 create mode 100644 kernel/bpf/wakeup_source_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/wakeup_source_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/wakeup_source_iter.c

-- 
2.52.0.457.g6b5491de43-goog

