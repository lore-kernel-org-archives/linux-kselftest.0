Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BE44BCB6
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169096; cv=none; b=vAtbqjfAicQnV5z0yUFKruITKq/ubh1GBq9Y9qEH5unGbUe1AEB1KsuRxi4xv8qe16DCskTBgTsROKsAsi5TiWZPNPDpjyaNQW8RMVNMnQl7JDKDtfeaqQsMVj7mII/c3aecRPOl6F3kGtyTc/WGomkbK8kxTJ351MH9aEJvh5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169096; c=relaxed/simple;
	bh=T1es+NUo7iUHfYNW7MbhVaFEpDoDjGvfl8mP6hP0Drs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlZ+ZdXtcwuNv1168SFwelKRZIEvMZOsUJ3rcN/CJ4pzi7jkHV0u7r84FKlvMM6WGcO56t8GAxxoCzqxB06M8r4EfElha50tNhYbibbRZ/GT+UU1RKoITX7Mn95hfADELuxn3J2H4u3rLHfCrTIp2QM2XWwFCMr7cVVTx74Ecu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gxruH3tk; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gxruH3tk"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-51013ab8e3bso1395851cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169094; x=1778773894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ax1Aa73Yhe1dRK53NtIJp2y9KXXpNOfAjqoEk54yGok=;
        b=FBr6rzccy4Gf+Zz+0X/juc8oiU13l61IqHg8gtCy64MGD8qiuzEyX/zrLVtT299mOm
         4I6BIBwvwUifvRxJuqtRKXA0Rl4TxzD9HC2ZaXxCzkSPwe+sZ6nFLal5y/iI+iIyWb8Y
         J4bDWA9dknvX8Xc2/3LgJe/aaQDB9WPPgyFa/M++8YfhTE5fedGXaai5dGTOP+lDnfqv
         md7jt3DtNbP4+y2tKIp0mXKUegn1hdpGFIzsfW+Mrz83eJvjicEaKozhzQ6TsCpMp3pv
         hwCXi0EVk7d8m+K3qYoiVytxP01uOc2rmYsAy4FqvAHgqlq/4MIx+HIM0qAmOwlRPkLE
         aYWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oWmH/7UxH2XQWbkqD3GL0jRMKfO5qzG/wZivFR97ktQAuqYked2KRHbJpdom3Gbc0oXzaDftvgaDvsQllZ1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GzAtWNcMhgElTNaWw3r2veac2ZSNIIgpekKHzrs52Tmz5PAc
	MJI3FVlmgEa6wnS8vL6liB6hjQSPIQAaDVfhKRTVTVu7ttZ6UONpQOUzjm93aAln66C6xXFxrAv
	ozDs9zYQ1G0KBI9T4NOkZjpdf08j4GXfARPQ365RZadck6J1vAU37V6niXIaGAP/ddYREqLy1ot
	Jr14Zkz7gWlXU2sMbLDMfd0rr38G0bpIVhd+Ao5fmUjVl6MKav+Qlov3DmnTLpF8LFVdotd34be
	Z7B5r2ZmeIhBH5M6kbKCZeReEc=
X-Gm-Gg: AeBDietZGH34WoMzWCNyY+6F85brxfKjQXyHnT29FdUzb8VBYOPIWYSAg52IXG/q1Uk
	bh4RR0ACJM+yTVmrCchjoRXL0Xj3RHhbSfdDwrsgcrFY3sLhbqH0TW8EHGTW8RJuGJgXXMhXGYE
	VZB5zUvjMGZ+qXwyAOToHEuXEcUqRqM/gycd1DuU5p9ZqAOmvtBO5qvci4a/CpqlEoCfeap6DJ8
	f8PljS7oVrNs6flEQWnmjInVMhN3BzMFWr8KWF5DE4GtvIAgbQMZDKa8XZbv/dAkBnVXRqxcpY+
	anDl/pR8Zc6tEvD67nar7yKnpenXrQGA4aTLFDyQ3GlI43xy0Yi+Lne7b0YKmae2cZR7GC90KWQ
	acHu7ZojIbgbGAd2miGi+eUJ/6Rwk26QPHJa+vpcM3gyBBqHq7lwG0mU9R8Kk+vaX2R44JVqs6X
	k2tuMeYnO4aosxMcNWxkYGbrxBCdeFcsJ6Di1euc302rIvOi1DMO/43QCLrz3i
