Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579837;
	b=Qe0hb9jyAGKoVYPt1v0+cOzewS24HXniC11c3sWaZhFYTOXhcJ7k709uj2QUW3fx2u/l
	 k2S8V13DAzimnuk+4HgC8eXOo1s9BQoqEdA1U1RPGbmQIflAhJbro4FvF/1CKpUy5oBPp
	 bC4ST/pPQYovs3k+mdqyAv+TfZrseLiyR7dfbIWq3+zZjlJVFWKSLcGG0PMS1AafKglNq
	 aMNGGa/g9fspAJ6Kpt6RiujCyK1d74s4aTWbdbO1EZLoEKhARoABqGzBpo7ju1mjz0AFn
	 PF07b4vWwHyplZml0BFW6n7U1xImph+RsHBBw/Qj+wYf/RXkwwSBxRJDHX8yXrfnYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IUnfnMCfJsbvpWvyHSjvGcJGybGXt1oQn5zqqiFkIO4=;
	b=RWULunPT0FN7Ls1oIGiZqXRwCuTyoKrYcx9GJAU5szD9pLYhzNNefYeVhtTUl4LFSyJF
	 I9S1NP+aoLC+Xm+nguwCnlvVGsehX0rdatUz1JjVuGV3tGAR08Gi+X8EFAGpbi7n9prU3
	 ntm8jPaopAKb6frdckUoZeF6b05nnYJJF1mfaaLH3QQgCCxPhQ8vUle6Pi5hMDDKXEbn3
	 dEpYALCEkK6osy4rI40JXxnK4iK41Y+wfDpRBqTeQ2XkQKs1b+sxhvu9W1obaXDwxB1G5
	 6EWIpVQlQtWZiQ7MFXS1p7HYIWAnLVQN4B4N1PN5CRCOKtb3mWPkRZg9oa3oKqO4B9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Eb8N64Y5;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44989606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 00:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44989606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Eb8N64Y5
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b8306b9f8so45011516d6.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793579831; x=1794184631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUnfnMCfJsbvpWvyHSjvGcJGybGXt1oQn5zqqiFkIO4=;
        b=Eb8N64Y5rqXemMKPCivG0+BhZ0l8xEhRnb+UBOUx7NAZ18szy4xG+lWskVUGA9ZL7a
         qw/Iy26lxR7dcQ5PM4iM0Fmss4c64hSMcN8LA30nX7cKoZrrzRaxRp0ssP7UU8cgd/AM
         OLSP2r+pEtG/bLfz0cmUtbmxk4ibNlJaToqqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579831; x=1794184631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUnfnMCfJsbvpWvyHSjvGcJGybGXt1oQn5zqqiFkIO4=;
        b=DJbDxKeq00965RkX5nM8d4XwFgXP0h8+neB8Z3s9lBOTaacyQOhR7+IPfM8WtD+Vpq
         8De10jGIVtb0DIl+gLMqULW0BjKefAQNZBvYIj+xZmREj4cYSXV6EG7wmfWjuMPoOH/j
         apo92F3How6hWvmoAnp03pikBGbNTJNri1uVZRU6rUnpMuZYmxN4XhbdPvRFBLHwYWeQ
         5aJlEP5sh4fuLTKfEYM783JB/gcxetgW/oRgr60IhutA7FU4laVytKNlo9hCfPX3Vrsw
         aw9zRvNs1116vmYQMDKeZgBRJV2TtRomGcm3V5cEa6oFnFjSUnmkBScq7SBDT6ztS9vX
         TfWw==
X-Forwarded-Encrypted: i=1; AKwUvBzi31F3Kwt2Q+yiiaHHMjb+2hTMZEuacVnR/SHBOC+pk0RwZdh5Rtb3Afcd2fQJkICwGxMSP2r4u+RIsLAkDZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z86n+6sJ05O3d0uNwjVcuLTmjeLNcdLMGJNL88gS35fXc0BHq2X
	jc9MptMj7ep4rAneTrR1woMwrt9umnnraAHRb7XZrIOjzQWX7TAwawv8pQ+rJGtGyQ==
