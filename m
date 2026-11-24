Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491217;
	b=Q8DmH4kqo6CqaXcLInsXQ92THYLju6wV0GTqT8H1aSBKKbpJJvPWk+ELSctcVM4BFy+M
	 rnPIOt9Jqmu//PbXhNiV9akSSfFz71lfMMT7KJKL8EjAJugEcGxnMFraqExz4awmGAxZ9
	 LGllU195B8uXlQ+I9a4XT1OaqUCAdEMH9T3TSXpvc063Gc1lQK/8uAcrt5xQixdD/JDla
	 c24Xsfk0B735T5aqWQvwHFPZBHQXh9rzuZlIuXQbjpdX4Zaq8WC4fMQCkgcPsUW1FLgvA
	 P0I80AHS/MxWa4vDdlJXyASAFvkysFyL9wo0IrtQALowcedDTI+sJSaLVFtZdl8XsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
	b=t5XpmhI1Wfb7N3Fdo0Avo1ww1h+oGZFdCgf0NlLTKJ7cwjJYJJ36qYHx/VbOwhJ7eAKu
	 WQZk0IEoEuNC1WO1op6Bj89HC2s8vlcE59bMjhY+Ndo/bY1YDoY3RyGDJGKfIEhYeXJH4
	 M2N+6z9Rrprxv1ZgjY4A3EJhQbPCtqReEYkVTnrc3D1joMM3yTyA+hPYM8pWrFqRfCYlI
	 e9Zp0CtnyAmjIRP8NfLWSLr4TcDRsgpIEqbsj7NC417f89lnZFpjRGbsKpvWhVSpuT2RO
	 nx0qWy6tduC9iQoSo6Of1W79qQp2+YLOJwXhwHoYgeMIENvyTf3lTNKrF5v0C+szTSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gs9lhhOf;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5F606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gs9lhhOf
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so662248a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 19:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491217; x=1796096017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=gs9lhhOfNFnaLBtsSJI7wjtJzJJzC9AJGxvTLGqRAnSuXuQ6MOqZCLk0c9cGY+6Auu
         4DbyBcRB/6R2ZgvRr+9027i0MtbRVfftVbdGnnjwq2kbECaTq+GUaQPdDhLpdSBwcve6
         aqnA6YjMVIHkqxALJJNSRzkLYZXRGtFnMqjlQEwKgv+2hgsQwpZrMOANc9iyn92T4zTp
         EkAO0jnHlnYckBOirYBmUJ3ExXuZppMPWiUMBe+5A2ldH/1NXsdlDqkYk60LDu0A7ILp
         HaTnT0m2muOevY+Y5R4q5x+N8MWIBN7tMhWBVUU++80+bNaYC8LwvK4BXRaNxhYbCldv
         oyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491217; x=1796096017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=hAAa8rXnur6PletDWqql65PuSZYOjGWSi+plrsfg0OY/BqCnR4kEKqJZNI8jstOWVw
         JgxmHCbu2tO3k27Ojwtj78Oq9kjVFi9kth2wDHQ1vXA8dib6JtJnj4VnjPLOHGvC7YH2
         e0LP8OFZz1BZM4JOpia+aAH0YTgwoCdJnVskmgoV9YRCdONAA+rUOkeWkL3LrXJ3mYpk
         Rxntjh7PII3PPX2gFODqdqgC+26tNA1VYPJ2R7zxvC07+jZJFkfI7MXjMhPTnfZQAVyP
         bvHOpLvx4X8NOQf8MvM3TTOoc4uU8wAe6Q8rl4ASWYXSgBO3+MJFXhMwGLJMGJwpzk+c
         2d/w==
X-Forwarded-Encrypted: i=1; AL+hErH4AoCwalePeDl3yExnR7/YrxKet0cTORsDnkyzMGJAUis0EUqVB+KPHlvSoS97sZy3cWVfR9zC2yw7mQIqIg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FYzjcHfPwiXaXaNVSB5vLkCugjT5skspWTtq7RyTSmWEEPvKd
	e8FX5FQHMhr0lWBGb/Dx9Ipg8r7VVkpKx/NZ5hOO18q+ZlSxaL2kgPNo
