Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58871DF59
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122103; cv=none; b=K/0XGr5t4QK88yXZfNGAgYloycAnhu+CdJj7NH3520IJAjXNl4u4MMHa+zb6FF6F4YdOz2WCFIDeBaSB7LKQPhbHs/H3ZwKHzLAICu4dL6SfLVEHmY5rzxH15u4NseU/bbVJNNVLsAaxr8FKYKz6cakc4nkLeScIyx7TqMvWKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122103; c=relaxed/simple;
	bh=ERimEa1G3IdfKCVSb18kreNgeDbEZqHoSBqszcbkbXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OgaUjLc3ggXUH6FTPWX3JRZy332rbMFArMyDIMtF4g6XTK/xn6af1EL+S15Mqiiy8kL7hbXlal/mea7eaiZoXkjDGiC16JZhYkOF0TztM7LVKP4EJk/CNwGrGqwMl36MOnZJzBOjIIzl487xUGSJrYm9ggR5SzlNRGkY9CpHoo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIUppR8x; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIUppR8x"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso2564825ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122102; x=1790726902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RolIiA9xWOqMDMe26HLaPTxvXgDJ3sSrQxbTSLuZkCs=;
        b=AIUppR8xW5R1Qz2Mi/6s6ITXHro6q/nM+HbpzRBySlrg1m+2bq2zI7IhVRwLi9hcZt
         MbjWpcYXEOK3rR7WEBNb33cJ6hMFMTwBeE1L13MiFxC0Zccf/2yvvMBeeJF92uS7wmlo
         T2lp+xKuJCjrYpTcaXKwaVb/69WQ5XQV/zkOcAID9Yn4L6ehOGeGcMNkrbW3zcF8CoG7
         KhDlyJPfTk2nQLdM6gkaIQkc78jHSFW3Q5MaCBcjevflrK0NA3kej+UyoSDC1fc42aD8
         uHWqvmWFvi/t/VavEM4iwvaBvzBbsSZoFS91t7Uvx/O1+tQxtC78G4StaqvvHy6vWBgX
         R/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122102; x=1790726902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RolIiA9xWOqMDMe26HLaPTxvXgDJ3sSrQxbTSLuZkCs=;
        b=qzEfeP3Dv2gCpD5qLcQ0xDQ7jXjjqFd7dYFFIsjeZye+iKbkpBRUnip5Tanz+4Fa5y
         N44iJE18mfj49G/RHgRInQQEiDPhCftIBYRWll1qDchHCm7BgSkz3rD1qNh5vb0A/Vaw
         NyQr62CG7sJCi7cOJpVDH7sH8IDRa7zdZ3u+DUUzT3PiPoqxe0rSQ2k6PeVTe059o2IG
         hwO2vBb2y4BbKaw/4dyMGquN+uZVjVSY7Uy101+lUq+yveNqpsThfuR9PvOg3kdy74Ws
         Bv8TgfJn4C6qzL5fCEryfnVHsWQLREPT2yf07QYQH4Zf9Z+fGNS9IJk6CkkJ93u6/okH
         joQw==
X-Forwarded-Encrypted: i=1; AKwUvBwxeY0roG1S1OuBkvtQKHiz1kkFl04YQur8ug4+oNOC/lquRMbZp0hJKfxsMnHCCO++HH+ZrqmOStDwpWwskck=@vger.kernel.org
X-Gm-Message-State: AFuF++kXsb2d7cu5mXXXzAez1/6WiqvDY/za6d4tJ6Gru4+OPE8BS8p8
	Fgxfhp6y+3TKhmPswPnVoiK6rXCl58eIBUVRzRR1VC2gKRMqPKtrL7Y=
X-Gm-Gg: AYBFou2+7//tjkrWadMidUxnDz/+pkKQ3aFhwYLmkKuZiKS4F2LDGgcyxpTtnkwRqLL
	tWsAxwVapkRBxAU76hnBSWmHe8eztpyWfNFhdkNN6EP5VZdf/hfY5lXRQi0103vKRkoDJZ20Pfl
	jbUqLpJ4LM+WWA/6trhTx/GMYI+L2rcbRQ9ZSmARaQEvgSgsfoPk7qgtUVTsm+tkdfIfl0A31Qk
	SZr/Z4Vy0J9QnqrkuJiifTS+qdrdF4N8yfXjpKhH6vbRw45mpdFVJgduEYr+3DKC3+o1zpqj5+W
	Bd8IBWkXifvvJKsBVpqEKNQO+jmI0PQnbiAGqL3u3q4fMvwPV2YSLX4Lw8HEIBcQocnwjoBloSx
	1Cpu/Yz1ENDQIPwaTMiLKfY10YrW+aV/Fk1Qf16+wroTdaI9fmZP6OK40VmuMopafEcgqFJR3xd
	vMLes5akUynUTaq09U0OjvEqabyn90vZfVu/iW9PymbfEbDNz17p+nsya2HyxsvBO8LoX9Y41zZ
	57uDtMqgrtJav17Hho3R9What/uErUwRxTWcA==
X-Received: by 2002:a17:903:8c3:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2df69d1aad5mr9368365ad.3.1790122101577;
        Tue, 22 Sep 2026 17:08:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3a3dsm2021425ad.43.2026.09.22.17.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:08:21 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v2 0/2] bpf: fix per-cpu initialization of a BPF_F_CPU created hash element
Date: Wed, 23 Sep 2026 09:07:59 +0900
Message-ID: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A BPF_F_CPU update that creates a [lru_]percpu_hash element writes the
named CPU's slot and leaves the others holding the recycled element's
values, so a lookup of the new key returns a deleted key's per-cpu
values.

Patch 1 zero-fills the other CPUs.  Patch 2 adds the selftest: the
existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
first, so the create path is not covered today.

v1: https://lore.kernel.org/bpf/20260920093153.439743-1-donggeunyoo.kernel@gmail.com/

Changes in v2:
 - skip the new subtests instead of failing them on a uniprocessor
   machine (Sashiko AI review)
 - cover the BPF_F_CPU entry condition in the block comment above
   pcpu_init_value() (BPF CI AI review, Alexei Starovoitov)

test_progs -t percpu_alloc and fourteen neighboring map tests, x86_64
under QEMU/KVM, 4 vCPUs:

  without patch 1   31/112 PASSED, 1/3 FAILED
  with patch 1      32/115 PASSED, 0/0 FAILED

Donggeun Yoo (2):
  bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash
    element
  selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created
    element

 kernel/bpf/hashtab.c                          | 10 ++-
 .../selftests/bpf/prog_tests/percpu_alloc.c   | 80 +++++++++++++++++++
 2 files changed, 86 insertions(+), 4 deletions(-)

-- 
2.53.0

