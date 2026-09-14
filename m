Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F253B2D39
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370748; cv=none; b=hg2xhs9LDjxy5lhwb1U+lazCmgSErkjX7O/BxPUhDOcRRBi61t1VDdUAQJD02rYfAWlj+BcvO9S9xgu9aUy4adMzKVqNUmX9M1JVNbq7v/a9JdlutrfjFqQ8t3dFd02AHHexqiYXAnGO5WODLdH1uzt5xI3xRC6e2Epdj+RZIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370748; c=relaxed/simple;
	bh=PbFleIiEMM4EcOk80K3i/aLj+DU6YW6VYPFpTkRWFdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QonQX2jMeolC1w/N9IV8aoiX6+0mpDi7CY+O8F/3iRIF8hRS3FfobwoJdivLAuuysBmJXMrSePj1w1vlokDlEXX94moG8WPAGKnarsf2VItzHDiglLu7Oby0IWdS17rvhaUyL31boQTNn6C2IpEZglVc5W1jK3DXrVcJNEJNXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=HrlhERzv; arc=none smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="HrlhERzv"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6a99cd510ecso1549119a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789370744; x=1789975544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJ86Zw0v4ma0tFKlF0YzcCNn6ZjfpJhPEM6cbbu9cJI=;
        b=HrlhERzv16GJowlpSwSwRzhGC4CyVKDxIMOr2L4ClQFpqohN1SIx6aU15FdTk2OUSM
         qTz03o+CtiNcmGRxpRMhnAP3AKJkFsnfBV8hGW2GOYJoJWKb0ffy0Vojq8fvuRvHCZJf
         VLJG4oy5gx6QQ+btAbIUouO7D1KdDipmaEsWoqPRz54U9g0n4a/zab87zK3a6SClar4p
         NWnKyF7g3Eab1tgpbburmMCq2/D3vun8WziluNIJ5rTZ0uOsAgWVLpN1QJc1ke2hcKZp
         3Y5KNam31omL9YHakilPEOwug7ys1+Ro7velGPt4SdQZnWrY2T75ERqyRqJ5Uh5Ot5aF
         69dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370744; x=1789975544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJ86Zw0v4ma0tFKlF0YzcCNn6ZjfpJhPEM6cbbu9cJI=;
        b=jcZy9FeAhQYqcTB+3BK6htjPPdTAjqF8uMOtSrSwTPUuylJ/FCmQDAH2dQ6oZlifU4
         gd6TjpvTRaB3yut4/05hPngTuodMqUIpKw+nyt3xnEdAPV2BCAGFaQV5uPbWI6hCSGrx
         uZao6dtOy0fz/YS5EtHlcj2aPj0RgaIZ9Eq6DBYryQvH/kPKzMo0xAsTGBm/iypdHS/s
         gQI4T1NvOFHoms9gtLZW99yuo1Ze+jk+mgtPzv4gnWELTfyoo8PTItvvGxDpoTS9+Acm
         Vj0+MgLyyBv4EMbk+aaeo+Yb2EMHmccGuL5L2yub8Lne/mwxHcwWAK2zFu1E656kWIxg
         lf3A==
X-Forwarded-Encrypted: i=1; AKwUvBxCd3PCrVLwerVZrjmzGptiK82RjJvRlGN08Dmq2oa4CftpmHh4Qh+dUvqv5oXE/w8QEpEYtoKDxy+izDWezXE=@vger.kernel.org
X-Gm-Message-State: AFuF++keWHuvG6bwghiaBOJzAwYGOO8b/hHEIAvidMFmf9K2roVHmpTT
	BK7cibGJSYQun/MeyAsPmjgPCWB/EHrCM3+7t3TlcUw8cGDhcykOiooYTOZ5l0+e4sGVT8tOzS+
	doPE9/KbZsigwByvH
