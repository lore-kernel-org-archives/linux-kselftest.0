Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB09487BE
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876384; cv=none; b=eVmQ+RJW5zWEHBKXxGl3o6v4ByZwX7iMHqpjzSw/vG/fZOlPC+rjsTx8hWvFC+XfGg1f0+E/Y371Y8Hp2H44WAmJJXct0DTbvDsV5roG3sqirlxuwzEO6xLLRRBl9Ev2wFDWK7fg3nQTLcecvkNlIljBVXRsWiepKa0eXQdgQdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876384; c=relaxed/simple;
	bh=IVAG7AjADp9pbIkirnW2LF7lyZL0hDgmHLHln1JCBGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bpf+Yb9lfz8ED0Wul61a9GGq3VSUHCBSQM1HeomRNEaX++bJ6b7nnbpCNyPkogKj8TK0fCmojpy18wg71MD5/dD4sTUtS5eahQ3krRYop/PClvcR3YuxJVNMMlHJ6PRqznBGKqyUZs4oC6PYmRmcI+WKQ+oyCwlx5+aDQh3m4r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48d146705b4so2165095e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876381; x=1779481181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wKWO2Yi4eHfQwzUIECRCEbVVtbU/J0JhEXvTgyUNag=;
        b=HnqWd1qxfE6RrgxwCTqyZmwzI8WrOLxI8CFCNgqMka/m8Ea7NsAex0opxCx++yudHt
         kRCAva9Maq199c6tlygwwEVxjG6IXRzlpgCVu6+8hhKRiHucpn1rZGHncgFc3IFthc/u
         PB6RXxlGNkp4uzwObvN8zQUfEhA+IXYQHyOTgLWNIQrreDAATj9HIEv8YFUTbkJWevbi
         mcJhuziy0D1NNNEOFEUnSeEUfoBfAHboqtsGMHFBKBeyqoFFdHVtUoyhHHANvYTZJInL
         FyyT5kv2mvqFbTDey+8A7KvdpUIFmvwfXbfthgWlaPyz49CLHz1haMcVrQRkeTPcLywf
         J7+w==
X-Forwarded-Encrypted: i=1; AFNElJ+D9rAy8eJ085RI2+7cqCXXMnDVad2Csa5NhkUc2OY9uSfrdLlNxgBDaOAC/2shFW+vwzifzgwr2njItGy01WM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqfkm6lCNr1fAGsWc/mmdxkOKVzZV83tbFub1WnARWp6Qzsh2Z
	IUEvHDyiLt1d+P7tEsvTYNJi2+dCguXBxwD62ok9thyDVBK/XWT6xvVY
X-Gm-Gg: Acq92OGuyJALQgrqhISKbZtxeAavC4sekeyLQeh6Xp4oDiBjI89HItnsYTv0rKm5KhB
	3PUWVQNeJivJOtmT/37j63Z1YBQV34PnYfL5GgGE//WohDUlugNas8pllrF0jviQ08kvzM9rDMD
	rnaAi7DJVawMSYB0+pZEkgDp8nyAV9GQQe1BFlNJD/9T4He0neDrACIIyUSN3dY0vu7IZioPAkM
	NTUcR3SiUaVsq5fr1lz2lD7g2TFNOWVqGMADpPpYd9ha33ddzCVpMzJ4XgBmyAJr7vQ9X2jgXdA
	NpCeF4mX8dCbAXr9MXgxer6gOOcTTlu8zRvW5BLDWaarhaLeVosMCkDPpDsFZFv3HRQQHRU6Vea
	1PuuueHZRTN26pLYkEEE9gDGFq04RWusqY7I4BLk66vaFXyG5jokZYTRVqFcMGdsXHIHITaBQ3y
	ZS7U1QqTYk7N3ljazDmr4Pwk5vtOn4FabZnFtoVr8+UnWCCkR7RsqB7nD4SE4=
X-Received: by 2002:a05:600c:a11c:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48fe61f27famr55369845e9.14.1778876381107;
        Fri, 15 May 2026 13:19:41 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm22924605e9.4.2026.05.15.13.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:19:40 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 0/5] netlink: fixes for cross-namespace nsid reporting
Date: Fri, 15 May 2026 22:19:19 +0200
Message-ID: <20260515201937.2813983-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on some new features for OVS and OVN we discovered that
self-referential NSIDs get unintentionally allocated in the system as
well as unexpectedly reported for local events on all-nsid listeners.

More details in the patches.  They change user-visible behavior, but
the current behavior is arguably a bug, as it makes it hard to use
all-nsid sockets without a decent amount of extra unrelated work of
tracking when new NSIDs are allocated for your local namespace.

Tests are added to check the expected behavior and YNL is extended to
support all-nsid sockets in the tests.

Ilya Maximets (5):
  net: rtnetlink: fix link nsid reported when the link is local
  selftests: net: add a test case for cross-namespace peer netns
  net: netlink: don't set nsid on local notifications
  tools: ynl: support listening on all nsids
  selftests: net: add a test case for nsid in all nsid notifications

 net/core/rtnetlink.c                      |   2 +-
 net/netlink/af_netlink.c                  |   8 +-
 tools/net/ynl/pyynl/lib/ynl.py            |  32 +++++--
 tools/testing/selftests/net/link_netns.py | 101 +++++++++++++++++++++-
 4 files changed, 132 insertions(+), 11 deletions(-)

-- 
2.53.0

