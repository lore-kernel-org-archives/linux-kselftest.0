Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF363B4EAB
	for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484045; cv=none; b=t2537QXBD3B0XPAXHM+NuDUSzrY4U7TVkniuHbjHPbU10c0hYWDllD1cq5kxaWitI40ni7jF6Zh0VeNUNPInc9JBhx/PPYyMFKG6M0nVQxn2f+4lIPTx8H7BP2d0i+q70B9J929skxfQZNnINmuFQAjD7UqEcjWPKExIYjirRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484045; c=relaxed/simple;
	bh=3ZUCrrDmOM7VZSnp6sdBGE5jCnwQNOc5dOPQ5kzHMhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j53i8nlT2q7AzU8fC8qaNiOprou97UOcRySv87kU0bwE4JmPeidO7cUo3j6TFqznP8TmXVfsMIqJep/lJgkUcl4++kpgzPCZHL/HvYi8J+c7kofrarQfWBnaoU9NOEcaQ4tZPj/xgDjeV8bE8mM3s9pLbWU04f2MGlJLewVyCoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExhUftIV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExhUftIV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so103407755ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484037; x=1785088837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=ExhUftIVu07CRaWkA9btZNonG/ISkzf7n8v+5OSZpmTtSD+vyFNTnHW5vo2MxaRJ2Y
         2NFSCdUYT4ZCtPWwf2RYXdU+9Jc5QVP6RyonM+yB72H9vEeeFHKExnMphZBd6YFlzDwj
         CbASnd+Y0hvBf6wh+bebN+yIauWXQfo/ayG2+LYL2PhyWfH37vvxQ9ecEa/A6JUhX5/u
         n1+V6Ecc3I67uEAIVYJfhYBkHf736a82LAX7Og+YiwQd1bKONylK9q1J+FU/tkZJ0lI2
         jh0qzZ6ZPvCCPZjaWibdfFjz0Npu+Q5WrPhDnVu50XsQe6Nj4QaAwWsZGbY6PhcyCFym
         l0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484037; x=1785088837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=VouGkVfQRAqPAqy+yNKUWm4G1yaoLfg2PHDxu5IswxyVmkxtBI5CwbVGB31anUyuqg
         9XEqTTUfH310pw7czEppg6zI1ay3wzbFh5AlO6+urEUKPxXl8CEn1UQgJBFaHk9j0+yQ
         PhhESiY//WEjBdGfpJman/p+EEVlpzC7RkZ6sOuCKDLruGkGSQNfY4gzzgGVYBvKjS8H
         GV6Bf85u7OkNkjft3hLmA10dSW2lYCRkSx6dvZ9DFbb4rrFVLvDQveDjoij+Xai8MDlz
         780PNEyE7jGk0TaLBw1ljcR9YTcba14SQNnLzV70rZV3CXSuBEFUMPkEG+/n/pY4ENOf
         XI1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr626yivAjoENcuCafWIzbeaI+OQxQ5MPFIPzynnrckxvZmokNd7Z5l0oIF7nhmqEcijy77XtjZHm0RMWxrnY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwJriQrdrSw0jTu0KzM+9RA1M0MjusXPt10qhEUg0bOLkGRSoe
	0NoWl1p7WtpWfNfIAN/WgmA1kPNtU41oDyFggV9Oq28RN/nk9mTW6Wfu
X-Gm-Gg: AfdE7ckTJLoGu8eXK3Y2DIH0/DEqeDjQSwHHHS4sfmScqRxjRCvL+k9i54NEJt7a7YG
	WS2nFmmtZSNp7sq79MZmcddvmlt6kcL/XpjuvPm5r3E/FwdZPnfSBuwIIcAqs9V7Sdr0kPdGqhE
	HuTugG+lZe0ghfGCfMKufDWRKzQMsdXr//nQawGlfFCxUUX01KCR7Z49Ysurooo1HBe99qbn/6C
	1dE1UcnuVatlgsi1WPYSQNzuy40ZLoX8sNxEeqMsEhEvvMEmwnDR7SgR+kdtnviHaT6TjkFmlPk
	tyJJNVfu5keMT3vqyeBZJy2YvQuiVsMRs5O8DU/jl4K2z5eMxk5H5nulBbSTzcB97+QoAjyKDb4
	aNjonKR+beFrDBtqCfDuzb3ZXt1MKENdMQ+OHxAsM9KHFhLvXlNiC+CEtluHky1H/VA==
X-Received: by 2002:a17:902:fc44:b0:2cc:b480:28ba with SMTP id d9443c01a7336-2cf34a25ab6mr120497085ad.44.1784484037543;
        Sun, 19 Jul 2026 11:00:37 -0700 (PDT)
Received: from ap.. ([182.213.254.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm43511065ad.74.2026.07.19.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:00:36 -0700 (PDT)
From: Taehee Yoo <ap420073@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	bpf@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Eric Dumazet <edumazet@google.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Hoyeon Lee <hoyeon.rhee@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Michael Chan <michael.chan@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simon Horman <horms@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Taehee Yoo <ap420073@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [RFC PATCH net-next 05/13] bpf: offload: allow PERCPU_ARRAY maps for offloaded programs
Date: Sun, 19 Jul 2026 17:58:49 +0000
Message-ID: <20260719175857.4071636-6-ap420073@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719175857.4071636-1-ap420073@gmail.com>
References: <20260719175857.4071636-1-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The knod BPF offload keeps hot per-CPU statistics in a PERCPU_ARRAY
map that is mirrored into accelerator memory and aggregated back on the
host.  Permit this map type on the offload path.

Signed-off-by: Taehee Yoo <ap420073@gmail.com>
(cherry picked from commit c447c9012940d48c1ec20a8ebac8d779e7d5a6fa)
---
 kernel/bpf/offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 0d6f5569588c..36e747a12cbe 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -510,7 +510,8 @@ struct bpf_map *bpf_map_offload_map_alloc(union bpf_attr *attr)
 	if (!capable(CAP_SYS_ADMIN))
 		return ERR_PTR(-EPERM);
 	if (attr->map_type != BPF_MAP_TYPE_ARRAY &&
-	    attr->map_type != BPF_MAP_TYPE_HASH)
+	    attr->map_type != BPF_MAP_TYPE_HASH &&
+	    attr->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 		return ERR_PTR(-EINVAL);
 
 	offmap = bpf_map_area_alloc(sizeof(*offmap), NUMA_NO_NODE);
-- 
2.43.0

