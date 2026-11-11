Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437514;
	b=Hyq9V4QQoZmlIwz48JlHaly01Q5vLD2LdQjU4PBB0omVUMIiigfNX+avbRszy0ANtWku
	 svpQSoSJaC53gJ/dxSi6vhMZxMxnlv1zPelQkorZTw2MgsviD0IjuFjQVC9LfJtwMmDiQ
	 fYTJ4GNNFkFLbJU8XE10NwGQ22RmrAQjUpPFzyBjzlTAui83k6wVzqLZ04lhQP++Vbp/r
	 735VyUaXaw70JbzCFtaWgSKXD4JHeyka9N3llQ2zqSOAlX5XgVL0J/aYzPnAzoIhUElH9
	 gMagmQ0AI844fyVzT2cowrSQ7J/E9bWTVbOqNx7rZqmC+DW0sJ6AhklCqZ43TquzJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
	b=4wruAtJNmMfb8Xc4eO3hBCfOIQfWCgScw87CS3dYn+cUEEjhyQDxcAiOJX4oDeSwgSQH
	 EeQLFhSHpvAuQOCk47LclTY3/HmPbPgGwS8LDnP/ua3+rp1rkUReP12K3S4d8ehPtoW8V
	 JwMckhmr0Yk+dXdELjp7EzuGS0bXbVRVzMBs1lEL3D1YtyZgC2oV2OnXH4R6z4NWD+nHa
	 ETt76LrEppkySjmTYAlhCi3eW3lju/tBz5WgkVRsoUWDoFgr57dH7lmkmEBBMtMadD5O0
	 Q6zUxpyyEVF/pZ0L+lLFMxioFDGwVisFRGUhrGH4Kc3drsyduQeoagEjvmsVIRX2Y/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmG84sQ6;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DACE606A887
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DACE606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmG84sQ6
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so305850b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437514; x=1795042314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
        b=bmG84sQ6jOBx5Z1z9eiqgOqzF0G8a49vw2wPdyPszzMsTt7FCkfkAumUU54CrlrSDT
         PeLNPVl4JYb0ZWMpPKqjUnU5JGWs6hH1zxFRntKvVnT2MNYr+lmcstg/A8uXxtRP3rKG
         O3iMMDAOh+rRptveXwnFSlFHPOLBPayAvuBKwGm0bSZ1hUqAtoikIMAGfdXKSIPqq9jS
         mZITDYkY9hKvMztmURdKb2OUOt6LFgtuLdJS8Lq+JfoKBC85y8FGvpX/q3nsPhKilMla
         AQLn7aR1/8nqYxex0Ea9GCB3vrs7X8DvYYmNTMU1qa+KuaSfi8goilPXbxzJM5FOHHeD
         bH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437514; x=1795042314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
        b=aZ3qikHTOeBn+DspbfI/PKQLkZF8nAr7xb7q16ecql0vON/KksYSL4B6iCTkB35Z1W
         pvWuN36TfuLZaO8lxH+W55Vu37Ymrdhu+XYFfp6tv/NMjgWNBI8UYiYt5e27EGUDHSxh
         43IVAnu0+PnpmMx15O1hGJ3hnBPSLRTpp71yTo/9ELGV7ANPQp072VtbOIsIqAsJ7L7b
         o9xgAIQcj2lBYwbDlip/oa9SwFo8wBX0hvafHxEtb0QmFC6b3zs0djHslWHXl8r4+cZU
         pzWU7MzgtACukAtLkFf7PJXtx+l1Vq5Yqj7VSXwXkZOUd2xZNvpk6z5qLMGd4+rSu2Nu
         q7kA==
X-Forwarded-Encrypted: i=1; AL+hErH2Amefb+aonViyjooAJau/aZwQSF5lXkHEhOUvDkSPCU7HCd4XbvNsmeB871NcUf0ZBwb1994dFIrWAiASIZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wnjX+Jrr+90yGH6GNpIzdE86sz9THFTqukoN9TSYl006FaTaE
	HcXh4VKs5b3ISS1MSbFYEVoZ8KGO1pQ0kzTsXlliFjPXf5x7YV72fM/1
X-Gm-Gg: AYBFou1D8W15t2PJHDkzBCMPduEdz/WXzVXuVMQZQxYJYZYXFr2Nye1Elu3wKmHQqPb
	LdZV0QwQAQo9KIBk7/vLoI500NPgegmXiX7VkHFjKHpcEsYl9wpIcU5TUfxY3/qNZYboHpkSjCU
	1FU63MBLf64VKuHWvLA2/GfDC5+7DkeNF7DnViB34qkSvCcuuoSAn9BvyaIPzcaO0KHtxy0+5Z3
	FXuhoU/a+KOhzEANvKiNW40VlAZ61VbUpHTkkx6C3SKxXW6/F/zNfrerGgFpZooJpmIl2QicLyh
	qV5U48WnfGuy/NHXGizcYrWA4YuCOEyHqo5iQsoRjOcx9wGkBScjntvjEV2aZ/dKk/ftmq0CaJe
	jccHMCY595WtWh3WdrtwX7stmJ25OE5jQz5Pv+Vg15Vf6joPwIR3IAwd+8hy12QO2VGzyGcJH6J
	YSOwMyuS8tlquRtasCg1e+XobX1H1Y8xEgYbpLqZyF3j9fTbvo5OlxYCx6kW34fT5jFLi5Sg7oG
	d68EBfgX47xakS7KBdM3/X+6sa3PPi2fsOmo09hFdA4tAeKNIeCAHR4qCrWHm5A1n4MOjayJOKt
	4DD/feYpN9xkeAHj96z3KjkKGgxcYBtx7CZFSbvgVpDMBXoSV+ER+SSSitbBRkrV921HQ7lTXdr
	1qxC4pLnJ710eKk8u59qCGC+s3tVVxFJptuupNkeBSNHRlXCvd0cAlrngMmeH2vCcfyGO+H93qZ
	/BrPKOFEqlzAiYaLPqyXCD27Kcu6fCQh0ey0XkUL5T
X-Received: by 2002:a05:6a00:23c7:b0:89e:71df:d6da with SMTP id d2e1a72fcca58-8bc196faeafmr3981172b3a.5.1794437513734;
        Wed, 11 Nov 2026 14:51:53 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2471575b3a.22.2026.11.11.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:51:52 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v2 0/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected()
Date: Wed, 11 Nov 2026 22:51:46 +0000
Message-ID: <20261111225148.88506-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes a u->scm_stat.nr_fds accounting leak in
unix_dgram_disconnected() when purging queued skbs from
sk->sk_receive_queue on disconnect, along with a selftest:

- Patch 1 splices sk->sk_receive_queue onto a local list in
  unix_dgram_disconnected() and calls scm_stat_del() before freeing each
  purged skb.
- Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
  in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
  send() disconnects.

Changes in v2:
- Drop MSG_OOB patches and tests per Kuniyuki Iwashima.
- Splice sk->sk_receive_queue onto a local list under the queue lock
  before freeing skbs so concurrent senders cannot extend the drain loop.
- Make dgram_disconnect_fdinfo a standalone TEST() instead of running
  no-op fixture variants, and also test dead-peer send() disconnect.
- Link to v1: https://lore.kernel.org/all/20261106051905.218638-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test scm_fds on dgram disconnect.

 net/unix/af_unix.c                            | 59 ++++++++------
 .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
 2 files changed, 114 insertions(+), 24 deletions(-)

-- 
2.43.0