X-Gm-Gg: AYBFou172i5+L+M0RoLWJewxBsXE6j35rQzIUJ3mh5hG85BCkj0h44coUbViKIdO6ov
	pSWHnLjr8e903tKXZfNRrI7SyhKR8N1CEKe0m6gvCl4oksMWdTkVutwGQPwBeP62uqiYlbXAsTZ
	1uE0BrPkpQcCKnABrjqo11pGlN/HFtYCrWqZ9XcBptNXjD10QyF4B5PNXAg3L5br4nbtuRgg5/u
	2j6EM7R2YEfVmnUiBTSaTRi9YTruVHcghKzTJeYwBnZAwIKjtVyapx9XTy480mS6UbLGpOgdGUu
	l0zSywcvdZY4gsK5/JXN3H499dCPhFqiFU39N4Ggr7esf/bV8wpAOh0bw2LwDtnur2xGVyt3sY3
	kVOwCMMEp0detkSqU61KCEsv1u39YzXZ9h7kmgeOx7WizO/x4aTO76jKnMesztvUM/wek9s8xbd
	cMu37fMKQya+Hngp90Jm/YSxrEO3FgJ7SXV0BtaO1lddC0e4owBW4/vAbmv3JZyFW4psH7AM5Kj
	SgJq59OLAo6Ubk2jXj6G/Uf8qo5H2E1aZJF9S3YxBHs+lZ+ZqdSpnhrq3q6tbviPu8czY0IIADt
	gorT49VKwGs1h7qSmlkoWi300Bxsw/xH27pSYox/T5jIXkrI1AlwIMPTANBhePOLGWMT7pPMutF
	aM+qP1xevZSVWvrtNbUEuqF6sPxZha1b8gwlkAaB7v2D9h9WS5Z2iLVffxb2armSgvTTOMxwD+R
	fqlSeoeY+h
X-Received: by 2002:a05:6402:4149:b0:6a5:d8eb:da01 with SMTP id 4fb4d7f45d1cf-6a9f61583a0mr1933700a12.0.1789370744430;
        Mon, 14 Sep 2026 00:25:44 -0700 (PDT)
Received: from Desktop.fritz.box ([185.152.145.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm382835666b.6.2026.09.14.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:25:43 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	razor@blackwall.org,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v5 0/3] flow offload teardown when layer 2 roaming
Date: Mon, 14 Sep 2026 09:25:38 +0200
Message-ID: <20260914072541.897040-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A direct xmit flow keeps the bridge port and destination address that the
fdb resolved when the flow was created. When the host moves to another
port of the bridge, for example a station roaming to another access
point, the bridge moves the fdb entry and the flow keeps forwarding to the
old port. Every packet the sender keeps transmitting refreshes the flow,
so it does not age out, and a hardware offloaded flow never sees a packet
on the software path where the stale port could be corrected.

The bridge notifies SWITCHDEV_FDB_DEL_TO_DEVICE for the old port before it
moves the entry. Patch 2 tears down the matching direct xmit flows on that
notification. Patch 1 stores the bridge vid in the tuple so the vid of the
deleted entry can be compared. Patch 3 adds a selftest.

Tested on an ipq807x router (OpenWrt, fw4 flowtable with the offload flag)
with a station roaming between the two radios of one bridge during a
download: without the patches the download stalls for as long as the
station stays on the other radio and resumes only after it roams back,
with them it continues through the roam, three runs each. A host moving
from a switch port with a hardware offloaded flow to a radio gets the flow
torn down and re-offloaded towards the radio.

Changes in v5:
- Rebase onto nf-next; the forward path resolution now lives in
  nf_flow_table_path.c and the tuple has no hw_ifidx.
- Store the bridge port in the tuple and match on it: the out interface
  is the lowest device of the path and differs from the port when the
  port is a vlan device.
- Add a helper for the per-tuple match.
- Drop the WARN_ON on allocation failure; the flow then ages out as
  before, the same way dsa_user_fdb_event() drops the hardware fdb
  update when its work item cannot be allocated.
- Skip local fdb entries, kick the gc once per flowtable.
- Hold the device with netdev_hold()/netdev_put() and a tracker.
- Add a selftest that roams a host between two bridge ports, plain and
  vlan, mid-transfer.

Changes in v4:
- Removed patch "don't follow fastpath when marked teardown".
- Use a work queue to process the event.

Changes in v3:
- static nf_flow_table_switchdev_nb.

Changes in v2:
- Unchanged, only tags RFC net-next to PATCH nf-next.

v4: https://lore.kernel.org/netfilter-devel/20250925182623.114045-1-ericwouds@gmail.com/

Eric Woudstra (2):
  netfilter: flow: Add bridge_vid member
  netfilter: flowtable: teardown direct xmit flows when the fdb entry
    moves

Julius Bairaktaris (1):
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/net/netfilter/nf_flow_table.h         |   4 +
 net/netfilter/nf_flow_table_core.c            | 109 ++++++++++++++
 net/netfilter/nf_flow_table_path.c            |   9 ++
 tools/testing/selftests/net/netfilter/config  |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh  | 140 ++++++++++++++++++
 5 files changed, 263 insertions(+)

-- 
2.53.0

