Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FF36A374
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782516; cv=none; b=KPuCi8WJ7WGmIC/INBrE4T3/9Q99XRHk6dhtaqoNitzPl4xYPkmIkfDWhcBQZivODhj1SJL4uq1Drn8k1Kyd8oqbd9zKhRW1skKN1cDkq80ok04Aq8p1J4wJSKR88BxRa3OkOQRP34qhUKysPT+95reP1YUiDHORCu+9zcQXbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782516; c=relaxed/simple;
	bh=4mTYBHO1BKwVo359O7O1oHBYX8lTCqfUYOiXLv1KYeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbdPPap4T5zyWGHdGrVg8ZMCWMe+C2f0QWzZkh3i/9HvRVbgQZFYLSnM3RXxSeLYVRmW1Y0GyGcLqehgFGVHHbKh/YK6Bmk8igIP6nFYIJWRxzCLSPnDhWI7xpDskbYDl2azHsp+QdZkrWVm8gGdJS4ay/vusSlK+B0HdL6CHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRghaFNb; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRghaFNb"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f84a55e31aso2435872a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782513; x=1789387313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=dRghaFNbz6i6Gjb99Tfs1JqUMOg9dL47AvMS23hXoIduhnv5piFI0AkiRUWXz4hUog
         /7+m3OYwb9+c5T7GczS3LGGUoFqZDMBY9P4xRx5OKzbcw3eELCKq+JInQ3ZCVXms7C1v
         +NCEHcmHm3cFXYZMFKT1KU8OFz1cP8J+EJhQrsWlI8aGsmMv7HV5Mc4j4tsm5KTuoKfK
         gKb36uwU71T/i0Etlsc7NDR2Q5TonNpG8Z8iYfFrS8VjlHuMZIf+UUlh2T1y5To+F4KY
         FAvaP0vsOkAc4KzsVxwmdCa34C4hlfMB7VjjEMpSgVexUNNLOVIySO7SVK6blQDTER7W
         cTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782513; x=1789387313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3F8xNc6JnbnOhSUa3MmC6YFjLwngFDOoggPy4Vs2zK4=;
        b=ML+A4hEwqcq+isd6iorJNxFNnpmLajeFgseTC4djR2CEOi488DMCCMtQRx4E9hHeht
         u3fRn48TzoqC+SOx+7iZSiebDf5KXcVdqPfDT3PzCzm3X8neiSS8Xu+kp3baZJndlXAI
         eeMMagPQckbBjErXm7Wh9pZ2yCzqh628eY9g0VONvHg90TEk3dNp9mfxP+UCry8Nx9BS
         JzcO/X57MUwfaEu5NSSXiGZK6NBeWvrTv81BDR9MrPOMAzEVgIhpTvV8H2BVdxExEG0g
         UDxSt392slJbAPR60f6+Hdu/o9C8JIbpCxFvbAbBZ3+PsHviqNAZEkgbDKsV/UMx3P1D
         xGYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGAoXvR1BteXppiFLPGrujfZbSJ7ER2HfuLPENN/4z+Is21c5cDsNfpqYdWfb+JQ5IY6wBYonLYkghBmJhw8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m9RySvuxDRN/dKjU5MjqX/PgnwoSkd3J2ysjxjXWVVz38LThWz
	URQQnE0QdlGuVfB3SrBrW7FbAKPqpnTq9VwtOFrgmp76gaTA5eqfjfWR
X-Gm-Gg: AYBFou31HKwi/dollkbg+j3eGJ+ocf7Q3Imhd58KfmH16eBAy+4Anl35i/I4Kcm/qh6
	qQzfeEl21W6UQbnWOjdYb4FJNalVtmo+Kz02ieWKoExxJ8qN+Tw4Ltyz8mUeWcRob9K0ywUfN+e
	NTIvAm1fZO8LAf7NhQjVcVViopN7IxgkNXEZPzsbwkspXbP6Ge2z6x9WaAgy1eTrEU+W5+gLqkL
	KhFvkRgWNVbyKePxwadiGQuK7LL5vWoeG86ENLcr6HBufPgPzlZUTleJdMQK1X+qPcsuDSJANcZ
	wtDVJCs8patryicb5snawdVBiifubBTfHU/JpPd80bx5V4nG42EpaC70/TK/EZ8N9oSCOVKZ+El
	5ssmUERQD11msBWL14sCzRCzAeqy7YK7ylZEYS7cpGtj4p5NokNjRvYg44L9wl2fvlXYZRZ3SCa
	p2Lr/ZCNY78o8mEKN0InfJXhuEPAWQSCwE7Vod0dAWqAnOo6LYqXlm2ooxGNXqGvrdSpXahaf6K
	6IVhmckuoTkMQ==
X-Received: by 2002:a05:6830:4424:b0:7fa:5c49:5243 with SMTP id 46e09a7af769-7fa5c4954c8mr12694235a34.28.1788782507546;
        Mon, 07 Sep 2026 05:01:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 6/7] libbpf: Fix typos in comments
Date: Mon,  7 Sep 2026 17:30:42 +0530
Message-ID: <20260907120043.36894-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

The subject changed since v1, from "tools/lib: fix typos in comments":
both files are under tools/lib/bpf/, where the prevailing form is
"libbpf: Fix ...".

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/lib/bpf/btf.c  | 4 ++--
 tools/lib/bpf/usdt.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/bpf/btf.c b/tools/lib/bpf/btf.c
index c783359977b4..d1c73113e58f 100644
--- a/tools/lib/bpf/btf.c
+++ b/tools/lib/bpf/btf.c
@@ -3847,7 +3847,7 @@ static int btf_dedup_remap_types(struct btf_dedup *d);
  * types, in general, can form graphs containing cycles, not just DAGs.
  *
  * While algorithm does deduplication, it also merges and resolves type
- * information (unless disabled throught `struct btf_opts`), whenever possible.
+ * information (unless disabled through `struct btf_opts`), whenever possible.
  * E.g., in the example above with two compilation units having partial type
  * information for structs `A` and `B`, the output of algorithm will emit
  * a single copy of each BTF type that describes structs `A`, `B`, and `S`
@@ -5648,7 +5648,7 @@ static int btf_dedup_resolve_fwds(struct btf_dedup *d)
  *
  * After we established for each type its corresponding canonical representative
  * type, we now can eliminate types that are not canonical and leave only
- * canonical ones layed out sequentially in memory by copying them over
+ * canonical ones laid out sequentially in memory by copying them over
  * duplicates. During compaction btf_dedup->hypot_map array is reused to store
  * a map from original type ID to a new compacted type ID, which will be used
  * during next phase to "fix up" type IDs, referenced from struct/union and
diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index ee9d1b614883..67c60f716c1a 100644
--- a/tools/lib/bpf/usdt.c
+++ b/tools/lib/bpf/usdt.c
@@ -144,7 +144,7 @@
  * about. This state has to be maintained per-BPF object and coordinate
  * between different USDT attachments within the same BPF object.
  *
- * Spec ID is the key in spec BPF map, value is the actual USDT spec layed out
+ * Spec ID is the key in spec BPF map, value is the actual USDT spec laid out
  * as struct usdt_spec. Each invocation of BPF program at runtime needs to
  * know its associated spec ID. It gets it either through BPF cookie, which
  * libbpf sets to spec ID during attach time, or, if kernel is too old to
-- 
2.48.1

