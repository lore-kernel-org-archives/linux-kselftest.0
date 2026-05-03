Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C182AEF5
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825575; cv=none; b=ueVW7MYzq46TS/S8ZCPN+LQkmQbrTLH3l8Kvo+3Ft15zvssI8kDMINuCHY39pcUIOSziW1ZizBbg7DSyDqjhmTcgS0/WsCkcjUR68SO1EkcbF7pnTZbKlZP9645VjfmSytDLF2EuakM9AXN4TZ7bGY6nsfdsswoU8wGuQsh6QkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825575; c=relaxed/simple;
	bh=UppTCLyY+Jp0kvcUyw9ROuNW3CnyFay5/4uYFzEZpII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L9YpWLL2lWJFDCc85VWY48f0VGoreS2fcSQxt79ri19q6V9KkFH+hviKLxFqe2kiddvOHURVYGSKchaE8ydV+paihJgAjeR4bkqZyHoVwKGmxMiIeLmy8PAg61YRh61gdSgjU8cdiYvmJQg92Q3r6Zxf9x29CigeVeESqOcy9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+F1ogvb; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+F1ogvb"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8892d4d6so1448934b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777825574; x=1778430374; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQu3AJrWbwHsNu5ahobfgefmMuxQAtBqu7LWlmYXgyI=;
        b=X+F1ogvbuHJKK+C0DUcA9KZ8vZkixFeY79JYkDfbHmpjsOtOVnqJcHLC/qJtyQKmWU
         Hc4CfoZuvaZgHmz22thHDvwMLmzZaSsHof9Bd1KI7MSSpVg5w/YmwobJmvh3QBRrmPgq
         BqCkYGcdVKJkLlV4Nnf/hxF24y2sYJKLpQyJOuFwDvKqfVjrWvFLCPH7uLW3Pu0PmAhT
         YvlvV4pPMrTrWWbxAtRtW6KQlqvWuw8w8jwiiNeaC9mGQIZqgheNbl6MTQlMyEEStk+7
         ml+U4oUh4ZT5ua3yXm/On2P7VHzJuQRO8NP6uKmmg98Uke7h4pRoT597EsqBY3l3vWf7
         xh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825574; x=1778430374;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQu3AJrWbwHsNu5ahobfgefmMuxQAtBqu7LWlmYXgyI=;
        b=J2CNH0cEXVj2EvurfRKDd5YeUT0wq8BdmPuNKotXdgsxjpcy6QkzTZmYJhtNFhuj8O
         M5hdIyASpG77TQpt2oslZKBCXQFDXn0nbNOIJpkuTOyR7WMS5p8FyDxW73BWcq5P06gj
         nzn84tkPXzG4Jdz+R6VnHSTXmmLswsyt5Ri+zIXzwjqEvhLfRdSelLaeE6LP3wMxz6l0
         ciBWwUpiyTXdOsfQ8T31gO4LBmYRZRoJufmAnwm3aow4DaHyUewLKxVLobGRDudUD96/
         Ju0PKWSwsGD64r9/B2r0AtSO9vqCEcLdOmZD8V95L5SJo9ntFItkzmXLIFGvD4wdhPLO
         EkkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4m6ssVk2uFgm60EkcpEPcSswuB+4yCjgzNvXyOkK86+jmEH8UbH1MyaHQhWWU3KzCozfI6yozNRcqUWDTX9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WaW1Pr7J5JPD8e6UrHsp27XMF/AeheZHhyeLv/p+fR7P8jOq
	yT48Jxm1VXg2jvV85nJiva2+A80+9ZnG4eUovQr4WrqSaEz0AYQf23Dz
