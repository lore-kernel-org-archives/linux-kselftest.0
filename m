Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804821;
	b=t503T8RUXwsJAgp5KF3xOlKpx0stNW5RCLYC3lqORwkd1voVh9mHb+zgzVcDYX9cFzTK
	 4WblEIGUi22EPXapP3hr+ZnCWDFpwuHrwGpSDt7TmhITxZ1tTsegAfxxaIZ9iMKY6LJjO
	 ZT51k3Erjtry+Yc50I5xNSAiSGkKP1FnaV4d55fRK18K8v16VREWToH/i3h6kOsUCgqas
	 Rxvtni0fUiVF5HWxhUfGaHLBASh53VFlYmDUWggC1hMvZ08rMKrmGJC0AB8pZTrOLLi8P
	 8DaIp++O/ltMscpYty5mQQsLgrKjyB6pZXTeHyy1juWmUvpqOPR185TgBHcS7sZLVVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
	b=UKN6KiMQVPAHUVSvOqPc5AXOKQu458YKn3Db3nVP5ysAgga2Ia2zX7S5fhU2AJdWYB3m
	 e3fxMGY6wiUjOYNvGsOK37xyaiD9/P8XNeXQ3kH6Kluvsq6nJV1CPs4B4EIgOqxIua+sV
	 Wtl2qvah8DRaZ94Fr4rUD6A9bk/HTZbrtkZWg95jjvH903JgynZov8//SaOC+0BfKVf3m
	 BAuXB8/S42+9osfCqXiCM5cs7aNAj5kyFiGwra6PNhnnz6Trl3pWe9SvvLtPBSzuc7Yjb
	 xm8LAVy8PNdkN2BfsinRnkobCAxrxF30Vv/p9UXXn+rBmZ+iCE4c0Zu9fho81y0s6pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xljKcLRf;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9AF606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C9AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xljKcLRf
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b54096b2d0so397652a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804820; x=1796409620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
        b=xljKcLRfETg0FA78YTWplcDabZ4wUdzyPDAKfhJGG72f7v2WpaZ2guf6nD92GV/fOr
         9+wzc5VyqgGaNzGJB5sZRdb3O9ynut47+ZzbFUArMpZWBwqONEoFLUCriys53pucG+JP
         sYz/XWIZGNFzkGaDsXReLBAizjV0rYbmtyYUiSIbByibvhGDADrio137j5pzl+mgfmVR
         VQijOT/kYD9CI4ZeVk3e5wSs798eigaO75r2KTZU8PBKZe8e/5FcKHx98mqokD0XIcIx
         2VrcVkVS/dGngIokbfh+16A3haQAP9imgGNOqPPkbEe1ciWwjDhqQjHuiCZ3hKVL8Fei
         3CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804820; x=1796409620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FReDfCXouQxzFDIb46YQ13IWS4CFAwUsjqRtVWzsPCg=;
        b=KeztWzFeOxEIB4MoVY+ijAYp0euYpjIAlAJvsl6lJIbKdLvQC1RhH1ykqdniONy9XS
         T6Xy5rXEhKC3WZzgRJ/G/CP2hRoHUxDAESb+tsN3sIt9kvxNbWfKvWsYkwlv5f7lf1kd
         nTsRrf3MktAyKlQRVvs3cYpvf/StR6a3Fh+wtuRcxny8ldAF7FClsW2FMB3LX+iFxAtj
         yZYhnTogmomQj2HU5eXJ3iUnxrY1+lhMRQpK1Rw3CiwqgjvbY6flmWVOXZtTWKYJfA10
         tLgzkqftho7jiYWs2P4TkStEXkomi5ogMdTbNzFXdzrkNC96htlDIYtpcZ/IrvwPJx9X
         a1mw==
X-Forwarded-Encrypted: i=1; AL+hErHSjqsoXKMFL7bc5P1NoDL3D8XrK1CU+RLQAyejsLvIP8EqE6krglys2bQKsphgTiS2QKemy2k/fcH7RAzJWZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Ao3nEl0fUSsn3b2uIQZ73KZnb1O38p1qfMlZ/Lz1D+dafsea
	UQdqrdDhzCBIrq/QiWI1E8dPYoVY7X4i+9lWG4gd1K2j61/nE7cOZqPR
X-Gm-Gg: AZFdTZeaj1BdTWwMWxZFvRu1cBxStxjBNBoX+UjzqQlY1YW+aN23Sp6852vyzFUW38H
	GB0VkmQnAuxFdZd1XuWTo6GohKXJdovCGPf/wXnAAXmgTI9Mgv1jCgoX/eqvHSwQDwAZkd4wg0U
	lIaenXjWGztSRPPmTkBCBnj1qcomXZV1CUjuj6fvYRagxXnrn5NvBhqV+fruBmIBBQfAf6thMlB
	42WsENH3AlH0V+/UC+RRZjxprxfduMmfjvDVbZ0Cr9yUFE5j7sd9I3T/ftStjZUEabOYUblidxR
	P8kJGEjhdqvjXysh/uEAUGjNf7NjHGR3UbijL+obvJ76NIOHzC7k/YDBSgzlNJOgt1SRFPRaqzC
	r00qQ75oQ7TymuLaSmOg39ySKrSfYz7WRJ1IxaPKyn8vYu95+Kk6QxEDpGJ4uh8IcZ7aqw3LOfK
	JXsW5+yAHIm3dWdzgBrEPLyaSVedgeVk02XIqGwr52Mb14oTvz1oSYVvvDYB95jSwTBmRj+QCyR
	JJiWjy3SQ1F9EZXHUnsC5laVLYYh9QQn1+d2YZ5RXXSyoWttEI+VSAGm50NdM66nPzZYJ8bCeCe
	U+ZXS60X9oU4pUkMHAMKZbZx/pebuFaCUbUv+PNvpa0h0/d7ALUGgqNCbsgc+dBRKdmYqrlvs3v
	T3Cs94g==
X-Received: by 2002:a17:90b:3e81:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b41c9559f5mr23209610a91.41.1795804820100;
        Fri, 27 Nov 2026 10:40:20 -0800 (PST)
Received: from localhost.localdomain ([203.202.252.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm41813902a91.14.2026.11.27.10.40.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 10:40:18 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	willemb@google.com
Subject: Re: [PATCH net v7 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sat, 28 Nov 2026 00:40:10 +0600
Message-ID: <20261127184010.74433-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179580399973.3135.12029769847251459361@kernel.org>
References: <20261126182329.91058-2-ilskdw@gmail.com> <179580399973.3135.12029769847251459361@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> This fixes the deterministic case. Can a route for the previous remote
> still end up in the cache after the migration, though?

Yes, through the same window answered for v2, v5 and v6:

https://lore.kernel.org/netdev/20261123185811.53107-1-ilskdw@gmail.com/

vxlan_fdb_replace() has it too, and closing it needs a different
invalidation scheme, which I would rather propose separately for
net-next. The plain store to remote_ip that a transmit can read while it
is in progress is not new either: vxlan_snoop() has rewritten
remote_ip in place without a lock since before this patch.

(Adding Willem, whom I missed on Cc for the selftest.)