X-Gm-Gg: AYBFou1VuVci4yC5uWZz7N1JVBAf/u7hvkcwck38Gca5xnMYOcURRj3PaRM/8e5Hhs1
	G9lDDLGES9w+NIr0/FYgBim3ALkr/7cZHDIro2w8d2cTNSMjmgxZ017kja/t5rW5ldd8jXxC9hZ
	9E7hSrBmsU+K4BX2k3mIuExNJ7+FIRAgGxP/Y6B+eSre60muxwXCdgWaKbCm0DEFHZrXhnhIEu0
	OHO0++ZgBUp73njoJvZPW+xn/JCcA9KH7wxAIz03v4bCU98WYJD1ljQd0xtO1S3SwVlfvm3GZlC
	WneM2jWYhxN9eqN8TpY6j3AdxbTmW0tbBQZRq1qHO2czDDO57XS/BkAos/v4+ZJtLiuqq/dOPfk
	tlo0PqMTWDKcRAdFGVS/dqBnNhuQQAeauLZA+IJqFMrU0l1ZMtPJCXVBJGsTO2NrwzzVRdac7A6
	qSqEZTGg0MB5wNuBgkyNlHEL7C5gln3PiQY489eQDQzMbOnYTzxoc4g+bJXKN9NeZzF5Y/iFjCr
	PPFICxx1GgZzrHMBOK+TMOD75d1wEKh5mwX9iOtvX5gmvV3OQjK/xvIBLFFv2iKcvG0vNRK2+zk
	cnp14apcYnczU0OjvLr6fV/tXIOCLkKWUeXlF5lQ4XmCVjDiIL30os0ovOwmI+OPTH7PnjatwKa
	zhFaUD8++7S0RB4A=
X-Received: by 2002:a05:6214:21eb:b0:919:85a3:313e with SMTP id 6a1803df08f44-91ca4b32cb1mr132715186d6.17.1793579830838;
        Sun, 01 Nov 2026 16:37:10 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f23754sm77043066d6.9.2026.11.01.16.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:37:10 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	stable@vger.kernel.org,
	shaos <shawnq1@163.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Vega <vega@nebusec.ai>,
	Tom Goff <thomas.goff@boeing.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/4] net/sched: fix short-skb metadata and namespace boundaries
Date: Sun,  1 Nov 2026 19:37:02 -0500
Message-Id: <SER-NSBD.v2.r0.20261101171325@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes three independent boundary problems in net/sched, and
adds a tc-testing case for the third.

1/4 act_ife: encode a configured zero metadata value.  The u32 and u16
presence callbacks reserve an 8-byte TLV for a configured zero value, but
the encoders returned without writing it, leaking stale skb headroom bytes.

2/4 act_ife: require a full Ethernet header on egress.  An undersized
linear head can make the encoder read past the end of the skb data.

3/4 sch_teql: reject qdiscs from another network namespace.  The global
TEQL master lives in the initial netns; a qdisc created in another netns
could still mutate the master's MTU and flags.

4/4 selftests: tc-testing: cover the cross-netns attach rejection.  The
existing 124e case attaches a child qdisc from nsPlugin's namespace, so it
is answered by whichever of the two rejection checks runs first.  This case
attaches a root qdisc, so only the namespace check can refuse it.

Origins:

1/4: reported by shaos <shawnq1@163.com> with a reproducer, which was
reproduced and verified in our test environment.
2/4: found by Sashiko (nipa and gemini) while reviewing Victor Nogueira's
parent act_ife patchset; independently reported by shaos
<shawnq1@163.com> with a reproducer, which was verified in our test
environment.
3/4: reported by shaos <shawnq1@163.com> with a reproducer, which was
reproduced and verified in our test environment.
4/4: follows a Sashiko (nipa) review of the repost2 posting of 3/4, which
pointed out that the new check masks what 124e asserts.

The four patches are independent.  They target net and the three fixes
carry a stable nomination; the test case does not.  They are sent together
because they share the short-skb and namespace-boundary review context.

Jamal Hadi Salim (4):
  net/sched: act_ife: encode configured zero metadata values
  net/sched: act_ife: require a full Ethernet header on egress
  net/sched: sch_teql: reject qdiscs from another network namespace
  selftests: tc-testing: teql: reject attach from another netns

 net/sched/act_ife.c                                | 13 ++++++-----
 net/sched/sch_teql.c                               |  9 ++++++--
 .../selftests/tc-testing/tc-tests/qdiscs/teql.json | 27 ++++++++++++++++++++++
 3 files changed, 41 insertions(+), 8 deletions(-)

Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---

v2: considers comments from Sashiko (nipa) on the repost2 posting.  The
cross-netns check in 3/4 ran before the "teql can only be used as root"
check, so every case it did not catch was answered by that check, masking
the assertion that tc-testing case 124e makes.  The root-parent validation
now runs first and the namespace check second, and 4/4 covers the namespace
rejection on its own as suggested by sashiko-nipa.

1/4 and 2/4 are unchanged from the repost2 posting.
