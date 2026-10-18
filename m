Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F441B4F0A
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297323; cv=none; b=BXCxY5yXYazDyv3/60H+FyZevcEvmkaTyadKEBbcAa5vqSO4qDktIbomPAVr+Mk56czzX+t+vpIJiklQpSDHuf0uXHqJzP1zH9BPfRkpX2CaBGqdrOYDTontLL0nTN+lUzhNuMn9YMyiCps8KIJm4+zaLIIQi0bSp5fJOd9wqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297323; c=relaxed/simple;
	bh=hAo0vwGVQ7+kpr8T3cgGCZDlFVZJeV9ymqFaz8SiIQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LItGBiLbe8DGDOT0oB47EMIBHiXecSBQyw3cq8DK8E6gGyDNNiZuUR9gFf1jxemO4pxJS4V2g15Y6kbd8yoKUtmC1zDiH4Hiof/4o7PE7N6ZQyrLAd1YoUqM2fEqufdxRSG4N4HyqZXrnIj4SLUywUnXBV/NBdxD8vMG/mKGssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxMQMRVX; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxMQMRVX"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so3609965ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 21:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297320; x=1792902120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u+mb+Ws97QevRJvwejrow/iLEBPi/r7J2JBQR0nE39Y=;
        b=RxMQMRVXouUBwDlPhl0WeoQQvYKzkQ492oDvKW3TDDgTwfO0edFj+VQgfBK8TbmF4G
         1P52Vmi4Z/xGE7tmFnKoW1hTLxZ1atKeRhYraaZoXOnwygunTAoBe2yQgDLWTt7H6wO0
         qRHwxTxMDWYeut2W12/r2CXT87YegzOgOwRpDmu7kUwGV0Fi+KVk4qLft+20C51kUrLL
         Qle4WjTgJ4WyekA8GZ6Ke/2olZmpN2mdrkDwTz8qdOw/swskB8+hnjX62O8ooroJYVqr
         Ea/1uTFBKfpq2Jg8oaMgiyRXAqaX0g/EctXsHnavIYEpNdbmGN7UDN4WonQoSolQZIfd
         9jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297320; x=1792902120;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u+mb+Ws97QevRJvwejrow/iLEBPi/r7J2JBQR0nE39Y=;
        b=s+hsTmU8ZeRL/MIR0HgBM8z8RXz7KG2ICnKDvvWl/656YUIpnZ2WIipAkHPSTI5m34
         N29LoOZq3zmIebf1fSzIyALp+DXMiwrYTUieBxmz5QqEgSsYFG7qoSZGpjpOBRSyZvbl
         O81pEGoJlg7yukc5y1+c97fM/tYZLEt0se9FIzV3D1CWBdwcRfB7yN/+ySdLAEq6q5HA
         6V54udjrvLc/SUovHrLZLZUVDn66jgXrwTvyZ7R6wIHT15cNoLELxOL7Er8BghAN7xnq
         bCWrkgzDsuvsJE+QkPDHaZTYu0fgMXXx/Qy8hN8cIVKjRvBiuZD07cxV/sPKxDxZzCmX
         YXgg==
X-Forwarded-Encrypted: i=1; AKwUvBzoeGejag1XIvkjEaHZiQfSZfGuW53NcDpvoIxAzj4wX6tzzrk8JK0CwhdTEsaiaMkzvCbNhbZQ4/+9MUpnzYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKddcJSjS88ZW2lr5bNvGmishYyjkTNJYSI4z5Lcn6Q8nr8pNmr
	BzVLqu3/ugWP3STy93XonNel+66pkqL+iKRh6FJM74B8XxRqQ+MhHAJP
X-Gm-Gg: AYBFou377pdHIsE+2tLwsmomikAtUrvLyPVcKMpgx+itKeIXRUAzdPDiK2xLjFDRej/
	FRavsrc7z5Nw+dz6lpQi5DQIxWVyOMbzELyPWMd4Z+IWqeWTXRO5dP+bfO785SH8+oqEzAuXbBY
	P0i9PesBZD2B8ggIaAHmCRhRDt/g/a0yW9zglduF3pbuqXc80YshMyP7HBIYUmewpnhEkzReuyp
	GMWGpW9KPwuWFk4d2/Mkqa6vjIkwOE6zedICOIgMwNdyYRZUcGvcjloxeSujDfLdBE7O+Jp9ckA
	4TXPdLa20t9vVfm141KG+TUl1uS9cdWuQhY6XDQQyQbE2dsiE9qZcR/Z7O64esSwyT/c764YPG2
	GrPjjg1i6cgaawDmby9wOHV5+pEVTfgd7O0b8CHkUtYyrkUN8ATrP3+8R3mZXEtm+IQm7AbDY+3
	I4g7a0RiX9v3vFDKrJUh9u0v/OwKI4Fpj6HGX2A38rkhSXlixUC4eCTPI2LKJMQk3agyjaWQWDY
	TdSLlzG/9E=
