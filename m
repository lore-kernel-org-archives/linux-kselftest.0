Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD8335F60F
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263791; cv=none; b=bLuw9mb6Gmd01j8e3/mnB+87P65ojNuSxV0bcnFJh8QAuHT98jzs7qgFZtHmQJg/hJVdP1TC+zTJJhZLEk7Ixw61fG2NWbKx+uWh0mXdkMPF0HajqmxsvBSADSCdfA1CvkY40ZTuq+jNZHIwJQl2NUcYglM+huDNw5oZu88fBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263791; c=relaxed/simple;
	bh=r7yDJGNf3vg9Dsuvo+2fXtkz1amrdnaQFLDyMDdoBeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mh/XhH6uCYwhIJU3V3A6xL17G2+2ayXlD9bVc/Lh9aDwRUCQCXHptlLfTnuanohudGzguOG1wliIF5gBBrOMq7Dti8lpmsMSHXWxIZHLmYS+lI1ZWnRwfh/WMHh/3btGyZ33fs5idSOpuMrWns5eA5q3C/rR4KNjFA7fYUAnYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=UoKaKUJL; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="UoKaKUJL"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-81ae6aefdceso2398294a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 22:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791263787; x=1791868587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcZAWj+F2P6v02eYEvSJlSeTa5ggyC9iZf9e6Z6vbRQ=;
        b=UoKaKUJLMoZduV6Ofexj/lX7Cze0j9UyMMCDm92Rjhm6jL2zJq4J/va7aLHeu24YAN
         MzpRtOGD+8c3TNniiYc2Hyf42JiaXDuVZtheoZo7AkIu7Nrt2NuAoFTCFc0z8Xcl0p6q
         Lp0ml28EpUnyx46Lc1ma4Liy1Dt1SKi+lEgWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263787; x=1791868587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcZAWj+F2P6v02eYEvSJlSeTa5ggyC9iZf9e6Z6vbRQ=;
        b=h2cWm6QiAoJYktbXJj01S4qnxslX+FV+cMRGAl51I/HQFmeKUQqcrvQ4CcsnVzoYZH
         ZR6+0BiYUL7vtGhvRaaa2qvUxD/DGD10OduYV9oDWjxgVdnLkM31qhrK8ffN+GWWojG2
         Q02KhLZKmAwEE0tQiSMkJzYJKslSssfH3QxXF2gGHIB6cxkr4P7qpzBcXUtZ25E38xlS
         y23DhwdrHP7BxLLjkj5iQnCe1RpPw1RNGYlgje6J8xPy6dR1jRwRJ6VqpBmcJvWQCYBM
         wBHOY6JRIkxX7jFg56kK20RyWUTOMPRwU/xUFzv4gUa4eMYDF7h5zFc9Dz/+yty6AOHi
         WV/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1U3Bv06yiztOItjjxf5hN4F4S+RAbMmo6F4Wa+p2HB/PRHV/rIkXUGi4LYGGleMPb11dzxWa+SIBGuPiBiJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++mnriXfshG6wE//ZInn8TW7CFYNCzpfaYYxOwHp3cGKTtQjWEsU
	U2ayATXPn60tst2/vxPO4LvUsRSrMNIfFNzm7BfVLWLRIN5KzMh7TIuElEuF7qjGSQs=
X-Gm-Gg: AYBFou3TvbMQNOFAWUygFADRzDnBAFQqRuPisP7gsbujAN68mwCq3OcH9sIZYQloANT
	97dAlCW4M/7RDtooc2ngalg4jjHLBQ2/BDDFM+61tbfBzMBVxMXF2OzCVZ2mgoY5PCEvqfDD4Z5
	bcmk41jgGo4stSlhw/S6fe1FXZ9pJYt3DY0EIcYW35IV1UIiQEghNydrqNPfvg3eocb+R0Z/DeX
	zKtWSKxMJ1c5jCLNhUF2oHMz5E2KjpnEEOeR5BtkLsQ9JIGQ2rMuseaqIHYR2OQIYa/mvg4T7hY
	uSa+wJlS2sbQpSOAjrOQCL/8jtQwHZeyTIwglaPp3JY47+nH2hqeD1pcSan79k6e1jf9y6jVe5R
	X3adld2qXBF8Gsoin6et479qGzeACKXDn6lHnSS2xkB8acEpfhJeDMAyE1tV3ikrNVJSV2ogozd
	nLwRr0vDuEdl0vqa1jLG2Jq0ykaCnUpXEYoDpBb2/ow62PrGhYwrAVHUTXobd7Utpe35uCMtU13
	4WsokfnG3h/S2Z1QI143/IShOQj3HPOuispO26BvPqtjEbfIt8m8ghD4cgkKs/uYJeS1pp/ig45
	1p0=
X-Received: by 2002:a05:6830:2b0a:b0:805:9b28:87d7 with SMTP id 46e09a7af769-828a167af3amr262818a34.8.1791263787188;
        Mon, 05 Oct 2026 22:16:27 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm1622898a34.6.2026.10.05.22.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:16:26 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: preserve RACK tracking across partial undo
Date: Mon,  5 Oct 2026 22:15:25 -0700
Message-ID: <cover.1791248202.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Partial undo can clear the TCPCB_LOST flag on segments already removed
from RACK's list, which prevents subsequent RACK loss detection, leading
to segments only being retransmitted after the RTO. Restoring them to
the RACK list as part of partial undo makes sure we can properly
reconsider them for fast retransmission in the future.

To do this, we first sort (by transmission time) the segments whose
TCPCB_LOST flag is being cleared and then linearly insert those back
into the RACK list, which is sorted by transmission time.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/

Changes in v2:
- Added production symptoms
- Removed the redundant TCPCB_LOST comparison
- Fixed lint/long lines

Patch 2 is unchanged.

v1:
https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/

Neil Ramaswamy (2):
  tcp: restore RACK list membership when undoing loss
  selftests: net: packetdrill: test RACK after partial undo

 net/ipv4/tcp_input.c                          | 35 ++++++++++++
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt


base-commit: 11536ee3d3e0b1bd35b6f3f8df55a6053eb0c71d
-- 
2.55.0

