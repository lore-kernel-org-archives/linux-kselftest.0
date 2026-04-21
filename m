Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC23D75C6;
	Tue, 21 Apr 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780820; cv=none; b=EvejmHQr1QR432V3E5M+mjUxSiboYq2G2Pv6kiEdNST/n9NYjb3JHDiReZgSZ6XlQxklTdjMXE3DigPsh08g62YjVPAXdC4z7OIUhvbvTcIUkltXKVVOE48nd5ahYkDScUfTaNgpcov2wGT1x6yTnSNKa0uP8xi3U4F8/QwZL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780820; c=relaxed/simple;
	bh=8c1FCBDluisN++wCqVaPRqhusGeGZbFLq+Rsv1qpGoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dOagD1SqwGk+QU6SHTIs2HQ3e0I3Se4s4Qae6y4T74lX2EQ7dWpJWm2iatx9NNt2wLjaqjJGKjUJ/xK047GdGadAXSzvifjaYXb76US5/5IFHL9ZLpM7mO2bsJb4b0JoFy1Tk+2mWTvmbB3QXnvPsWimBjMuOsg8RoP1bxm2B3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=MPbgQoiT; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="MPbgQoiT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bfcxF2u+hQ4VdjQRf9kqyoNx6rQM7T3312bTI/HTZHg=; b=MPbgQoiT+/tQc0iC0nnsMfSORr
	DgmmrgoIduPqozuq0h1YJmqHVrWcxOS86sI91DObsnYJqQ6kH6QyRUgHx7O2VzcKs8uvDJFgqrv0A
	qyWCbo1j185tdD4lcSfR3MzckeE1XyvwVWSPoZopIVbCC+PkYBKL7HR5xIhAbyYtBxFQ4gwB+D3TW
	cefLvJW10RHq5P9rAiRudOiHv0uaVE9rVY4klUhUzmJszoRvGLEsK6801Z6+924h00V4IaZhMeSOp
	1afj/CZ4oRXzEXMKJRvFJj2frTSawftLTvzkhaVM1GCD7ISj05Su8z8oJQwgnYJBlg38lRlbqXIy1
	uh+MDddw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFBPh-000tUF-1n;
	Tue, 21 Apr 2026 13:45:17 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] mm/kmemleak: dedupe verbose scan output
Date: Tue, 21 Apr 2026 06:45:03 -0700
Message-Id: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGB/52kC/yXM0QqCMBQG4Fc5/NcO1lCDvUpETPevTqbJphGI7
 x7V5XfzbSjMygIvGzJfWvQ5wcuhEvS3MF1pNMILnHWtrZ01w8jxwTBcIuM6m45s6pRC2/CISjB
 nJn3/wtP577J2d/bLd8G+fwBvkKDAcgAAAA==
X-Change-ID: 20260420-kmemleak_dedup-bee54ffa65e7
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=leitao@debian.org;
 h=from:subject:message-id; bh=8c1FCBDluisN++wCqVaPRqhusGeGZbFLq+Rsv1qpGoM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp539pNPX8JyvWSFZg0lwaLVLDVjeBHI39/IXG2
 OHTw6ccuAOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaed/aQAKCRA1o5Of/Hh3
 bbl7D/9nUdgcr7VM74o/Dvc/6FI4Hvf37TKvzCH80sbO7zoFxootHE6USvSApY1WG1yXPq340Px
 GnFcedrx7ZZ5HsrFB0ykmap2ifZtAght8wU56ovt2Dw78gdCfLynbg/dNNHag4Zvc1e/BTlsyGY
 VWi5kY4pRbRSEEK20/6cpQREBIwokucnzQ4N0B2JpHSAFv1vBLcsNbrBYv1oGlfzMUtwSaNI8aM
 wzJJg4SoUiaynBj8OpMvcT9/ykz9mnMfZVmU+5MFVifsBJMIpOw2RVngoL65lBYMWsb6/T6h0oe
 kcah0hv93DniQW0LzLWNyCqw7Ryzzgl6VT6pphaQkO3F/jsJ3CQ8aE/FgK5BpaCL4TbTzpI2m2S
 ipm/YOIEoFQHFLTFvitM5+KFr5x7Fa21rXOpJsTYFmZIXNo3YLabEgIzhVO5jCMkbwu72orBQHo
 MheYWDGiArsLhSqgL0KN69cNEvtDp/P6Bct8pNQpbZ48TLKYmSvSxy/m4WfWWXjPNvI4wm5Ds0u
 KTTEGhKQuBsDxtWbeH+LmpCDLYA9JoVuHha1D1d4p6CtEydmjShtpvhB5e+8dyupYM0ly1QsIZs
 vnryt9NloXzzOdsYubIBuePVCM0mgiyqBN4J2RtNCKOB3cB6tMbGLf4xQAMl8TSXX3wqsy4xOqw
 6CqRIYJsVwTf5gw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I am starting to run with kmemleak in verbose enabled in some "probe
points" across the my employers fleet so that suspected leaks land in
dmesg without needing a separate read of /sys/kernel/debug/kmemleak.

The downside is that workloads which leak many objects from a single
allocation site flood the console with byte-for-byte identical
backtraces. Hundreds of duplicates per scan are common, drowning out
distinct leaks and unrelated kernel messages, while adding no signal
beyond the first occurrence.

This series collapses those duplicates inside kmemleak itself. Each
unique stackdepot trace_handle prints once per scan, followed by a
short summary line when more than one object shares it:

  kmemleak: unreferenced object 0xff110001083beb00 (size 192):
  kmemleak:   comm "modprobe", pid 974, jiffies 4294754196
  kmemleak:   ...
  kmemleak:   backtrace (crc 6f361828):
  kmemleak:     __kmalloc_cache_noprof+0x1af/0x650
  kmemleak:     ...
  kmemleak:   ... and 71 more object(s) with the same backtrace

The "N new suspected memory leaks" tally and the contents of
/sys/kernel/debug/kmemleak are unchanged - the per-object detail is
still available on demand, only the verbose (dmesg) output is collapsed.

Patch 1 is the kmemleak change.

Patch 2 adds a selftest that loads samples/kmemleak's CONFIG_SAMPLE
kmemleak-test module to generate ten leaks sharing one call site and
checks that the printed count is strictly less than the reported leak
total. Not sure if Patch 2 is useful or not, if not, it is easier to
discard.

Breno Leitao (2):
  mm/kmemleak: dedupe verbose scan output by allocation backtrace
  selftests/mm: add kmemleak verbose dedup test

mm/kmemleak.c                                 | 102 +++++++++++++++++-
 .../selftests/mm/test_kmemleak_dedup.sh       |  78 ++++++++++++++
 2 files changed, 175 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/mm/test_kmemleak_dedup.sh
-- 
2.52.0

Signed-off-by: Breno Leitao <leitao@debian.org>

---
Breno Leitao (2):
      mm/kmemleak: dedupe verbose scan output by allocation backtrace
      selftests/mm: add kmemleak verbose dedup test

 mm/kmemleak.c                                     | 113 +++++++++++++++++++++-
 tools/testing/selftests/mm/test_kmemleak_dedup.sh |  86 ++++++++++++++++
 2 files changed, 197 insertions(+), 2 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260420-kmemleak_dedup-bee54ffa65e7

Best regards,
--  
Breno Leitao <leitao@debian.org>

