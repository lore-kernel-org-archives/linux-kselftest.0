Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220155;
	b=YDrrWfuTX01BpEB2ZL9LUdSqL9wUfVbrKwwh+QL1U/oO2lyMci7iWwYIG9KczkYV8YEY
	 so2CioKHZBHKV+BJBdnJMHnPAZNgmbH1DQPaLf1xd6pfYzAUEZlDALi4xIB8CMyyDBq+i
	 SOyYbqYmuRimG2xnEnGVPn28kQOodnm9Gaqo1xjK8zltzZITYGC+xE4WJ2N+pEoUHQNcY
	 ortYLARhynalLfkmJKUeXNm9Bz7ZyL8IKy3s/51y3qAEdQlgPalI+PqHN1lcl3xiyx7u4
	 vvPgHkOkjslYoGzqYnL3IhFFtwaumtrfZoTv322kGI1Qx62YjdMGAwadcon09TfTkVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220155;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ah4gzw5OiHfYj57lOarZOXCU6RfDPS1zY+caCBQQGnA=;
	b=WT3/9zW4qApMH9HMYIRkfVFcvyFbMKLG8w8KQ+aPtzRRLCCGvLez46u+peJxYKwuOU+W
	 /74X5Id9hd1WvMLNxcPW7hCS8lTSnjWsPRjE67dqj6fIjpZmqF783EzhbLz8/walkt3EG
	 pN03WYjahJCOc4f7s/x5ey9jUKkMI7dbGSORQbyOZspzYPG6unrLslYT837x6IKyjX8Xl
	 c4cx/++4moDQYS3JQ7dP7elDLkEsDZnAdptecWrOGuKBx4VnqqdjCaljC7SwRnuBIOHTt
	 gE4GdB7aC8PE94EnNgQae9RRwcEBb8niZutSBESIgwj0puIaZ1wvKKaiEYAiKfe6toQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hAHfE99h;
	arc=none smtp.remote-ip=91.218.175.235
Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240C60A3804
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E240C60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hAHfE99h
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=psa7zx1Xe6yGIkcQOpjXlYI3zz/TQ9U0VkcLjx2WVoI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793220152; v=1; x=1793824952;
 b=hAHfE99ht+ju0aaQ0ElHYNxGYRnXQIdQm+OZxW1e3/oPkonWmSaOBRU2w9XeRFrGlFOWON5k
 BxvYtwslmpEong4ZAM+gzuyvm+qm4RxksKQHRVmCLVq9CFmISlS0IjJYEcrDi+jHZVJuJzOTDXC
 d5ZGU5UK4W2UOX377A1JN49c=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6027c9657daffdb;
	Wed, 28 Oct 2026 20:42:32 +0000
X-Mizu-Trace-ID: b6027c9657daffdb
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jose.marchesi@oracle.com,
	david.faust@oss.qualcomm.com,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v2 6/8] selftests/bpf: cast explicitly in the arena subprog and callback faults
Date: Wed, 28 Oct 2026 13:41:56 -0700
Message-ID: <20261028204158.1021284-7-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028204158.1021284-1-vineet.gupta@linux.dev>
References: <20261028204158.1021284-1-vineet.gupta@linux.dev>
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

Four stream tests fail with BPF_GCC:

  test_stream_arena_fault_address:FAIL:stream__open_and_load unexpected error: -13
  #479 stream_oversize:FAIL
  #480 stream_partial_read:FAIL
  #482 stream_syscall:FAIL

They call stream__open_and_load(), which loads every program in the object,
and two of those do not verify:

  #481/11 stream_success/stream_arena_subprog_fault:FAIL
  #481/12 stream_success/stream_arena_callback_fault:FAIL

Both dereference an arena pointer and leave the cast to the compiler:

  int __arena *addr = (int __arena *)0xdeadbeef;
  *addr = 1;

Without arena support __arena is only btf_type_tag("arena"), so no
addr_space_cast is emitted and the store is to a scalar, which the
verifier rejects.  GCC splits it into byte stores, 0xdeadbeef not
being aligned:

  r2=3735928559 ll
  *(u8*)(r2+0)=1            <- plain store, no cast

Their siblings in the same file do not rely on the compiler; they use
bpf_addr_space_cast(), which emits the instruction byte by byte and
works anywhere.  Do the same here.

The address space has to come off the local as well.  Left on, a
compiler that supports arenas casts a second time for the
dereference, on a pointer the explicit cast has already converted:

  r2 = addr_space_cast(r2, 0, 1)
  r3 = addr_space_cast(r2, 0, 1)
  *(u32*)(r3+0)=1

With it off, GCC with and without arena support and clang all emit the
same thing, which is what the test wants:

  r2 = addr_space_cast(r2, 0, 1)
  *(u32*)(r2+0)=1

What these two assert is the fault report, not how the pointer was
produced, so nothing they were testing is lost.

Measured on bpf-next with a stock bpf-gcc, test_progs before and after.
Fifteen results go FAIL -> OK -- every test that loads this object, not
just the arena ones:

  stream_arena_fault_address             stream_oversize
  stream_fd        stream_fd/blocking    stream_partial_read
  stream_fd/edge   stream_fd/empty       stream_success
  stream_fd/hup    stream_fd/nmi_epoll   stream_success/stream_arena_callback_fault
  stream_fd/open   stream_fd/nonblock    stream_success/stream_arena_subprog_fault
                                         stream_syscall

and the five stream_arena_fault_address subtests become visible for the
first time (read, write, xchg, cmpxchg and load_acquire faults).

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 tools/testing/selftests/bpf/progs/stream.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/stream.c b/tools/testing/selftests/bpf/progs/stream.c
index 1ae015c4e6b4..dc56779cac06 100644
--- a/tools/testing/selftests/bpf/progs/stream.c
+++ b/tools/testing/selftests/bpf/progs/stream.c
@@ -5,7 +5,6 @@
 #include <bpf/bpf_helpers.h>
 #include "bpf_misc.h"
 #include "bpf_experimental.h"
-#include <bpf_arena_common.h>
 
 struct arr_elem {
 	struct bpf_res_spin_lock lock;
@@ -381,9 +380,10 @@ int stream_arena_cmpxchg_fault(void *ctx)
 
 static __noinline void subprog(void)
 {
-	int __arena *addr = (int __arena *)0xdeadbeef;
+	int *addr = (int *)0xdeadbeef;
 
 	arena_ptr = &arena;
+	bpf_addr_space_cast(addr, 0, 1);
 	*addr = 1;
 }
 
@@ -404,9 +404,10 @@ int stream_arena_subprog_fault(void *ctx)
 
 static __noinline int timer_cb(void *map, int *key, struct bpf_timer *timer)
 {
-	int __arena *addr = (int __arena *)0xdeadbeef;
+	int *addr = (int *)0xdeadbeef;
 
 	arena_ptr = &arena;
+	bpf_addr_space_cast(addr, 0, 1);
 	*addr = 1;
 	return 0;
 }
-- 
2.53.0-Meta

