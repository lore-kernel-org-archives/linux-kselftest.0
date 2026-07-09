Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620983603C2
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 01:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783560143; cv=none; b=N37VZyAohI8hGe/roM7YwgW4vh2N0GzEtcKCZ1HTyr7pTm06fTIKiLG/EjEM1RIy6oK53hOWmtK8Aj2d+NqoKrlX2zKrfJ4YvucamZHNmm8NS8QYBzFM+ZWSF9AB637hovoKBEu4jOf3PC2EAG61Ja4RVqq986UYsW/XflnfGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783560143; c=relaxed/simple;
	bh=C3NzKl7R8jEudJ1vBCLGnRxXduqEmYcQCEFZ+/mUdi4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=IjKl2DVzeLtGD/DfggLMmUtLdCQ19zLaYhYt1YlD0C46+siFcTj4bqeXKa0MQfC/5jNP0AqWp333lboWcxLw6n9FJleQb40Vx9Tm0HSjb4KRD2BAGeQnWuq+jc/fpmzukGWfXGWqxTO45WG9okDdD4qfXSDdz27zKl6isBdqhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbScoS2O; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbScoS2O"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664d530fcfdso506763d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 18:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783560141; x=1784164941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67xPiCc7IoK1MebZhELUS99nIxtEFCS5kPqGhdt1OzU=;
        b=GbScoS2O9946NWQYXZnysCstaxtNBfQCzw1w0cRQdCj2omccylCFulXpJu0u9FWgoL
         MRqCO8sX0SHRA4DtVr7H1Xbx65vJHgjGdHNkLJ+kdeIyYvy/tntJGvyDTN+hrZZ45+rd
         LxJg1icMIRah+zr96NWnCLxDA0kYu2EpVQSsjImXGrkULw6/bisPq83/p0O3y5mkfyog
         rFedRlBWJiWDsQqILd5VvivOGNJGRee+JenoyQfLfyuceUWFhLAmNN3PxZ2hrL76eugc
         ZseQo/P0QHjmLeZyM8g0RlictLt22lHtPGtlgOLBz7iD5VBqUz7djZuwdsEgaWKCsuN0
         O+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783560141; x=1784164941;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67xPiCc7IoK1MebZhELUS99nIxtEFCS5kPqGhdt1OzU=;
        b=gOX5zbxlp1H3yUbjURk450/nAFgi5+EAXeN3KN1zhAnH1YZSa3B9xo03/Z6urv3G7q
         xJJQRJ+kFb77+wll9USGuLL+ZO0N7IB59vMaK0vrvwcSpA+hacwfIRZpDJXW11dRhpK4
         +FjmsC0iHUtLIoELbZxFRiDPnLKBeBG3T+E6/oyG3j6wQBNyhb5XUwpnPMaq5iFwC4fO
         Sz3WZjXRZGCkfq0D7CntKTf1D1oVJsvXs/9mrC+5rS2tI5331sUMRoaAx/phF0uCIyr/
         G9m7u/ILhBru8yZmA+LOfcdsz+kDEm6NUYNsn1eFYI1VUd5GlHkacsSWBOToENI+o33F
         Sjxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+cHyxssdgjTM7SfX7U2m0B6RDx4qiyLkM/swmBsq3E+ANxTucH/n+pcjXszqZoGrzxnepfZF597BwMzR410E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytp868t6zltPPjwM4wJOZABFEfmVChYj0m2IH3HwjsN+ij0L93
	MJwOO+gSJKr0u2ZwySDpjDzCqGhApASGYRsJLaBQ/SMxSilDtXQ38D8AIFIONg==
X-Gm-Gg: AfdE7cm5+G3X8v0zWuYzV+TLYOZNSr1RTGma4RxdXdAfoCkf++GWME9DOtOe2Cu6DWo
	4MUjoYDVP+A65cNK+VM+rjO3bZ7HCVD+/teaSk8gQl8aEookHJGedYQfjyGXF+N84J4hgnGfxYZ
	MRZpMzXyFN9u3pBa+JyJpiOjdDMXMFUVFmH0evni+3lBFzmAgWm/0lmZCfa41VkVp5V+WzOnt6B
	kYaYSJmzYnscV/cwKakrR+41NSkOxAhaiLa2qp3Jpdzylsl7DfWSDT9iyjUbcOnvWV6pwRY5vQ9
	uWkNZuJeuAOvRaPbcv6b6G8ZEL5nUe8u4EG5KcNNXCtdUmOgNLfl6+HcaZr/FD/MfhgyiCW00iw
	XzVsOHvuogTjrnAj/QkcDNHbv4vrI3S1ZXN1GYtqU2GjzvrtD5l5GTxCTZd43gjMx3fsCKkCxoE
	rt/wYQhKW5vnBDwY6Xw4L6ddrv+r7FWIz2xuWCS1P9KbisDfuCnHdFymSw7aHpLxZNcw==
X-Received: by 2002:a05:690c:61c9:b0:80c:3848:bde2 with SMTP id 00721157ae682-81dbee6d64bmr39120257b3.32.1783560141411;
        Wed, 08 Jul 2026 18:22:21 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1a5d16sm5860997b3.25.2026.07.08.18.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:22:20 -0700 (PDT)
Date: Wed, 08 Jul 2026 21:22:20 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.b213c4463b15@gmail.com>
In-Reply-To: <a5b65f092d22a12b52fc536c0565b948cd8ecae3.1783372173.git.littlesmilingcloud@gmail.com>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
 <a5b65f092d22a12b52fc536c0565b948cd8ecae3.1783372173.git.littlesmilingcloud@gmail.com>
Subject: Re: [PATCH net-next v6 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> Add a selftest to verify that FOU-encapsulated packets addressed to a
> multicast destination are correctly resubmitted to the inner protocol
> handler (GRE) via the UDP multicast delivery path.  Both IPv4 and IPv6
> paths are tested.
> 
> The test creates two network namespaces connected by a veth pair with
> a FOU/GRETAP (IPv4) and FOU/ip6gretap (IPv6) tunnel using multicast
> remote addresses (239.0.0.1 and ff0e::1).  Ping is sent through each
> tunnel and received packets are counted on the receiver's tunnel
> interface.
> 
> The veth pair is created directly inside the namespaces to avoid
> possible name collisions with devices in the root namespace.
> 
> Static neighbor entries are configured on the sender because ARP/ND
> replies from the receiver cannot traverse the unidirectional multicast
> tunnel back to the sender.
> 
> The early demux optimization (net.ipv4.ip_early_demux, which controls
> both IPv4 and IPv6) is disabled on the receiver to force packets
> through __udp4_lib_mcast_deliver() / __udp6_lib_mcast_deliver(), which
> is the code path being tested.
> 
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
> Assisted-by: Claude:claude-opus-4-6

Reviewed-by: Willem de Bruijn <willemb@google.com>

> +setup_ipv4() {
> +	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for

Instead of this distinction and modprobe for IPv6, also set those new
CONFIGs to =Y, so that the two are equivalent?

Not important enough to respin.