X-Gm-Gg: AeBDiev3yAoaTMaJyvYYcvBYgZHEdjkfriQ1QAcw7HugWnUFC4yFW/HZE/O+P+jGBVU
	hgZUrNbCAp9GtHVd1+jvBfBZaL4uf2ZghO+bfQGnIika9YpT4VBa+r7XtnmId8/cvG+jXQgtFql
	vVyPKxez3jd1UzLw33qor1gcqugAVZfxFtGRl/hYGZPM8QQsTqliAP0hBgbigcZnNFTzJ8wwB4J
	fn7IS/Aj9MFRWpOftXFkymetiUA0Ppz88Jvzvj+fs2cIkkin87T5Fwr70J3aloMI53mGXWSb0Co
	6/dyYlo3yKcZrkIMt1Yj31hgWs2AYoK7r177GqRpINW9ouEGkKeL2zIkOtzlGVw1iZun2AmEPJ2
	LVEkwRIsSbhnppex8+BCMFYMaM4debYRV1cYw6no/C4wOUVPbfPG647oMFAHlxBwE4tskdTVf2N
	CmPo5ZcbP8cBKMKHSeuKV6lS+PqjfAeyVcKxwRJecXNw4G
X-Received: by 2002:a05:6a00:2453:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-83541f402c6mr1953995b3a.14.1777825573988;
        Sun, 03 May 2026 09:26:13 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm9788911b3a.58.2026.05.03.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:26:13 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Subject: [PATCH 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
Date: Mon, 04 May 2026 01:25:53 +0900
Message-Id: <20260504-srv6-mup-v1-v1-0-e0a6791575cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF392kC/yXMSQqAMAxA0atI1gbq0IpeRVw4RI3gQKNFEO9u1
 eVb/H+BkGUSKIILLDkWXhePKAygHetlIOTOG2IVG6VVimKdwfnY0EVo6qTTea4pSwl8sVnq+fx
 uZfVbjmaidn8XcN8PfmOSRm8AAAA=
X-Change-ID: 20260504-srv6-mup-v1-6a3d5995e74e
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3763;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=UppTCLyY+Jp0kvcUyw9ROuNW3CnyFay5/4uYFzEZpII=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBp93chRT3p0dGUt14JZMpqzhqDYe2S0A9I3gQgI
 NyWPwcvf9aJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCafd3IQAKCRAq19F1Kl0b
 TZI4D/9AnhuRg1aQwCbjuglWmzzRnhsFsypuo7atbbXmOgdUKDHkoHsrWr9TrLLWGNPl3UfCUeK
 9m4JC9A0DoDFabdcD29kCJw1BtP5VbXD+00NsGNYxF/uTKfBAat8L8gv9SaCGNc5BfaZhiABYck
 6hRxefgJo1NSZEJib0eRj096dhNPCiOhuwX8kJPpGF//8zCGSFJw5p6SCVetH6ak/O/Ba83s6UD
 1KwQfPaPjA3EjG/PFtiwSR2Z7LJ+p0k34GmHr7l0Gj60AVfUykiU3J+nrgr4oh86DA8rF5J+LrT
 dVICBck0wd5iPpW7TceXvM3ZBmRGQ/VAnAyN1jTK3xdEzjSDNnfVrsycXyQfyzswkbUP1Ey3g6n
 C82p8pL1n6faibev6yWcsOx8jDvucDwCQHfwPhskdtllkFyIEDdkLzBSj43icAA61ZAxHtEGlOh
 WFrulNBS2fytMRVTtyBpHQz3vWrXjcPkhh43WyULyQP6lwWnV4TCrg+4zge3CgAR1KF5RQkmGy+
 Vv1LQ85JWlNF9Yyc4lzDnqd+EBC/rQyNjvawWaMYsj1SZvVaEyJMwPerbue4mugImRjYvtYL/fG
 ETuu5PNFqKoBsHaAwflEGmqp/akGkKS/qSTaB3HzpcyJHTP/xMc8Y5gpxw/teZPpnxjes1Rt/pe
 TWU3ytgV+779D9g==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

This series adds the in-kernel data path for the SRv6 Mobile User
Plane (MUP) architecture defined in RFC 9433.  SRv6 MUP integrates
GTP-U mobile traffic into an SRv6 transport domain by mapping the
5-tuple (TEID, QFI, R, U, PDU Session ID) into a single SID, allowing
operators to replace the GTP-U overlay between the gNB and the
upstream UPF with native SRv6 forwarding while keeping the radio side
unchanged.

The series implements the six MUP behaviors that an SRv6 MUP gateway
typically needs:

  End.MAP         (RFC 9433 Section 6.2) -- swap DA with the next SID
                                            without consuming the SRH
  End.M.GTP6.D    (Section 6.3) -- IPv6/GTP-U to SRv6 headend encap
  End.M.GTP6.D.Di (Section 6.4) -- drop-in mode variant of the above
                                   (preserves the original outer DA at
                                   SRH[0] and discards TEID/QFI)
  End.M.GTP6.E    (Section 6.5) -- SRv6 to IPv6/GTP-U egress encap
  End.M.GTP4.E    (Section 6.6) -- SRv6 to IPv4/GTP-U egress encap
  H.M.GTP4.D      (Section 6.7) -- IPv4/GTP-U to SRv6 headend encap

End.Limit (RFC 9433 Section 6.8) is intentionally out of scope.

All behaviors plug into the existing seg6_local lwtunnel framework, so
they are configurable through the standard "ip route ... encap
seg6local action ..." interface.  No new netlink families are
introduced -- the new SEG6_LOCAL_MOBILE_* attributes extend
SEG6_LOCAL_MAX in an add-only way, and the new SEG6_LOCAL_ACTION_*
values are appended.

The egress behaviors (End.M.GTP4.E and End.M.GTP6.E) accept an
optional per-route pdu_type attribute that is the sole control
for inserting the GTP-U PDU Session Container (3GPP TS 38.415 Section
5.5.2).  When pdu_type is set (dl/ul/0..15), every emitted GTP-U
packet carries the container with that PDU Type and the QFI extracted
from Args.Mob.Session.  When pdu_type is unset, the egress emits
a short GTPv1-U header with no container.  pdu_type must be
configured on egress routes serving 5G N3 traffic; omitting it is
intended only for LTE-only / S1-U-style deployments where no PDU
Session Container is exchanged.

The matching iproute2 patch series has been posted to iproute2-next:
https://lore.kernel.org/netdev/20260503154510.912576-1-yuya.kusakabe@gmail.com/

Link: https://www.rfc-editor.org/rfc/rfc9433

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Yuya Kusakabe (7):
      seg6: add End.MAP behavior
      seg6: add End.M.GTP4.E behavior
      seg6: add End.M.GTP6.E behavior
      seg6: add End.M.GTP6.D behavior
      seg6: add End.M.GTP6.D.Di behavior
      seg6: add H.M.GTP4.D behavior
      Documentation: networking: add seg6_mobile guide

 Documentation/networking/index.rst                 |    1 +
 Documentation/networking/seg6_mobile.rst           |  236 ++
 include/net/dropreason-core.h                      |   47 +
 include/uapi/linux/seg6_local.h                    |   17 +
 net/ipv6/seg6_local.c                              | 2667 ++++++++++++++++++--
 tools/testing/selftests/net/Makefile               |    6 +
 .../selftests/net/srv6_end_m_gtp4_e_test.sh        |  485 ++++
 .../selftests/net/srv6_end_m_gtp6_d_di_test.sh     |  426 ++++
 .../selftests/net/srv6_end_m_gtp6_d_test.sh        |  496 ++++
 .../selftests/net/srv6_end_m_gtp6_e_test.sh        |  401 +++
 tools/testing/selftests/net/srv6_end_map_test.sh   |  102 +
 .../testing/selftests/net/srv6_h_m_gtp4_d_test.sh  |  486 ++++
 12 files changed, 5163 insertions(+), 207 deletions(-)
---
base-commit: 98878ed91b68a3150126fccef125ee7b1bb86ab2
change-id: 20260504-srv6-mup-v1-6a3d5995e74e

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

