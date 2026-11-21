Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795275247;
	b=wkhzEGGukvGou0mEpd8CcyMEBHzSC6qHL8pzlUeuNJSkkq5HsIskYtI8XaOaLngCRGHO
	 Q3QJ93SyMysxv+w9RKh16ECYEZPn7VRrIvk2LjEUW26hQJ+qt58fV80DTIIeJw45BZqUs
	 y0PoMqk8qOfuDWjTWITaciOHAraRdUqAlw+mFc9fEdY5Yq8U+FBiGW/Pi2miqAX+yuhWi
	 RsZ11dwkNw5XNIXKZ62QFaQpGGNOm/9LW/8EkIUUuV5SAfI+3Uq5+pqHa4B8IiTxCZQ8w
	 XTAgQ60zuHKUODZWm6VGOhS3X/T2XMC42abzOiqXHivHb+x4U9SnCAyU1MCrAu5abFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275247;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6wI6hd3wCr92yJ1fH/9oYnu0+cWq1GtimCY3YbDctlM=;
	b=Ler6yVFiLak07QluAmyeJszkgPGTsZgs468Cto+qg8DnLeVU0LNH3WHgRDRtVw9ZEwK0
	 a/gB4vEE1FvFJQxlx5RqonsMGQi8y0CPxz0s/OyRiqlv3vZSAICCcmhDUw0mk+ryaXG2/
	 rvjbJkFIa1DPC+mc3+zZ7LC46h833H8wQ3ii7HAVZ0Rm/8UchMAT7TYQ41tyP1cXPef0x
	 kBh1AgmYG5cuZq4eGQ2uQ8koR4urfQNv1HmauylazlCdpn1xjf8XHZxZYUlFeie1xii96
	 rKBPaT0stHTna0KzEt1ytQnOkXnXChMguT80gotanAlJ+zpfpI82f4O/qcuUuTsk1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TXZ6/DgU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB0606A320;
	Sat, 21 Nov 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXZ6/DgU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924EC1F000C4;
	Sat, 21 Nov 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275246;
	bh=6wI6hd3wCr92yJ1fH/9oYnu0+cWq1GtimCY3YbDctlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TXZ6/DgU0Y11jqGYzn3bje7TSdZiIGiSXkZAEoSxtBv7TZXoxUGOe2vRvQKyACC5I
	 KHgQ4RqnELsug+V0cp+sQZJDvnL0+HSow7AmFmoa0ZsoAwPZLgVjfSHd4F/AQX+zPa
	 KwkQDRkKRgv2nhPAN5X6brheQNQw+7GvdVdyM+cKbwxRuxwrQvuqScexYOawo4/U/t
	 E/HbGrdBYXxA19S6fnae2ZZ7/vR+EB1tnvlRd81C+UG4lyZDOa5ek4/nMXYjWW4Iwk
	 5vbxiUfUbqrjUhtOeZV/KNcuDCMURpiiXv+JfRgraskMR95cVd4YhSnbxiPQsuD+oc
	 vlOAWmyuH7IAw==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Nageswara R Sastry <rnsastry@linux.ibm.com>,
	kexec@lists.infradead.org,
	Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Wake Liu <wakel@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/3] selftests: target selection fixes for cross and LLVM builds
Date: Sat, 21 Nov 2026 10:34:04 -0500
Message-ID: <20261121153404.2241652-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105125701.1605281-1-sashal@kernel.org>
References: <20261105125701.1605281-1-sashal@kernel.org>
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

Hi Andrew, Shuah,

Ping on this series. All three patches still apply to current mainline and
to next-20261120.

KernelCI still hits what 2/3 and 3/3 fix: the 32-bit arm clang builds
fail size on the undefined _init and _fini, the loongarch builds fail it
on _DYNAMIC, and the powerpc builds skip kexec.

-- 
Thanks,
Sasha
