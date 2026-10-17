Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8A3F23C0
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 23:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281539; cv=none; b=n0/T3h0DaBlmFHTLlsjMULeBm+f3vxlpzNyHDBu98mRzOWjfjWNbQI1zei5jIIQssCx6f2FLee2Vflarl3FMLyQzJyZpr63ZVqsDMibewtT5jZofhrGH4SY6IYkmEkonFL3IdSpLGrz5Wbd41ZXlU7gLieutnWNEbrZEMm9Sq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281539; c=relaxed/simple;
	bh=rOpiqxy5Hwt3SE0e9vZaPQFw0gt21K2h6bHhN6d7H3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8l/jxaDz9tHGP1+NmQnTS7DVmSWuwv5Rj6erXjjt1Nm6DIWB08aKUnAhPylN4EOENIzDroDc1X7/Wnw2YZBj/NSQGLJnGQNL4snUZ1lMJJ3JcgKy/JLySDirlGq+1aq15ul9oWH9wjMluA8mPugoTMH4x1rUJZKjwY/99B1tvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=EFvkYHq3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="EFvkYHq3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso112513766b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 16:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792281535; x=1792886335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Sz/9HECOnKqBct7vdatnd4ZGB8n4Dp//SRsM9tOgzQ=;
        b=EFvkYHq3KIXit4kQprAlvWxY9IQLgoJVuanjwtL6wliPZxPuhhgrWFmzf3fdd7mEpc
         GBn3qL5TYJtmVKOZoXYPG5CMKvVlLTuaEmmeRH+2XTUaG+bznxfAAYVQRi49oTfNShyK
         NUCYIIuhYgYPXQxJRgeSMFMZC3mmXd75U8SRm3+2fttad7F68zDFuNdin91L8YqMGBhX
         IgFxPs+HYnP26OCWhrknXIWhsFb4wC5pzfBJyPrzeQAWTKbecGFw9cEPRsGc/MiUhMbL
         Uw4Pckq/DZ6hsMnkyX0EeyZEmBUnJJ7X9tr2En5VoFdRCHJSWnR3Y/KDk798Rdi4+7L5
         qEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281535; x=1792886335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sz/9HECOnKqBct7vdatnd4ZGB8n4Dp//SRsM9tOgzQ=;
        b=gef/zhiadOC93JvaxYzEnq8BPU8RjVZcfjRVXlQ9twJiKYrEFQQD857ltvBuoiP5oP
         DGSnTRJwISetuZjQKnajYL3vdVR9KYfYvFLUDyLmqbIkSad1TouaSMkRQ/5sDvKdgIUM
         OAf7tvaZDoW1eivJKAFgzN38iiBdrXcaGxBnJq/eKO9GyPLMXeHI8sFcyzWbAqzg4Hdg
         GyuVRa4ZV31GhxiiPi7fSdz5keVlPlPIw/r6WlXg7pMkr3HXYSrnadN0Dv//vFWLspZU
         TBflMzhgTpjeZxywFPC7dPpCDNmaaXaQQuUFGb2DXvRzNtKv9PU9Y1lOwjsRyQdbqkUl
         xiOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/MN6Tz+qnoAfB7XYRtqrQN+12jpgSEA1i/H715DqfiqSpHKJvVYFFD5FWgui4wfR36kp3O3ewaSKwpnl411k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjfmaHDEU5fSdaAQev96DXkIP+ZZywEATBTb0Si4dh9RCXtU+a
	swXwVEsXN4L753XsDyLfIXgpf+5bN/JPA9rbfVGImwF3XIlJja3laor0f7jOpQH6kw==
