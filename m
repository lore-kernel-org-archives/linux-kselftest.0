Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A66531AE3
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172461; cv=none; b=rWI2u+B4bO1an05SeCnrcocJmHJd0xfs72oMUFgAVgPHQ81WrSwbg2VdT51icLw0mio9O6ZaoRhwHgIEk9S3mhjUpIU7e3TroJUv1xhAcSTjKD55PqevrzSNlXaiM/atTGpmRScYz9ek2EHW7EB6HYG10JuX3ifmofzA5wF4NX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172461; c=relaxed/simple;
	bh=qVO2aOXV8qOfQW3a+N4ntdYpNIUu+AmmtXveRqFp7Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6o79M8mziDdCiRTF3BaaFpy+6Xh/YMCdNDB9qsa7gTRxFXbk0S14gqvqUYIBl9x8z4q39Q3/adbkqZ4MhXaHnuCIojnmROT1oqUwuXerNcYiuKDDA3C+ktrlOT3Ukvcj1PTkNgE7rIYNOhi55I4JLeQh+eTCQrUM1GvMKGF46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rw4mQ1IY; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rw4mQ1IY"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso580985c88.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790172459; x=1790777259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVO2aOXV8qOfQW3a+N4ntdYpNIUu+AmmtXveRqFp7Jg=;
        b=rw4mQ1IYH04c7P4ES+naih2nAvwVNQdj3JRVjzQhlyu/21Y4OHl5g32oP8o1/ygBFU
         TP+h1U5bp2x8BnD/X//2xjxYuMz9guFAhR8A1/vangMfE3GQJVIlHJLeqUwYmVsrEZ4v
         O+5/bOCvpsjBd/T2qn7zM+N6dtOw4wR0dQvyzh5vsfdVZNHBPyWVInJPtxv3axQTLA0/
         OdSvOsegkoiyRl8/ysRFQAMCTCvbkzsDoYm1fvwoGbQTvC/l+cm9J7/8An41dS+JiSp9
         pzp43L7AbcvaD/jlAly5AKkR8Y5Nlny3JXH0T1yCGsb4YL8eUFZf5CXaYB8IR7pP0LbQ
         6RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172459; x=1790777259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVO2aOXV8qOfQW3a+N4ntdYpNIUu+AmmtXveRqFp7Jg=;
        b=GBGFeFlqJVLt8BPJEfa97TgSWahd5RlD6QCjlNaJAxjs3+mjK5mBHF9Xkn6E/1m/DE
         n1mZ0nRoh+2ApRWJ268dLlm5FX/rQAy3fysxesLz0am7Atv5IHHhdTGubwwvgnX503HK
         NnJ7ls8lvFlScifFUt/wFa7Kcdy2rzZSN6NI0WaitGWqmY3qKjOsMOc/eqfOLA4JWv9U
         xr89WBdaMTvbDXRFNRDcsxdPfm42rLbmAVIdXxXx7dnSD123Qoxz8VP0taS/fbW9su4+
         0jPoQnpcBK036yH14wtVYESZSHwBWfbsC05V2dv6iaT5VeiRENPys+A4APa7wgY/bY3Z
         pJAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/ylufgmrN5rELMQvzSiNNDOTtwmOOPV3a/SrIzOh+n9d2TvbJogP6poObyKt3pCfwG52mDowRcdWoGd5kT2g=@vger.kernel.org
X-Gm-Message-State: AFuF++muLqv1oddoaw76+A/dhsws45RNe0pjedORePskZl2aCOdk6ICl
	XSRTysrhUcsHcRL00ehgdeXQDkoLNP8O+qqQ2QR7Y93w97/YgaJor2n4
X-Gm-Gg: AYBFou2DSUE/H4ZlNagsN54KpO5IMioUHx959H4NwDJv2ytfDegzXLY0aRKezZEOaMV
	tZIgrHwYkHSyKoJwf1DdzC75r4F6IUhYQJL5QzpXOlJQAT8TFpEA7NhUpgpNee8euFWReNOKFqi
	goggzpMtxNVi+k1iTjdO3AydKa/6RDYFf9q9dfNWZnOPrM/JfuuhpiMUH1e3hlU6A4+fD9W1LZg
	6J6aoHRPXYVaSWeFTfKPFRsnIHddGZXyi7wUvC87OJzpMKE/mjnvlXyqOko6SS7isNp90y0nkcX
	WrvWGkdnvAtMPfXtN9FqRlbVP1Ux67jvio2QTToeI86suhnCPi7Cw6m73/ZV2bpv6gBrUCZeFb3
	f4IOmgKk4nrThl5gA3Nwm36LQwTpd7oMMZbogEX87n1a7EcREkC8iyP7NgmKM5pSBzJdrrly9yh
	NFuVRbzdcEJS4IW0T1oTHG4/nC64ewlyzRy9jlz2Bd0R6zWXnvqPqY/gFq3prfmVFy/h76LaB8F
	rgc
X-Received: by 2002:a05:7022:3c07:b0:144:f8a3:2eb8 with SMTP id a92af1059eb24-144f9086e0cmr2903706c88.9.1790172457980;
        Wed, 23 Sep 2026 07:07:37 -0700 (PDT)
Received: from houminxi ([61.170.225.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96846f85sm6391689eec.20.2026.09.23.07.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:07:37 -0700 (PDT)
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
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP flow key test over IPv6
Date: Wed, 23 Sep 2026 10:07:29 -0400
Message-ID: <20260923140729.1044989-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179008950943.2160803.15856491533624064435@kernel.org>
References: <20260918144647.2024095-1-houminxi@gmail.com> <20260918144647.2024095-2-houminxi@gmail.com> <179008950943.2160803.15856491533624064435@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 15:05:09 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Medium] The promised skip when IPv6 is unavailable is incomplete in
> test_sctp_connect_v6().

The /proc/sys/net/ipv6 check only sees ipv6.disable=1. ipv6.disable_ipv6=1
still leaves the sysctl tree, and a new netns inherits it, so the address
add fails and this test would FAIL.

test_icmpv6() in the same file does not check disable_ipv6 either, and
its ip addr add calls also ignore the exit status. Aaron already said
this is not something we special-case in one test. A real usability check
belongs in one helper used by every IPv6 test in the file, not in this
series.

No respin for this comment.

Thanks,
Minxi
