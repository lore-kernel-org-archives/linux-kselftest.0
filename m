Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6E4E4C2B
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012373; cv=none; b=PdC3eZhlgHU5j3uZ7Ak5KylvYw+zqnZGkVfSeuPxvFsmYMJxSAa3pb39cAewBNfDjb24C6Q5mdikFgwshSTfdsxaOhkt/Pcr3H74y4I6PE78y+tsVIfeR8cEDDVRQnjCLvkEcKH5g0bhub3WjmUc/oQrv8/hZgmG3d2WkiUzxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012373; c=relaxed/simple;
	bh=HhFClUICP7LmPKOCpv+tBSAjahEijfSps+4cVHoIynM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDQXN8Zu8zCimyfVzBz+AqIZBoR+Sh10G2sF5LoaHe9LtL9eUlQSSWKBt3pHPrIkYIk4KPEi/GyuaBIqhVGdyiGNv35nfhFDvvr/vzv5bJd5FXhotk2JrBIrD+FRbMN0e6JL2CyybHIBbSb91I+pGSRp/ZaBI3/h5ZIcje8jlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3a2Ts0G; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3a2Ts0G"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d249c6so2830750b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790012371; x=1790617171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jINDts3UuKVPqaZDvWUfm35N/OrGGobyZ1ICHQzvtsU=;
        b=X3a2Ts0Gi+7GKV1OXyIntTqUVYfXrGSdqu84S5KrQLDGJeStjfvQkEiRxK+zNVAF0g
         DkK6mlCcuKPPMAYKGeOtwxE91PBUe7uzQjRCe7TgW5uUA2ryKZcUJHmsJCK8ONM5Idiz
         KdXAOOK+5xWy8NAq9WsHvgMkc2byBuFoyAFHvG/Jds8V9PLiHxuCaXzR/SaCl0kdA0IL
         IdbMmZYUEiCvsHrCQ/ZxuNrK3oXg1XEtjzSrz3uQsYvI4rL8yHmSCkqs6czvInxksdUF
         4Y/8gNnbX5k/vFJRSufQqbNJCZBPn5/HmWxm2lUdArJwPSgVYEbzHO0hC9D6tdWxmr+u
         WlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012371; x=1790617171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jINDts3UuKVPqaZDvWUfm35N/OrGGobyZ1ICHQzvtsU=;
        b=aPbB8tG89W4du5phBRt1SMxzGn7gQiv77cy11mHWK7DAStEZ2W5qgR6b858+KXIDw3
         JwB5kRpeTd9bNeFov6uWs/JU2Kj8BCRD2wr76Srocffm5ouX63g6QQ+ZDz391GfcBuOo
         PYLj2IqjHGJK5TyGaFnTQjDGN3m+dWBIXJ2h5Uj1zoDsxVIqtF0Tlrfih7o2NvUYLDBN
         kXYS3V5ewvkzeUvh33pmvSdQILld870TK1dpGqspkwk1gN5fa/tkshNLYsKBiAl21pMk
         Nn+IEkuqpQwOy3jvT5fH0e5ROwBvBF2pCrEl5B7JqXIQ++tcl38KrEC3SYaYMJVOV9Bf
         eKhA==
X-Forwarded-Encrypted: i=1; AKwUvBxOi0wL0CecXjs1zVN147WNZOKrWnF/EiDnTkWFIiwzuoeFMatM5ZP2rhY7WjuvJiwp9Td/PoYPuat/yBpBTVI=@vger.kernel.org
X-Gm-Message-State: AFuF++k8hdrvCTVq9JkCgia1kJDjFuYYoDEQnJ/8//wvipPt9Qg/kJlG
	HvV65/J91WPSiKd4LpXfNhLS4ICew4EXtpN5unOWQmJNOW5e2v8mBIXD