X-Received: by 2002:a17:902:f68e:b0:2e9:7190:32e1 with SMTP id d9443c01a7336-2e9a69f7864mr32203925ad.17.1792297319948;
        Sat, 17 Oct 2026 21:21:59 -0700 (PDT)
Received: from [127.0.1.1] ([123.109.188.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8758efsm24799195ad.55.2026.10.17.21.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:21:59 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
Subject: [PATCH bpf v2 0/2] bpf: Zero-extend the index in inlined
 bpf_get_func_arg()
Date: Sun, 18 Oct 2026 13:21:40 +0900
Message-Id: <20261018-get-func-arg-v2-0-048848b3eddf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRJ1GoC/x3MQQ5AMBBA0avIrE1SLYKriEXVTM2mpEUk4u4ay
 7f4/4FEUSjBUDwQ6ZIkW8jQZQFutcETypINWum2UlWHng7kMzi00WNvXKeW1hDXDeRkj8Ry/7s
 R5p1het8PUP6Ht2MAAAA=
X-Change-ID: 20261018-get-func-arg-93c80d63ef45
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Woojin Ji <random6.xyz@gmail.com>
X-Mailer: b4 0.14.2

v2, from the review of v1:

 - Shift the index as a 32-bit value instead of inserting an explicit
   zero-extension (Alexei). The inlined sequence is one instruction shorter
   and the bounds check is untouched, so no program is accepted or rejected
   differently.

 - The selftest is now a separate patch (Jiri). Patch 2 keeps Jiri's
   Acked-by from v1; patch 1 does not, because the kernel patch changed.

v1, the problem: bpf_get_func_arg() takes a u32 index, but the inlined
expansion compared only the low 32 bits of R2 with the argument count and
then shifted the full 64-bit register to compute the context address. R2 is
ARG_ANYTHING, so an index of 1ULL << 32 passed the bounds check as index
zero while the load was performed at ctx + (1ULL << 35).

Patch 2 depends on patch 1: without it the wide index faults in the inlined
sequence and the guest panics.

Validation, re-run with this revision (the 32-bit shift kernel):

 - Disposable x86_64 QEMU guest running a BTF-enabled kernel built with
   clang 22, with tracing and bpf_testmod. test_progs output, verbatim:

     #150     get_func_args_fsession_test:OK
     #151     get_func_args_test:OK
     Summary: 2/0 PASSED, 0 SKIPPED, 0/0 FAILED

   The pairs in that line are top-level tests/subtests, so both tests pass
   with nothing skipped or failed; TEST_PROGS_EXIT=0 and the guest dmesg is
   clean.
 - The same two tests on unpatched ff47652a4b66 fault in the inlined
   sequence: a page fault in bpf_prog_..._test2, with the load performed at
   ctx + (1ULL << 35), which panics the guest.
 - bpftool xlated dumps of both test programs show the index shifted as a
   32-bit value (w2 <<= 3) at all 32 inlined helper sites on this kernel,
   and the 64-bit shift (r2 <<= 3) at all 32 on unpatched ff47652a4b66.

v1: https://lore.kernel.org/bpf/179221432098.1890560.17043109037413683447.get-func-arg-index@gmail.com/

---
Woojin Ji (2):
      bpf: Zero-extend the index in inlined bpf_get_func_arg()
      selftests/bpf: Test out-of-range index bits in bpf_get_func_arg()

 kernel/bpf/fixups.c                                |  2 +-
 .../selftests/bpf/progs/get_func_args_test.c       | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: ff47652a4b66c067c765a7ad464d930b5a9367cc
change-id: 20261018-get-func-arg-93c80d63ef45

Best regards,
-- 
Woojin Ji <random6.xyz@gmail.com>

