Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754101;
	b=IGntRKmNumKbpU/0kjvgj6waZDCPYDorrB11JtLbGvPWknf/2SaCs/Qu0YEuFxMPAJjR
	 VGEtsdp54Kq28iYYlMjS4+vBipMyL62y288gxGOiB8hBDEAZZivFL8rKJM4t6374AMXgU
	 CvyBQNPuuSzNMRX3f2y6VRWDCK2Sk6g0RfYI16GBTeIoSR0eG2snokapiMLTLnUaPgQU+
	 Ua+oYc8guGpL4u3oYzYkNWVikUyStEWrGvbkDSJ9QKdZvqEpkvnFSEW4eTVRW7lh+Drv0
	 ESPxluLocG6snld3NFyAkGVfApYNzMylys1NKls+SMvm/k3WJjbfha9sSsMaFJMlDsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754101;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=VJ7iCvRg9RnOJ4Ff3zurHi0KjOzE/lesnjDitUS+xUA=;
	b=YOYGEBILolEzPAMQmCibVy7a7C768VuuGQDrXmwnVK4rmqHZnkEi6p0PQjRccOPpkn8/
	 0ER3lrbP9CiOQOTdTnuXnfIrN7SU7SysHb0Qy7IpDSy6Ac2l8mSq8EirBxyxAEolcuf4C
	 hla7FittnHX9INWR1GSE1OqC5h0tFcmn6sxdsrYVV7ryBeIjRgcck1mUiFQVlxSA470Pg
	 gR8s402WeQCl9bgrYWDkhErOEWX2Zr+TuYSUty3OYtdTbapVNXA0zjl20e13/CESlSroi
	 2hg3LFozkWVnURNFgJopkOJLiUAfC7EKzTM9qMldPGykaUhU3PpaEzCmi8fycXT5IqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB3606A31D;
	Fri, 23 Oct 2026 11:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFB3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D62B645DC6;
	Fri, 23 Oct 2026 13:14:57 +0200 (CEST)
From: Hannes Laimer <h.laimer@proxmox.com>
Subject: [PATCH net 0/2] vxlan: keep reserved_bits on changelink
Date: Fri, 23 Oct 2026 13:14:26 +0200
Message-Id: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJB22oC/yWM0QqDMBAEf0XuuQcmrSL9ldIHY1Y9laskKoL47
 03r4+wyc1BEEER6ZgcFbBLlownMLaOmr7UDi09MNrelye2d3YO3faqVr3sSHblzM3sUqAzgK28
 o2XNAK/u//CLFQu9rjKsb0Cy/Jp3nF1Fon8uAAAAA
X-Change-ID: 20261023-b4-vxlan-changelink-gbp-de5e81eed8d1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, David Ahern <dsahern@kernel.org>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Hannes Laimer <h.laimer@proxmox.com>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=855; i=h.laimer@proxmox.com;
 h=from:subject:message-id; bh=8OhAupMg1xmd2XfvSuc1zQ7gZFbk6qz3UedeRwYzeMw=;
 b=owGbwMvMwCU2e2Iv83RDTSPG02pJDFm3HTf0GG/+8TVoimGPwzb/EpOn6rvWh/lKv1jBLjJlW
 fzhfbzLOkpZGMS4GGTFFFku2+//Oqt3apzR6c1cMHNYmUCGMHBxCsBEuFUZGRaeFQ5hNNyxPtVK
 gG0794w5dyffOl9tL/5EcVGNqJLohBqG/6EdBw9+PVCdr58nb8lqwdKa5Tw3OdjSRfeunH9vhNU
 GZgA=
X-Developer-Key: i=h.laimer@proxmox.com; a=openpgp;
 fpr=64D04F905C35D23EBE24D079FA418E647F2175D1
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1792754097328

Currently reserved_bits are reset on every changelink. This leads to
packets using extensions that were enabled on creation being dropped
after a changelink. The first commit describes the problem and
solution in more detail and the second just adds a selftest for this.

Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
---
Hannes Laimer (2):
      vxlan: keep reserved_bits across changelink
      selftests: forwarding: vxlan_reserved: add gbp changelink test

 drivers/net/vxlan/vxlan_core.c                           |  2 +-
 tools/testing/selftests/net/forwarding/vxlan_reserved.sh | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261023-b4-vxlan-changelink-gbp-de5e81eed8d1

Best regards,
--  
Hannes Laimer <h.laimer@proxmox.com>


