Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1445D19F
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921960; cv=none; b=CR9srL3r8SvGqsVC7a1xHo2mporDBCzbHcKsMpL2mfRnNk1fwmNIGF+wXqGeUw6udHhJximBHb0kicL+4mNk0DfYJ7hw9Ulb0DGce3n/MK7UKtO+b8S3yU3R6dl0XW9KlLbl87XzWtiSrib7SBeaIuNz7AQNzFhbFomanuMCP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921960; c=relaxed/simple;
	bh=1Mmp9z7COGyxK9xnnEX9yk23blndC2AFARmxjMGR9SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ht7NUrxG2YGvwY9Tkb3nY3BH5VeRkJJ+cPkAY5+dOIokpgEeFc1UVv3hXGdCadttQFmRiBlhw2821IMQ4d5PpkjRlkkDVZqaZ4rIefj0+yLFTtso+zuIhmCvCSIlOhL8gmwogf/3nFd99Pst899jCWfiHPYF1SaVenFMAeNBFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMwLqta3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMwLqta3"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so6713355ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921954; x=1790526754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjNvBDr5WCXy3HSYn/Z6xkY91W8OnRmASt3rgB5rG98=;
        b=OMwLqta36CrdAHNfNKkDSVrmoI6SxBJR6I2pvysXOLZF/TcmDpY9ncmOb+0lPcXIwC
         +3TufLYHobp8TQUsrbKFabgSoqJsHzEPAWadO1d2TE4lkuK8xz3As6LvGDs4XNvskY3E
         AMrHbXJDSIXVkilWysblukGiqPu0e+ougjblUKwIRNKrM3yJUzXfvd3kpWoMxpH432Yv
         0UzXNZks5qnd5/MB8vorZZOMP3R5/ITBeHG5gDAKiSBNAjanEqmuagMlE162MMyPrmNB
         RdTOLPvZFvza1mc4EQdEllbHnPzaj0bxLB3dtsA9fvIGz3wCnaxe/RpUXRYSpihqQH+R
         mEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921954; x=1790526754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjNvBDr5WCXy3HSYn/Z6xkY91W8OnRmASt3rgB5rG98=;
        b=jWa8t1cixhpROfOsD/D24txjKyVWhvFnEAO5DzW7XzjFaHKGoObnP/jzz4MLb1I9sn
         aeqMOrPY5dRNOtpM3kLIprC1dKR/WMp0Yd28CUuyhKjSV8EHnk+t2MT5DHNVjlJ0PdmX
         OEYV1eN6hMUSbf8AIWlz2G2Qb3xpF6DfPUbbDjnaDGqw5PJFMWGC/KGdH/7pBkWmRR9p
         8h1/a+as2gILZ+pwLrTUJNyK9itMIpmG6IW9kPfvCoWBRyhhUrUwzQW7yvBvmokugNZ8
         j5Hw6yRoDk0LCN4lwg/lDImvcvrPvXU1LKYvn8lLim/s08k13XrErCEvhuCw8V8n89gt
         He1g==
X-Forwarded-Encrypted: i=1; AKwUvBx5zRcu6c+0yP+YL3/lrJKMQUjkqlp8OKlKgOmYGy/TFe4M0wi6FdkFrJnpRta9qLjMesgX49L4Ebn79Ro6lWI=@vger.kernel.org
X-Gm-Message-State: AFuF++kyNhvJZZE5RI5Kw5EyLP6X+IKN0roQ44+kax683hqL1xpFz1xB
	YmzLUfeF/wDUi56cGERNWV+ae+XG+PUDEzp5JzU9FmsRFj0wcHwY4p+d
