Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66D8443E2F
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672367; cv=none; b=EcI2GuFyPpO4/xAuC64cMU6PBt76ccE1CeiIRPIrgsjdYDfyRWVLCoYNGle9DaqnK4KlGiEeQLTEysmdZY62G3ynHuFYbDxEqPOl0r70tzkBQb2DwyJRMLPCIcvMqfltNJ7eJs60M4j6YcjO/qCTOysRqX3EaiS52/Nq/ES0F8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672367; c=relaxed/simple;
	bh=6i5jYXsAZTIuZy3JweEhPDPIMYGEmqGb5I4PHkRBVko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxxCOrfIQ7wvmyPbVk+FSXpzVCb7UtGjEWO5HG3rVJVpreJ6gIGhabpPdS7ZSrVjjlyCzAu+tfb8UuFxB9Nxq3SwCoo1+RcT7WUo9YreWffoDQ+eajJieqne/uUfJVEAkYlMKjQ0SmGK9S29Y4Ddu2kZozF6mc95cnvvqECWxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+2bhQKL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+2bhQKL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso145852805ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672365; x=1785277165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Sq8auGZ8N5ZH3jsftC3dYQE6POMa6K7YTQrQOZw8OU=;
        b=V+2bhQKLV/oIK8gGigPBBtDpJlQyln4Epovpe2+KD1pJpU0IxcalJyWoyrtcg1nQsd
         A0jN9jQqJTz1m0S1psFzUF7eLuIWyjGrdT25MPrfj3RySozBuR3Rw3WMPWFrndWBXCfa
         JrXe1fEpD1utSzpEC5XsBKVyuIm519n/QK+MxQCYleU9tDIgj+C3TJr4JavYejuwL+Bf
         7iVepRa3jdYgFdXcEdJ6RvjMDfc229rZ1Kc4lzWKMd/NqN3VRUorZtuXn8mGMftT1hjW
         l3cX6E/YcCZe+sD5Epv7dAtiuIN7orQ04WUpvwxoHkrPOkPZCYNLCiWD2Yq7mcQf7dgf
         pnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672365; x=1785277165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Sq8auGZ8N5ZH3jsftC3dYQE6POMa6K7YTQrQOZw8OU=;
        b=m3ifZ0Sbq49UYLy9Ldb6kvVyHXZW9Ipy4pHpeYsD8JyyjMEhtVenD/lLrgo7z80cvX
         /yC5igVr0Pg+uA5dZrScSQ9QTebTnfq/MFmo5tD5t/qwJgYusKhS8mqwa5F3No3xpfUS
         uMFSN94x4Ud1HCj+OL0efPeLkNLc/6M0XyYZGUi2240TkAyZ+sVKvowGuH+vxju8p3c3
         M/SCVM+HoHVBt19jOp6eVw0jnZ9bDA2tGnlcgG9Mo/wuPSmZ+bVumqSrVefPTSR8FzsB
         4wFmHvV2rhJ3U/ran3WeUMQQPeUQtGFsi6+eKM3/V+CLNUi3or8BxPDghUBgcVr71xC/
         5qAw==
X-Forwarded-Encrypted: i=1; AHgh+RqUutWdBHFnC3YnlZ7OclaSv3Llk0a3GMuJzpEjvy0CDOqZYRMw6SlaZTTNACren5z3b9hOe+LyultOGJgyuU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHsdiuoMUSvaxFI72ibzWDuUkckdPH1UjIgS3a6BDWyJ1sZiT
	Vj5u5p1cSe/1BVeVXv84Ho81x6votyGhYr9hJtHuljjhAvFkBCTKRuDi
X-Gm-Gg: AR+sD12dwvXgIgVwdxUjkZyzAc3K1Ex2xM4GvQh6psQFAL0JJgdaVKX8ZB3XIpodBla
	cf9lWLHxxqKrsrdE4RDWWXOjmvV7bGWZeXwC+WZIN+MN0FiMFfXPhSGYCEn5WHfQ2KCDJxrb8Sz
	IWZlx0RE/g1HKAsRrDhMcCBmiA98jWoWYH4hl8LVQoDAhVsOOfHE7d2a46UDzvBaLj1hIEZbnbA
	Honk866tCiQ3MTO6MRnVO+RX1BJosgcJnAD3She2bKvBJ1ShhX9hfugTBji3sd2h7IcvVFHtOl2
	Rwz8b8+05EjVHjPWGK2eK5W5xWWBTZh5bpap61FoSfAaKKzc1eyXbRYBz/HZgpoR9dtjn19LUlH
	3FeqHrRwkjgn3hHPVnYhBu2jsJHS+QBQF20rC5dxx4avsKTmNtA3T3T48g+lEnXNDTm3yJUiCJq
	hcyKK15o5dyWmGSvfPgvAbqoQjQ5nOtdrNJq4=
X-Received: by 2002:a17:903:b08:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2cf34835859mr239097795ad.8.1784672365186;
        Tue, 21 Jul 2026 15:19:25 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efae5aesm3657535ad.15.2026.07.21.15.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:19:24 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: nexthop: add NHA_FDB_PORT for fdb nexthops
Date: Tue, 21 Jul 2026 22:19:05 +0000
Message-ID: <20260721221907.2702-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721151741.GA2667735@shredder>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com> <20260717-b4-vxlan-fdb-port-v2-1-f4862e8fe867@gmail.com> <20260721151741.GA2667735@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jul 21, 2026 at 06:17:41PM +0300, Ido Schimmel wrote:
> Maybe NLA_POLICY_MIN(NLA_BE16, 1) given that it's BE16 and that we don't
> dump / use a destination port of 0?

Done for v3.  Switched the NHA_FDB_PORT policy to
NLA_POLICY_MIN(NLA_BE16, 1), so the core rejects a zero destination
port for us; the "fdb + gateway" requirement stays in
rtm_to_nh_config().

> Why not nhi->fdb_port ?

Good catch.  Fixed for v3: nh_nlmsg_size_single() now reserves the
NHA_FDB_PORT space under "if (nhi->fdb_port)", matching the emit
condition in nh_fill_node() so the size calculation and the dump
agree and space is only reserved when a port is actually set.

Thanks,
Jack
