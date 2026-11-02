Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583213;
	b=eYt/RlsMTx4gpgdDTTZrOpIJZ/vETpTBUSvQRH6hdlQ3qvRCsPYrzV2SdC+IUBeOkad+
	 /KfnrreToBQD5tZcQSFA/zUDGqEaoYCf3sN1YuCNcEhBKUX8N8kkHTbK/NxOjLJ/C63Fs
	 S74gwR8WlgWg8U8kvy18PIhGMQW8+KqfCnjma8usfsWLV5rAehYLAJ3+ONQ/naZu7cnh1
	 onBjSaPhXLv+Pe6gAUMNsw1Ri4eLmuQZx3N87yQrDeeX392tSjL406+TQrGC/QVGMdJQX
	 27MTH9EyxMm9s8MFocRhzUZ3OO52XTkPVY5ap582nQavFANtwUQ14CgO8pCcE5o6flg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583213;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DD7e/JxRhvDqK9KBWWD4cYeG0X206k1aVuUHYXZNbr0=;
	b=bDezf5cQjVJb7BEIgcobJsTmjakLxQjXJAIwvg/FnKhiCUBgCp9HxCBRLF/V8MSyi7Of
	 eqB8uKz+bogw3PoKwGZb+a2LJ2v2yqC/iCe5JnVTOu2z0X6M41eZtMlHSHVEBeigZ+gxZ
	 RwouGS9PdCTyoKhEc9jFeIoizsetSqNi/kbIVcAhAgQ/hI0KZGk3OwMX3z3r6U+sJIDzk
	 unPcIs+U0ZOnwa6ZCjlBZN6oewd2bHDUDpXgL3SVnvimahsFk47Rs/Qd0V5rsfIHHMeLI
	 81EsrQ/PYXB0NYVCTum8S/LLbEUyFXcqUFkVQOJtEI2DlNpU1B0HhANmYVxw3pKkzkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZsuQFTpr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368F606A324;
	Mon,  2 Nov 2026 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZsuQFTpr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F881F000C1;
	Mon,  2 Nov 2026 01:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793583213;
	bh=DD7e/JxRhvDqK9KBWWD4cYeG0X206k1aVuUHYXZNbr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZsuQFTprsmQmccjEwXFpEmdTTB/24M7SZDHu8julEBTYVyAAmlI7P6UdnJBes57Tr
	 tZRD9NYEqKwt264f5bD5E0UADSV8Ux848kFjhxvsPW88/JQn6zF0nm93iXzNDtrt44
	 /F4+wsSsM+QniFdjETp0XfpxQK57dfOL9Gk2Pqf+y0TqUdUsjg0a0mWKCzuIC+atKD
	 1ayx3v1n3l2jW9UoFr8VK+IlyG4UmmpOLUx6tQ/h6dJ7iAKSLq/mCcWWMEGiUV9hlp
	 m0NDz27ch7NipzXePI+/xV7TbrrScv8oi9qnk62SezfXIWm2Fpf4yzfHixhlMHQq4J
	 sTCf1VhUCS5HQ==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: lib.mk: define LINK.c, COMPILE.S and LINK.S when make has none
Date: Sun,  1 Nov 2026 20:33:31 -0500
Message-ID: <20261102013331.2136774-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011223358.2327625-6-sashal@kernel.org>
References: <20261011223358.2327625-6-sashal@kernel.org>
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

On Sun, Oct 11, 2026 at 06:33:34PM -0400, Sasha Levin wrote:
>The kernel build runs make with -rR, which removes make's built-in rules
>and variables. tools/testing/selftests/Makefile copes by clearing
>MAKEFLAGS for its sub-makes, and lib.mk defines LINK.c, COMPILE.S and
>LINK.S again, but only when building_out_of_srctree is set. A selftest
>directory built directly by a make that inherited -R gets neither, so
>LINK.c is empty and the generic rule tries to execute the source file:
>
>  make[4]: acct_syscall.c: No such file or directory

Hi Shuah,

Ping on this one. It still applies to v7.4-rc1.

The tools_build series [1] depends on it: without it, 70 of the 74
selftests the series builds fail this way. Could you pick it up for
7.5, or ack it so it can go through kbuild with the next version of the
series?

[1] https://lore.kernel.org/r/20261016143143.3613501-1-sashal@kernel.org

-- 
Thanks,
Sasha
