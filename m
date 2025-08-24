Received: from bregans-0.gladserv.net (bregans-0.gladserv.net [185.128.210.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8401F3FDC;
	Sun, 24 Aug 2025 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.128.210.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756021858; cv=none; b=c9V6p57vDuju6OcpiXQYUXesm9opIoGEp+wmIOviI4oFG7CZm7yikyBcNI4+TJF9BnD629Es1ui29ajY/89ygpadmITZ2622fVwP57mAXRBvDOI5RwRozGcx4n3nCQIsEQQxLPb4ftp13R2WPhpC96zgygUc6y+v1YtXTSNrxJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756021858; c=relaxed/simple;
	bh=E05aj0Eyocvn7/Y8L5l8zR61dpymRDyKM4sP5P2AyiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QslQpNKe0x6Fm3kbvwy6VCU4dWzeHQJvZSrPEkN2U/v2tTU4ZakQFHRJj5GNEEiKCgYunbNL2PYuY/OTbwP5k8kQh2pP1+MC8Z/Y6Mdn5hkXjsg1oDfvj8G5j3hLhzNDPQuuje2yF/Z5WMb5Q25gxtHgKAXAsM/PDSWTWi4wRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net; spf=pass smtp.mailfrom=librecast.net; arc=none smtp.client-ip=185.128.210.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=librecast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=librecast.net
From: Brett A C Sheffield <bacs@librecast.net>
To: Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kselftest@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brett A C Sheffield <bacs@librecast.net>
Subject: [PATCH 0/1] docs: kselftest: remove link to obsolete wiki
Date: Sun, 24 Aug 2025 07:48:44 +0000
Message-ID: <20250824075007.13901-2-bacs@librecast.net>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings,

I've recently been getting my head around the kselftest system from a standing
start. As I do so, it makes sense that I submit any patches to fix or clarify
the accompanying documentation while I still have a newbie's perspective, as
presumably that is who such documentation is aimed at.

Paragraph three of the "Linux Kernel Selftests" documentation immediately sends
me off elsewhere to a wiki which greets me with the ominous warning:

"OBSOLETE CONTENT This wiki has been archived and the content is no longer
updated."

The wiki hasn't been updated since 2019, still refers to Freenode as an IRC
network where one might find help, and mentions kernel versions that are
probably older than some budding kernel developers.

There are a few links to Google docs with slides from presentations given over a
decade ago, but I don't think there's much in here that isn't covered more
accessibly in the kernel Documentation/

If there's anything in the archived wiki that should be retained, lets move it
into the main documentation.

Cheers,


Brett
--

Brett A C Sheffield (1):
  docs: kselftest: remove link to obsolete wiki

 Documentation/dev-tools/kselftest.rst | 5 -----
 1 file changed, 5 deletions(-)

-- 
2.49.1