X-Gm-Gg: AYBFou2dYiTYj8JaxoRlgJuJHCRB3w8SjlQzF7KpN/LGEAA5Sy1m1fZaxtueLldpPPM
	FvVhw16HM0E+5eSkW0w1Q11KN/tcR/lAOd2yBwDT9qT/ut9qaECfFNDe1cZHMMGJv1m1EZ94Ffk
	K5WxuESaPsNrZa6Fu84J2A4/v2GnfhDmnfn1/m6cVgkHJEp2C95sd2N9q9AcutWfMGCiU/GRjOh
	hXg53EAP27AKIMmcokFQFNzJPWgohsEBDu5sItJO1dr45mAor656nrrKf8F3P+vNdqRSKGFBpvh
	XzlGuAN7xO32MG/X9SUwcTkrdAxwMEpwwwtMNJng3MTumUayvaVekswvRcp2V703TOj8YdZFFHU
	axwOn36NIUgWAGOfO6HXRJPyy3WCbHiMF0C+dvyx6T3ddW3g/q53AMJSBjyK/NNPPtbqvLvYWRS
	USFF66/IIJCUvxf42yZPNxBfFvnz51x9VfCBwmZmt69vLPZKQx6vaXuE3je8k6W/QutQraL+PQw
	lbX/xTM06bQFX8lJHCyopFY5bJ+5jgV8nw10V+8/KU=
X-Received: by 2002:a05:6a20:4304:b0:3d0:d1f1:6ec5 with SMTP id adf61e73a8af0-3dd8c2dd73fmr18840357637.4.1790012370973;
        Mon, 21 Sep 2026 10:39:30 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72af0955esm3986985a12.32.2026.09.21.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:39:30 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
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
	John Fastabend <john.fastabend@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH v4 0/2] bpf: clear stale IPv4 options after LWT encapsulation
Date: Tue, 22 Sep 2026 01:39:08 +0800
Message-ID: <20260921173910.90847-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_lwt_push_ip_encap() rebases the network header after prepending an
outer IP header, but can leave IPCB(skb)->opt describing the inner IPv4
header. An ingress LWT route can then make an ICMP error consume stale
option offsets.

Patch 1 marks completed LWT IP encapsulation and clears the stale metadata
after bpf_prog_run_save_cb() has restored the protocol control block. For
same-family IPv4 encapsulation it clears only IPCB(skb)->opt. For a family
change it resets the new family's control block following
seg6_do_srh_encap(). Patch 2 adds compact coverage to the existing LWT IP
encapsulation selftest.

Changes:

v4:
- Follow Alexei Starovoitov's suggestion to drop the independent freplace
  patch and keep cb_access as one bit.
- Clear only IPv4 options when the family is unchanged; use skb->protocol
  and the SEG6 precedent when it changes.
- Rebase on bpf-next and replace the standalone selftest with compact
  coverage in the existing LWT IP encapsulation test.

v3: https://lore.kernel.org/bpf/20260920163211.795547-1-bestswngs@gmail.com/
- Follow Daniel Borkmann's suggestion to reset the CB after
  bpf_prog_run_save_cb() restores it, avoiding an extra CB copy.
- Split out freplace handling and selftests, and cover CB access, VRF,
  nested runs, and already-encapsulated packets.

v2: https://lore.kernel.org/bpf/20260916170406.1280954-2-bestswngs@gmail.com/
- Preserve the protocol CB for programs without ctx->cb[] access and restore
  the proper layout for the final packet consumer.

v1: https://lore.kernel.org/bpf/20260915170147.3943392-2-bestswngs@gmail.com/

Weiming Shi (2):
  bpf: clear stale IPv4 options after LWT encapsulation
  selftests/bpf: cover stale CB after LWT IP encapsulation

 include/linux/filter.h                        |  1 +
 net/core/lwt_bpf.c                            | 30 ++++++++++++
 .../selftests/bpf/prog_tests/lwt_ip_encap.c   | 45 ++++++++++++++++++
 .../selftests/bpf/progs/test_lwt_ip_encap.c   | 47 +++++++++++++++++++
 4 files changed, 123 insertions(+)

-- 
2.55.0
