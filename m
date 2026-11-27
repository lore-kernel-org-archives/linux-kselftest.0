Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779821;
	b=kpBokrUcDEe2A9E3os8KhMS1fq1NlENzNfwQmY6TrntwDwoyTyi3ich2scsX6+LFCbMb
	 2KPuin30eilz7Jum2qaqPP7ucccaH3jsMvBAqT+2WR6H8iH2MeU7Y9JCkpEKAbJ3iKrD9
	 bdHFVXPYMnsRKVUCYhPOSNz3UUdUD1Jq0v5yVoGwZWIp8Ma189Ym1SlDlIvTfgEbqt00K
	 qc06u2zmNHcbJGL1mPW/YOmHGHiRBFOHq8ev/KYwJID7RUUE2SfNI4N9fdE1Ucgei6BxI
	 LWLwCVUQ5UuLeRGL0Qu7jbnQxhIyPf+Wu5YQwI+Prxh9SNEFANhuFKptUeZTAy5uwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
	b=E3HPBatyYd8P52K0BRTVQELRN2Mpb/lELZ9x8In1XjxPCaD+nA/xyuaEeg51guZj1XQy
	 MKoS7zHsROUhrFFMFIDBVjN+MNUER9ggc37m0z1f2kbqhEln/Zk/BhSnCsh+wQDZC/S88
	 mAkuQdLn+A6aFQ0wJ1TJkQpYUDxvLwApD1GLUtdewVrsISvHKbNUbEeySlsMcSLFR9yem
	 7lDSSh0INWNF+qm20Hd24E00Urawqr1aaCuFKMmwJpEURDHVZcxR1qSmSSNJfHE6cOUiK
	 Hjh0QnvVNG+Tod6R/JsZk8Fo2Tgx5bXBMZry10BQbzWSZP/G0pPsP2cFYJUaPn5W0UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="Yy/JZIXW";
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E9606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Yy/JZIXW
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5430f70c827so94114841cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779820; x=1796384620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
        b=Yy/JZIXWughqL+85ngdXxRaRNcs2VE5jmZLE7hvVJQlTSFHZ3zNt/rti6zabMR8QrG
         nzuI51uhXzo4miM5f6ENVfGerf4tNA+yPh+F3nHOYKqAuiszj2TY0zeN9gbg30XvVB3S
         nlcBK8XTi0CG+xnfMGQ/iJYcVr2TG03+QN410=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779820; x=1796384620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
        b=rawhe5an3rpz+J7bYV+AavaJpaAus1PH2fNk85nxZhydHWp/pRZaG2tGVxrzWMxb2e
         Mw2CHe4YzVjiFoJb0Oy+qnoNs8DAgth1yEvzNSiMWyHgv/XTsyr0EZi+nLAXRC1QuS8k
         bOPQ4l00PhelkesD1zGcDNTOuvvEXcGQPk+vvzmjqj6DhILRt9tXa+a0CiHf3TCR6qxx
         ViAqovVet7CESFZwigyN5onvYA6Ya/He7+e9IHDZd3kvJKNqHtgOS5a6xN5QBc3+chfZ
         b5mKIN+Redoj7GNklyifkXYTJ04nPj3t02KeN1fXo5GJFfAA1nUZFl/5Cfhe+CpOap2I
         vRkA==
X-Forwarded-Encrypted: i=1; AL+hErEwmNoK1izgcedBmRJd55O2lBhnR6R/L0znMi6tfYcpZgjO7zL9nBRlj9VWkKOMsEhaxBCvVHDwd8GIruDzdD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B+vWphSch7QGujvL5EjsyBgYHv6/MNxyL+nmqAI8OkSpEIpUY
	XCSVWY88sn+klA8xv4v9kWCujtM01bMgnzs6AxqfqcHah4BGrsJcQbMaN3WpPidBUw==
X-Gm-Gg: AZFdTZeWbarDVhQMG/22G8meCOLBmgLVj+kySnNld3xBI5MowGRxJZDefYhxIek5HcC
	n1wJgG8kpz/mpwTK6udQT6hxcsrgHq4rs3jPtBeuYjEToCj2q79E44CGpDHIawX28G+bz8a4zNg
	Ln2cnkhsq4MlBAWlXcwVbnoqjKD80w/Kgs5t3wKdUs8C6rmAxjj+GrC3CFdrPzE40PEI6cOHSVu
	vDkjYNkfVnAVBbvtXE5boxAw13QDm2flVHVU2gSdllYqt8EpVHDWfizq5sAt4YBG4jy82/oPOdF
	CfFhR61ciaVwnh/2YgiWF9/ms56zK4h8FdhoST253OSNSchkRsf8brUAu8wa48vYjbbtEEQU7B1
	ZG/hE2FjxC4AS/Vy/j3Skho66GfEeUrIz/WxaTRyAwWUHA2BPEUi4z869dFUSn85nKEwxmMVWqk
	h/7Vj/dz7MoxJ4ejwhmErVy1Fsv8M795ljv23OlHumlIn5VMmv26Xs2WeSJ6/D06nauuiaslTcl
	xEuKs6GkM7XsI2LPPx4ZR7U350lxjCX/9jFNDLyGz+67LPx1GLxyqVqmDO794XsqP5a4kNdUPxP
	pie0owt7TjkN1Gp+xBmvpOllxQIOuZoiwrF/5PLQnEuBMUJwfy1a14oFKsRLzhcofo+vYZT299K
	WOWsFCn6Fm98e7A==
X-Received: by 2002:a05:622a:258a:b0:55c:7f3d:260f with SMTP id d75a77b69052e-55d76a882demr428968481cf.63.1795779820213;
        Fri, 27 Nov 2026 03:43:40 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:39 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	stable@vger.kernel.org,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>
Subject: [PATCH net v5 0/2] net/sched: act_gate: bound the cycle time and start time arithmetic
Date: Fri, 27 Nov 2026 06:43:33 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
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

The cycle time and the base time are read from u64 attributes into a
signed ktime_t, and the cycle arithmetic built on them wraps when either
value is above S64_MAX.  With base_time = 1 and cycle_time = all ones the
timer is armed in the past on every expiry, so the softirq never finishes
and the installing task soft-locks the CPU.

Neither attribute has been bounded since the action was introduced, so one
request is enough to stall a CPU on any kernel that has it.

Patch 1 bounds both attributes at KTIME_MAX and computes the next
boundary with ktime_add_safe(), so an unrepresentable expiry saturates in
the far future.  Patch 2 covers the accepted upper bound and both refusals
in tc-testing.

The 10 us schedule-entry floor from the previous posting is a policy
change and moves to net-next; it follows once this series lands, and is not
part of this series.

Changes since v4:
- Split: only the regression fix and its tests are here; the entry
  interval floor and its test cases move to net-next.
- Conditions states the user-namespace route through a filter, which is
  the minimum privilege that reaches the code (reported on the list).
- The test cases match the kernel's own message on a libmnl build as
  well as the strerror text, use deterministic signed values instead of a
  2^63 decimal whose conversion is architecture dependent, and assert
  the stored value instead of only the index.

Jamal Hadi Salim (2):
  net/sched: act_gate: bound the cycle time and start time arithmetic
  selftests: tc-testing: act_gate: cover the cycle time and base time
    bounds

 net/sched/act_gate.c                          |  34 +++---
 .../tc-testing/tc-tests/actions/gate.json     | 108 ++++++++++++++++++
 2 files changed, 127 insertions(+), 15 deletions(-)

-- 
2.34.1

