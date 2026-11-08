Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141286;
	b=EXCGSUJJIKa7Bfc8EuKUl/8Dw778hyYKEnSGV6jBiUVL3wOwDy0FDL9fNBLBIkHhFhPk
	 ZP/UyHw2UuM7TtX5TwRFxHmDodpLdKt3lUVRU0tGlMGwQFULN3SSiZYKlt3JG3JZIEk4A
	 hMm4QVcFWuP8svx8lRfGyzB6M2ya9vYW5JFVTOphrecdrlbe1tiV6BxASsWX0H/uviaZN
	 Fku9xfmJRpLs5aPSSfj5BRH+HF7PNxXk+VQ2bVOyr924XSarMgfjAXTJpNJQSQE48Z15J
	 liQrONOOrJ/K0q6WxIordGD7mr+eFdD0ClHIDFDekfdKwR+ZIOrSkeVAQIKDtAV0nCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fOZEfPbkpDcUaP0mBLPSnsv8fE4ioirCVy7jzR22tC4=;
	b=jLyYt46cHHbemjhK0vv70X9Smdi1Nf73g4pB05tr6GXhKiNIxQ1izmGnX97SAgdSQ5nv
	 xhBe0U8ejlFv7xRDeIGsvg4AkjzeaojUZ0q48F3m0Fczwjteq3YFAWcQBT1HGs9kftUmo
	 Cgpp/MzFXFAOZdV3aqD8hJmhe/4AYRtflkotdutA+ec5v/IaQiODS0cfODq+h/OMtGDlr
	 K/hd2P0VeKcYpi7GlZbxQUKJQQKntNRBon/nponIbIkBPZMKolN93MLziaArJWSFWMWr8
	 R0UePMbD0pdATYpm7CTGR0xx1U2w1rLM/Z3dYdHngygNuv83XbTvOchU9IYYY3bq9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eH2WZQCq;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAD606A320
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 12:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFAD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eH2WZQCq
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b305d38bafso187817b3.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141284; x=1794746084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOZEfPbkpDcUaP0mBLPSnsv8fE4ioirCVy7jzR22tC4=;
        b=eH2WZQCqohh3ZJL9JRPl4XVfAxk4PlENe5FMnO43jrWAFkPkWOtSNC8UupurbmgryD
         I6pBz6m1BrZIiYw/pBD98CTalo0Uct2IOD61fMDiO3SodxAHEbcutIEazv9vY7/0OrVe
         bzXlxUNghxhrmL+LPp4K8BYfk0k+rjFe893do6FFZLDCN1pRSSIcTiLPyY/gPx6fNEn0
         9rrVnLfyTCVfL3KKZS35VpaWyGcMe/huNkk2yvZiuU8cHCQyD1Dhv56KrA7gfEapCpgv
         EMRgQcjRA4JILeXgsqpBJeUtzAmnwqCmytiESjPWC3bXUXzqXzaOnntBRALtoZVD7qi2
         gGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141284; x=1794746084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOZEfPbkpDcUaP0mBLPSnsv8fE4ioirCVy7jzR22tC4=;
        b=OMSvoPMGIdtNDy8F79qigWdGDvSeda61UEUZicSSllK6ALYkf+a3F8DJUqVPR1kobh
         XLb0Lk7HYMByPpm7EiOIu4r39ySPfpNtBwv8yg6qzeq9+V81qW4VH+Q94G72cbgkIjWt
         GVeXJwy4Jx1PMgSJzGBsKcOgHXPS6FlL9Tx2R+NtARUs5FJPheqkrt3f8QLyPBlQ1iJs
         C8DVCewsc5gylVvvp8OcvF7cnpCmY2MrS+sJb1+rLRvALU6OU2bFCMaejmjPvAvsSLY0
         avMBEAJZB5fykzl3XMwEBVYOPPH1i6V3OtcKUhqmvWvD6z4YUN7BmDnl0S8ho4AC+azO
         SJpA==
