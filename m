Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52DE361651
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 05:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522091; cv=none; b=EAApa7YDRmThIFpc6E7tmNgH3vLN0oi0PoY2Wa2VijBHe4ElAcDW3Rz5c1PgB63ApqHL2nRhF8lktc9BnfIbWVKTDq1QNMo3dwXc64K3lCrCAxJSaLr076auNwd4DBn/JQLWaDbjiM/yA5eHuI8LecYYcRJ8RPeKubU5sjeyXiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522091; c=relaxed/simple;
	bh=w06dbejtkEH04LcmMoPjg3zXXYBbOO8qP0cKSsXeiwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDo0czlHhkRdrXxitGqHzTEE17JDhsXe2W8h6I68lftInYJE65Fkt5O7q3wQO8+Ug3XvA2HRVAFI8pihQNkjQz9FoLsZQ8n702mi3vBlNqGbzExFGTKXr9WD26ofWfKjdQesn2rxqUz6EvFFTcEhCufXiPXWJZLTDF9ILcdvVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=RwQn8+MP; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="RwQn8+MP"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-81ae6aefdceso5270200a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791522089; x=1792126889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qBLA0HGkiEWJ8GXA3riQcw6NGek+JArcvuviGDYRsc=;
        b=RwQn8+MPqQDTQsRgEN/dePQgq5OZk+xmPJ+3n0XmcDCkBi8kNb8xvGOjo70z/PFUEo
         MrDKA9DTBLCNOaPa8Gtgz7KvPLS3rdb4noIqcjUo4+GKIxcKaB2DqyovmpT+AEWjW+UP
         sad7+25sfkWv1mRelRk5ZTNA4ykQEjWryG3Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522089; x=1792126889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qBLA0HGkiEWJ8GXA3riQcw6NGek+JArcvuviGDYRsc=;
        b=jFX30H1hTPGD/2qes+FlkYbvA7Bh0I+GUEyYVbu0r3c59Hk8IC0xXcXn0ARl+NQEbb
         ygof6mwtsn6kcKcG+3tdq3HHNyBhAokAGk//AD2UyxjV4uIiWPt36kyfClNuYAUrgwVp
         Hb9t2OqfAZhlNl5yk7rFd0rZl3FiRFuuHk9sYNPczqF3yxIYNHsrvXYu7lK2AxJr8rBf
         FKh8xPJySLywp00/vsGIbJrMH7Lox4qttFry6M/t6YqIonR2uQ9CIMCaIDlEdY0ToO1+
         L2mgDSRDyFiH3zUBGC1HH/uOAYSEcBdIlICZd28HDbC4TReR+mIY+U7eOXqpf0qENGH7
         exCw==
X-Forwarded-Encrypted: i=1; AKwUvBx94mDLtcima8exsnRZabzgLYpheCiMQMZxVSr4RWTmLR+7DnEX85s5wCoo5L7GXFjMymO6WliMtW9Kw7NmksM=@vger.kernel.org
X-Gm-Message-State: AFuF++msPzUqK61OvGl3iz30R+SBJOzwZ7dJfMdJftT1ZOEQfb92OjLt
	dVcziunegzmwgH5ZnH84lX3w0JN5D1R+vdRT5iZTbmbn6lk8Cus752+gpwT/tV7t908=
X-Gm-Gg: AYBFou1Z8EVMOhtsalxH8nh0hC612x+oURMvIrXI0sHU0Yc0X2dFsnmHXvrXFAgzsix
	BFwr3ML3FAGcMcpvwRXnzYfdlriQ4kJtVC4bdFQaNETueqMDmx6htkgLfpk/n5eX3onezCSk4yj
	7DdDH/irUOC7gb+ofplgPtSiAAgTB6su6SSqdxhz7tMRncq7UvcDAvOwWhNyMSbrJKYbzvILFFN
	VHG2iHPyMRABXKmhhBSm7eYkGMt+PdzNrm46agmPvYn25oZbhDZwhomfmQrnYfLfTc5olZg58e4
	OlLMc8/rhgJ0UAo5XGjKFGlMEjZwvcsu/bJJ1qKP1J5Coque5dWiboeNsZQVIZzEjKmDa/86hKl
	Qz/CUegx/4AqzoNt7CT8oQl0a8Q6nU8r1KvIATxbZS705SXUUl27E3QKsFg4IMC9RZvFg0/eCyW
	DZVGJC2IEGnnOPIaWckFakq76xXhHQ1p26faMytQSekoT56OqPRwtbIcRbUewu37KK4cbceQuDP
	lzIBqblDEJN9Stce72Bvu5g0HRzwTgitAos8u5X5bhQaC0mKzhuE6DDYdI2tsHvVJcCqH6Zjzm4
	wTZz
X-Received: by 2002:a05:6808:15a7:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-50c4e685311mr857092b6e.22.1791522088665;
        Thu, 08 Oct 2026 22:01:28 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c1246cbsm944574b6e.18.2026.10.08.22.01.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 22:01:27 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
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
Subject: [PATCH net v3 0/3] tcp: preserve RACK tracking across partial undo
Date: Thu,  8 Oct 2026 22:00:31 -0700
Message-ID: <cover.1791506907.git.nramaswamy@openai.com>
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
to segments only being retransmitted after the RTO.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

These changes use the implementation provided by Neal Cardwell to restore
elements to the RACK list that were lost but not yet retransmitted.
Segments that are lost but already retransmitted are explicitly left to be
handled by the RTO. Since I've used your implementation Neal, I'd love a
Co-developed-by and Signed-off-by if it still looks good.

Patch 2 tests that these changes allow RACK to (re-)track a segment marked
as TCPCB_LOST but not TCPCB_EVER_RETRANS. Patch 3 tests that a segment
marked as TCPCB_LOST and TCPCB_EVER_RETRANS is transmitted by an RTO.

Changes in v3:
- Replaced sorting with Neal's implementation [2]
- Clarified the relink helper's complexity comment
- Clarified the original packetdrill test's comments
- Added a new packetdrill test for the intended RTO fallback

v2:
https://lore.kernel.org/netdev/cover.1791248202.git.nramaswamy@openai.com/

v1:
https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/
[2]
https://lore.kernel.org/netdev/20261006141300.1722466-1-ncardwell.sw@gmail.com/

Neil Ramaswamy (3):
  tcp: restore RACK list membership when undoing loss
  selftests: net: packetdrill: test RACK after partial undo
  selftests: net: packetdrill: test RTO fallback after partial undo

 net/ipv4/tcp_input.c                          | 50 +++++++++++++-
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++
 .../tcp_partial_undo-rto-fallback.pkt         | 65 +++++++++++++++++++
 3 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-rto-fallback.pkt


base-commit: 11536ee3d3e0b1bd35b6f3f8df55a6053eb0c71d
-- 
2.55.0