X-Gm-Gg: AYBFou1EbEJfSitDoiLiwp1wjUDRXPGib7fFTU9S1tEZ/cs11GxkjIl02lbrzNVCw4i
	2Pt5u8/691KSkjmcMy/06Z2Ni0CjRpa8+GirKfvOVi3b44BSWABt6w0ZXp2NoYn1xQyyTUlONjI
	NJ6UyIexSofvMVHXSej4Mmbs8XpvhDMfJoCuTX6tGy13p4mX7WmIix76ExCzdiwJkQD0oldG8SC
	p8NLTKDiOUq5xZUyKY6uT6HYEW2AorVyOQM2cRDMWECdmCap81JF5Pg94D3XnbTRJp+AHRgnnE2
	2p12BmhAXe0JWeilO+3lmMZdOLABXbPqu8dFUKudPGOaADJ5dI0a2+WQprxWsyjnF1bf+8d81r6
	dOePA0rxQHjkZxvy7WU7JL5xty4jWbvwiIgHM6nl58z6bkQM2iA4YBQpYwaL5Tuc6ORWZV84LSm
	FmrUZMPnUfzJhokCCcKzZDOgUd+DTy6BkZ+OYPg8DwUtxJevZQEHu/akFQP3kcci4lHBXUtz05e
	Y/tuvrjfQQnpEKd2ZWAYQ/Vn6XAxGP6jA7J0U48qfLumYfW3TfB0oxhygWBG+xrWutxeuFf7vC9
	fQSlipZh2ykBQqqIBRmJUAC89FDyYH3Tth8J1vqyOcfto+gKJ2c/CMChLTIZXDfQL2HMEzEQwLW
	7fCzeiCPkmJfbCXHIEgQFTcH1TP4fb/UyFR+3LkDtB8zokpGE9hUs8nil3K3hqW0Jt6PnspKOwe
	rg6IoIGK9x7b5/uABM37cSeAkpYAhKy2uKRS4w1epsJ/HnnUibA22ncg8EWxHtc8nhtdU=
X-Received: by 2002:a17:907:944a:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c419e73e10emr273217766b.24.1792281534993;
        Sat, 17 Oct 2026 16:58:54 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f24741261000ca3161c2b9b67f.dip0.t-ipconnect.de. [2003:f2:4741:2610:ca:3161:c2b9:b67f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328780sm216534166b.6.2026.10.17.16.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:58:53 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v8 0/2] netfilter: flowtable: tear down bridged flows on layer 2 roaming
Date: Sun, 18 Oct 2026 01:58:46 +0200
Message-ID: <20261017235849.1066624-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flowtable flow that transmits straight to a bridge port keeps sending
to the old port when the host moves to another port, for example a
Wi-Fi station roaming between access points.

Patch 1 makes the gc tear such a flow down, using the bridge fdb lookup
from Pablo's patch. Patch 2 adds selftest cases.

Tested on nf-next a5e7d8e446af in an x86 guest with PROVE_LOCKING:
nft_flowtable.sh passes, including all eleven roaming cases, with no
lockdep splat. A kprobe on flow_offload_teardown sees no teardown of
the test flow during 10 s of steady traffic in any case. struct
flow_offload stays at 296 bytes on x86_64.

Changes in v8:
- drop bridge_ifidx and bridge_vid (Pablo): the bridge port is found
  from out.ifidx through the vlan devices the forward path has below
  the port (new port_vlans field), the vid comes from the encap stack
  (new bridge_vlan bit) or is the pvid of the port for an untagged port
  of a vlan_filtering bridge
- move the fdb check into nf_flow_dst_valid() next to
  nf_flow_dst_check(), and name the hook fdb_valid_dst() again (Pablo);
  it now takes the bridge port device instead of net and ifindex
- drop the comments Pablo pointed out
- selftest: vlan_filtering with tagged plain and vlan ports, the router
  address on a vlan device on the bridge, and vlan ports whose real
  devices are ports of another bridge; no forward chain packet is
  allowed once the flow is offloaded again

v7: https://lore.kernel.org/netfilter-devel/20261014235628.197976-1-julius@bairaktaris.de/
v6: https://lore.kernel.org/netfilter-devel/20261004171605.3544792-1-julius@bairaktaris.de/
Pablo's patch: https://lore.kernel.org/netfilter-devel/20261014210256.1573072-1-pablo@netfilter.org/

Julius Bairaktaris (2):
  netfilter: flowtable: tear down direct xmit flows when the fdb entry
    moves
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/linux/netfilter.h                     |   7 +
 include/net/netfilter/nf_flow_table.h         |   8 +-
 net/bridge/Makefile                           |   2 +
 net/bridge/br.c                               |   2 +
 net/bridge/br_nf_utils.c                      |  38 +++
 net/bridge/br_private.h                       |  13 +
 net/netfilter/core.c                          |   3 +
 net/netfilter/nf_flow_table_core.c            |  45 +++-
 net/netfilter/nf_flow_table_path.c            |  19 +-
 .../selftests/net/netfilter/nft_flowtable.sh  | 239 ++++++++++++++++++
 10 files changed, 371 insertions(+), 5 deletions(-)
 create mode 100644 net/bridge/br_nf_utils.c


base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
-- 
2.53.0

