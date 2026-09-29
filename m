Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79E39060B
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664483; cv=none; b=tE9FXzjgsnWqTseuR8SfQFufJFdvYogxCnwwOqWID8g/7RXBW3/fufjd8OZXE9XEzoPKlLNPSFZt9QaRUJakoPSemAlN/GV1hoaP4TjszrGF6j8rpw2TmIOEXd7kGFytZRr7JyARYa9TFYFVcbiw6dygMvXojVvzcEPX+POXGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664483; c=relaxed/simple;
	bh=5z84o7SmoK1MfkB9ciA9u7prts41Oso+lRT/sEz6vNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ljUCtPWVxUqOYNk4pt52Y8Fm7iLCb67PZIfOBTACIbTVNDUuzYict9QBZFCGh5VuPhaINtMG1Cf/OW6K+VpEnffLyO26xkrG+soEAhnNdME4SLv8iQdsk1FOkcWK+N7LUNqLC5o8yuCNkAOoAY/bNukFTq2COxSQ9ksBRAErPss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hyj53bPU; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyj53bPU"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-880483985aeso1619256b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 23:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790664481; x=1791269281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RB04FcJG3heFGxGzctuC3aaXwFFC1J6ocmOzj+rjAe8=;
        b=Hyj53bPUyyF2fEACDc0Shtz0QejOlvrG/Vdud4wVl3S83WyE3oC87O3ccGozHD2fIt
         1kEZkCt9VH2L6yj5kB5jZaoIfIfRFEZK6JaxJo9EMGzZC0Cq9uvfnE57t6I9UH3o2+m7
         bszeb2ljJyhBhpuFAf8K9Y2/9oo7xj5ebi2gDpWVkDY5J+RLd/MwbcchmacdwcKuBj8V
         RmyA8IvyUcAvq1uNzlxpVqz5zuTv8J59RZA/dtwBFzH+V1fkI1KsmxYxeosX6lt2AlNZ
         3iAHi/sDBxUEov9B6CgCQ29I+Xk0XSXS8yS2fJymPjHolFD069x5/6vkE6mGcx5BLon6
         a8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664481; x=1791269281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RB04FcJG3heFGxGzctuC3aaXwFFC1J6ocmOzj+rjAe8=;
        b=piYJyUSz3kcp743Zufc6JsxNTpURpN/lThS1fISDzNeny1BbIcIE9W67CH7afkbFxJ
         1w2FurWqjYiHRoRJdAyk6xQEk+uk2BchBISjWlK9aoFFpPp2wop2SRqnv4OP5nd1OSCS
         78sSQWf1nCnsGEla1Eo/vOdkq68S5veZLismDPjZzCWDMpQdZoqkxp7q1jGq831ppNsD
         wtE/dWTJUfzppveqFmdEqra2+PU5cAbqBZPubnhvdi7MULJcGE5DzYIrw77c1IhtY3aI
         ZdHmsRacxBiSdCeO7abCcG7vXGgOauGAi24Yxkgv3/TWAnRNjXMBkyMqQKQv+mauJ2b6
         Nu5A==
X-Forwarded-Encrypted: i=1; AKwUvBy4n+G+720RKd7I9t0of02UGCsvHzA5umno31qrVi909zYdNkeuzLpgX0escSMWyDdwFGEyhutz/yz8d2vQpNw=@vger.kernel.org
X-Gm-Message-State: AFuF++lCSmF7uF1+nBQ0a08j4miKt5I/ol/YjfRvR8NAKf1kITsTL1bi
	iWLKzZZQfkxEhMxeMI0tmDa9lKB20MGVPPTzYAaf77FrlAFLUc3grMJp
X-Gm-Gg: AYBFou3+DF5VFtH4/C69ldV3cCyr3qDgl9lxQ4n7OSMoOJmmaEHLMX3VFx1Dkd7hPuv
	Bs4MZyut4is//Pz/KHDDYDV8xj+nxsteJu01SH1HMgie/GfdCKnkhYvSdcj1ZSPIYwmhtVJJNwh
	5WAhxrIWRBb4ntc94m2NW/2ZQH1Xia0rHPeGH5sPgyWTR1jTx975vs+dA+tiwfyrTY7M9TzNnUJ
	I9vlv8lyqhEltsI2oBkdnf33YTsU7UNDkwMtieyC/pCo0jVz+jTfhRKInu+cszn2ema12XWEyqm
	NHt7PWDRGRRCM+F+ZH6B9GG1WlCW3Pp/eAdPPFLjdUmwfCXMLeRGkQGE/6thBNKP23HBF7KN2qL
	WS9YzDdCJo2tpO2psW/+wU98ye+jMh+yVibvaB3BcYlpk2wW7akXS1PL/pqovBZc8t6judmPLGK
	wURKBWZbTfZU03yb7QolgmuCIDrqBjBRS0wvep2RKPogVxa5fN3pSlOBOSCDJChZX3St7Wk5lte
	7N7goV0aPWMkoGevnA=