X-Received: by 2002:ac8:5c8f:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-51464ab1828mr68809351cf.4.1778169094161;
        Thu, 07 May 2026 08:51:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8b537f74ed7sm16615816d6.6.2026.05.07.08.51.33
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2026 08:51:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb6880430dso28898985a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778169093; x=1778773893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax1Aa73Yhe1dRK53NtIJp2y9KXXpNOfAjqoEk54yGok=;
        b=gxruH3tk/6ZLQp3HaN3RH6W/SfXEH8kK8jNBbUMJtKVjNqLhJI7V30n1needsmEKWv
         ghMeZ5dxY4lGadYDV8TEnsqIK6SyY4l9T7fjqNWC/AMmJQRuwhGIMD8viTMXCvjj1Lfx
         K2rNAfTQvTZh3A3mz9i4h7tLywlbB8oOq7VtI=
X-Forwarded-Encrypted: i=1; AFNElJ+W9kdcmbNFpPUOuJReeWcIBloVcIxmoj4mFybC36dzRSPk6jlqeTmjMytY1bv7dl94k2q5LPX5HBNilF4QrUI=@vger.kernel.org
X-Received: by 2002:a05:620a:1726:b0:8d7:ed38:8189 with SMTP id af79cd13be357-90517dc628dmr724171685a.0.1778169093237;
        Thu, 07 May 2026 08:51:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:8d7:ed38:8189 with SMTP id af79cd13be357-90517dc628dmr724167785a.0.1778169092652;
        Thu, 07 May 2026 08:51:32 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-90642b76d39sm240711885a.2.2026.05.07.08.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:51:32 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	netdev@vger.kernel.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Ankit Jain <ankit-aj.jain@broadcom.com>
Subject: [PATCH net v3 0/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Thu,  7 May 2026 15:48:04 +0000
Message-ID: <20260507154806.18635-1-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series fixes Silly Window Syndrome (SWS) for sockets using 
locked SO_RCVBUF.

When applications like Tomcat lock SO_RCVBUF, receiving small packets 
causes the memory truesize penalty to drop the scaling_ratio to 1. 
This shrinks the internal window clamp and leads to 504 Gateway Timeouts.

Patch 1 bypasses this penalty for locked sockets, except for GRO packets.
Patch 2 adds a packetdrill test to validate this fix.

Link to v1:
https://lore.kernel.org/all/20260427152756.1205-1-ankit-aj.jain@broadcom.com/
Link to v2:
https://lore.kernel.org/all/20260504144945.13477-1-ankit-aj.jain@broadcom.com/

v2 -> v3:
 - Changed GRO detection from checking tp->advmss to skb->len > len 
   based on Eric Dumazet's suggestion. This correctly detects GRO 
   packets even if they contain tiny segments.
 - Updated packetdrill script. Removed the ad-hoc mss 48 configuration. 
   It now uses a standard 1460 MSS and sends varying packet sizes 
   (600, 700, 800 bytes) to naturally trigger the scaling_ratio 
   recalculation.

Testing:
 - Verified fix in a live Java/Tomcat environment (504 timeouts resolved).
 - Passed the newly added packetdrill test demonstrating the clamp bypass.
 - Passed upstream regression tests: tcp_rcv_neg_window.pkt,
   tcp_rcv_wnd_shrink_allowed.pkt, tcp_rcv_wnd_shrink_nomem.pkt,
   tcp_rcv_zero_wnd_fin.pkt, and tcp_rcv_big_endseq.pkt

Ankit Jain (2):
  tcp: protect locked SO_RCVBUF from Silly Window Syndrome
  selftests/net: add packetdrill test for locked SO_RCVBUF SWS

 net/ipv4/tcp_input.c                          |  7 ++++-
 .../net/packetdrill/tcp_locked_rcvbuf_sws.pkt | 29 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt

-- 
2.53.0

