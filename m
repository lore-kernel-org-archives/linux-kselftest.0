Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437847;
	b=rAAhcMLdtmQOR/rvujkXdlsy5ravwg3Dde8Ux5Ub5QP/JFkzIhAA65AAoOi8Qryojt/R
	 rqU7IeKqsB4hK+VXPpcGvfPP2OkJXvSjJoMwdssvI8LlNeg9NAqzVD7PYKMHszsy830Sy
	 6FVVCt6qZ+I5eHPw5GR1zHDhASE8eWbpuMw2jmYZiYnbMougqzPO7vxSTQe9VtCJzWrlc
	 0LwGYjyqtDj3B5j/g34TXnoW/ORwSlQBlOgcvwJhbDQ7HywCkJrNYymdoG0KLyL545xkR
	 BQsQogTMwlvk30IjnxNIugVUkSaEH/oAXN80Oj8hGc3fVy50I3AMnaEioiLcpK2In5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437847;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=RnZmEFmoIqRAZ/Kw3P9uUdRvXZJhp3c4Z1sJwTSbLs1YL1e73lqIVsaz8KSFF5vO7XCw
	 gLZkZaRTIeHWrpkyDsd8CayaOnUG7b8m2gWpaHAbnmsSwxSMUkQrVhdhxOMck3PVBB1lf
	 oPSBUWiHKchcVH2L4li+sinhSSI9kHSsnBPEd4T7llOq+9GimQZ1MKLYS+5JdMDw5XOJy
	 4Mc7p40c43FyLWlx9Bn6iMMIZq2JOsn9Wgq4LbZweoEGQirHkA1q2ivXvqK53vAtCi8Sq
	 N3cNdNac0cv98jX9BUBcNnfk5Tmp2lX02zi7n2tEeH2+snRKwr/USasl3woGLF3UG+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfwqLfi7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CCB606A324;
	Wed, 11 Nov 2026 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PfwqLfi7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407331F00A05;
	Wed, 11 Nov 2026 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437847;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PfwqLfi7wiERo1uY5KTJSaRPYGRIb75Ju9nwAjdXQfDfiMAkrsyEHbSGtUAGk3KTT
	 +5Eu4mot5fzco6lqIAVdNM1zkH5Yd8KkmJmN+LWrd6r2FP+E7sgqRojK64SSv4QZ21
	 yGZHPqYi3zlwGrVK55vCmHUtSe+XCLOC3fHSmThQHuEp1cQFKmlvqmOvdsnTy3iXLO
	 Z9bnUi5qWRdd+4Pj732kzx0KJXKv/1x9dzkHVuFUG6CvAyI2SuES3rhd2GDyMkwiMA
	 PsHvxWJ5fGhi8PfxpzS4fUIhs31uyZ0jhbeG22IMcguPzj+35rqCbVPI+eXwrmdRtn
	 HxlhK6Uoq4lKA==
From: netdev-bot+sinfo@kernel.org
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, hargar@linux.microsoft.com,
 rlmenge@gmail.com, egoriluk@gmail.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] af_unix: Fix scm_stat.nr_fds leak in
 unix_dgram_disconnected()
Date: Wed, 11 Nov 2026 22:57:25 +0000
Message-ID: <179443784583.2168702.14157419822554898920@kernel.org>
In-Reply-To: <20261111225148.88506-1-sidchintamaneni@gmail.com>
References: <20261111225148.88506-1-sidchintamaneni@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