X-Forwarded-Encrypted: i=1; AL+hErFxhai+wWXYUTC5Y87TcGJCYnDIn5Ki2VgWyiMLdvpMzB/B+Lsiq9SFgf3SeL1K//yLZb8ummH72jxdcHnyvoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hl3Gqv9XFcOyANvKmmnjkN/Q8z62NNVVC0HaqQMZ4HOdKrM64
	wwvZe0h5c56WZ30VEeb5xiCNwdiUmABTXhwrQmPd6IA57kGF/V1qLFXF
X-Gm-Gg: AYBFou1XXXH27iBVYuxtZEadcqqEj0cs+fZF5GM5/gZcehSJjq+e/i3wIW9CzKDCfjT
	QNTn1IflA4OCLeCwNO+N+Mg2BOunAh3eKsB5khT/y1JmSMUaq/vJuWILmbtfgbOTtCMBvYDWHmz
	kRk6pQpMNZngjoU1//xCIoE3BKR9J6bfBvQX8hoObbYOCE86zysWOGvEPru2I3nNt+aMtoi1vZl
	Uf8TBBwx4QGvLi0xBVgWdU4WOfY+wtRSoAHq9pdyffxzSwUoobrAsEBFpUpn5rsXra1XsT6un8B
	L5eQ6jT/fUIa6g7Y/M2P+bFrdpIdaZtLv6wITiizPoDfiTrsqmkN6VEUIhYdjluLTcVkDqrZL7u
	5eTHTquMPWODkREQe3um1DPqHYKzYAkFa2OzmbezGxct02wjCeW0Oq8SnllJ3QhjpTKJc4rkbhq
	TzlEE9HsXGX/KvU203qyRLDCccIw7nP2wzf61KZLw2JrFLUwEF9bF2VZIInDGwaIq9rdr2JCTUA
	9+iB5793vMD997ZVs29TfYM3u2v0YOQgUFu2jVPwfscUIw7nLpIYCGuZ6jeX/iXtak4ET7WLWch
	/vE7BuRPKqDd9bHdF/WcN6E+wr5powxd6XSYfEtrSg75/Q==
X-Received: by 2002:a05:690c:68f:b0:8b3:3fc5:2be with SMTP id 00721157ae682-8b36c9c514cmr8721117b3.20.1794141284574;
        Sun, 08 Nov 2026 04:34:44 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36be7d88dsm13475627b3.39.2026.11.08.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:34:43 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Paul Blakey <paulb@nvidia.com>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sun,  8 Nov 2026 07:34:22 -0500
Message-ID: <20261108123424.2825403-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Changes in v2:
- Patch 1 limits its closing claim to OVS_DP_CMD_SET, and says that a
  failed OVS_DP_CMD_NEW and the reset that follows it still leave the
  key one enable ahead.
- Patch 1 names the reachability and the effect: only CAP_NET_ADMIN is
  needed, datapath_policy does not validate the per-cpu-pids attribute,
  and a disable on a count of zero warns in static_key_dec_not_one().
- Patch 2 treats only EOPNOTSUPP as the missing key and skips with the
  kselftest skip code; any other failure fails the test.
- Patch 2 selects CONFIG_NET_CLS_ACT and CONFIG_NET_TC_SKB_EXT in the
  selftest config fragment, so the recirc round runs in CI.
- Patch 2 sends the features the datapath reports when --features is
  left out, instead of clearing them.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/

ovs_dp_change() records the requested user features before it calls the
update that can fail, so a request rejected for an empty per-cpu-pids
leaves the datapath claiming a feature it never enabled. The tc skb
extension key is a reference count shared with cls_flower, and the code
that would keep it in step is skipped on that path.

Patch 1 fixes the ordering. Patch 2 adds a set-dp command to the
openvswitch selftest tool, and a test that sends such a request and
checks the features the datapath reports afterwards. It fails without
the fix and passes with it.

The problem turned up while the YNL spec for this family was being
written: describing the ovs_datapath set command meant reading
ovs_dp_change(), where the ordering stands out.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    | 10 +--
 .../testing/selftests/net/openvswitch/config  |  2 +
 .../selftests/net/openvswitch/openvswitch.sh  | 67 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 53 +++++++++++++++
 4 files changed, 127 insertions(+), 5 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.56.0