X-Gm-Gg: AYBFou2n6oN8tKf7/Hvbps2R+SW9QJ9TrqKf3CBiyjPDhagidHnzBUH1dghC1eDKSNj
	quPR0EU1kIsBlH6f7/LPdMwff1BrWMNhURVRexKaoE2XqflUY7mHzwamBz+KvWzJ6tAgDXXdjHZ
	mfeXdYfSUohLLbT7K8mKE0fMwsTvYLlaF4aaPIguKEw1iLoH9RQ3H9DNuJ1CXTQ336e2utoAkVg
	/PVbAfn5f5CHn65UzGjuNHodnHAdD95i219yy7GqmdI2ZZ8iE0ftsqlBwgTH+k0WreKSjn7Uiwa
	lVAcwTlqqJSbtAoIYONmfac4SdFa2AHpcfRfgkib0H5LY4UUxz9/DKS1EmMeyKMnETBh6t845Pa
	j3F3eD5/eewi05lpwDRqa60ti1vvAUhyqWS7EvV32l1UcqHdzJDLqsqDMFkIwupMbw00/cZvIWS
	sGuqs/BQAd1N5xpIIViuLYmjB1nT/NF2N7XIQ3L5TZxXoTdl7hCdHkBiFW03JOA8NbsHrdji/ml
	Xvv8bnl63munGqx9usV3qrobdkmPUwh
X-Received: by 2002:a17:903:2352:b0:2d8:d4cf:fe49 with SMTP id d9443c01a7336-2ddb21f74e1mr91357915ad.15.1789921953672;
        Sun, 20 Sep 2026 09:32:33 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm21784355ad.70.2026.09.20.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 09:32:31 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Peter Oskolkov <posk@google.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v3 0/3] bpf: clear stale IPv4 options after LWT encapsulation
Date: Mon, 21 Sep 2026 00:32:08 +0800
Message-ID: <20260920163211.795547-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements the post-run CB reset suggested by Daniel, reuses the
existing save/restore wrapper, and propagates cb_access from freplace
programs before their activation.

Patch 1 handles freplace cb_access propagation. Patch 2 marks successful LWT
IP header pushes and resets the restored protocol CB after the program runs.
Patch 3 contains the selftests, covering direct and freplace CB access, VRF
ingress, and packets already marked encapsulated before entering LWT.

Changes since v2:
- Replace the LWT state tracking and extra CB copy with a post-run reset after
  bpf_prog_run_save_cb() restores the protocol control block.
- Propagate cb_access from freplace programs in a separate prerequisite patch.
- Mark only successful BPF_LWT_ENCAP_IP pushes, covering packets already
  marked encapsulated without treating failed SEG6 operations as completed
  header replacements.
- Select the reset layout from the protocol callback which next consumes the
  packet, preserving ingress interface and L3-slave state across family
  changes and initializing the IPv6 network-header offset.
- Save and restore the marker around nested LWT runs.
- Add selftests for direct and freplace CB access, VRF ingress, and packets
  already marked encapsulated before entering LWT.

Validation: the full KASAN+BTF kernel build passes. All five selftest cases
pass with none skipped and no KASAN report, Oops, or panic. The new
already-encapsulated case fails on the earlier transition-based implementation
and passes with this series.

Previous version:
https://lore.kernel.org/bpf/20260916170406.1280954-2-bestswngs@gmail.com/

Review discussion:
https://lore.kernel.org/bpf/48990076-414c-4196-99b9-86fce41b8054@iogearbox.net/
https://lore.kernel.org/bpf/97695bef-507a-403a-84ae-c2e222b3dc65@iogearbox.net/

Weiming Shi (3):
  bpf: propagate cb_access from freplace programs
  bpf: clear stale IPv4 options after LWT encapsulation
  selftests/bpf: cover stale CB after LWT IP encapsulation

 include/linux/bpf.h                           |   2 +-
 include/linux/filter.h                        |   8 +-
 kernel/bpf/syscall.c                          |   6 +
 net/core/lwt_bpf.c                            |  47 +++
 .../selftests/bpf/prog_tests/lwt_ip_encap.c   | 288 ++++++++++++++++++
 .../bpf/progs/lwt_ip_encap_stale_cb.c         | 100 ++++++
 .../progs/lwt_ip_encap_stale_cb_freplace.c    |  32 ++
 7 files changed, 479 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/lwt_ip_encap_stale_cb.c
 create mode 100644 tools/testing/selftests/bpf/progs/lwt_ip_encap_stale_cb_freplace.c


base-commit: 6c096bb08de97cdca051fecddad22cac6a1fd275
-- 
2.55.0
