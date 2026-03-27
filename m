Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64629DB88;
	Fri, 27 Mar 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647155; cv=none; b=rr3Ge/TS5V4+e2kZW4tpMqgUfvJEO5FEpzdp9J++FhyfH/SAlsyDzNSSstsOYHM2pUQlyl2iW5Ue8SL+Xu+zUyVxOe2MY68TxcCju9Edsdy/GI10So4MTfvhA6Mf+Rht/EZJXqVYKfGUjM0gzGWsPqRzcI+St/4VBWyynlU7YTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647155; c=relaxed/simple;
	bh=BU6WtRaB4EK015vA4CNY7IvPCX00apu11HOfXO6nOJM=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=FxnjIfGa4ITJrHs+Ey59O0aSoQyWUst4nD+bVLRu2E7dJ1wXk+RQLg4sKBa29FRxWKCES/L+zBI+gW1waMP4zvd4OovsKUe1U4+4ZALnlHT4nYj0/BXTEBCjQRmkxMPbfcnG8L3ublz03DP7oOj9hVbZc2JexOQfQQSe4sdp7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=l60CPaZt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="l60CPaZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18621C19423;
	Fri, 27 Mar 2026 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774647155;
	bh=BU6WtRaB4EK015vA4CNY7IvPCX00apu11HOfXO6nOJM=;
	h=Date:From:To:Subject:From;
	b=l60CPaZtQQF443xDq5nNkByM0LnHTYpdEvWGpCaAOkuJ8Uo1eSUOFspCCbPiHYdVB
	 yfNaFe70BjUmfP/W9ZfBYscE2C0R3P6qINxQ5HTr/7QlfuQAb0/40yTmL+wrhha9ny
	 gE+qNsya6V6tbeuwzJZytMkWljXzd03NmlwFKCQU=
Date: Fri, 27 Mar 2026 14:32:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: tools/testing/selftests
Message-Id: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


whinges, perrmanits, maybe I'm doing it wrong, etc.

a)

At the top-level, neither `make mrproper' nor `make clean' remove the
executables from tools/testing/selftests/mm/.  Seems wrong?

b)

Shouldn't I be able to run

	make selftests

from the top level?

c)

tools/testing/selftests/mm
make clean
make

does:

  CC       droppable
  CC       guard-regions
  CC       merge
  CC       rmap
  CC       soft-dirty
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32

why did it start emitting the gcc command lines?

d) within tools/testing/selftests/mm:

	make clean
	make -j100

   compiles 3-4 things then ends.

   A subsequent `make -j1' compiles nothing.

   Whereas

	make clean
	make -j1

   compiles everything.  Slowly.

Thanks.   
