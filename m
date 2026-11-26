Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660338;
	b=neFBJHswe5L52YbNTDpuQuwqmWgnSezmHlLrIiI2bYKGKTPMwJXOaqZdaeTwMM9/1bTb
	 A10uu7I9Bh8oQXaBLHimcrGboSMXQfpBtO435S54lmWbNaEDOy8VLwhZ0AwadDElxZMkP
	 /EoCsOF+j4PIJDrkVxemxhaLAymqjwgq0mD+F+Tl6rglqZgLejmF0zccGfm+/5Grm6Z45
	 fOcwdxYxfnTFNOmuAV9pFQOvTTW/Q8zD3fpHzQOS+Ae+Ne8rrvSZMRGoUKGJ3Ie1q4unX
	 XWXNq+7/QBhRk7XoEV5lCcc2x7VAeRnLyiYezeu9RqQtMWx2bocWrsV8LlZzGa4QscQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660338;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=n1gaku03fzj8L/6VwKtvfv7euPW/26oOCXXbjZgI5RsHyTYtcDF2Ld0IqZ8B8Nzm64aZ
	 thkvdGZNTPekF4PBp7Jnzb/tA/CHDh0te4vPb0o1lSAdjvG9dO9RDS+MrJ9VKG5a6GwGr
	 8+e/ZrvPJ436R7oNrWwadOxBQQR6HsBdTrYMK8J1Z/0XqOmbu619b3jJB5TxpippnhRbA
	 VEf3xpfSdeZ8oqppEg2xU8paiXoM8X4XKpvoC15lpB/hNx2/i4WE8v44wqCWsUx1+hbyG
	 ltVao6Lt6yUfEZby+VITCA/LcIfYLXjnz6Jpc7wi6Mpk012y2TFMNRQUPlV+KUGLoaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9Gijhty;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0FF606A684;
	Thu, 26 Nov 2026 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9Gijhty
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8331F000EC;
	Thu, 26 Nov 2026 02:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660337;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a9GijhtyQzJcusURtjJI85TgzfzAw4hyxdARYAWJ1mt2HK2xQ1MurZT4yBT2QCBZa
	 GDteM3ql/5w3nNOCHj/+f8f/0M3Fcggx5NbnYeZoZWtKe6YjjPe+udkMhSJztKjcj1
	 yHZ78F8bXiFOjUoVF2J7m5DxtzsXyfC/RcDQnudYn/zfGseCbV1BxYK4Q5h2e5fH5G
	 cngEVkgDFdBF/9AnBmj8TSwH/WGniNUcI0aqHkiYBYgjftM0rFvjUPGBxpNyKlbLJa
	 qRgGwEqdMTd82xxdJYqubOxx1TE/dI/UTYEEo3ojYvF/mfIPngDtnqm8MR+UBJrI0i
	 YlEX7gmOsJkRg==
From: netdev-bot+sinfo@kernel.org
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tonghao Zhang <tonghao@bamaicloud.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>,
 "jiangjiehua (A)" <jiangjiehua1@huawei.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/3] bonding: ignore updelay when no active links for
 broadcast mode
Date: Thu, 26 Nov 2026 02:32:15 +0000
Message-ID: <179566033583.3294.7595995030938204309@kernel.org>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
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
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