X-Received: by 2002:a05:6a00:6c9a:b0:880:d04d:1502 with SMTP id d2e1a72fcca58-880d04d1618mr7358024b3a.0.1790664481306;
        Mon, 28 Sep 2026 23:48:01 -0700 (PDT)
Received: from lsk.tail206e42.ts.net (vps-787f8425.vps.ovh.us. [2604:2dc0:202:300::17a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e1066470sm266922b3a.18.2026.09.28.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:48:00 -0700 (PDT)
From: liushike <liushike123@gmail.com>
To: netdev@vger.kernel.org
Cc: jmaloy@redhat.com,
	tung.quang.nguyen@est.tech,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
Date: Tue, 29 Sep 2026 06:47:40 +0000
Message-Id: <20260929064742.576651-1-liushike123@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: liushike <liushike@ruijie.com.cn>

This series notifies pending active opens when contact with the peer node
is lost, and adds selftests for both connection-oriented socket types.

A client can send SYN and wait in connect() while the listening server
has not called accept(). If the last usable link then disappears, the
unmodified kernel leaves that connect waiting instead of reporting node
loss. Registering pending connects lets node_lost_contact() notify them;
the client receives EHOSTUNREACH. A surviving link preserves the attempt.

Patch 1 changes connection registration and error notification. Patch 2
adds selftests and their build/maintainer integration.

I am proposing net-next for this long-standing behavior change, but would
appreciate guidance on whether net is the preferred target. This is an
RFC for review, including the target tree and historical attribution.

I have not reliably identified the original introducing commit for a
Fixes tag. Commit dadebc00299a ("tipc: eliminate port_connect()/port_disconnect()
functions") moved existing registration logic in 2014; its parent already
registered at connection completion, so that refactoring alone is not
evidence of introduction. No Fixes tag is guessed here.

Testing used the base-commit below for the before kernel and that base
plus this series for the after kernel. Both ran the identical final
selftest in x86_64 QEMU/KVM guests (2 vCPUs, 1536 MiB), with GCC 9.4.0
and binutils 2.34. Two network namespaces communicate over veth pairs;
fault injection disables TIPC Ethernet bearers, not physical cables.

Results (SOCK_STREAM and SOCK_SEQPACKET, nine cases each):
  Before: 8 passed, 10 failed, 0 skipped; exit status 1.
  After: 18 passed, 0 failed, 0 skipped; exit status 0.

On the before kernel, last-link loss, both-links loss and named node loss
left connect pending beyond the two-second assertion window. Nonblocking
connect and connection-wait timeout followed by node loss had no hangup
event and SO_ERROR remained zero. Normal accept, surviving-link failover,
rejection and named accept passed. These failures occurred after SYN
reached the listener, not during topology preparation.

On the after kernel all cases passed, including EHOSTUNREACH and POLLHUP
checks for asynchronous failure. The two-second bound is a test deadline,
not a measurement of millisecond-level latency.

The kernel configurations differ only in CONFIG_LOCALVERSION. The build
records include the base commit, patch and image hashes, configurations,
compiler output, launch script and both guest TAP logs.

liushike (2):
  tipc: abort pending connects when the peer node is lost
  selftests: net: cover pending TIPC connects on peer node loss

 MAINTAINERS                                 |   1 +
 net/tipc/node.c                             |  37 ++-
 net/tipc/node.h                             |   1 +
 net/tipc/socket.c                           |  38 ++-
 tools/testing/selftests/net/Makefile        |   1 +
 tools/testing/selftests/net/config          |   1 +
 tools/testing/selftests/net/tipc_connect.py | 278 ++++++++++++++++++++
 7 files changed, 353 insertions(+), 4 deletions(-)
 create mode 100755 tools/testing/selftests/net/tipc_connect.py


base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
-- 
2.34.1

