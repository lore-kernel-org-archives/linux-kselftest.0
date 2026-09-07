Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C07211A09
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763368; cv=none; b=gVUebce9QlaO1L91rPw7xIIL7pZbEnR0UER+ajzIrX0fgdDJj0wAfMs8fu9P7jQdAI6h3mJ2DH5++uv4HMpO90TCQEDlBpAFnsJFQx1sAW0xhOApopnDmd+3vlI4QXfIDftzIqdRLA7obVURKEqzoiv6j7EyMipbYBkvJmARYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763368; c=relaxed/simple;
	bh=bh09GlI2ZVrHHaVK9K6YfhcOnemvcxic7wyZXMUYXs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9qQ90bp3Z/Yz8UmKyzfjNaaG8GAXTvtHKmydFuP6CGf6CmlfNGTND3L/RKlCnwF8RbdD583fVnc1w8DShC9MXSaWWQ4OrRH+Cp0yZiAbqbxJwfzp9zfYbLq2XCr1pm/VGOUDkKJt0CaGpQx9ekU/1NDndEwgkHO00qIyCKBWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa2eLPRv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa2eLPRv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39675172593so2514158a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763366; x=1789368166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoT9Sm5I4OGgTRtKvk7z40wlIhMHDfTkFcK0qALI+Jc=;
        b=Fa2eLPRvoDXHRRzKIni0sYpVYoXmRxoIlpbKCHd/gR5yKtUHZv9Gxfh29kqjL5g/+c
         bbJyMhz9fMTrBV+PP031iqMq6BbPBEUNES86jHQJ36taChNOfPkb7VliWwCS9k4Ht5Za
         I8wXCn/VZeP+i3x7VGVt1hVIGDjiUUdFmV6kPiSRL99omEFGtBtaPsLCNyZWNN2crK5u
         VnAckeKxMQYZYpk5djHJ6DRMX8YZwd9aIrosGBCCh7oQb6laVwQJX/qVKnJ172otsnzL
         I3cWNCxKlAWS5LWyfxXMQlXas/TRiuRC75mBQFQqjZyegsXsftmhChv+H8CK23v4o+e5
         8Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763366; x=1789368166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoT9Sm5I4OGgTRtKvk7z40wlIhMHDfTkFcK0qALI+Jc=;
        b=LLSSp5mmQV1sX+Sq2UYt1KmZdSvOh7uAXIivJuG32UEDwLyoELUF8GNpkrXBGvvcmf
         DhiEkZnFfdiX+aGrbQ92MnnnLdVfov+dbfXJm1w58Kbp/c8PNfqHgTf+JtQuK27mLIZr
         v9ynwe1LfFJ/5LDXABmtOwHVUixD4sukwofYCc1oEfliA59FN5rjb8NJNfGVgvH21nX7
         25qu4meMshG7xWGxf8X1Svz8Sl6yVcEvMA21LNWXa7Ko1fAZJVzexMZn29rzaAXXLJat
         9xku8Pl2saTjrHcdW0jeumwNvbNgpddbvOocveXRESQXkgZN9M8MAhQX6HbdEVCMOHrE
         pfag==
X-Forwarded-Encrypted: i=1; AKwUvBxCLWg771SKvZ8nD1UvRLMEHVKM2aqszqYpQ5wXL5tJpuJpipN8RunTUUPrrGbGKqlEKgS9tDVDEhMF2jgVQic=@vger.kernel.org
X-Gm-Message-State: AFuF++kvufyEXVHikfhhWz7EQ4tXHpaUhsFvpatZ0jX+dxUQ3aHI6qUM
	sooXFBB16gyT4DYj4Hlk+nEzPc9SDio3yzjhMjjkCuAnm3YO2Ln+hzJ6
X-Gm-Gg: AYBFou0QgYtaKaIv17iclL7O07hlK12y4Mzx3zA/NlYFV+qFgfn6C+94mjLNjTZLTK6
	HYwvaXgOgYPOOjBtWnXeand1i1kYW7xMHz2xVNAYZYA3lu5q2XjnSxvfhCnlFYGXN8nw6PsOToM
	cUyDK3TkLt9CqXMbxWgIC27xZXEjzbNcvfblpoq2wHFNkI7OhebpJnwxviWDartJLaK6OJSJNjS
	AsHW2f/DUJXXN+nPwVbqkJvHiOpVOAXN1G9lUk0qy9vqkA6B3NR+TK8Ok8nNsgCyuEnEHDr7hx0
	Km0OlJe8Hm2ilfKjN6XisNfPdjqLPYTY0LWwUrJVOUCW72dAVdPk/t+5dcR+Fn69VduXpbbJB3+
	/Tt7ntYW5TS4Ghq5vAJ3KDe5Ruj+2bAASUp3U/7nph4UNadbbzH9OajLKWszGPJ2gCtn9EK3w0b
	CSjO1yJqcag3RzUTRyDZ+EuaidaWjhWC+tMkWThcbf5d742yU2YBaDklURYtM9T7hqwJAJp9zhA
	Ncolp/FvaC8+aLDwvB6W/v1
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr33952091a91.16.1788763366448;
        Sun, 06 Sep 2026 23:42:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm14377817eec.8.2026.09.06.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:42:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] net: fix typos in comments
Date: Mon,  7 Sep 2026 12:12:35 +0530
Message-ID: <20260907064239.39910-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (3):
  net: ipv4: fix typo "alignement" in comment
  net: netfilter: fix typo "artifical" in comment
  selftests: net: fix typo "adress" in comment

 net/ipv4/netfilter/arp_tables.c                                 | 2 +-
 net/netfilter/ipset/ip_set_core.c                               | 2 +-
 tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

