Received: from mail-dy2-f15.google.com (mail-dy2-f15.google.com [74.125.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CF4DEC16
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172470; cv=none; b=kYJstq7sNEbDRjjLdvIZOGLXG83MfI/RzEF2Wh7xd2GH5yAiCHQhdXLuSrsU6GBODwBh3BERkvfv1jIz7TB7l+vITuauz3t5m2BPLWvPXFxWRhDJa1WwDNH0a57sMfcK9K/dXfluiZH/GW8wVsMIW+QgZTH1e1b06av+gqVq2qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172470; c=relaxed/simple;
	bh=hjsojklkWTvCL4jJhphhchqci2dixHgONZ4YVxk4b8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saByMVAfkdbFe78L1EKmavU5/jCVZUw2R5hOPqLAfZilMkBPHvJosijwsWMJZ7hNM3YFzLmeewDPwQqMo+r/+5pxste8clHDIWTmHdWZnKFAGWqUdXW5Z1z2jtYMyg6m2WwiP0/JuKoGsfw180JaJljJ5yGDksFqjWtZopVxubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+iJldaw; arc=none smtp.client-ip=74.125.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+iJldaw"
Received: by mail-dy2-f15.google.com with SMTP id 5a478bee46e88-32dec843c37so1648329eec.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790172467; x=1790777267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjsojklkWTvCL4jJhphhchqci2dixHgONZ4YVxk4b8s=;
        b=Q+iJldawQPFhc5TWRq+eTJfl00BtBuWULXo7MNMUBSdEQAXphtveDQ5vWeiNTloO56
         RFhwJkn9mIH+8Fz3kEMPh+77Yp6UBalrxWL9LHtUS6tPzKuCKSkxJyHDq9ckZdAWPrcB
         kvixQWoVW+z17QcF0CFTXg1dfD2OG6oF3n83Wz0+yOQA6uxvHfVIRt6vaG8nfoAWcYLD
         9cQaI8pUwzxmeudqNGbSoFGkpc39F6KTqQbQ8R6pRMiPP8F4vMkhVRJYUdBClCHwkXLN
         MLPKT05Rs+42n80Hw483RUdlRvZT8r75hVA+vWBAbg0B6QcLbBbEXq/N+Nsu6Qt2DLu+
         xdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172467; x=1790777267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjsojklkWTvCL4jJhphhchqci2dixHgONZ4YVxk4b8s=;
        b=Hvv6jn+OabXwB55yBSVUy19AvrhNuMBXZKVkYWqR/QDgZdFOYXCdP7oJJBEXnB8fJN
         8zHxgiHYIm+Zx2pPa49p+VVs4YTBqgzMCXz26IEdUb2iuBYg7SAQJl/+IAcqFa4Mq6OH
         AdOFckitWspL9ud7/fb6cFAQK3S/e6W6jeGW94Bdw538xA5XYvAezfqOmRyOlDak88Qo
         5XqQRIar08z2ef3YngH41J6oPn970YALW+nE1s23GbZyR98d4ZgbrsFHz7HZaaFzP7GG
         QX0RcT/+y24a3x2bz6rCfq50+h/B49ikN5h9O5bIb9dGP9lEAgXutcG3/tZGWQaH6Of0
         RtMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj3LtJ2BSHDaXBX1+SbexMYBH6sqsN/Cl59zD1LcDXK0OHZlw2EMADc6ij0IM1aZbgFSg9vBaFQKOVtLQfFmM=@vger.kernel.org
X-Gm-Message-State: AFuF++nadfG+4Vj68GHCiAX4+8kBLFWPv9fFfdyQglz4RCCvnrVDsR3x
	ATF8SZe3yq84+90/tY+h+Az94wrf/IfnSPWZ68piKm7wEC6jK1eqZVHp
X-Gm-Gg: AYBFou04Tlxvb0T7T4YoCo+oA3EmsH4H0Sfwk1ZK5e8Hz5S4avC1sQv9iS6/4DYfh46
	gcF48C0UqmfnvSzrul8HTgVYtzwwKJHq8pbmbUuROdVSUuGdibTgHf+NVNm7A4QdUvcr7HGT3QL
	fWpAzSvR8w+FTFGC9C7HHmdv8MFhVmDcjflT3emSwLm8u3ykqpBQGOdIc41Hzprl07zfZF3yxo3
	2B847J0X10PR1kiHG7sw/LIbLXGvWJMcTWe/J6vIGrKsN30H/mNdzmyZjSHwzvP2ACAb/gZguDX
	zJ5Fy/y5m6r8OWPx9n62SRkJBwgRQy+b2SfgcQp1YF9M5P9PpV5oWWRDvxo9mCRGnqdnxIp1Tzd
	guDekQQkk0wk6y32NSQzZhmiFFDLENwmeUyOtubkkdKnCFPWAocG2h8hDGPn0thDYgcNlWOFKcM
	tX4kspgBDfMh4FplNz8O+mn8VfXAtENnLytkZj2PF6SRCcFlHLLW/ZZG/RrQ2yJO3y4dWTB9kA9
	/kn
X-Received: by 2002:a05:7301:1803:b0:33c:2611:1a14 with SMTP id 5a478bee46e88-33e8dec76e4mr2749737eec.29.1790172467269;
        Wed, 23 Sep 2026 07:07:47 -0700 (PDT)
Received: from houminxi ([61.170.225.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684ed70sm6100527eec.19.2026.09.23.07.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:07:46 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
Date: Wed, 23 Sep 2026 10:07:38 -0400
Message-ID: <20260923140738.1045071-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179008951086.2160803.550424027687672394@kernel.org>
References: <20260918144647.2024095-1-houminxi@gmail.com> <20260918144647.2024095-3-houminxi@gmail.com> <179008951086.2160803.550424027687672394@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 15:05:10 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Low] test_sctp_nat_connect_v4()
> can a forked socat child outlive teardown here?

Same pattern as test_sctp_connect_v4() and test_sctp_connect_v6():
fork on the listener, SIGTERM only the pid that ovs_netns_spawn_daemon()
recorded. A process-group kill inside that helper would change every
caller. Aaron already called that overkill. I am leaving the existing
convention.

No respin for this comment.

Thanks,
Minxi
