Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E284137B2
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951321; cv=none; b=GLoru8NJdcRhkFPbHfOdWMNISmcRJS/Vb4knxEVybGWxQ1owou2pQyAK6BoJ0HpSoaD3DOL+WsTqRDfg5QH19vYYSkf3ujDxGDVBCWTMJZI5XIMEQKxlB4P/3kGZYiuv2j3YHS56TVyja7O7lCPCuukl60ZaNPNr+lwSFYAJFEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951321; c=relaxed/simple;
	bh=xYywkRsBSKjw8Axa27YEpGjbg1zDhSx4yyXEIskgcM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpzKXSkuuRjfRBo72na7spZNPgckKeDy206xdlOvSlW/StJCIRa6ZdAcyXYzdTRaZ+IlFKJSmYr1hixXla9iep3uYOUp1zTskA5p9FGjIqjI/OmpmvV6OUhMRSuhZcdPwFw9f1co8Y8fGZWAqol9DdvUaW/VotGYhumLDvgMao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoFq64Yv; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoFq64Yv"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so1670356eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 21:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791951319; x=1792556119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyFJXztVLdc/Rg7vt5oGO3PCAQKi6BcjvQhwTuC+hUc=;
        b=KoFq64YvmdzxHhMl1Q3DX7bzK+wqvOgl474QleMapmgZvviyz9u8jO2bx5huxNH86t
         X4qNP7acdv9ZeiiPH8IUvW5aJ/IJczEe57vwF01j4tzBOYQaounLJAnuEdxjPPfHxqDB
         zK3a0aN5zjySohwsDF+LaNnDXncOm2NsyIJXtfxMLa/PwK70KBaiHvRoogBXgmNpKaUQ
         ew9TRSCk04vRx+edY53Z/PbQO0kteNLPY8SvxM876v3Lcsp3Yi0NCHiNvi2B9FTIl8LF
         tyiGwsFYpFd1/HwBAsKEYjmTo0EC6FKmtmcc60a55f8BOHDbBWfyLQq/kjZOtanxh0pq
         1CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951319; x=1792556119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VyFJXztVLdc/Rg7vt5oGO3PCAQKi6BcjvQhwTuC+hUc=;
        b=VJeIY68mFl4Pq5XFCnWvEANrJqHiwgiP50BWOxwwhLjYDX/VZsaP9EdBY8Kx0JK6VU
         3UGnAz2AJyDpyMIM6uU6uCowKR8TozxbgfNK30smm1T0VPkvDGn/W12FaOfZ/+vuol0G
         tBwOzYAD6gBuXkZvO/dtktzpdMtaSC6vk1OfUaEfLkuQb4ZJ4HIbgi0iLTpz6AS7aOEO
         tELRMRsxyEAFZk2j9rcUvY1mNkJnHkb0A/qdUUPIIq6Pi/rlC/SUqewvips24GX8qmm/
         43zkfJY6X/6xzf6TBweMfeiN313ULdOceh2uU0k+adUeGEmZAunl3TAWfBGcLscqxLXN
         KwTg==
X-Forwarded-Encrypted: i=1; AKwUvBxOzSC2toY8gKo72WMEOvLyLEDUndrywceIfqs4Cpa3I2QLsUs9sa2l337gQs20zqXq8Ojg7vJFkrrn+c22vYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP+Q14my0rFWGuA8NOic0V6T7m2cbF/RQ4DCpV5ssu6Iph35Wo
	UsYvLrT6E9N7Yv9J8fj9LP56ztTBIAD2oJ6+G+abNMo1nN/ca44ODxFj
X-Gm-Gg: AYBFou1u4ftz6JGg2NHqyplK4hkIJvF6ZF84B9ch3EeTYfJXbVWqcLTP2irQ+LrZz0W
	yrs6WTcGKn7c/yIvoAU0dEGhulJ95hGIX6J49jtoDrmHVrI1PeefK8WcUqg3k63z3mB5rgEhrO5
	VT0BbXw36AHIhaBicY1PSTZPIIw5D1ULzbL/G44k2VKz4CMHPKpJRMkqnI6Fnhxx3d8Nt7En4zJ
	M6AJTYhbw5wszY297SJpCJPs4wL8+SV1Hzke4jQFiP3OB7pJlG5C7O1xkH8QVUvql52rIcocew4
	ZbrdyOpAbvIe7BA7JNizRJLIso42mzxEHv5cg3R+tKi+r/TdQqe3pzkVVU6cT1bLVUEyJ8f3RA3
	K8edLDoxSwC8268yfUwXdmXDBMD/2nBKhGbsWL/jA0uya7AcETOqZ29VFZgiGuJti1os/+3vATT
	93nCHN42tZFxouTKLhvzZp6G5AypKHd2jlhUrXK5Wtjkje7OJNTktuiFkKiJH6zNSsjflsp5CjY
	sQMQNr5iTXm99B+YqDZDXJKiRhRRYfDr6kG1as=
X-Received: by 2002:a05:7300:e9c5:10b0:359:f28:412d with SMTP id 5a478bee46e88-3590f28533cmr16964482eec.36.1791951317953;
        Tue, 13 Oct 2026 21:15:17 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm33110980eec.20.2026.10.13.21.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:15:17 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests/net: test network sysctl extremes
Date: Wed, 14 Oct 2026 09:45:55 +0530
Message-ID: <20261014041555.2823108-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179190711505.434549.1991031349414256009@kernel.org>
References: <179190711505.434549.1991031349414256009@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. All three findings are valid.

1. [Medium] nf_hooks_lwtunnel cannot be disabled once enabled, so
   restoring the original value after a probe failed in --all mode.
   v2 drops --all and the full /proc/sys/net scan, and documents that
   only per-netns, restorable sysctls belong in the list.

2. [Medium] The rounding problem applied to sysctls that only --all
   reached (ms/jiffies conversions). The four remaining sysctls do not
   round, so find_bound() is not affected for them.

3. [Low] check_kernel_log() now ignores /dev/kmsg records whose facility
   is not LOG_KERN.

v2: https://lore.kernel.org/r/20261014041446.2821085-1-sahaj123.sc@gmail.com

pw-bot: cr