X-Gm-Gg: AZFdTZenx50gouEeFlODN4lkfTyWw3a8C92YDfukUxrzW/9JWuxtIpvctSe2RuG9rzF
	pCiRpZF78DZi9qgDdDgaTENmv22y0swGLwFrhzJe5AQbyNEZYjl5mwiBgrPFmdR3xdLlqfdgwTz
	Jgha1LDTnHcX2h60gTRtXZUxFhjJsEs8B3Hd5PCJe8AvzoCinS9WxmWjKInrb1/G9kTnmmMvQ4X
	SXeWx82j53yZdWzmiSl+oD6l7TFn0O2n/EPXr1CWHPQZGClRSFyIB90zzqAcAHSYxdcUYzWcWfU
	4FxJlN1Ek2OpRdMKqZa9gzyMdSN3XezPTBEGoGdq6cPc1miaj5MEyr/iekla9YbwFR8lzJdeGxC
	BQpgk2qhDAajkiX9r6tsNcs9IHSNOu6/8k1Wb9iJlqL9BwHeyuUnyJkrVNOysH8h9NNCG8jsXBr
	Q0p95CaQQFft99RWqvmP39+L6tyr1sCEHdtUU51d39NQtRG0HVMVt30vKJBk9nVYetRms3bHAFZ
	y/+eqbab9eW1lismqlSEOEZkPC9Y9iudh9bDh6KEx0WTFwdtRPok28znP+UnFO/XNTbmFnLHNgy
	uvrVVK82eSCIfhw41VTITvLUy1VP7GHNYvCIr9fZZQ==
X-Received: by 2002:a05:6a00:414c:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8c87c3882fcmr11093633b3a.21.1795491216650;
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Test steal-time dirty logging and RISC-V STA transitions
Date: Tue, 24 Nov 2026 11:33:26 +0800
Message-Id: <20261124033328.612894-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the KVM steal_time selftest to cover guest RAM
dirty-log tracking for steal-time accounting writes across architectures,
and exercises RISC-V SBI STA shared-memory state transitions.

Patch 1 fixes get_run_delay() so that missing or malformed schedstat files
fail explicitly instead of dereferencing a null stream or returning a
fabricated constant that causes polling loops to spin indefinitely.

Patch 2 enables dirty logging on the shared-area memslot in the common
per-vCPU test path, clears initialization dirty bits before checking
accounting writes, removes the v1 #ifdefs from main(), and tests three
RISC-V SBI STA transitions: disabling an active area, re-enabling the same
area (matching the SBI calls used by Linux RISC-V guest CPU hotplug
callbacks), and replacing an active registration directly with a new area
at the end of a second host page.

Changes in v2:
- Split the get_run_delay() error-handling fix into a prerequisite patch.
- Move the steal-time accounting dirty-log check into the common per-vCPU
  test path and drop the added #ifdefs from main(). (Andrew Jones)
- Separate RISC-V SBI STA disable, re-enable of the same area, and direct
  replacement of an active registration; clarify that the selftest invokes
  SBI directly rather than running Linux CPU hotplug. (Andrew Jones)
- Drop the MADV_DONTNEED check, which discarded guest page contents rather
  than modeling migration. (Andrew Jones)
- Clear initialization and transition dirty bits before each accounting
  check so registration writes cannot mask missing accounting dirty marks.
- Force bounded runnable CPU contention instead of assuming every KVM_RUN
  advances the sequence counter when run_delay is unchanged.
- Size the RISC-V two-page region using the host page size for 16K/64K
  host page compatibility, and fix Author/Signed-off-by formatting.

v1: https://lore.kernel.org/r/20261115085457.889873-1-shanbeeyoo@gmail.com/

Validation:
- RISC-V (QEMU TCG + H-ext L1 KVM): all 11 steal_time cases pass; local
  controls confirm compatibility with skipping zero-increment STA updates
  and immediate detection when the accounting dirty mark is omitted.
- Separate local 2-vCPU RISC-V Linux L2 guest run under L1 KVM confirms
  SBI STA detection and 3 CPU offline/online rounds invoking
  pv_time_cpu_down_prepare() and pv_time_cpu_online().
- x86_64 (host KVM): all 8 steal_time cases pass, plus fault-injection
  checks for missing and malformed schedstat files.

Note: AI tooling assisted with review analysis, test rework, and local
verification; all changes were reviewed and validated by the authors.

Thanks,
Bingyu

Bingyu Xian (2):
  KVM: selftests: Fail explicitly when schedstat cannot be read
  KVM: selftests: Test steal-time dirty logging and RISC-V STA
    transitions

 tools/testing/selftests/kvm/lib/test_util.c |   7 +-
 tools/testing/selftests/kvm/steal_time.c    | 233 +++++++++++++++++---
 2 files changed, 210 insertions(+), 30 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.34.1

